/************************************************************************
中断只处理按键监测
中断无法调用子程序
修改io端口适配硬件设计
修改table表以简化程序
新按键消抖程序
修改按键功能
T0定时器模拟RTC时钟
简化背光按键
静止状态液晶刷新频率约为1750hz
修正按键bug,增加档位至15档
*************************************************************************/

/****
Button_Pin_Backlight P1.1   无内置上拉电阻
Button_Pin_Gears     P1.2
Button_Pin_Timing    P1.3

MR                   P0.0
CLK				 	 P1.0
DSB                  P2.5
Pin_Backlight        P2.4

***/


#include<sn8p2501b.h>

#define uchar8 unsigned char
#define uint8   unsigned char

#define COM1	0x01        //P2.0
#define COM2    0x02	    //P2.1
#define COM3    0x04		//P2.2	
#define COM4    0x08		//P2.3   

#define MR						FP00        //HC164锁存   P0.0
#define CLK						FP10        //HC164时钟信号 P1.0
#define DSB						FP25		//HC164数据输出 P2.5
#define Button_Pin_Backlight    FP11        //背光开关
#define Button_Pin_Gears       	FP12        //控制档位
#define Button_Pin_Timing       FP13        //控制定时
#define Pin_Backlight			FP24        //背光灯

#define Get_Number_Mask          0x03        //掩码，从table1表中获取数字
 									
/*************flag标志*****************/
#define LcdSacn_forward          0x80        //Lcd正向扫描标志
#define Lcd_Data_New             0x40        //Lcd新数据标志

#define BUTTON_GEARS             0x20        //按键“档位” P2.4 被按下一次
#define BUTTON_TIMING            0x10        //按键“定时” P2.5 被按下一次
#define BUTTON_BACK_LIGHT        0x08        //按键 “背光” P1.1  被按下一次

#define BUTTON_GEARS_WAIT        0x04        //按键“档位” P2.4 确认被按下，等待释放
#define BUTTON_TIMING_WAIT       0x02        //按键“定时” P2.5 确认被按下，等待释放
#define BUTTON_BACK_LIGHT_WAIT   0x01        //按键“背光”P1.1确认被按下，等待释放
/******************************************/

#define Max_Gears                15           //最大档位限制
/*********************Button_flag*****************/
#define ButtonSearchStatus       0x01  		//标识，标识按键处于查询状态
#define ButtonAckStatus			 0x02		//标识，标识按键处于确认状态
#define ButtonReleaseStatus		 0x03		//标识，标识按键处于等待释放状态

/********************lcd_flag1***************/
#define LcdGearsMask            0x0f         //掩码，用于从Lcd_flag1标志中获取当前档位 0-Max_Gears个档位
#define LcdGearsNew				0x80         //标志，新档位标志，PWMOut函数读取此标志判断是否更新PWM输出状态

/********************lcd_flag2****************/
#define LcdTimingMask		    0x3f         //掩码，用于从Lcd_flag2标志中获取当前定时时间 最大值 2^6 =64分钟
#define LcdTimingON             0x40         //标志，定时使能

/*********************************************/
#define ButtonPort                   P1			//按键端口
#define ButtonMask  				 0x0e		 //掩码 从端口获取按键键值
#define ButtonBackLightMask          0x02        //掩码  获取单个按键状态
#define ButtonGearsMask              0x04        //掩码  获取单个按键状态
#define ButtonTimingMask  			 0x08    	 //掩码  获取单个按键状态


uchar8 LcdScan_row= COM1;   //当前LCD扫描com口标志,初始化从Com1开始扫描
uchar8 flag = (LcdSacn_forward | Lcd_Data_New); //标志变量1，初始化液晶正向扫描,Lcd刷新缓冲区数据
uchar8 Lcd_flag1 = 0x00;     //用于标识当前档位，PWM输出更新标志位
uchar8 Lcd_flag2 = 0x00 ;	 //用于标识当前的定时时间，定时使能状态
uchar8 Button_flag =  ButtonSearchStatus;   //用于标识按键，初始化为查询状态
uchar8 databuf[4]={0x00,0x44,0x11,0x00};  //Lcd数据映射 初始化为“----”

uchar8 __ROM table1[][4]={0xee,0xbb,0xee,0xbb,//"0000"
						  0x44,0x11,0x44,0x11,//"1111"	
						  0xaa,0xee,0x55,0xbb,//"2222"
					      0xee,0x55,0x55,0xbb,//"3333"
						  0x44,0x55,0xff,0x11,//"4444"
						  0xee,0x55,0xbb,0xaa,//"5555"
						  0xee,0xff,0xbb,0xaa,//"6666"							
						  0x44,0x11,0x44,0xbb,//"7777"
					 	  0xee,0xff,0xff,0xbb,//"8888"
						  0xee,0x55,0xff,0xbb,//"9999"
						  0x00,0x44,0x11,0x00,//"----"
						  0x11,0x00,0x00,0x44,//"S1,S2,S3,S4"
								  }; 

void IoInit(void);       //io初始化函数
void IrqInit(void);      //中断初始化函数
void LcdScan(void);      //Lcd扫描函数
void ButtonScan(void);   //按键扫描函数
void DataPut(uchar8  data);   //数据输出函数
void RefleshBuf(void);	//更新数据缓冲区数据
void PwmOut(void);      //PWM控制程序



void IoInit()   //io初始化函数
{	
	_bSET(&P1M,0); //配置为HC164的CLK引脚为输出模式
	_bSET(&P2M,5); //配置HC164的DSB引脚为输出模式
	_bSET(&P0M,0); //配置HC164的MR引脚为输出模式
	_bCLR(&P0,0);  //配置HC164的MR引脚输出0，即锁存HC164

	TC0M = 0x61;     //TC0分频选择Fcpu/4，使能PWM输出，选择输出阶数256 ,禁止TC0时钟
 //	FALOAD0 = 0;	//
//	FTC0OUT = 0;    //选择输出阶数256 
	 
	TC0C = 00;	//
  	TC0R = 00;	//重装值为00  占空比为00/256

	_bCLR(&P1M,1); //配置按键“背光”P1.1引脚为输入模式
	_bCLR(&P1M,2); //配置按键“档位”P1.2引脚为输入模式
	_bCLR(&P1M,3); //配置按键“定时”P1.3引脚为输入模式
    P1 |= 0x0e;    //p1.1 p1.2 p1.3 数据寄存器写1

	P1UR  = 0x0c;   //配置按键“档位” P1.2引脚，按键“定时” P1.3引脚为上拉
	_bSET(&P2M,4);  //配置背光灯引脚为输出模式
	Pin_Backlight = 1; //背光灯关闭

	P2M &=0xf0;    //配置P2.0~P2.3为输入模式，用于控制LCD的COM端口
}


void IrqInit()     //中断初始化函数
{
	T0M |=0x30;	  //设置T0M模式控制寄存器，T0分频为Fcpu/32
	T0C = 0x06;   //设置T0溢出时间间隔，约2ms溢出一次
	 
	_bCLR(&INTRQ,4);    //清除中断请求寄存器
	_bSET(&INTEN,4);	//使能TO中断
	_bSET(&T0M,7);      //启动T0定时器
	_bSET(&STKP,7);		//开总中断
		
}

uchar8 Get_TensPlace_Number(uchar8 x)     //获取一个数的十位，数不允许超过100
{
	uchar8 j=0;
	while(x >= 10)
	{
		j += 1;
		x -= 10;
	}
	return j;
}	



uchar8 Get_OnesPlace_Number(uchar8 x)     //获取一个数的个位，数不允许超过100
{
	while(x >= 10)	
		x -= 10;
	return x;
}

void ButtonScan(void)
{
	uchar8 i;
	if(flag & BUTTON_GEARS)   //“档位”按键被按下
	{	 
		i=(Lcd_flag1 & LcdGearsMask);  //获取当前档位
		Lcd_flag1 &= ~(uchar8)LcdGearsMask; //清除旧档位
		i += 1;
		if(i > Max_Gears)   //超出最大档位限制
		i = 0;
		Lcd_flag1 |= i;  //写入新档位

		flag &= ~(uchar8)(BUTTON_GEARS); //清除按键待处理标志
		flag |= Lcd_Data_New;      //新数据待刷新标志
		Lcd_flag1 |= LcdGearsNew;  //通知PwmOut函数更新PWM输出
	}


	if(flag & BUTTON_TIMING)   //“定时”按键被按下
	{
		i=(Lcd_flag2 & LcdTimingMask);  //获取当前定时定时时间
		if(!(Lcd_flag2 &= LcdTimingON))   //定时器处于失能状态
		{
			Lcd_flag2 &= LcdTimingON;  //定时器使能标志	
			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //清除旧定时时间,相当于写入新定时时间0
		}
		else if(((i+10)==70))
		{
			Lcd_flag2 |= ~(uchar8)LcdTimingON;  //定时器失能标志	
		}
		else
		{
		    i= Get_TensPlace_Number(i);     //获取i的十位数
			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //清除旧定时时间
			Lcd_flag2 |= (i+10);  //写入新定时时间
		}				
		flag &= ~(uchar8)(BUTTON_TIMING);    //清除按键待处理标志
		flag |= Lcd_Data_New;     //新数据待刷新标志	
	}

	if(flag & BUTTON_BACK_LIGHT)  //“背光”按键被按下
	{
		Pin_Backlight=~i;  //背光灯状态翻转
		flag &= ~(uchar8)(BUTTON_BACK_LIGHT);  //清除按键待处理标志
	}

}

void LcdScan()      //lcd扫描com口函数
{	
	uchar8 i=0,j=0;
	if(flag&LcdSacn_forward)   //com口处于正向扫描状态 
	{ 
		if(LcdScan_row&COM4)     //com口扫描到达com4
		{
			flag &= ~LcdSacn_forward;	//清正向扫描标志
			LcdScan_row = COM1; //设置com1
		}
		else
			LcdScan_row <<= 1;   //com口左移一位
		j=LcdScan_row;
		while((j >>= 1)==0x01)   //获取行号
		i+=1;
		DataPut(~databuf[i]);    //推送数据
	
		P2M = P2M & 0xF0 | LcdScan_row;   //设置COMn为输出模式
		P2  = P2 & 0xF0 | LcdScan_row;    //设置COMn输出为1
	}
	else         //com口处于反向扫描状态
	{
		if(LcdScan_row&COM4)       //com口扫描到达com4
		{
			flag |= LcdSacn_forward;	//设置正向扫描标志
			LcdScan_row = COM1;    //设置com1
		}
		else
			LcdScan_row <<= 1;   //com口左移一位

		j=LcdScan_row;
		while((j >>= 1)==0x01)      //获取行号
		i+=1;
		DataPut(databuf[i]);     //推送数据
	
		P2M = P2M & 0xF0 | LcdScan_row;   //设置COMn为输出模式
		P2  = P2 & 0xF0 & ~LcdScan_row;    //设置COMn输出为0
	}
}

void DataPut(uchar8  data)   //推送数据至74hc164
{	
	uchar8 i;
	MR=0;   //锁存
	for(i=0;i<8;i++)
	{
		CLK=0;
//		NOP(10);   //空指令，用于稳定数据，降低扫描速度
		DSB=(data & 0x01);
//		NOP(10);   //空指令，用于稳定数据，降低扫描速度
		CLK=1;
		data >>= 1;
	}
	MR=1;	//开锁存
}

void TableToBuf(uchar8 mask,uchar8 number)  //根据掩码从Table表中取数据放至databuf
{
	uchar8 i,dat;
	for(i=0;i<4;i++)
	{	
		dat = table1[number][i] & mask;    //获得对应的数码管显示位
		databuf[i] &= ~(uchar8)mask;     
		databuf[i] |= dat;							
	}
}

void RefleshBuf(void)   //数据缓冲区刷新函数
{
	uchar8 temporary1,temporary2;
	if(flag & Lcd_Data_New)   //有新数据要刷新
	{	
/********************************刷新档位***********************************************/
		temporary1=(Lcd_flag1 & LcdGearsMask);  //获取档位
		temporary2=Get_TensPlace_Number(temporary1);  //获取十位
		TableToBuf(0xc0,temporary2);        //从Table表中区数据放至databuf

		temporary2=Get_OnesPlace_Number(temporary1);  //获取个位
		TableToBuf(0x30,temporary2);        //从Table表中区数据放至databuf


/*******************************刷新定时时间******************************************/
		if(Lcd_flag2 & LcdTimingON)  //定时器使能标志
		{
			temporary1=(Lcd_flag2 & LcdTimingMask);  //获取当前定时定时时间
			temporary2=Get_TensPlace_Number(temporary1);  //获取十位
			TableToBuf(0x0c,temporary2);    //从Table表中取数据放至databuf

			temporary2=Get_OnesPlace_Number(temporary1);  //获取十位
			TableToBuf(0x03,temporary2);    //从Table表中取数据放至databuf		
		}else    //显示“--”
			TableToBuf(0x0f,11);         //从Table表中取数据放至databuf
			

/**************************************************************************************/

		flag &= ~(uchar8)Lcd_Data_New; //数据处理完毕
	}
}


void __interrupt[0x08] ISR(void)   //中断处理函数
{
	
  	uchar8 ButtonValue ; 
	static uchar8 ms_counter=0; //毫秒计数
	static uchar8 s_counter=0;  //秒计数

/******************************定时处理****************/
	if(Lcd_flag2 & LcdTimingMask)   //剩余定时时间不为零
	{
		if(ms_counter>=250)   //250*2ms=0.5s
		{
			ms_counter = 0;
			s_counter++;
		}else
		{
			ms_counter++;
		}

		if(s_counter>=120)    //120*0.5=60s
		{
			s_counter = 0;
			Lcd_flag2 -= 1;        //定时时间减去一分钟
			flag |= Lcd_Data_New;  //新数据待刷新标志
		}else
		{
			s_counter++;
		}
	}
	else
	{
		ms_counter = 0;	
		s_counter  = 0;
		Lcd_flag1 |= LcdGearsNew;  //通知PwmOut函数更新PWM输出
	}
/***********************检测按键********************************/

   ButtonValue = (~ButtonPort) & ButtonMask;   // 检测哪一个按键按下
   switch (Button_flag & 0x03)
   {
     case ButtonSearchStatus:            // 按键查询状态
    {
       if (ButtonValue)
         Button_flag = ButtonAckStatus;    // 按键下一个状态为确认状态
     } break;
     
     case ButtonAckStatus:               // 按键确认状态
    {
       if (!ButtonValue)    
         Button_flag = ButtonSearchStatus;
       else
       {
		if(ButtonValue & ButtonGearsMask)      //按键“档位”被按下
			flag |= BUTTON_GEARS_WAIT;          //按键“档位” 置等待确认标志

		if(ButtonValue & ButtonTimingMask)      //按键“定时”被按下
			flag |= BUTTON_TIMING_WAIT;          //按键“定时” 置等待确认标志

		if(ButtonValue & ButtonBackLightMask)    //按键“背光”被按下
			flag |= BUTTON_BACK_LIGHT_WAIT;      //按键“背光” 置等待确认标志

         Button_flag = ButtonReleaseStatus;  // 按键下一个状态为释放状态
       }
     } break;        
                     
     case ButtonReleaseStatus:             // 按键释放状态
    {
       if (!ButtonValue)                   // 按键释放
      {
         if(flag & BUTTON_GEARS_WAIT)      //按键“档位”正等待确认
		{
			flag |= BUTTON_GEARS;          //按键“档位” 置确认标志
			flag &= ~(uchar8)BUTTON_GEARS_WAIT;  //清等待确认标志
		 }
		 if(flag & BUTTON_TIMING_WAIT)      //按键“定时”等待确认
		{
			flag |= BUTTON_TIMING;          //按键“定时” 置确认标志
			flag &= ~(uchar8)BUTTON_TIMING_WAIT;  //清等待确认标志
		 }
		 if(flag & BUTTON_BACK_LIGHT_WAIT)      //按键“背光”等待确认
	 	{
			flag |= BUTTON_BACK_LIGHT;          //按键“背光” 置确认标志
			flag &= ~(uchar8)BUTTON_BACK_LIGHT_WAIT;  //清等待确认标志
		 }	
        Button_flag = ButtonSearchStatus;  // 按键下一个状态为查询状态     
      }
     }  
     default : break;
   }
   FT0IRQ = 0;     //清除中断标志位
   /*************************************************************/
}

void PwmOut()
{
	if(Lcd_flag1 & LcdGearsNew)  //需要更新PWM输出
	{
		switch(Lcd_flag1 & LcdGearsMask)  //获取新输出档位
		{
			case 0: FTC0ENB = 0; //禁止TC0时钟
			break;
			case 1: TC0R = 30;	//占空比为30/256
			break;
			case 2: TC0R = 60;	//占空比为60/256
			break;
			case 3: TC0R = 90;	//占空比为90/256
			break;
			case 4: TC0R = 120;	//占空比为120/256
			break;
			case 5: TC0R = 150;	//占空比为150/256
			break;
			case 6: TC0R = 180;	//占空比为180/256
			break;
			case 7: TC0R = 210;	//占空比为210/256
			break;
			default :break;
		}
		if((Lcd_flag2 & LcdTimingON) && (!(Lcd_flag2 & LcdTimingMask)) )  //如果定时功能使能并且定时时间到零
			FTC0ENB = 0; //禁止TC0时钟，关闭PWM输出
			
	Lcd_flag1 &= ~(uchar8)LcdGearsNew;  //PWM输出更新完毕
	}
}

/**************************主函数************************/
int main(void)
{	 
	IoInit();
	IrqInit();   
	while(1)
	{
		WDTR=0x5A;      //看门狗清零
		ButtonScan();   //按键扫描
		RefleshBuf();   //刷新显示缓冲区
		LcdScan();      //扫描Lcd
		PwmOut(); 		//更新PWM输出状态
	}
	return 0;
	
}
