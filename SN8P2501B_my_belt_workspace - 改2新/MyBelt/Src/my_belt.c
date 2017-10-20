/************************************************************************
�ж�ֻ���������
�ж��޷������ӳ���
�޸�io�˿�����Ӳ�����
�޸�table���Լ򻯳���
�°�����������
�޸İ�������
T0��ʱ��ģ��RTCʱ��
�򻯱��ⰴ��
��ֹ״̬Һ��ˢ��Ƶ��ԼΪ1750hz
��������bug,���ӵ�λ��15��
*************************************************************************/

/****
Button_Pin_Backlight P1.1   ��������������
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

#define MR						FP00        //HC164����   P0.0
#define CLK						FP10        //HC164ʱ���ź� P1.0
#define DSB						FP25		//HC164������� P2.5
#define Button_Pin_Backlight    FP11        //���⿪��
#define Button_Pin_Gears       	FP12        //���Ƶ�λ
#define Button_Pin_Timing       FP13        //���ƶ�ʱ
#define Pin_Backlight			FP24        //�����

#define Get_Number_Mask          0x03        //���룬��table1���л�ȡ����
 									
/*************flag��־*****************/
#define LcdSacn_forward          0x80        //Lcd����ɨ���־
#define Lcd_Data_New             0x40        //Lcd�����ݱ�־

#define BUTTON_GEARS             0x20        //��������λ�� P2.4 ������һ��
#define BUTTON_TIMING            0x10        //��������ʱ�� P2.5 ������һ��
#define BUTTON_BACK_LIGHT        0x08        //���� �����⡱ P1.1  ������һ��

#define BUTTON_GEARS_WAIT        0x04        //��������λ�� P2.4 ȷ�ϱ����£��ȴ��ͷ�
#define BUTTON_TIMING_WAIT       0x02        //��������ʱ�� P2.5 ȷ�ϱ����£��ȴ��ͷ�
#define BUTTON_BACK_LIGHT_WAIT   0x01        //���������⡱P1.1ȷ�ϱ����£��ȴ��ͷ�
/******************************************/

#define Max_Gears                15           //���λ����
/*********************Button_flag*****************/
#define ButtonSearchStatus       0x01  		//��ʶ����ʶ�������ڲ�ѯ״̬
#define ButtonAckStatus			 0x02		//��ʶ����ʶ��������ȷ��״̬
#define ButtonReleaseStatus		 0x03		//��ʶ����ʶ�������ڵȴ��ͷ�״̬

/********************lcd_flag1***************/
#define LcdGearsMask            0x0f         //���룬���ڴ�Lcd_flag1��־�л�ȡ��ǰ��λ 0-Max_Gears����λ
#define LcdGearsNew				0x80         //��־���µ�λ��־��PWMOut������ȡ�˱�־�ж��Ƿ����PWM���״̬

/********************lcd_flag2****************/
#define LcdTimingMask		    0x3f         //���룬���ڴ�Lcd_flag2��־�л�ȡ��ǰ��ʱʱ�� ���ֵ 2^6 =64����
#define LcdTimingON             0x40         //��־����ʱʹ��

/*********************************************/
#define ButtonPort                   P1			//�����˿�
#define ButtonMask  				 0x0e		 //���� �Ӷ˿ڻ�ȡ������ֵ
#define ButtonBackLightMask          0x02        //����  ��ȡ��������״̬
#define ButtonGearsMask              0x04        //����  ��ȡ��������״̬
#define ButtonTimingMask  			 0x08    	 //����  ��ȡ��������״̬


uchar8 LcdScan_row= COM1;   //��ǰLCDɨ��com�ڱ�־,��ʼ����Com1��ʼɨ��
uchar8 flag = (LcdSacn_forward | Lcd_Data_New); //��־����1����ʼ��Һ������ɨ��,Lcdˢ�»���������
uchar8 Lcd_flag1 = 0x00;     //���ڱ�ʶ��ǰ��λ��PWM������±�־λ
uchar8 Lcd_flag2 = 0x00 ;	 //���ڱ�ʶ��ǰ�Ķ�ʱʱ�䣬��ʱʹ��״̬
uchar8 Button_flag =  ButtonSearchStatus;   //���ڱ�ʶ��������ʼ��Ϊ��ѯ״̬
uchar8 databuf[4]={0x00,0x44,0x11,0x00};  //Lcd����ӳ�� ��ʼ��Ϊ��----��

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

void IoInit(void);       //io��ʼ������
void IrqInit(void);      //�жϳ�ʼ������
void LcdScan(void);      //Lcdɨ�躯��
void ButtonScan(void);   //����ɨ�躯��
void DataPut(uchar8  data);   //�����������
void RefleshBuf(void);	//�������ݻ���������
void PwmOut(void);      //PWM���Ƴ���



void IoInit()   //io��ʼ������
{	
	_bSET(&P1M,0); //����ΪHC164��CLK����Ϊ���ģʽ
	_bSET(&P2M,5); //����HC164��DSB����Ϊ���ģʽ
	_bSET(&P0M,0); //����HC164��MR����Ϊ���ģʽ
	_bCLR(&P0,0);  //����HC164��MR�������0��������HC164

	TC0M = 0x61;     //TC0��Ƶѡ��Fcpu/4��ʹ��PWM�����ѡ���������256 ,��ֹTC0ʱ��
 //	FALOAD0 = 0;	//
//	FTC0OUT = 0;    //ѡ���������256 
	 
	TC0C = 00;	//
  	TC0R = 00;	//��װֵΪ00  ռ�ձ�Ϊ00/256

	_bCLR(&P1M,1); //���ð��������⡱P1.1����Ϊ����ģʽ
	_bCLR(&P1M,2); //���ð�������λ��P1.2����Ϊ����ģʽ
	_bCLR(&P1M,3); //���ð�������ʱ��P1.3����Ϊ����ģʽ
    P1 |= 0x0e;    //p1.1 p1.2 p1.3 ���ݼĴ���д1

	P1UR  = 0x0c;   //���ð�������λ�� P1.2���ţ���������ʱ�� P1.3����Ϊ����
	_bSET(&P2M,4);  //���ñ��������Ϊ���ģʽ
	Pin_Backlight = 1; //����ƹر�

	P2M &=0xf0;    //����P2.0~P2.3Ϊ����ģʽ�����ڿ���LCD��COM�˿�
}


void IrqInit()     //�жϳ�ʼ������
{
	T0M |=0x30;	  //����T0Mģʽ���ƼĴ�����T0��ƵΪFcpu/32
	T0C = 0x06;   //����T0���ʱ������Լ2ms���һ��
	 
	_bCLR(&INTRQ,4);    //����ж�����Ĵ���
	_bSET(&INTEN,4);	//ʹ��TO�ж�
	_bSET(&T0M,7);      //����T0��ʱ��
	_bSET(&STKP,7);		//�����ж�
		
}

uchar8 Get_TensPlace_Number(uchar8 x)     //��ȡһ������ʮλ������������100
{
	uchar8 j=0;
	while(x >= 10)
	{
		j += 1;
		x -= 10;
	}
	return j;
}	



uchar8 Get_OnesPlace_Number(uchar8 x)     //��ȡһ�����ĸ�λ������������100
{
	while(x >= 10)	
		x -= 10;
	return x;
}

void ButtonScan(void)
{
	uchar8 i;
	if(flag & BUTTON_GEARS)   //����λ������������
	{	 
		i=(Lcd_flag1 & LcdGearsMask);  //��ȡ��ǰ��λ
		Lcd_flag1 &= ~(uchar8)LcdGearsMask; //����ɵ�λ
		i += 1;
		if(i > Max_Gears)   //�������λ����
		i = 0;
		Lcd_flag1 |= i;  //д���µ�λ

		flag &= ~(uchar8)(BUTTON_GEARS); //��������������־
		flag |= Lcd_Data_New;      //�����ݴ�ˢ�±�־
		Lcd_flag1 |= LcdGearsNew;  //֪ͨPwmOut��������PWM���
	}


	if(flag & BUTTON_TIMING)   //����ʱ������������
	{
		i=(Lcd_flag2 & LcdTimingMask);  //��ȡ��ǰ��ʱ��ʱʱ��
		if(!(Lcd_flag2 &= LcdTimingON))   //��ʱ������ʧ��״̬
		{
			Lcd_flag2 &= LcdTimingON;  //��ʱ��ʹ�ܱ�־	
			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //����ɶ�ʱʱ��,�൱��д���¶�ʱʱ��0
		}
		else if(((i+10)==70))
		{
			Lcd_flag2 |= ~(uchar8)LcdTimingON;  //��ʱ��ʧ�ܱ�־	
		}
		else
		{
		    i= Get_TensPlace_Number(i);     //��ȡi��ʮλ��
			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //����ɶ�ʱʱ��
			Lcd_flag2 |= (i+10);  //д���¶�ʱʱ��
		}				
		flag &= ~(uchar8)(BUTTON_TIMING);    //��������������־
		flag |= Lcd_Data_New;     //�����ݴ�ˢ�±�־	
	}

	if(flag & BUTTON_BACK_LIGHT)  //�����⡱����������
	{
		Pin_Backlight=~i;  //�����״̬��ת
		flag &= ~(uchar8)(BUTTON_BACK_LIGHT);  //��������������־
	}

}

void LcdScan()      //lcdɨ��com�ں���
{	
	uchar8 i=0,j=0;
	if(flag&LcdSacn_forward)   //com�ڴ�������ɨ��״̬ 
	{ 
		if(LcdScan_row&COM4)     //com��ɨ�赽��com4
		{
			flag &= ~LcdSacn_forward;	//������ɨ���־
			LcdScan_row = COM1; //����com1
		}
		else
			LcdScan_row <<= 1;   //com������һλ
		j=LcdScan_row;
		while((j >>= 1)==0x01)   //��ȡ�к�
		i+=1;
		DataPut(~databuf[i]);    //��������
	
		P2M = P2M & 0xF0 | LcdScan_row;   //����COMnΪ���ģʽ
		P2  = P2 & 0xF0 | LcdScan_row;    //����COMn���Ϊ1
	}
	else         //com�ڴ��ڷ���ɨ��״̬
	{
		if(LcdScan_row&COM4)       //com��ɨ�赽��com4
		{
			flag |= LcdSacn_forward;	//��������ɨ���־
			LcdScan_row = COM1;    //����com1
		}
		else
			LcdScan_row <<= 1;   //com������һλ

		j=LcdScan_row;
		while((j >>= 1)==0x01)      //��ȡ�к�
		i+=1;
		DataPut(databuf[i]);     //��������
	
		P2M = P2M & 0xF0 | LcdScan_row;   //����COMnΪ���ģʽ
		P2  = P2 & 0xF0 & ~LcdScan_row;    //����COMn���Ϊ0
	}
}

void DataPut(uchar8  data)   //����������74hc164
{	
	uchar8 i;
	MR=0;   //����
	for(i=0;i<8;i++)
	{
		CLK=0;
//		NOP(10);   //��ָ������ȶ����ݣ�����ɨ���ٶ�
		DSB=(data & 0x01);
//		NOP(10);   //��ָ������ȶ����ݣ�����ɨ���ٶ�
		CLK=1;
		data >>= 1;
	}
	MR=1;	//������
}

void TableToBuf(uchar8 mask,uchar8 number)  //���������Table����ȡ���ݷ���databuf
{
	uchar8 i,dat;
	for(i=0;i<4;i++)
	{	
		dat = table1[number][i] & mask;    //��ö�Ӧ���������ʾλ
		databuf[i] &= ~(uchar8)mask;     
		databuf[i] |= dat;							
	}
}

void RefleshBuf(void)   //���ݻ�����ˢ�º���
{
	uchar8 temporary1,temporary2;
	if(flag & Lcd_Data_New)   //��������Ҫˢ��
	{	
/********************************ˢ�µ�λ***********************************************/
		temporary1=(Lcd_flag1 & LcdGearsMask);  //��ȡ��λ
		temporary2=Get_TensPlace_Number(temporary1);  //��ȡʮλ
		TableToBuf(0xc0,temporary2);        //��Table���������ݷ���databuf

		temporary2=Get_OnesPlace_Number(temporary1);  //��ȡ��λ
		TableToBuf(0x30,temporary2);        //��Table���������ݷ���databuf


/*******************************ˢ�¶�ʱʱ��******************************************/
		if(Lcd_flag2 & LcdTimingON)  //��ʱ��ʹ�ܱ�־
		{
			temporary1=(Lcd_flag2 & LcdTimingMask);  //��ȡ��ǰ��ʱ��ʱʱ��
			temporary2=Get_TensPlace_Number(temporary1);  //��ȡʮλ
			TableToBuf(0x0c,temporary2);    //��Table����ȡ���ݷ���databuf

			temporary2=Get_OnesPlace_Number(temporary1);  //��ȡʮλ
			TableToBuf(0x03,temporary2);    //��Table����ȡ���ݷ���databuf		
		}else    //��ʾ��--��
			TableToBuf(0x0f,11);         //��Table����ȡ���ݷ���databuf
			

/**************************************************************************************/

		flag &= ~(uchar8)Lcd_Data_New; //���ݴ������
	}
}


void __interrupt[0x08] ISR(void)   //�жϴ�����
{
	
  	uchar8 ButtonValue ; 
	static uchar8 ms_counter=0; //�������
	static uchar8 s_counter=0;  //�����

/******************************��ʱ����****************/
	if(Lcd_flag2 & LcdTimingMask)   //ʣ�ඨʱʱ�䲻Ϊ��
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
			Lcd_flag2 -= 1;        //��ʱʱ���ȥһ����
			flag |= Lcd_Data_New;  //�����ݴ�ˢ�±�־
		}else
		{
			s_counter++;
		}
	}
	else
	{
		ms_counter = 0;	
		s_counter  = 0;
		Lcd_flag1 |= LcdGearsNew;  //֪ͨPwmOut��������PWM���
	}
/***********************��ⰴ��********************************/

   ButtonValue = (~ButtonPort) & ButtonMask;   // �����һ����������
   switch (Button_flag & 0x03)
   {
     case ButtonSearchStatus:            // ������ѯ״̬
    {
       if (ButtonValue)
         Button_flag = ButtonAckStatus;    // ������һ��״̬Ϊȷ��״̬
     } break;
     
     case ButtonAckStatus:               // ����ȷ��״̬
    {
       if (!ButtonValue)    
         Button_flag = ButtonSearchStatus;
       else
       {
		if(ButtonValue & ButtonGearsMask)      //��������λ��������
			flag |= BUTTON_GEARS_WAIT;          //��������λ�� �õȴ�ȷ�ϱ�־

		if(ButtonValue & ButtonTimingMask)      //��������ʱ��������
			flag |= BUTTON_TIMING_WAIT;          //��������ʱ�� �õȴ�ȷ�ϱ�־

		if(ButtonValue & ButtonBackLightMask)    //���������⡱������
			flag |= BUTTON_BACK_LIGHT_WAIT;      //���������⡱ �õȴ�ȷ�ϱ�־

         Button_flag = ButtonReleaseStatus;  // ������һ��״̬Ϊ�ͷ�״̬
       }
     } break;        
                     
     case ButtonReleaseStatus:             // �����ͷ�״̬
    {
       if (!ButtonValue)                   // �����ͷ�
      {
         if(flag & BUTTON_GEARS_WAIT)      //��������λ�����ȴ�ȷ��
		{
			flag |= BUTTON_GEARS;          //��������λ�� ��ȷ�ϱ�־
			flag &= ~(uchar8)BUTTON_GEARS_WAIT;  //��ȴ�ȷ�ϱ�־
		 }
		 if(flag & BUTTON_TIMING_WAIT)      //��������ʱ���ȴ�ȷ��
		{
			flag |= BUTTON_TIMING;          //��������ʱ�� ��ȷ�ϱ�־
			flag &= ~(uchar8)BUTTON_TIMING_WAIT;  //��ȴ�ȷ�ϱ�־
		 }
		 if(flag & BUTTON_BACK_LIGHT_WAIT)      //���������⡱�ȴ�ȷ��
	 	{
			flag |= BUTTON_BACK_LIGHT;          //���������⡱ ��ȷ�ϱ�־
			flag &= ~(uchar8)BUTTON_BACK_LIGHT_WAIT;  //��ȴ�ȷ�ϱ�־
		 }	
        Button_flag = ButtonSearchStatus;  // ������һ��״̬Ϊ��ѯ״̬     
      }
     }  
     default : break;
   }
   FT0IRQ = 0;     //����жϱ�־λ
   /*************************************************************/
}

void PwmOut()
{
	if(Lcd_flag1 & LcdGearsNew)  //��Ҫ����PWM���
	{
		switch(Lcd_flag1 & LcdGearsMask)  //��ȡ�������λ
		{
			case 0: FTC0ENB = 0; //��ֹTC0ʱ��
			break;
			case 1: TC0R = 30;	//ռ�ձ�Ϊ30/256
			break;
			case 2: TC0R = 60;	//ռ�ձ�Ϊ60/256
			break;
			case 3: TC0R = 90;	//ռ�ձ�Ϊ90/256
			break;
			case 4: TC0R = 120;	//ռ�ձ�Ϊ120/256
			break;
			case 5: TC0R = 150;	//ռ�ձ�Ϊ150/256
			break;
			case 6: TC0R = 180;	//ռ�ձ�Ϊ180/256
			break;
			case 7: TC0R = 210;	//ռ�ձ�Ϊ210/256
			break;
			default :break;
		}
		if((Lcd_flag2 & LcdTimingON) && (!(Lcd_flag2 & LcdTimingMask)) )  //�����ʱ����ʹ�ܲ��Ҷ�ʱʱ�䵽��
			FTC0ENB = 0; //��ֹTC0ʱ�ӣ��ر�PWM���
			
	Lcd_flag1 &= ~(uchar8)LcdGearsNew;  //PWM����������
	}
}

/**************************������************************/
int main(void)
{	 
	IoInit();
	IrqInit();   
	while(1)
	{
		WDTR=0x5A;      //���Ź�����
		ButtonScan();   //����ɨ��
		RefleshBuf();   //ˢ����ʾ������
		LcdScan();      //ɨ��Lcd
		PwmOut(); 		//����PWM���״̬
	}
	return 0;
	
}
