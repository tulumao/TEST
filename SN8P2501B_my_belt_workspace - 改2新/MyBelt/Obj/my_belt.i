#line 1 ".\Src\my_belt.c"
#line 1 "D:\Sonix\SN8_C_Studio_V154(580.219)\C\include\SonixDef.h"



unsigned long GetRollingCode(unsigned int offset);








struct _intrinsicbitfield
{
	unsigned bit0:1;
	unsigned bit1:1;
	unsigned bit2:1;
	unsigned bit3:1;
	unsigned bit4:1;
	unsigned bit5:1;
	unsigned bit6:1;
	unsigned bit7:1;
};













#line 1 ".\Src\my_belt.c"

#line 13 ".\Src\my_belt.c"


#line 25 ".\Src\my_belt.c"


#line 1 "D:\Sonix\SN8_C_Studio_V154(580.219)\C\include\sn8p2501b.h"



void _ClearWatchDogTimer(void);
void _ClrRAM(void);



sfr	R = 0x82;
sfr	Z = 0x83;
sfr	Y = 0x84;
sfr	PFLAG = 0x86;
sbit	FZ = 0x86:0;
sbit	FDC = 0x86:1;
sbit	FC = 0x86:2;
sbit	FLVD24 = 0x86:4;
sbit	FLVD36 = 0x86:5;
sbit	FNPD = 0x86:6;
sbit	FNT0 = 0x86:7;
sfr	P0M = 0xb8;
sbit	FP00M = 0xb8:0;
sfr	PEDGE = 0xbf;
sbit	FP00G1 = 0xbf:4;
sbit	FP00G0 = 0xbf:3;
sfr	P1W = 0xc0;
sfr	P1M = 0xc1;
sbit	FP10M = 0xc1:0;
sbit	FP12M = 0xc1:2;
sbit	FP13M = 0xc1:3;
sfr	P2M = 0xc2;
sbit	FP20M = 0xc2:0;
sbit	FP21M = 0xc2:1;
sbit	FP22M = 0xc2:2;
sbit	FP23M = 0xc2:3;
sbit	FP24M = 0xc2:4;
sbit	FP25M = 0xc2:5;
sfr	P5M = 0xc5;
sbit	FP54M = 0xc5:4;
sfr	INTRQ = 0xc8;
sbit	FP00IRQ = 0xc8:0;
sbit	FT0IRQ = 0xc8:4;
sbit	FTC0IRQ = 0xc8:5;
sfr	INTEN = 0xc9;
sbit	FP00IEN = 0xc9:0;
sbit	FT0IEN = 0xc9:4;
sbit	FTC0IEN = 0xc9:5;
sfr	OSCM = 0xca;
sbit	FCPUM1 = 0xca:4;
sbit	FCPUM0 = 0xca:3;
sbit	FCLKMD = 0xca:2;
sbit	FSTPHX = 0xca:1;
sfr	WDTR = 0xcc;
sfr	TC0R = 0xcd;
sfr	PCL = 0xce;
sfr	PCH = 0xcf;
sfr	P0 = 0xd0;
sbit	FP00 = 0xd0:0;
sfr	P1 = 0xd1;
sbit	FP10 = 0xd1:0;
sbit	FP11 = 0xd1:1;
sbit	FP12 = 0xd1:2;
sbit	FP13 = 0xd1:3;
sfr	P2 = 0xd2;
sbit	FP20 = 0xd2:0;
sbit	FP21 = 0xd2:1;
sbit	FP22 = 0xd2:2;
sbit	FP23 = 0xd2:3;
sbit	FP24 = 0xd2:4;
sbit	FP25 = 0xd2:5;
sfr	P5 = 0xd5;
sbit	FP54 = 0xd5:4;
sfr	T0M = 0xd8;
sbit	FT0TB = 0xd8:0;
sbit	FT0RATE0 = 0xd8:4;
sbit	FT0RATE1 = 0xd8:5;
sbit	FT0RATE2 = 0xd8:6;
sbit	FT0ENB = 0xd8:7;
sfr	T0C = 0xd9;
sfr	TC0M = 0xda;
sbit	FTC0ENB = 0xda:7;
sbit	FTC0RATE2 = 0xda:6;
sbit	FTC0RATE1 = 0xda:5;
sbit	FTC0RATE0 = 0xda:4;
sbit	FTC0CKS = 0xda:3;
sbit	FALOAD0 = 0xda:2;
sbit	FTC0OUT = 0xda:1;
sbit	FPWM0OUT = 0xda:0;
sfr	TC0C = 0xdb;
sfr	STKP = 0xdf;
sbit	FGIE = 0xdf:7;
sbit	FSTKPB1 = 0xdf:1;
sbit	FSTKPB0 = 0xdf:0;
sfr	P0UR = 0xe0;
sbit	FP00R = 0xe0:0;
sfr	P1UR = 0xe1;
sbit	FP10R = 0xe1:0;
sbit	FP12R = 0xe1:2;
sbit	FP13R = 0xe1:3;
sfr	P2UR = 0xe2;
sbit	FP20R = 0xe2:0;
sbit	FP21R = 0xe2:1;
sbit	FP22R = 0xe2:2;
sbit	FP23R = 0xe2:3;
sbit	FP24R = 0xe2:4;
sbit	FP25R = 0xe2:5;
sfr	P5UR = 0xe5;
sbit	FP54R = 0xe5:4;
sfr	_YZ = 0xe7;
sfr	P1OC = 0xe9;
sfr	STK3L = 0xf8;
sfr	STK3H = 0xf9;
sfr	STK2L = 0xfa;
sfr	STK2H = 0xfb;
sfr	STK1L = 0xfc;
sfr	STK1H = 0xfd;
sfr	STK0L = 0xfe;
sfr	STK0H = 0xff;





#line 28 ".\Src\my_belt.c"






















































 unsigned char LcdScan_row= 0x01;
 unsigned char flag = (0x80 | 0x40);
 unsigned char Lcd_flag1 = 0x00;
 unsigned char Lcd_flag2 = 0x00 ;
 unsigned char Button_flag = 0x01;
 unsigned char databuf[4]={0xee,0xbb,0xee,0xbb};

 unsigned char __ROM table1[][4]={0xee,0xbb,0xee,0xbb,
						  0x44,0x11,0x44,0x11,
						  0xaa,0xee,0x55,0xbb,
					      0xee,0x55,0x55,0xbb,
						  0x44,0x55,0xff,0x11,
						  0xee,0x55,0xbb,0xaa,
						  0xee,0xff,0xbb,0xaa,
						  0x44,0x11,0x44,0xbb,
					 	  0xee,0xff,0xff,0xbb,
						  0xee,0x55,0xff,0xbb,
						  0x00,0x44,0x11,0x00,
						  0x11,0x00,0x00,0x44,
								  };

void IoInit(void);
void IrqInit(void);
void LcdScan(void);
void ButtonScan(void);
void DataPut(unsigned char  data);
void RefleshBuf(void);
void PwmOut(void);



void IoInit()
{
(((*((__RAM struct _intrinsicbitfield *)&P1M)). bit0) = 1);
(((*((__RAM struct _intrinsicbitfield *)&P2M)). bit5) = 1);
(((*((__RAM struct _intrinsicbitfield *)&P0M)). bit0) = 1);
(((*((__RAM struct _intrinsicbitfield *)&P0)). bit0) = 0);

	TC0M = 0x61;



	TC0C = 00;
  	TC0R = 00;

(((*((__RAM struct _intrinsicbitfield *)&P1M)). bit1) = 0);
(((*((__RAM struct _intrinsicbitfield *)&P1M)). bit2) = 0);
(((*((__RAM struct _intrinsicbitfield *)&P1M)). bit3) = 0);
    P1 |= 0x0e;

	P1UR  = 0x0c;
(((*((__RAM struct _intrinsicbitfield *)&P2M)). bit4) = 1);
 FP24 = 1;

	P2M &=0xf0;
}


void IrqInit()
{
	T0M |=0x30;
	T0C = 0x06;

(((*((__RAM struct _intrinsicbitfield *)&INTRQ)). bit4) = 0);
(((*((__RAM struct _intrinsicbitfield *)&INTEN)). bit4) = 1);
(((*((__RAM struct _intrinsicbitfield *)&T0M)). bit7) = 1);
(((*((__RAM struct _intrinsicbitfield *)&STKP)). bit7) = 1);

}

 unsigned char Get_TensPlace_Number(unsigned char x)
{
 unsigned char j=0;
	while(x >= 10)
	{
		j += 1;
		x -= 10;
	}
	return j;
}



 unsigned char Get_OnesPlace_Number(unsigned char x)
{
	while(x >= 10)
		x -= 10;
	return x;
}

void ButtonScan(void)
{
 unsigned char i;
	if(flag & 0x20)
	{
		i=(Lcd_flag1 & 0x0f);
		Lcd_flag1 &= ~(unsigned char)0x0f;
		i += 1;
		if(i > 15)
		i = 0;
		Lcd_flag1 |= i;

		flag &= ~(unsigned char)(0x20);
		flag |= 0x40;
		Lcd_flag1 |= 0x80;
	}


	if(flag & 0x10)
	{
		i=(Lcd_flag2 & 0x3f);
		if(!(Lcd_flag2 &= 0x40))
		{
			Lcd_flag2 &= 0x40;
			Lcd_flag2 &= ~(unsigned char)0x3f;
		}
		else if(((i+10)==70))
		{
			Lcd_flag2 |= ~(unsigned char)0x40;
		}
		else
		{
		    i= Get_TensPlace_Number(i);
			Lcd_flag2 &= ~(unsigned char)0x3f;
			Lcd_flag2 |= (i+10);
		}
		flag &= ~(unsigned char)(0x10);
		flag |= 0x40;
	}

	if(flag & 0x08)
	{
 FP24 =~i;
		flag &= ~(unsigned char)(0x08);
	}

}

void LcdScan()
{
 unsigned char i=0,j=0;
	if(flag& 0x80)
	{
		if(LcdScan_row& 0x08)
		{
			flag &= ~ 0x80;
			LcdScan_row = 0x01;
		}
		else
			LcdScan_row <<= 1;
		j=LcdScan_row;
		while((j >>= 1)==0x01)
		i+=1;
		DataPut(~databuf[i]);

		P2M = P2M & 0xF0 | LcdScan_row;
		P2  = P2 & 0xF0 | LcdScan_row;
	}
	else
	{
		if(LcdScan_row& 0x08)
		{
			flag |= 0x80;
			LcdScan_row = 0x01;
		}
		else
			LcdScan_row <<= 1;

		j=LcdScan_row;
		while((j >>= 1)==0x01)
		i+=1;
		DataPut(databuf[i]);

		P2M = P2M & 0xF0 | LcdScan_row;
		P2  = P2 & 0xF0 & ~LcdScan_row;
	}
}

void DataPut(unsigned char  data)
{
 unsigned char i;
 FP00 =0;
	for(i=0;i<8;i++)
	{
 FP10 =0;

 FP25 =(data & 0x01);

 FP10 =1;
		data >>= 1;
	}
 FP00 =1;
}

void TableToBuf(unsigned char mask,unsigned char number)
{
 unsigned char i,dat;
	for(i=0;i<4;i++)
	{
		dat = table1[number][i] & mask;
		databuf[i] &= ~(unsigned char)mask;
		databuf[i] |= dat;
	}
}

void RefleshBuf(void)
{
 unsigned char temporary1,temporary2;
	if(flag & 0x40)
	{

		temporary1=(Lcd_flag1 & 0x0f);
		temporary2=Get_TensPlace_Number(temporary1);
		TableToBuf(0xc0,temporary2);

		temporary2=Get_OnesPlace_Number(temporary1);
		TableToBuf(0x30,temporary2);



		if(Lcd_flag2 & 0x40)
		{
			temporary1=(Lcd_flag2 & 0x3f);
			temporary2=Get_TensPlace_Number(temporary1);
			TableToBuf(0x0c,temporary2);

			temporary2=Get_OnesPlace_Number(temporary1);
			TableToBuf(0x03,temporary2);
		}else
			TableToBuf(0x0f,11);




		flag &= ~(unsigned char)0x40;
	}
}


void __interrupt[0x08] ISR(void)
{

 unsigned char ButtonValue ;
	static unsigned char ms_counter=0;
	static unsigned char s_counter=0;


	if(Lcd_flag2 & 0x3f)
	{
		if(ms_counter>=250)
		{
			ms_counter = 0;
			s_counter++;
		}else
		{
			ms_counter++;
		}

		if(s_counter>=120)
		{
			s_counter = 0;
			Lcd_flag2 -= 1;
			flag |= 0x40;
		}else
		{
			s_counter++;
		}
	}
	else
	{
		ms_counter = 0;
		s_counter  = 0;
		Lcd_flag1 |= 0x80;
	}


   ButtonValue = (~ P1) & 0x0e;
   switch (Button_flag & 0x03)
   {
     case 0x01 :
    {
       if (ButtonValue)
         Button_flag = 0x02;
     } break;

     case 0x02 :
    {
       if (!ButtonValue)
         Button_flag = 0x01;
       else
       {
		if(ButtonValue & 0x04)
			flag |= 0x04;

		if(ButtonValue & 0x08)
			flag |= 0x02;

		if(ButtonValue & 0x02)
			flag |= 0x01;

         Button_flag = 0x03;
       }
     } break;

     case 0x03 :
    {
       if (!ButtonValue)
      {
         if(flag & 0x04)
		{
			flag |= 0x20;
			flag &= ~(unsigned char)0x04;
		 }
		 if(flag & 0x02)
		{
			flag |= 0x10;
			flag &= ~(unsigned char)0x02;
		 }
		 if(flag & 0x01)
	 	{
			flag |= 0x08;
			flag &= ~(unsigned char)0x01;
		 }
        Button_flag = 0x01;
      }
     }
     default : break;
   }
   FT0IRQ = 0;

}

void PwmOut()
{
	if(Lcd_flag1 & 0x80)
	{
		switch(Lcd_flag1 & 0x0f)
		{
			case 0: FTC0ENB = 0;
			break;
			case 1: TC0R = 30;
			break;
			case 2: TC0R = 60;
			break;
			case 3: TC0R = 90;
			break;
			case 4: TC0R = 120;
			break;
			case 5: TC0R = 150;
			break;
			case 6: TC0R = 180;
			break;
			case 7: TC0R = 210;
			break;
			default :break;
		}
		if((Lcd_flag2 & 0x40) && (!(Lcd_flag2 & 0x3f)) )
			FTC0ENB = 0;

	Lcd_flag1 &= ~(unsigned char)0x80;
	}
}


int main(void)
{
	IoInit();
	IrqInit();
	while(1)
	{
		WDTR=0x5A;
		ButtonScan();
		RefleshBuf();
		LcdScan();
		PwmOut();
	}
	return 0;

}
