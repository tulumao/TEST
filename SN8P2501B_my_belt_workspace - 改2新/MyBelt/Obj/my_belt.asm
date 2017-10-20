
;----------------------------------------------------
;  Copyright (c) 2003-2013 SONiX Technology Co., Ltd.
;  Sonix SN8 C Compiler - V2.01
;----------------------------------------------------

CHIP SN8P2501B

INCLUDE <sncc_macros.h>
EXTERN DATA T
EXTERN DATA I
.CODE
.stabs "lcc4_compiled.",0x3C,0,0,0
.stabs "F:\运动腰带\SN8 C Studio_workspace\SN8P2501B_my_belt_workspace - 改2新\MyBelt/",0x64,0,3,Ltext0
.stabs ".\Src\my_belt.c",0x64,0,3,Ltext0
Ltext0:
.stabs "int:t1=r1;-128;127;",128,0,0,0
.stabs "char:t2=r2;-128;127;",128,0,0,0
.stabs "double:t3=r1;4;0;",128,0,0,0
.stabs "float:t4=r1;4;0;",128,0,0,0
.stabs "long double:t5=r1;4;0;",128,0,0,0
.stabs "long int:t6=r1;-32768;32767;",128,0,0,0
.stabs "long long int:t7=r1;-2147483648;2147483647;",128,0,0,0
.stabs "signed char:t8=r1;-128;127;",128,0,0,0
.stabs "unsigned char:t9=r1;0;255;",128,0,0,0
.stabs "unsigned long:t10=r1;0;65535;",128,0,0,0
.stabs "unsigned long long:t11=r1;0;4294967295;",128,0,0,0
.stabs "unsigned int:t12=r1;0;255;",128,0,0,0
.stabs "void:t13=13",128,0,0,0
.stabs "bit:t14",128,0,0,0
.stabs ":t300=L16:0",128,0,0,0
.stabs ":t301=L16:1",128,0,0,0
.stabs ":t302=L16:2",128,0,0,0
.stabs ":t303=L16:3",128,0,0,0
.stabs ":t304=L16:4",128,0,0,0
.stabs ":t305=L16:5",128,0,0,0
.stabs ":t306=L16:6",128,0,0,0
.stabs ":t307=L16:7",128,0,0,0
.stabs ":t308=ar1;0;9;1",128,0,0,0

;---------------Begin emit user code-----------------

PUBLIC _LcdScan_row
PUBLIC _flag
PUBLIC _Lcd_flag1
PUBLIC _Lcd_flag2
PUBLIC _Button_flag
PUBLIC _databuf
PUBLIC _table1
PUBLIC _IoInit
PUBLIC _IrqInit
PUBLIC _Get_TensPlace_Number
PUBLIC _Get_TensPlace_Number_arg@0
PUBLIC _Get_OnesPlace_Number
PUBLIC _Get_OnesPlace_Number_arg@0
PUBLIC _ButtonScan
PUBLIC _LcdScan
PUBLIC _DataPut
PUBLIC _DataPut_arg@0
PUBLIC _TableToBuf
PUBLIC _TableToBuf_arg@0
PUBLIC _TableToBuf_arg@1
PUBLIC _RefleshBuf
PUBLIC _ISR_isr
PUBLIC _PwmOut
PUBLIC _main

_LcdScan_row@segment SEGMENT DATA INBANK
	_LcdScan_row DS 1
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	__SelectBANK _LcdScan_row
	MOV A,#0x1
	MOV _LcdScan_row,A
_flag@segment SEGMENT DATA INBANK
	_flag DS 1
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	__SelectBANK _flag
	MOV A,#0xC0
	MOV _flag,A
_Lcd_flag1@segment SEGMENT DATA INBANK
	_Lcd_flag1 DS 1
_Lcd_flag2@segment SEGMENT DATA INBANK
	_Lcd_flag2 DS 1
_Button_flag@segment SEGMENT DATA INBANK
	_Button_flag DS 1
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	__SelectBANK _Button_flag
	MOV A,#0x1
	MOV _Button_flag,A
_databuf@segment SEGMENT DATA INBANK
	_databuf DS 4
_DATA_INIT_CODE SEGMENT CODE INBANK
_databuf_initial_value:
	DB 0xEE
	DB 0xBB
	DB 0xEE
	DB 0xBB
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
INIT@global _databuf,_databuf_initial_value,4
_table1@segment SEGMENT CODE INBANK
_table1:
	DB 0xEE
	DB 0xBB
	DB 0xEE
	DB 0xBB
	DB 0x44
	DB 0x11
	DB 0x44
	DB 0x11
	DB 0xAA
	DB 0xEE
	DB 0x55
	DB 0xBB
	DB 0xEE
	DB 0x55
	DB 0x55
	DB 0xBB
	DB 0x44
	DB 0x55
	DB 0xFF
	DB 0x11
	DB 0xEE
	DB 0x55
	DB 0xBB
	DB 0xAA
	DB 0xEE
	DB 0xFF
	DB 0xBB
	DB 0xAA
	DB 0x44
	DB 0x11
	DB 0x44
	DB 0xBB
	DB 0xEE
	DB 0xFF
	DB 0xFF
	DB 0xBB
	DB 0xEE
	DB 0x55
	DB 0xFF
	DB 0xBB
	DB 0x0
	DB 0x44
	DB 0x11
	DB 0x0
	DB 0x11
	DB 0x0
	DB 0x0
	DB 0x44
_Function_IoInit_data SEGMENT DATA INBANK

_Function_IrqInit_data SEGMENT DATA INBANK

_Function_Get_TensPlace_Number_data SEGMENT DATA INBANK
	_Get_TensPlace_Number_arg@0 DS 1
	_Get_TensPlace_Number_data@0	DS	1

_Function_Get_OnesPlace_Number_data SEGMENT DATA INBANK
	_Get_OnesPlace_Number_arg@0 DS 1

_Function_ButtonScan_data SEGMENT DATA INBANK
	_ButtonScan_data@0	DS	1

_Function_LcdScan_data SEGMENT DATA INBANK
	_LcdScan_data@0	DS	1
	_LcdScan_data@1	DS	1

_Function_DataPut_data SEGMENT DATA INBANK
	_DataPut_arg@0 DS 1
	_DataPut_data@0	DS	1

_Function_TableToBuf_data SEGMENT DATA INBANK
	_TableToBuf_arg@0 DS 1
	_TableToBuf_arg@1 DS 1
	_TableToBuf_data@0	DS	1
	_TableToBuf_data@1	DS	1

_Function_RefleshBuf_data SEGMENT DATA INBANK
	_RefleshBuf_data@0	DS	1
	_RefleshBuf_data@1	DS	1

_sdata273@segment SEGMENT DATA INBANK
	_sdata273 DS 1
_sdata274@segment SEGMENT DATA INBANK
	_sdata274 DS 1
_DEFINE_ISRBACKUP_DATA 2
_Function_ISR_isr_data SEGMENT DATA INBANK
	_ISR_isr_data@0	DS	1
	_ISR_isr_data@1	DS	1

_Function_PwmOut_data SEGMENT DATA INBANK
	_PwmOut_data@0	DS	1

_Function_main_data SEGMENT DATA INBANK


_VirtualReg SEGMENT DATA BANK 0 INBANK COMMON
	W0 DS 1
	W1 DS 1
	W2 DS 1
	W3 DS 1
	W4 DS 1
	W5 DS 1


_VirtualRegIsr SEGMENT DATA BANK 0 INBANK COMMON
	WG DS 1

.stabs "R:G12",32,0,0,0x82
.stabs "Z:G12",32,0,0,0x83
.stabs "Y:G12",32,0,0,0x84
.stabs "PFLAG:G12",32,0,0,0x86
.stabs "FZ:G300",32,0,0,0x86
.stabs "FDC:G301",32,0,0,0x86
.stabs "FC:G302",32,0,0,0x86
.stabs "FLVD24:G304",32,0,0,0x86
.stabs "FLVD36:G305",32,0,0,0x86
.stabs "FNPD:G306",32,0,0,0x86
.stabs "FNT0:G307",32,0,0,0x86
.stabs "P0M:G12",32,0,0,0xB8
.stabs "FP00M:G300",32,0,0,0xB8
.stabs "PEDGE:G12",32,0,0,0xBF
.stabs "FP00G1:G304",32,0,0,0xBF
.stabs "FP00G0:G303",32,0,0,0xBF
.stabs "P1W:G12",32,0,0,0xC0
.stabs "P1M:G12",32,0,0,0xC1
.stabs "FP10M:G300",32,0,0,0xC1
.stabs "FP12M:G302",32,0,0,0xC1
.stabs "FP13M:G303",32,0,0,0xC1
.stabs "P2M:G12",32,0,0,0xC2
.stabs "FP20M:G300",32,0,0,0xC2
.stabs "FP21M:G301",32,0,0,0xC2
.stabs "FP22M:G302",32,0,0,0xC2
.stabs "FP23M:G303",32,0,0,0xC2
.stabs "FP24M:G304",32,0,0,0xC2
.stabs "FP25M:G305",32,0,0,0xC2
.stabs "P5M:G12",32,0,0,0xC5
.stabs "FP54M:G304",32,0,0,0xC5
.stabs "INTRQ:G12",32,0,0,0xC8
.stabs "FP00IRQ:G300",32,0,0,0xC8
.stabs "FT0IRQ:G304",32,0,0,0xC8
.stabs "FTC0IRQ:G305",32,0,0,0xC8
.stabs "INTEN:G12",32,0,0,0xC9
.stabs "FP00IEN:G300",32,0,0,0xC9
.stabs "FT0IEN:G304",32,0,0,0xC9
.stabs "FTC0IEN:G305",32,0,0,0xC9
.stabs "OSCM:G12",32,0,0,0xCA
.stabs "FCPUM1:G304",32,0,0,0xCA
.stabs "FCPUM0:G303",32,0,0,0xCA
.stabs "FCLKMD:G302",32,0,0,0xCA
.stabs "FSTPHX:G301",32,0,0,0xCA
.stabs "WDTR:G12",32,0,0,0xCC
.stabs "TC0R:G12",32,0,0,0xCD
.stabs "PCL:G12",32,0,0,0xCE
.stabs "PCH:G12",32,0,0,0xCF
.stabs "P0:G12",32,0,0,0xD0
.stabs "FP00:G300",32,0,0,0xD0
.stabs "P1:G12",32,0,0,0xD1
.stabs "FP10:G300",32,0,0,0xD1
.stabs "FP11:G301",32,0,0,0xD1
.stabs "FP12:G302",32,0,0,0xD1
.stabs "FP13:G303",32,0,0,0xD1
.stabs "P2:G12",32,0,0,0xD2
.stabs "FP20:G300",32,0,0,0xD2
.stabs "FP21:G301",32,0,0,0xD2
.stabs "FP22:G302",32,0,0,0xD2
.stabs "FP23:G303",32,0,0,0xD2
.stabs "FP24:G304",32,0,0,0xD2
.stabs "FP25:G305",32,0,0,0xD2
.stabs "P5:G12",32,0,0,0xD5
.stabs "FP54:G304",32,0,0,0xD5
.stabs "T0M:G12",32,0,0,0xD8
.stabs "FT0TB:G300",32,0,0,0xD8
.stabs "FT0RATE0:G304",32,0,0,0xD8
.stabs "FT0RATE1:G305",32,0,0,0xD8
.stabs "FT0RATE2:G306",32,0,0,0xD8
.stabs "FT0ENB:G307",32,0,0,0xD8
.stabs "T0C:G12",32,0,0,0xD9
.stabs "TC0M:G12",32,0,0,0xDA
.stabs "FTC0ENB:G307",32,0,0,0xDA
.stabs "FTC0RATE2:G306",32,0,0,0xDA
.stabs "FTC0RATE1:G305",32,0,0,0xDA
.stabs "FTC0RATE0:G304",32,0,0,0xDA
.stabs "FTC0CKS:G303",32,0,0,0xDA
.stabs "FALOAD0:G302",32,0,0,0xDA
.stabs "FTC0OUT:G301",32,0,0,0xDA
.stabs "FPWM0OUT:G300",32,0,0,0xDA
.stabs "TC0C:G12",32,0,0,0xDB
.stabs "STKP:G12",32,0,0,0xDF
.stabs "FGIE:G307",32,0,0,0xDF
.stabs "FSTKPB1:G301",32,0,0,0xDF
.stabs "FSTKPB0:G300",32,0,0,0xDF
.stabs "P0UR:G12",32,0,0,0xE0
.stabs "FP00R:G300",32,0,0,0xE0
.stabs "P1UR:G12",32,0,0,0xE1
.stabs "FP10R:G300",32,0,0,0xE1
.stabs "FP12R:G302",32,0,0,0xE1
.stabs "FP13R:G303",32,0,0,0xE1
.stabs "P2UR:G12",32,0,0,0xE2
.stabs "FP20R:G300",32,0,0,0xE2
.stabs "FP21R:G301",32,0,0,0xE2
.stabs "FP22R:G302",32,0,0,0xE2
.stabs "FP23R:G303",32,0,0,0xE2
.stabs "FP24R:G304",32,0,0,0xE2
.stabs "FP25R:G305",32,0,0,0xE2
.stabs "P5UR:G12",32,0,0,0xE5
.stabs "FP54R:G304",32,0,0,0xE5
.stabs "_YZ:G12",32,0,0,0xE7
.stabs "P1OC:G12",32,0,0,0xE9
.stabs "STK3L:G12",32,0,0,0xF8
.stabs "STK3H:G12",32,0,0,0xF9
.stabs "STK2L:G12",32,0,0,0xFA
.stabs "STK2H:G12",32,0,0,0xFB
.stabs "STK1L:G12",32,0,0,0xFC
.stabs "STK1H:G12",32,0,0,0xFD
.stabs "STK0L:G12",32,0,0,0xFE
.stabs "STK0H:G12",32,0,0,0xFF
.stabs "LcdScan_row:G9",32,0,0,_LcdScan_row
.stabs "flag:G9",32,0,0,_flag
.stabs "Lcd_flag1:G9",32,0,0,_Lcd_flag1
.stabs "Lcd_flag2:G9",32,0,0,_Lcd_flag2
.stabs "Button_flag:G9",32,0,0,_Button_flag
.stabs ":t15=ar1;0;3;9",128,0,0,0
.stabs "databuf:G15",32,0,0,_databuf
.stabs ":t16=ar1;0;11;17=ar1;0;3;9",128,0,0,0
.stabs "table1:G16",32,0,1,_table1
.stabs "IoInit:F13",36,0,0,_IoInit
_Function_IoInit_code SEGMENT CODE INBANK USING _Function_IoInit_data
_IoInit:
.stabn 0xC0,0,0,L10-_IoInit
L10:
.stabn 0x44,0,114,L11-_IoInit
L11:
;Line#114 {	

 .stabn 0x44,0,115,L12-_IoInit
L12:
;Line#115 	_bSET(&P1M,0); //配置为HC164的CLK引脚为输出模式

 	;MOVX1 0xC1.0 ,#1
	B0BSET 0xC1.0
.stabn 0x44,0,116,L13-_IoInit
L13:
;Line#116 	_bSET(&P2M,5); //配置HC164的DSB引脚为输出模式

 	;MOVX1 0xC2.5 ,#1
	B0BSET 0xC2.5
.stabn 0x44,0,117,L14-_IoInit
L14:
;Line#117 	_bSET(&P0M,0); //配置HC164的MR引脚为输出模式

 	;MOVX1 0xB8.0 ,#1
	B0BSET 0xB8.0
.stabn 0x44,0,118,L15-_IoInit
L15:
;Line#118 	_bCLR(&P0,0);  //配置HC164的MR引脚输出0，即锁存HC164

 	;MOVX1 0xD0.0 ,#0
	B0BCLR 0xD0.0
.stabn 0x44,0,120,L16-_IoInit
L16:
;Line#120 	TC0M = 0x61;     //TC0分频选择Fcpu/4，使能PWM输出，选择输出阶数256 ,禁止TC0时钟

 	;MOVU1 0xDA ,#97
	MOV A, #0x61
	B0MOV 0xDA, A
.stabn 0x44,0,124,L17-_IoInit
L17:
;Line#124 	TC0C = 00;	//

 	;MOVU1 0xDB ,#0
	__SelectBANKCNST 0
	CLR (0xDB & 0xFF)
.stabn 0x44,0,125,L18-_IoInit
L18:
;Line#125   	TC0R = 00;	//重装值为00  占空比为00/256

 	;MOVU1 0xCD ,#0
	__SelectBANKCNST 0
	CLR (0xCD & 0xFF)
.stabn 0x44,0,127,L19-_IoInit
L19:
;Line#127 	_bCLR(&P1M,1); //配置按键“背光”P1.1引脚为输入模式

 	;MOVX1 0xC1.1 ,#0
	B0BCLR 0xC1.1
.stabn 0x44,0,128,L20-_IoInit
L20:
;Line#128 	_bCLR(&P1M,2); //配置按键“档位”P1.2引脚为输入模式

 	;MOVX1 0xC1.2 ,#0
	B0BCLR 0xC1.2
.stabn 0x44,0,129,L21-_IoInit
L21:
;Line#129 	_bCLR(&P1M,3); //配置按键“定时”P1.3引脚为输入模式

 	;MOVX1 0xC1.3 ,#0
	B0BCLR 0xC1.3
.stabn 0x44,0,130,L22-_IoInit
L22:
;Line#130     P1 |= 0x0e;    //p1.1 p1.2 p1.3 数据寄存器写1

 	;ORU1 0xD1 ,0xD1 ,#14
	MOV A, #0x0e
	__SelectBANKCNST 0
	OR (0xD1 & 0xFF), A
.stabn 0x44,0,132,L23-_IoInit
L23:
;Line#132 	P1UR  = 0x0c;   //配置按键“档位” P1.2引脚，按键“定时” P1.3引脚为上拉

 	;MOVU1 0xE1 ,#12
	MOV A, #0x0c
	B0MOV 0xE1, A
.stabn 0x44,0,133,L24-_IoInit
L24:
;Line#133 	_bSET(&P2M,4);  //配置背光灯引脚为输出模式

 	;MOVX1 0xC2.4 ,#1
	B0BSET 0xC2.4
.stabn 0x44,0,134,L25-_IoInit
L25:
;Line#134 	Pin_Backlight = 1; //背光灯关闭

 	;MOVX1 0xD2.4 ,#1
	B0BSET 0xD2.4
.stabn 0x44,0,136,L26-_IoInit
L26:
;Line#136 	P2M &=0xf0;    //配置P2.0~P2.3为输入模式，用于控制LCD的COM端口

 	;ANDU1 0xC2 ,0xC2 ,#240
	MOV A, #0xf0
	__SelectBANKCNST 0
	AND (0xC2 & 0xFF), A
.stabn 0xE0,0,0,L27-_IoInit
L27:
.stabn 0x44,0,137,L28-_IoInit
L28:
;Line#137 }

L1:
	RET
.stabs "IrqInit:F13",36,0,0,_IrqInit
_Function_IrqInit_code SEGMENT CODE INBANK USING _Function_IrqInit_data
_IrqInit:
.stabn 0xC0,0,0,L34-_IrqInit
L34:
.stabn 0x44,0,141,L35-_IrqInit
L35:
;Line#141 {

 .stabn 0x44,0,142,L36-_IrqInit
L36:
;Line#142 	T0M |=0x30;	  //设置T0M模式控制寄存器，T0分频为Fcpu/32

 	;ORU1 0xD8 ,0xD8 ,#48
	MOV A, #0x30
	__SelectBANKCNST 0
	OR (0xD8 & 0xFF), A
.stabn 0x44,0,143,L37-_IrqInit
L37:
;Line#143 	T0C = 0x06;   //设置T0溢出时间间隔，约2ms溢出一次

 	;MOVU1 0xD9 ,#6
	MOV A, #0x06
	B0MOV 0xD9, A
.stabn 0x44,0,145,L38-_IrqInit
L38:
;Line#145 	_bCLR(&INTRQ,4);    //清除中断请求寄存器

 	;MOVX1 0xC8.4 ,#0
	B0BCLR 0xC8.4
.stabn 0x44,0,146,L39-_IrqInit
L39:
;Line#146 	_bSET(&INTEN,4);	//使能TO中断

 	;MOVX1 0xC9.4 ,#1
	B0BSET 0xC9.4
.stabn 0x44,0,147,L40-_IrqInit
L40:
;Line#147 	_bSET(&T0M,7);      //启动T0定时器

 	;MOVX1 0xD8.7 ,#1
	B0BSET 0xD8.7
.stabn 0x44,0,148,L41-_IrqInit
L41:
;Line#148 	_bSET(&STKP,7);		//开总中断

 	;MOVX1 0xDF.7 ,#1
	B0BSET 0xDF.7
.stabn 0xE0,0,0,L42-_IrqInit
L42:
.stabn 0x44,0,150,L43-_IrqInit
L43:
;Line#150 }

L29:
	RET
.stabs "Get_TensPlace_Number:F9",36,0,0,_Get_TensPlace_Number
_Function_Get_TensPlace_Number_code SEGMENT CODE INBANK USING _Function_Get_TensPlace_Number_data
_Get_TensPlace_Number:
.stabs "x:p9",160,0,0,_Get_TensPlace_Number_arg@0
.stabs "j:9",128,0,0,_Get_TensPlace_Number_data@0
.stabn 0xC0,0,0,L48-_Get_TensPlace_Number
L48:
.stabn 0x44,0,153,L49-_Get_TensPlace_Number
L49:
;Line#153 {

 .stabn 0x44,0,154,L50-_Get_TensPlace_Number
L50:
;Line#154 	uchar8 j=0;

 	;MOVU1 _Get_TensPlace_Number_data@0 ,#0
	__SelectBANK _Get_TensPlace_Number_data@0
	CLR _Get_TensPlace_Number_data@0
	JMP L46
L45:
.stabn 0xC0,0,1,L51-_Get_TensPlace_Number
L51:
.stabn 0x44,0,156,L52-_Get_TensPlace_Number
L52:
;Line#156 	{

 .stabn 0x44,0,157,L53-_Get_TensPlace_Number
L53:
;Line#157 		j += 1;

 	;ADDU1 _Get_TensPlace_Number_data@0 ,_Get_TensPlace_Number_data@0 ,#1
	__SelectBANK _Get_TensPlace_Number_data@0
	INCMS _Get_TensPlace_Number_data@0
	NOP
.stabn 0x44,0,158,L54-_Get_TensPlace_Number
L54:
;Line#158 		x -= 10;

 	;SUBU1 _Get_TensPlace_Number_arg@0 ,_Get_TensPlace_Number_arg@0 ,#10
	MOV A, #0xf6
	__SelectBANK _Get_TensPlace_Number_arg@0
	ADD _Get_TensPlace_Number_arg@0, A
.stabn 0xE0,0,1,L55-_Get_TensPlace_Number
L55:
.stabn 0x44,0,159,L56-_Get_TensPlace_Number
L56:
;Line#159 	}

L46:
.stabn 0x44,0,155,L57-_Get_TensPlace_Number
L57:
;Line#155 	while(x >= 10)

 	;GE L45 ,_Get_TensPlace_Number_arg@0 ,#10
	__SelectBANK _Get_TensPlace_Number_arg@0
	MOV A, _Get_TensPlace_Number_arg@0
	SUB A, #0x0a
	JGE L45
.stabn 0x44,0,160,L58-_Get_TensPlace_Number
L58:
;Line#160 	return j;

 	;RETU1 _Get_TensPlace_Number_data@0
	__SelectBANK _Get_TensPlace_Number_data@0
	MOV A, _Get_TensPlace_Number_data@0
.stabn 0xE0,0,0,L59-_Get_TensPlace_Number
L59:
.stabn 0x44,0,161,L60-_Get_TensPlace_Number
L60:
;Line#161 }	

L44:
	RET
.stabs "Get_OnesPlace_Number:F9",36,0,0,_Get_OnesPlace_Number
_Function_Get_OnesPlace_Number_code SEGMENT CODE INBANK USING _Function_Get_OnesPlace_Number_data
_Get_OnesPlace_Number:
.stabs "x:p9",160,0,0,_Get_OnesPlace_Number_arg@0
.stabn 0xC0,0,0,L65-_Get_OnesPlace_Number
L65:
.stabn 0x44,0,166,L66-_Get_OnesPlace_Number
L66:
;Line#166 {

	JMP L63
L62:
.stabn 0x44,0,168,L67-_Get_OnesPlace_Number
L67:
;Line#168 		x -= 10;

 	;SUBU1 _Get_OnesPlace_Number_arg@0 ,_Get_OnesPlace_Number_arg@0 ,#10
	MOV A, #0xf6
	__SelectBANK _Get_OnesPlace_Number_arg@0
	ADD _Get_OnesPlace_Number_arg@0, A
L63:
.stabn 0x44,0,167,L68-_Get_OnesPlace_Number
L68:
;Line#167 	while(x >= 10)	

 	;GE L62 ,_Get_OnesPlace_Number_arg@0 ,#10
	__SelectBANK _Get_OnesPlace_Number_arg@0
	MOV A, _Get_OnesPlace_Number_arg@0
	SUB A, #0x0a
	JGE L62
.stabn 0x44,0,169,L69-_Get_OnesPlace_Number
L69:
;Line#169 	return x;

 	;RETU1 _Get_OnesPlace_Number_arg@0
	MOV A, _Get_OnesPlace_Number_arg@0
.stabn 0xE0,0,0,L70-_Get_OnesPlace_Number
L70:
.stabn 0x44,0,170,L71-_Get_OnesPlace_Number
L71:
;Line#170 }

L61:
	RET
.stabs "ButtonScan:F13",36,0,0,_ButtonScan
_Function_ButtonScan_code SEGMENT CODE INBANK USING _Function_ButtonScan_data
_ButtonScan:
.stabs "i:9",128,0,0,_ButtonScan_data@0
.stabn 0xC0,0,0,L85-_ButtonScan
L85:
.stabn 0x44,0,173,L86-_ButtonScan
L86:
;Line#173 {

 .stabn 0x44,0,175,L87-_ButtonScan
L87:
;Line#175 	if(flag & BUTTON_GEARS)   //“档位”按键被按下

 	;ANDU1 W0 ,_flag ,#32
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x20
	;EQ L73 ,W0 ,#0
	AND A, #0xFF
	JEQ L73
.stabn 0xC0,0,1,L88-_ButtonScan
L88:
.stabn 0x44,0,176,L89-_ButtonScan
L89:
;Line#176 	{	 

 .stabn 0x44,0,177,L90-_ButtonScan
L90:
;Line#177 		i=(Lcd_flag1 & LcdGearsMask);  //获取当前档位

 	;ANDU1 _ButtonScan_data@0 ,_Lcd_flag1 ,#15
	__SelectBANK _Lcd_flag1
	MOV A, _Lcd_flag1
	AND A, #0x0f
	__SelectBANK _ButtonScan_data@0
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,178,L91-_ButtonScan
L91:
;Line#178 		Lcd_flag1 &= ~(uchar8)LcdGearsMask; //清除旧档位

 	;ANDU1 _Lcd_flag1 ,_Lcd_flag1 ,#240
	MOV A, #0xf0
	__SelectBANK _Lcd_flag1
	AND _Lcd_flag1, A
.stabn 0x44,0,179,L92-_ButtonScan
L92:
;Line#179 		i += 1;

 	;ADDU1 _ButtonScan_data@0 ,_ButtonScan_data@0 ,#1
	__SelectBANK _ButtonScan_data@0
	INCMS _ButtonScan_data@0
	NOP
.stabn 0x44,0,180,L93-_ButtonScan
L93:
;Line#180 		if(i > Max_Gears)   //超出最大档位限制

 	;LE L75 ,_ButtonScan_data@0 ,#15
	MOV A, _ButtonScan_data@0
	CMPRS A, #0x0f
	JLT L75
.stabn 0x44,0,181,L94-_ButtonScan
L94:
;Line#181 		i = 0;

 	;MOVU1 _ButtonScan_data@0 ,#0
	CLR _ButtonScan_data@0
L75:
.stabn 0x44,0,182,L95-_ButtonScan
L95:
;Line#182 		Lcd_flag1 |= i;  //写入新档位

 	;ORU1 _Lcd_flag1 ,_Lcd_flag1 ,_ButtonScan_data@0
	__SelectBANK _ButtonScan_data@0
	MOV A, _ButtonScan_data@0
	__SelectBANK _Lcd_flag1
	OR _Lcd_flag1, A
.stabn 0x44,0,184,L96-_ButtonScan
L96:
;Line#184 		flag &= ~(uchar8)(BUTTON_GEARS); //清除按键待处理标志

 	;ANDU1 _flag ,_flag ,#223
	MOV A, #0xdf
	__SelectBANK _flag
	AND _flag, A
.stabn 0x44,0,185,L97-_ButtonScan
L97:
;Line#185 		flag |= Lcd_Data_New;      //新数据待刷新标志

 	;ORU1 _flag ,_flag ,#64
	MOV A, #0x40
	OR _flag, A
.stabn 0x44,0,186,L98-_ButtonScan
L98:
;Line#186 		Lcd_flag1 |= LcdGearsNew;  //通知PwmOut函数更新PWM输出

 	;ORU1 _Lcd_flag1 ,_Lcd_flag1 ,#128
	MOV A, #0x80
	__SelectBANK _Lcd_flag1
	OR _Lcd_flag1, A
.stabn 0xE0,0,1,L99-_ButtonScan
L99:
.stabn 0x44,0,187,L100-_ButtonScan
L100:
;Line#187 	}

L73:
.stabn 0x44,0,190,L101-_ButtonScan
L101:
;Line#190 	if(flag & BUTTON_TIMING)   //“定时”按键被按下

 	;ANDU1 W0 ,_flag ,#16
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x10
	;EQ L77 ,W0 ,#0
	AND A, #0xFF
	JEQ L77
.stabn 0xC0,0,1,L102-_ButtonScan
L102:
.stabn 0x44,0,191,L103-_ButtonScan
L103:
;Line#191 	{

 .stabn 0x44,0,192,L104-_ButtonScan
L104:
;Line#192 		i=(Lcd_flag2 & LcdTimingMask);  //获取当前定时定时时间

 	;ANDU1 _ButtonScan_data@0 ,_Lcd_flag2 ,#63
	__SelectBANK _Lcd_flag2
	MOV A, _Lcd_flag2
	AND A, #0x3f
	__SelectBANK _ButtonScan_data@0
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,193,L105-_ButtonScan
L105:
;Line#193 		if(!(Lcd_flag2 &= LcdTimingON))   //定时器处于失能状态

 	;ANDU1 W0 ,_Lcd_flag2 ,#64
	__SelectBANK _Lcd_flag2
	MOV A, _Lcd_flag2
	AND A, #0x40
	;MOVU1 _Lcd_flag2 ,W0
	MOV _Lcd_flag2, A
	;NEI1 L79 ,W0 ,#0
	CMPRS A, #0x00
	JMP L79
.stabn 0xC0,0,2,L106-_ButtonScan
L106:
.stabn 0x44,0,194,L107-_ButtonScan
L107:
;Line#194 		{

 .stabn 0x44,0,195,L108-_ButtonScan
L108:
;Line#195 			Lcd_flag2 &= LcdTimingON;  //定时器使能标志	

 	;ANDU1 _Lcd_flag2 ,_Lcd_flag2 ,#64
	MOV A, #0x40
	AND _Lcd_flag2, A
.stabn 0x44,0,196,L109-_ButtonScan
L109:
;Line#196 			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //清除旧定时时间,相当于写入新定时时间0

 	;ANDU1 _Lcd_flag2 ,_Lcd_flag2 ,#192
	MOV A, #0xc0
	AND _Lcd_flag2, A
.stabn 0xE0,0,2,L110-_ButtonScan
L110:
.stabn 0x44,0,197,L111-_ButtonScan
L111:
;Line#197 		}

	JMP L80
L79:
.stabn 0x44,0,198,L112-_ButtonScan
L112:
;Line#198 		else if(((i+10)==70))

 	;ADDU1 W0 ,_ButtonScan_data@0 ,#10
	MOV A, #0x0a
	__SelectBANK _ButtonScan_data@0
	ADD A, _ButtonScan_data@0
	;NEI1 L81 ,W0 ,#70
	CMPRS A, #0x46
	JMP L81
.stabn 0xC0,0,2,L113-_ButtonScan
L113:
.stabn 0x44,0,199,L114-_ButtonScan
L114:
;Line#199 		{

 .stabn 0x44,0,200,L115-_ButtonScan
L115:
;Line#200 			Lcd_flag2 |= ~(uchar8)LcdTimingON;  //定时器失能标志	

 	;ORU1 _Lcd_flag2 ,_Lcd_flag2 ,#191
	MOV A, #0xbf
	__SelectBANK _Lcd_flag2
	OR _Lcd_flag2, A
.stabn 0xE0,0,2,L116-_ButtonScan
L116:
.stabn 0x44,0,201,L117-_ButtonScan
L117:
;Line#201 		}

	JMP L82
L81:
.stabn 0xC0,0,2,L118-_ButtonScan
L118:
.stabn 0x44,0,203,L119-_ButtonScan
L119:
;Line#203 		{

 .stabn 0x44,0,204,L120-_ButtonScan
L120:
;Line#204 		    i= Get_TensPlace_Number(i);     //获取i的十位数

 	;PUSH _Get_TensPlace_Number_arg@0 ,_ButtonScan_data@0
	__SelectBANK _ButtonScan_data@0
	MOV A, _ButtonScan_data@0
	__SelectBANK _Get_TensPlace_Number_arg@0
	MOV _Get_TensPlace_Number_arg@0, A
	;CALLU1 _ButtonScan_data@0 ,_Get_TensPlace_Number
	CALL _Get_TensPlace_Number
	__SelectBANK _ButtonScan_data@0
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,205,L121-_ButtonScan
L121:
;Line#205 			Lcd_flag2 &= ~(uchar8)LcdTimingMask; //清除旧定时时间

 	;ANDU1 _Lcd_flag2 ,_Lcd_flag2 ,#192
	MOV A, #0xc0
	__SelectBANK _Lcd_flag2
	AND _Lcd_flag2, A
.stabn 0x44,0,206,L122-_ButtonScan
L122:
;Line#206 			Lcd_flag2 |= (i+10);  //写入新定时时间

 	;ADDU1 W0 ,_ButtonScan_data@0 ,#10
	MOV A, #0x0a
	__SelectBANK _ButtonScan_data@0
	ADD A, _ButtonScan_data@0
	;ORU1 _Lcd_flag2 ,W0 ,_Lcd_flag2
	__SelectBANK _Lcd_flag2
	OR _Lcd_flag2, A
.stabn 0xE0,0,2,L123-_ButtonScan
L123:
.stabn 0x44,0,207,L124-_ButtonScan
L124:
;Line#207 		}				

L82:
L80:
.stabn 0x44,0,208,L125-_ButtonScan
L125:
;Line#208 		flag &= ~(uchar8)(BUTTON_TIMING);    //清除按键待处理标志

 	;ANDU1 _flag ,_flag ,#239
	MOV A, #0xef
	__SelectBANK _flag
	AND _flag, A
.stabn 0x44,0,209,L126-_ButtonScan
L126:
;Line#209 		flag |= Lcd_Data_New;     //新数据待刷新标志	

 	;ORU1 _flag ,_flag ,#64
	MOV A, #0x40
	OR _flag, A
.stabn 0xE0,0,1,L127-_ButtonScan
L127:
.stabn 0x44,0,210,L128-_ButtonScan
L128:
;Line#210 	}

L77:
.stabn 0x44,0,212,L129-_ButtonScan
L129:
;Line#212 	if(flag & BUTTON_BACK_LIGHT)  //“背光”按键被按下

 	;ANDU1 W0 ,_flag ,#8
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x08
	;EQ L83 ,W0 ,#0
	AND A, #0xFF
	JEQ L83
.stabn 0xC0,0,1,L130-_ButtonScan
L130:
.stabn 0x44,0,213,L131-_ButtonScan
L131:
;Line#213 	{

 .stabn 0x44,0,214,L132-_ButtonScan
L132:
;Line#214 		Pin_Backlight=~i;  //背光灯状态翻转

 	;BCOM W0 ,_ButtonScan_data@0
	__SelectBANK _ButtonScan_data@0
	MOV A, _ButtonScan_data@0
	XOR A, #0xFF
	;LODI1 W0 ,W0
	B0MOV W0, A
	;LODX1 0xD2.4 ,W0
	B0BSET 0xD2.4
	B0BTS0 W0.0
	JMP L481
	B0BCLR 0xD2.4
L481:
.stabn 0x44,0,215,L133-_ButtonScan
L133:
;Line#215 		flag &= ~(uchar8)(BUTTON_BACK_LIGHT);  //清除按键待处理标志

 	;ANDU1 _flag ,_flag ,#247
	MOV A, #0xf7
	__SelectBANK _flag
	AND _flag, A
.stabn 0xE0,0,1,L134-_ButtonScan
L134:
.stabn 0x44,0,216,L135-_ButtonScan
L135:
;Line#216 	}

L83:
.stabn 0xE0,0,0,L136-_ButtonScan
L136:
.stabn 0x44,0,218,L137-_ButtonScan
L137:
;Line#218 }

L72:
	RET

CALLTREE _ButtonScan invoke _Get_TensPlace_Number

.stabs "LcdScan:F13",36,0,0,_LcdScan
_Function_LcdScan_code SEGMENT CODE INBANK USING _Function_LcdScan_data
_LcdScan:
.stabs "i:9",128,0,0,_LcdScan_data@0
.stabs "j:9",128,0,0,_LcdScan_data@1
.stabn 0xC0,0,0,L151-_LcdScan
L151:
.stabn 0x44,0,221,L152-_LcdScan
L152:
;Line#221 {	

 .stabn 0x44,0,222,L153-_LcdScan
L153:
;Line#222 	uchar8 i=0,j=0;

 	;MOVU1 _LcdScan_data@0 ,#0
	__SelectBANK _LcdScan_data@0
	CLR _LcdScan_data@0
.stabn 0x44,0,222,L154-_LcdScan
L154:
;Line#222 	uchar8 i=0,j=0;

 	;MOVU1 _LcdScan_data@1 ,#0
	__SelectBANK _LcdScan_data@1
	CLR _LcdScan_data@1
.stabn 0x44,0,223,L155-_LcdScan
L155:
;Line#223 	if(flag&LcdSacn_forward)   //com口处于正向扫描状态 

 	;ANDU1 W0 ,_flag ,#128
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x80
	;EQ L139 ,W0 ,#0
	AND A, #0xFF
	JEQ L139
.stabn 0xC0,0,1,L156-_LcdScan
L156:
.stabn 0x44,0,224,L157-_LcdScan
L157:
;Line#224 	{ 

 .stabn 0x44,0,225,L158-_LcdScan
L158:
;Line#225 		if(LcdScan_row&COM4)     //com口扫描到达com4

 	;ANDU1 W0 ,_LcdScan_row ,#8
	__SelectBANK _LcdScan_row
	MOV A, _LcdScan_row
	AND A, #0x08
	;EQ L141 ,W0 ,#0
	AND A, #0xFF
	JEQ L141
.stabn 0xC0,0,2,L159-_LcdScan
L159:
.stabn 0x44,0,226,L160-_LcdScan
L160:
;Line#226 		{

 .stabn 0x44,0,227,L161-_LcdScan
L161:
;Line#227 			flag &= ~LcdSacn_forward;	//清正向扫描标志

 	;ANDU1 _flag ,_flag ,#127
	MOV A, #0x7f
	__SelectBANK _flag
	AND _flag, A
.stabn 0x44,0,228,L162-_LcdScan
L162:
;Line#228 			LcdScan_row = COM1; //设置com1

 	;MOVU1 _LcdScan_row ,#1
	MOV A, #0x01
	__SelectBANK _LcdScan_row
	MOV _LcdScan_row, A
.stabn 0xE0,0,2,L163-_LcdScan
L163:
.stabn 0x44,0,229,L164-_LcdScan
L164:
;Line#229 		}

	JMP L142
L141:
.stabn 0x44,0,231,L165-_LcdScan
L165:
;Line#231 			LcdScan_row <<= 1;   //com口左移一位

 	;LSH _LcdScan_row ,_LcdScan_row ,#1
	B0BCLR FC
	__SelectBANK _LcdScan_row
	RLCM _LcdScan_row
L142:
.stabn 0x44,0,232,L166-_LcdScan
L166:
;Line#232 		j=LcdScan_row;

 	;MOVU1 _LcdScan_data@1 ,_LcdScan_row
	__SelectBANK _LcdScan_row
	MOV A, _LcdScan_row
	__SelectBANK _LcdScan_data@1
	MOV _LcdScan_data@1, A
	JMP L144
L143:
.stabn 0x44,0,234,L167-_LcdScan
L167:
;Line#234 		i+=1;

 	;ADDU1 _LcdScan_data@0 ,_LcdScan_data@0 ,#1
	__SelectBANK _LcdScan_data@0
	INCMS _LcdScan_data@0
	NOP
L144:
.stabn 0x44,0,233,L168-_LcdScan
L168:
;Line#233 		while((j >>= 1)==0x01)   //获取行号

 	;RSH W0 ,_LcdScan_data@1 ,#1
	B0BCLR FC
	__SelectBANK _LcdScan_data@1
	RRC _LcdScan_data@1
	;MOVU1 _LcdScan_data@1 ,W0
	MOV _LcdScan_data@1, A
	;EQ L143 ,W0 ,#1
	SUB A, #0x01
	JEQ L143
.stabn 0x44,0,235,L169-_LcdScan
L169:
	__SelectBANK _LcdScan_data@0
	MOV A, _LcdScan_data@0
	B0MOV Y, #(_databuf)$M
	B0MOV Z, #(_databuf)$L
	B0ADD Z, A
	B0MOV A, @YZ
;Line#235 		DataPut(~databuf[i]);    //推送数据

 	;BCOM _DataPut_arg@0 ,W0
	XOR A, #0xFF
	__SelectBANK _DataPut_arg@0
	MOV _DataPut_arg@0, A
	;CALLV _DataPut
	CALL _DataPut
.stabn 0x44,0,237,L170-_LcdScan
L170:
;Line#237 		P2M = P2M & 0xF0 | LcdScan_row;   //设置COMn为输出模式

 	;ANDU1 W0 ,0xC2 ,#240
	B0MOV A, 0xC2
	AND A, #0xf0
	;ORU1 0xC2 ,W0 ,_LcdScan_row
	__SelectBANK _LcdScan_row
	OR A, _LcdScan_row
	B0MOV 0xC2, A
.stabn 0x44,0,238,L171-_LcdScan
L171:
;Line#238 		P2  = P2 & 0xF0 | LcdScan_row;    //设置COMn输出为1

 	;ANDU1 W0 ,0xD2 ,#240
	B0MOV A, 0xD2
	AND A, #0xf0
	;ORU1 0xD2 ,W0 ,_LcdScan_row
	OR A, _LcdScan_row
	B0MOV 0xD2, A
.stabn 0xE0,0,1,L172-_LcdScan
L172:
.stabn 0x44,0,239,L173-_LcdScan
L173:
;Line#239 	}

	JMP L140
L139:
.stabn 0xC0,0,1,L174-_LcdScan
L174:
.stabn 0x44,0,241,L175-_LcdScan
L175:
;Line#241 	{

 .stabn 0x44,0,242,L176-_LcdScan
L176:
;Line#242 		if(LcdScan_row&COM4)       //com口扫描到达com4

 	;ANDU1 W0 ,_LcdScan_row ,#8
	__SelectBANK _LcdScan_row
	MOV A, _LcdScan_row
	AND A, #0x08
	;EQ L146 ,W0 ,#0
	AND A, #0xFF
	JEQ L146
.stabn 0xC0,0,2,L177-_LcdScan
L177:
.stabn 0x44,0,243,L178-_LcdScan
L178:
;Line#243 		{

 .stabn 0x44,0,244,L179-_LcdScan
L179:
;Line#244 			flag |= LcdSacn_forward;	//设置正向扫描标志

 	;ORU1 _flag ,_flag ,#128
	MOV A, #0x80
	__SelectBANK _flag
	OR _flag, A
.stabn 0x44,0,245,L180-_LcdScan
L180:
;Line#245 			LcdScan_row = COM1;    //设置com1

 	;MOVU1 _LcdScan_row ,#1
	MOV A, #0x01
	__SelectBANK _LcdScan_row
	MOV _LcdScan_row, A
.stabn 0xE0,0,2,L181-_LcdScan
L181:
.stabn 0x44,0,246,L182-_LcdScan
L182:
;Line#246 		}

	JMP L147
L146:
.stabn 0x44,0,248,L183-_LcdScan
L183:
;Line#248 			LcdScan_row <<= 1;   //com口左移一位

 	;LSH _LcdScan_row ,_LcdScan_row ,#1
	B0BCLR FC
	__SelectBANK _LcdScan_row
	RLCM _LcdScan_row
L147:
.stabn 0x44,0,250,L184-_LcdScan
L184:
;Line#250 		j=LcdScan_row;

 	;MOVU1 _LcdScan_data@1 ,_LcdScan_row
	__SelectBANK _LcdScan_row
	MOV A, _LcdScan_row
	__SelectBANK _LcdScan_data@1
	MOV _LcdScan_data@1, A
	JMP L149
L148:
.stabn 0x44,0,252,L185-_LcdScan
L185:
;Line#252 		i+=1;

 	;ADDU1 _LcdScan_data@0 ,_LcdScan_data@0 ,#1
	__SelectBANK _LcdScan_data@0
	INCMS _LcdScan_data@0
	NOP
L149:
.stabn 0x44,0,251,L186-_LcdScan
L186:
;Line#251 		while((j >>= 1)==0x01)      //获取行号

 	;RSH W0 ,_LcdScan_data@1 ,#1
	B0BCLR FC
	__SelectBANK _LcdScan_data@1
	RRC _LcdScan_data@1
	;MOVU1 _LcdScan_data@1 ,W0
	MOV _LcdScan_data@1, A
	;EQ L148 ,W0 ,#1
	SUB A, #0x01
	JEQ L148
.stabn 0x44,0,253,L187-_LcdScan
L187:
	__SelectBANK _LcdScan_data@0
	MOV A, _LcdScan_data@0
	B0MOV Y, #(_databuf)$M
	B0MOV Z, #(_databuf)$L
	B0ADD Z, A
	B0MOV A, @YZ
;Line#253 		DataPut(databuf[i]);     //推送数据

 	;PUSH _DataPut_arg@0 ,W0
	__SelectBANK _DataPut_arg@0
	MOV _DataPut_arg@0, A
	;CALLV _DataPut
	CALL _DataPut
.stabn 0x44,0,255,L188-_LcdScan
L188:
;Line#255 		P2M = P2M & 0xF0 | LcdScan_row;   //设置COMn为输出模式

 	;ANDU1 W0 ,0xC2 ,#240
	B0MOV A, 0xC2
	AND A, #0xf0
	;ORU1 0xC2 ,W0 ,_LcdScan_row
	__SelectBANK _LcdScan_row
	OR A, _LcdScan_row
	B0MOV 0xC2, A
.stabn 0x44,0,256,L189-_LcdScan
L189:
;Line#256 		P2  = P2 & 0xF0 & ~LcdScan_row;    //设置COMn输出为0

 	;ANDU1 W0 ,0xD2 ,#240
	B0MOV A, 0xD2
	AND A, #0xf0
	B0MOV W0, A
	;BCOM W1 ,_LcdScan_row
	MOV A, _LcdScan_row
	XOR A, #0xFF
	;ANDU1 0xD2 ,W1 ,W0
	__SelectBANKCNST 0
	AND A, W0
	B0MOV 0xD2, A
.stabn 0xE0,0,1,L190-_LcdScan
L190:
.stabn 0x44,0,257,L191-_LcdScan
L191:
;Line#257 	}

L140:
.stabn 0xE0,0,0,L192-_LcdScan
L192:
.stabn 0x44,0,258,L193-_LcdScan
L193:
;Line#258 }

L138:
	RET

CALLTREE _LcdScan invoke _DataPut

.stabs "DataPut:F13",36,0,0,_DataPut
_Function_DataPut_code SEGMENT CODE INBANK USING _Function_DataPut_data
_DataPut:
.stabs "data:p9",160,0,0,_DataPut_arg@0
.stabs "i:9",128,0,0,_DataPut_data@0
.stabn 0xC0,0,0,L199-_DataPut
L199:
.stabn 0x44,0,261,L200-_DataPut
L200:
;Line#261 {	

 .stabn 0x44,0,263,L201-_DataPut
L201:
;Line#263 	MR=0;   //锁存

 	;MOVX1 0xD0.0 ,#0
	B0BCLR 0xD0.0
.stabn 0xC0,0,1,L202-_DataPut
L202:
.stabn 0x44,0,264,L203-_DataPut
L203:
;Line#264 	for(i=0;i<8;i++)

 	;MOVU1 _DataPut_data@0 ,#0
	__SelectBANK _DataPut_data@0
	CLR _DataPut_data@0
	JMP L198
L195:
.stabn 0xC0,0,2,L204-_DataPut
L204:
.stabn 0x44,0,265,L205-_DataPut
L205:
;Line#265 	{

 .stabn 0x44,0,266,L206-_DataPut
L206:
;Line#266 		CLK=0;

 	;MOVX1 0xD1.0 ,#0
	B0BCLR 0xD1.0
.stabn 0x44,0,268,L207-_DataPut
L207:
;Line#268 		DSB=(data & 0x01);

 	;ANDU1 W0 ,_DataPut_arg@0 ,#1
	__SelectBANK _DataPut_arg@0
	MOV A, _DataPut_arg@0
	AND A, #0x01
	;LODI1 W0 ,W0
	B0MOV W0, A
	;LODX1 0xD2.5 ,W0
	B0BSET 0xD2.5
	B0BTS0 W0.0
	JMP L482
	B0BCLR 0xD2.5
L482:
.stabn 0x44,0,270,L208-_DataPut
L208:
;Line#270 		CLK=1;

 	;MOVX1 0xD1.0 ,#1
	B0BSET 0xD1.0
.stabn 0x44,0,271,L209-_DataPut
L209:
;Line#271 		data >>= 1;

 	;RSH _DataPut_arg@0 ,_DataPut_arg@0 ,#1
	B0BCLR FC
	__SelectBANK _DataPut_arg@0
	RRCM _DataPut_arg@0
.stabn 0xE0,0,2,L210-_DataPut
L210:
.stabn 0x44,0,272,L211-_DataPut
L211:
;Line#272 	}

L196:
.stabn 0x44,0,264,L212-_DataPut
L212:
;Line#264 	for(i=0;i<8;i++)

 	;ADDU1 _DataPut_data@0 ,_DataPut_data@0 ,#1
	__SelectBANK _DataPut_data@0
	INCMS _DataPut_data@0
	NOP
L198:
.stabn 0x44,0,264,L213-_DataPut
L213:
;Line#264 	for(i=0;i<8;i++)

 	;LT L195 ,_DataPut_data@0 ,#8
	__SelectBANK _DataPut_data@0
	MOV A, _DataPut_data@0
	SUB A, #0x08
	JLT L195
.stabn 0xE0,0,1,L214-_DataPut
L214:
.stabn 0x44,0,273,L215-_DataPut
L215:
;Line#273 	MR=1;	//开锁存

 .stabn 0x44,0,273,L216-_DataPut
L216:
;Line#273 	MR=1;	//开锁存

 	;MOVX1 0xD0.0 ,#1
	B0BSET 0xD0.0
.stabn 0xE0,0,0,L217-_DataPut
L217:
.stabn 0x44,0,274,L218-_DataPut
L218:
;Line#274 }

L194:
	RET
.stabs "TableToBuf:F13",36,0,0,_TableToBuf
_Function_TableToBuf_code SEGMENT CODE INBANK USING _Function_TableToBuf_data
_TableToBuf:
.stabs "mask:p9",160,0,0,_TableToBuf_arg@0
.stabs "number:p9",160,0,0,_TableToBuf_arg@1
.stabs "i:9",128,0,0,_TableToBuf_data@0
.stabs "dat:9",128,0,0,_TableToBuf_data@1
.stabn 0xC0,0,0,L224-_TableToBuf
L224:
.stabn 0x44,0,277,L225-_TableToBuf
L225:
;Line#277 {

 .stabn 0xC0,0,1,L226-_TableToBuf
L226:
.stabn 0x44,0,279,L227-_TableToBuf
L227:
;Line#279 	for(i=0;i<4;i++)

 	;MOVU1 _TableToBuf_data@0 ,#0
	__SelectBANK _TableToBuf_data@0
	CLR _TableToBuf_data@0
	JMP L223
L220:
.stabn 0xC0,0,2,L228-_TableToBuf
L228:
.stabn 0x44,0,280,L229-_TableToBuf
L229:
;Line#280 	{	

 .stabn 0x44,0,281,L230-_TableToBuf
L230:
;Line#281 		dat = table1[number][i] & mask;    //获得对应的数码管显示位

 	;CVUU2 W0:W1 ,_TableToBuf_data@0
	__SelectBANK _TableToBuf_data@0
	MOV A, _TableToBuf_data@0
	B0MOV W0, A
	__SelectBANKCNST 0
	CLR W1
	;CVUU2 W2:W3 ,_TableToBuf_arg@1
	__SelectBANK _TableToBuf_arg@1
	MOV A, _TableToBuf_arg@1
	B0MOV W2, A
	__SelectBANKCNST 0
	CLR W3
	;LSH W2:W3 ,W2:W3 ,#2
	B0BCLR FC
	__SelectBANKCNST 0
	RLCM W2
	__SelectBANKCNST 0
	RLCM W3
	B0BCLR FC
	__SelectBANKCNST 0
	RLCM W2
	__SelectBANKCNST 0
	RLCM W3
	;LEA W4:W5 ,_table1
	;ADDP2 W2:W3 ,W4:W5 ,W2:W3
	MOV A, #(W2)$M
	B0MOV H, A
	MOV A, #(W2)$L
	B0MOV L, A
	MOV A, #(_table1)$M
	B0MOV R, A
	MOV A, #(_table1)$L
	B0MOV Z, A
	B0MOV A, R
	B0MOV Y, A
	B0MOV A, W3
	B0MOV R, A
	B0MOV A, W2
	CALL __AddRomPtr2Ram
	;ADDP2 W0:W1 ,W2:W3 ,W0:W1
	MOV A, #(W0)$M
	B0MOV H, A
	MOV A, #(W0)$L
	B0MOV L, A
	B0MOV A, W3
	B0MOV R, A
	B0MOV A, W2
	B0MOV Z, A
	B0MOV A, R
	B0MOV Y, A
	B0MOV A, W1
	B0MOV R, A
	B0MOV A, W0
	CALL __Add1RomPtr2Ram
	;ANDU1 _TableToBuf_data@1 , *W0:W1 ,_TableToBuf_arg@0
	B0MOV A, W1
	B0MOV Y, A
	B0MOV A, W0
	B0MOV Z, A
	CALL __Mov1ByteRomToReg
	__SelectBANK _TableToBuf_arg@0
	AND A, _TableToBuf_arg@0
	__SelectBANK _TableToBuf_data@1
	MOV _TableToBuf_data@1, A
.stabn 0x44,0,282,L231-_TableToBuf
L231:
;Line#282 		databuf[i] &= ~(uchar8)mask;     

 	;CVUU2 W0:W1 ,_TableToBuf_data@0
	__SelectBANK _TableToBuf_data@0
	MOV A, _TableToBuf_data@0
	__SelectBANKCNST 0
	CLR W1
	;LEA W2:W3 ,_databuf
	;ADDP2 W0:W1 ,W2:W3 ,W0:W1
	ADD A, #(_databuf)$L
	B0MOV Z, A
	MOV A, #(_databuf)$M
	ADC A, W1
	B0MOV Y, A
	;BCOM W2 ,_TableToBuf_arg@0
	__SelectBANK _TableToBuf_arg@0
	MOV A, _TableToBuf_arg@0
	XOR A, #0xFF
	;ANDU1 *W0:W1 ,W2 , *W0:W1
	B0MOV L, A
	__SelectBANKCNST 0
	AND @YZ, A
.stabn 0x44,0,283,L232-_TableToBuf
L232:
;Line#283 		databuf[i] |= dat;							

 	;CVUU2 W0:W1 ,_TableToBuf_data@0
	__SelectBANK _TableToBuf_data@0
	MOV A, _TableToBuf_data@0
	__SelectBANKCNST 0
	CLR W1
	;LEA W2:W3 ,_databuf
	;ADDP2 W0:W1 ,W2:W3 ,W0:W1
	ADD A, #(_databuf)$L
	B0MOV Z, A
	MOV A, #(_databuf)$M
	ADC A, W1
	B0MOV Y, A
	;ORU1 *W0:W1 , *W0:W1 ,_TableToBuf_data@1
	__SelectBANK _TableToBuf_data@1
	MOV A, _TableToBuf_data@1
	B0MOV L, A
	__SelectBANKCNST 0
	OR @YZ, A
.stabn 0xE0,0,2,L233-_TableToBuf
L233:
.stabn 0x44,0,284,L234-_TableToBuf
L234:
;Line#284 	}

L221:
.stabn 0x44,0,279,L235-_TableToBuf
L235:
;Line#279 	for(i=0;i<4;i++)

 	;ADDU1 _TableToBuf_data@0 ,_TableToBuf_data@0 ,#1
	__SelectBANK _TableToBuf_data@0
	INCMS _TableToBuf_data@0
	NOP
L223:
.stabn 0x44,0,279,L236-_TableToBuf
L236:
;Line#279 	for(i=0;i<4;i++)

 	;LT L220 ,_TableToBuf_data@0 ,#4
	__SelectBANK _TableToBuf_data@0
	MOV A, _TableToBuf_data@0
	SUB A, #0x04
	JLT L220
.stabn 0xE0,0,1,L237-_TableToBuf
L237:
.stabn 0x44,0,285,L238-_TableToBuf
L238:
;Line#285 }

 .stabn 0xE0,0,0,L239-_TableToBuf
L239:
.stabn 0x44,0,285,L240-_TableToBuf
L240:
;Line#285 }

L219:
	RET

CALLTREE _TableToBuf invoke __AddRomPtr2Ram,__Add1RomPtr2Ram,__Mov1ByteRomToReg

.stabs "RefleshBuf:F13",36,0,0,_RefleshBuf
_Function_RefleshBuf_code SEGMENT CODE INBANK USING _Function_RefleshBuf_data
_RefleshBuf:
.stabs "temporary1:9",128,0,0,_RefleshBuf_data@0
.stabs "temporary2:9",128,0,0,_RefleshBuf_data@1
.stabn 0xC0,0,0,L246-_RefleshBuf
L246:
.stabn 0x44,0,288,L247-_RefleshBuf
L247:
;Line#288 {

 .stabn 0x44,0,290,L248-_RefleshBuf
L248:
;Line#290 	if(flag & Lcd_Data_New)   //有新数据要刷新

 	;ANDU1 W0 ,_flag ,#64
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x40
	;EQ L242 ,W0 ,#0
	AND A, #0xFF
	JEQ L242
.stabn 0xC0,0,1,L249-_RefleshBuf
L249:
.stabn 0x44,0,291,L250-_RefleshBuf
L250:
;Line#291 	{	

 .stabn 0x44,0,293,L251-_RefleshBuf
L251:
;Line#293 		temporary1=(Lcd_flag1 & LcdGearsMask);  //获取档位

 	;ANDU1 _RefleshBuf_data@0 ,_Lcd_flag1 ,#15
	__SelectBANK _Lcd_flag1
	MOV A, _Lcd_flag1
	AND A, #0x0f
	__SelectBANK _RefleshBuf_data@0
	MOV _RefleshBuf_data@0, A
.stabn 0x44,0,294,L252-_RefleshBuf
L252:
;Line#294 		temporary2=Get_TensPlace_Number(temporary1);  //获取十位

 	;PUSH _Get_TensPlace_Number_arg@0 ,_RefleshBuf_data@0
	__SelectBANK _Get_TensPlace_Number_arg@0
	MOV _Get_TensPlace_Number_arg@0, A
	;CALLU1 _RefleshBuf_data@1 ,_Get_TensPlace_Number
	CALL _Get_TensPlace_Number
	__SelectBANK _RefleshBuf_data@1
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,295,L253-_RefleshBuf
L253:
;Line#295 		TableToBuf(0xc0,temporary2);        //从Table表中区数据放至databuf

 	;PUSH _TableToBuf_arg@1 ,_RefleshBuf_data@1
	__SelectBANK _TableToBuf_arg@1
	MOV _TableToBuf_arg@1, A
	;PUSH _TableToBuf_arg@0 ,#192
	MOV A, #0xc0
	__SelectBANK _TableToBuf_arg@0
	MOV _TableToBuf_arg@0, A
	;CALLV _TableToBuf
	CALL _TableToBuf
.stabn 0x44,0,297,L254-_RefleshBuf
L254:
;Line#297 		temporary2=Get_OnesPlace_Number(temporary1);  //获取个位

 	;PUSH _Get_OnesPlace_Number_arg@0 ,_RefleshBuf_data@0
	__SelectBANK _RefleshBuf_data@0
	MOV A, _RefleshBuf_data@0
	__SelectBANK _Get_OnesPlace_Number_arg@0
	MOV _Get_OnesPlace_Number_arg@0, A
	;CALLU1 _RefleshBuf_data@1 ,_Get_OnesPlace_Number
	CALL _Get_OnesPlace_Number
	__SelectBANK _RefleshBuf_data@1
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,298,L255-_RefleshBuf
L255:
;Line#298 		TableToBuf(0x30,temporary2);        //从Table表中区数据放至databuf

 	;PUSH _TableToBuf_arg@1 ,_RefleshBuf_data@1
	__SelectBANK _TableToBuf_arg@1
	MOV _TableToBuf_arg@1, A
	;PUSH _TableToBuf_arg@0 ,#48
	MOV A, #0x30
	__SelectBANK _TableToBuf_arg@0
	MOV _TableToBuf_arg@0, A
	;CALLV _TableToBuf
	CALL _TableToBuf
.stabn 0x44,0,302,L256-_RefleshBuf
L256:
;Line#302 		if(Lcd_flag2 & LcdTimingON)  //定时器使能标志

 	;ANDU1 W0 ,_Lcd_flag2 ,#64
	__SelectBANK _Lcd_flag2
	MOV A, _Lcd_flag2
	AND A, #0x40
	;EQ L244 ,W0 ,#0
	AND A, #0xFF
	JEQ L244
.stabn 0xC0,0,2,L257-_RefleshBuf
L257:
.stabn 0x44,0,303,L258-_RefleshBuf
L258:
;Line#303 		{

 .stabn 0x44,0,304,L259-_RefleshBuf
L259:
;Line#304 			temporary1=(Lcd_flag2 & LcdTimingMask);  //获取当前定时定时时间

 	;ANDU1 _RefleshBuf_data@0 ,_Lcd_flag2 ,#63
	MOV A, _Lcd_flag2
	AND A, #0x3f
	__SelectBANK _RefleshBuf_data@0
	MOV _RefleshBuf_data@0, A
.stabn 0x44,0,305,L260-_RefleshBuf
L260:
;Line#305 			temporary2=Get_TensPlace_Number(temporary1);  //获取十位

 	;PUSH _Get_TensPlace_Number_arg@0 ,_RefleshBuf_data@0
	__SelectBANK _Get_TensPlace_Number_arg@0
	MOV _Get_TensPlace_Number_arg@0, A
	;CALLU1 _RefleshBuf_data@1 ,_Get_TensPlace_Number
	CALL _Get_TensPlace_Number
	__SelectBANK _RefleshBuf_data@1
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,306,L261-_RefleshBuf
L261:
;Line#306 			TableToBuf(0x0c,temporary2);    //从Table表中取数据放至databuf

 	;PUSH _TableToBuf_arg@1 ,_RefleshBuf_data@1
	__SelectBANK _TableToBuf_arg@1
	MOV _TableToBuf_arg@1, A
	;PUSH _TableToBuf_arg@0 ,#12
	MOV A, #0x0c
	__SelectBANK _TableToBuf_arg@0
	MOV _TableToBuf_arg@0, A
	;CALLV _TableToBuf
	CALL _TableToBuf
.stabn 0x44,0,308,L262-_RefleshBuf
L262:
;Line#308 			temporary2=Get_OnesPlace_Number(temporary1);  //获取十位

 	;PUSH _Get_OnesPlace_Number_arg@0 ,_RefleshBuf_data@0
	__SelectBANK _RefleshBuf_data@0
	MOV A, _RefleshBuf_data@0
	__SelectBANK _Get_OnesPlace_Number_arg@0
	MOV _Get_OnesPlace_Number_arg@0, A
	;CALLU1 _RefleshBuf_data@1 ,_Get_OnesPlace_Number
	CALL _Get_OnesPlace_Number
	__SelectBANK _RefleshBuf_data@1
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,309,L263-_RefleshBuf
L263:
;Line#309 			TableToBuf(0x03,temporary2);    //从Table表中取数据放至databuf		

 	;PUSH _TableToBuf_arg@1 ,_RefleshBuf_data@1
	__SelectBANK _TableToBuf_arg@1
	MOV _TableToBuf_arg@1, A
	;PUSH _TableToBuf_arg@0 ,#3
	MOV A, #0x03
	__SelectBANK _TableToBuf_arg@0
	MOV _TableToBuf_arg@0, A
	;CALLV _TableToBuf
	CALL _TableToBuf
.stabn 0xE0,0,2,L264-_RefleshBuf
L264:
.stabn 0x44,0,310,L265-_RefleshBuf
L265:
;Line#310 		}else    //显示“--”

	JMP L245
L244:
.stabn 0x44,0,311,L266-_RefleshBuf
L266:
;Line#311 			TableToBuf(0x0f,11);         //从Table表中取数据放至databuf

 	;PUSH _TableToBuf_arg@1 ,#11
	MOV A, #0x0b
	__SelectBANK _TableToBuf_arg@1
	MOV _TableToBuf_arg@1, A
	;PUSH _TableToBuf_arg@0 ,#15
	MOV A, #0x0f
	__SelectBANK _TableToBuf_arg@0
	MOV _TableToBuf_arg@0, A
	;CALLV _TableToBuf
	CALL _TableToBuf
L245:
.stabn 0x44,0,316,L267-_RefleshBuf
L267:
;Line#316 		flag &= ~(uchar8)Lcd_Data_New; //数据处理完毕

 	;ANDU1 _flag ,_flag ,#191
	MOV A, #0xbf
	__SelectBANK _flag
	AND _flag, A
.stabn 0xE0,0,1,L268-_RefleshBuf
L268:
.stabn 0x44,0,317,L269-_RefleshBuf
L269:
;Line#317 	}

L242:
.stabn 0xE0,0,0,L270-_RefleshBuf
L270:
.stabn 0x44,0,318,L271-_RefleshBuf
L271:
;Line#318 }

L241:
	RET

CALLTREE _RefleshBuf invoke _Get_TensPlace_Number,_TableToBuf,_Get_OnesPlace_Number

.stabs "ISR:F13",36,0,0,_ISR_isr

_interrupt@_ISR_isr SEGMENT CODE AT 0x8 INBANK
_vector_for_ISR_isr:
	JMP _ISR_isr

_Function_ISR_isr_code SEGMENT CODE INBANK USING _Function_ISR_isr_data
_ISR_isr:
	__PUSH_REG 2
.stabs "ButtonValue:9",128,0,0,_ISR_isr_data@0
.stabn 0xC0,0,0,L305-_ISR_isr
L305:
.stabn 0x44,0,322,L306-_ISR_isr
L306:
;Line#322 {

 .stabn 0x44,0,329,L307-_ISR_isr
L307:
;Line#329 	if(Lcd_flag2 & LcdTimingMask)   //剩余定时时间不为零

 	;ANDU1 WG ,_Lcd_flag2 ,#63
	__SelectBANK _Lcd_flag2
	MOV A, _Lcd_flag2
	AND A, #0x3f
	;EQ L275 ,WG ,#0
	AND A, #0xFF
	JEQ L275
.stabn 0xC0,0,1,L308-_ISR_isr
L308:
.stabn 0x44,0,330,L309-_ISR_isr
L309:
;Line#330 	{

 .stabn 0x44,0,331,L310-_ISR_isr
L310:
;Line#331 		if(ms_counter>=250)   //250*2ms=0.5s

 	;LT L277 ,_sdata273 ,#250
	__SelectBANK _sdata273
	MOV A, _sdata273
	SUB A, #0xfa
	JLT L277
.stabn 0xC0,0,2,L311-_ISR_isr
L311:
.stabn 0x44,0,332,L312-_ISR_isr
L312:
;Line#332 		{

 .stabn 0x44,0,333,L313-_ISR_isr
L313:
;Line#333 			ms_counter = 0;

 	;MOVU1 _sdata273 ,#0
	CLR _sdata273
.stabn 0x44,0,334,L314-_ISR_isr
L314:
;Line#334 			s_counter++;

 	;ADDU1 _sdata274 ,_sdata274 ,#1
	__SelectBANK _sdata274
	INCMS _sdata274
	NOP
.stabn 0xE0,0,2,L315-_ISR_isr
L315:
.stabn 0x44,0,335,L316-_ISR_isr
L316:
;Line#335 		}else

	JMP L278
L277:
.stabn 0xC0,0,2,L317-_ISR_isr
L317:
.stabn 0x44,0,336,L318-_ISR_isr
L318:
;Line#336 		{

 .stabn 0x44,0,337,L319-_ISR_isr
L319:
;Line#337 			ms_counter++;

 	;ADDU1 _sdata273 ,_sdata273 ,#1
	__SelectBANK _sdata273
	INCMS _sdata273
	NOP
.stabn 0xE0,0,2,L320-_ISR_isr
L320:
.stabn 0x44,0,338,L321-_ISR_isr
L321:
;Line#338 		}

L278:
.stabn 0x44,0,340,L322-_ISR_isr
L322:
;Line#340 		if(s_counter>=120)    //120*0.5=60s

 	;LT L279 ,_sdata274 ,#120
	__SelectBANK _sdata274
	MOV A, _sdata274
	SUB A, #0x78
	JLT L279
.stabn 0xC0,0,2,L323-_ISR_isr
L323:
.stabn 0x44,0,341,L324-_ISR_isr
L324:
;Line#341 		{

 .stabn 0x44,0,342,L325-_ISR_isr
L325:
;Line#342 			s_counter = 0;

 	;MOVU1 _sdata274 ,#0
	CLR _sdata274
.stabn 0x44,0,343,L326-_ISR_isr
L326:
;Line#343 			Lcd_flag2 -= 1;        //定时时间减去一分钟

 	;SUBU1 _Lcd_flag2 ,_Lcd_flag2 ,#1
	__SelectBANK _Lcd_flag2
	DECMS _Lcd_flag2
	NOP
.stabn 0x44,0,344,L327-_ISR_isr
L327:
;Line#344 			flag |= Lcd_Data_New;  //新数据待刷新标志

 	;ORU1 _flag ,_flag ,#64
	MOV A, #0x40
	__SelectBANK _flag
	OR _flag, A
.stabn 0xE0,0,2,L328-_ISR_isr
L328:
.stabn 0x44,0,345,L329-_ISR_isr
L329:
;Line#345 		}else

	JMP L276
L279:
.stabn 0xC0,0,2,L330-_ISR_isr
L330:
.stabn 0x44,0,346,L331-_ISR_isr
L331:
;Line#346 		{

 .stabn 0x44,0,347,L332-_ISR_isr
L332:
;Line#347 			s_counter++;

 	;ADDU1 _sdata274 ,_sdata274 ,#1
	__SelectBANK _sdata274
	INCMS _sdata274
	NOP
.stabn 0xE0,0,2,L333-_ISR_isr
L333:
.stabn 0x44,0,348,L334-_ISR_isr
L334:
;Line#348 		}

 .stabn 0xE0,0,1,L335-_ISR_isr
L335:
.stabn 0x44,0,349,L336-_ISR_isr
L336:
;Line#349 	}

	JMP L276
L275:
.stabn 0xC0,0,1,L337-_ISR_isr
L337:
.stabn 0x44,0,351,L338-_ISR_isr
L338:
;Line#351 	{

 .stabn 0x44,0,352,L339-_ISR_isr
L339:
;Line#352 		ms_counter = 0;	

 	;MOVU1 _sdata273 ,#0
	__SelectBANK _sdata273
	CLR _sdata273
.stabn 0x44,0,353,L340-_ISR_isr
L340:
;Line#353 		s_counter  = 0;

 	;MOVU1 _sdata274 ,#0
	__SelectBANK _sdata274
	CLR _sdata274
.stabn 0x44,0,354,L341-_ISR_isr
L341:
;Line#354 		Lcd_flag1 |= LcdGearsNew;  //通知PwmOut函数更新PWM输出

 	;ORU1 _Lcd_flag1 ,_Lcd_flag1 ,#128
	MOV A, #0x80
	__SelectBANK _Lcd_flag1
	OR _Lcd_flag1, A
.stabn 0xE0,0,1,L342-_ISR_isr
L342:
.stabn 0x44,0,355,L343-_ISR_isr
L343:
;Line#355 	}

L276:
.stabn 0x44,0,358,L344-_ISR_isr
L344:
;Line#358    ButtonValue = (~ButtonPort) & ButtonMask;   // 检测哪一个按键按下

 	;BCOM WG ,0xD1
	B0MOV A, 0xD1
	XOR A, #0xFF
	;ANDU1 _ISR_isr_data@0 ,WG ,#14
	AND A, #0x0e
	__SelectBANK _ISR_isr_data@0
	MOV _ISR_isr_data@0, A
.stabn 0x44,0,359,L345-_ISR_isr
L345:
;Line#359    switch (Button_flag & 0x03)

 	;ANDU1 _ISR_isr_data@1 ,_Button_flag ,#3
	__SelectBANK _Button_flag
	MOV A, _Button_flag
	AND A, #0x03
	__SelectBANK _ISR_isr_data@1
	MOV _ISR_isr_data@1, A
	;EQ L284 ,_ISR_isr_data@1 ,#1
	SUB A, #0x01
	JEQ L284
	;EQ L287 ,_ISR_isr_data@1 ,#2
	MOV A, _ISR_isr_data@1
	SUB A, #0x02
	JEQ L287
	;EQ L296 ,_ISR_isr_data@1 ,#3
	MOV A, _ISR_isr_data@1
	SUB A, #0x03
	JEQ L296
	JMP L282
.stabn 0xC0,0,1,L346-_ISR_isr
L346:
.stabn 0x44,0,360,L347-_ISR_isr
L347:
;Line#360    {

L284:
.stabn 0xC0,0,2,L348-_ISR_isr
L348:
.stabn 0x44,0,362,L349-_ISR_isr
L349:
;Line#362     {

 .stabn 0x44,0,363,L350-_ISR_isr
L350:
;Line#363        if (ButtonValue)

 	;EQ L282 ,_ISR_isr_data@0 ,#0
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	JEQ L282
.stabn 0x44,0,364,L351-_ISR_isr
L351:
;Line#364          Button_flag = ButtonAckStatus;    // 按键下一个状态为确认状态

 	;MOVU1 _Button_flag ,#2
	MOV A, #0x02
	__SelectBANK _Button_flag
	MOV _Button_flag, A
.stabn 0xE0,0,2,L352-_ISR_isr
L352:
.stabn 0x44,0,365,L353-_ISR_isr
L353:
;Line#365      } break;

 .stabn 0x44,0,365,L354-_ISR_isr
L354:
;Line#365      } break;

	JMP L282
L287:
.stabn 0xC0,0,2,L355-_ISR_isr
L355:
.stabn 0x44,0,368,L356-_ISR_isr
L356:
;Line#368     {

 .stabn 0x44,0,369,L357-_ISR_isr
L357:
;Line#369        if (!ButtonValue)    

 	;NEI1 L288 ,_ISR_isr_data@0 ,#0
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	CMPRS A, #0x00
	JMP L288
.stabn 0x44,0,370,L358-_ISR_isr
L358:
;Line#370          Button_flag = ButtonSearchStatus;

 	;MOVU1 _Button_flag ,#1
	MOV A, #0x01
	__SelectBANK _Button_flag
	MOV _Button_flag, A
	JMP L282
L288:
.stabn 0xC0,0,3,L359-_ISR_isr
L359:
.stabn 0x44,0,372,L360-_ISR_isr
L360:
;Line#372        {

 .stabn 0x44,0,373,L361-_ISR_isr
L361:
;Line#373 		if(ButtonValue & ButtonGearsMask)      //按键“档位”被按下

 	;ANDU1 WG ,_ISR_isr_data@0 ,#4
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	AND A, #0x04
	;EQ L290 ,WG ,#0
	AND A, #0xFF
	JEQ L290
.stabn 0x44,0,374,L362-_ISR_isr
L362:
;Line#374 			flag |= BUTTON_GEARS_WAIT;          //按键“档位” 置等待确认标志

 	;ORU1 _flag ,_flag ,#4
	MOV A, #0x04
	__SelectBANK _flag
	OR _flag, A
L290:
.stabn 0x44,0,376,L363-_ISR_isr
L363:
;Line#376 		if(ButtonValue & ButtonTimingMask)      //按键“定时”被按下

 	;ANDU1 WG ,_ISR_isr_data@0 ,#8
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	AND A, #0x08
	;EQ L292 ,WG ,#0
	AND A, #0xFF
	JEQ L292
.stabn 0x44,0,377,L364-_ISR_isr
L364:
;Line#377 			flag |= BUTTON_TIMING_WAIT;          //按键“定时” 置等待确认标志

 	;ORU1 _flag ,_flag ,#2
	MOV A, #0x02
	__SelectBANK _flag
	OR _flag, A
L292:
.stabn 0x44,0,379,L365-_ISR_isr
L365:
;Line#379 		if(ButtonValue & ButtonBackLightMask)    //按键“背光”被按下

 	;ANDU1 WG ,_ISR_isr_data@0 ,#2
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	AND A, #0x02
	;EQ L294 ,WG ,#0
	AND A, #0xFF
	JEQ L294
.stabn 0x44,0,380,L366-_ISR_isr
L366:
;Line#380 			flag |= BUTTON_BACK_LIGHT_WAIT;      //按键“背光” 置等待确认标志

 	;ORU1 _flag ,_flag ,#1
	MOV A, #0x01
	__SelectBANK _flag
	OR _flag, A
L294:
.stabn 0x44,0,382,L367-_ISR_isr
L367:
;Line#382          Button_flag = ButtonReleaseStatus;  // 按键下一个状态为释放状态

 	;MOVU1 _Button_flag ,#3
	MOV A, #0x03
	__SelectBANK _Button_flag
	MOV _Button_flag, A
.stabn 0xE0,0,3,L368-_ISR_isr
L368:
.stabn 0x44,0,383,L369-_ISR_isr
L369:
;Line#383        }

 .stabn 0xE0,0,2,L370-_ISR_isr
L370:
.stabn 0x44,0,384,L371-_ISR_isr
L371:
;Line#384      } break;        

 .stabn 0x44,0,384,L372-_ISR_isr
L372:
;Line#384      } break;        

	JMP L282
L296:
.stabn 0xC0,0,2,L373-_ISR_isr
L373:
.stabn 0x44,0,387,L374-_ISR_isr
L374:
;Line#387     {

 .stabn 0x44,0,388,L375-_ISR_isr
L375:
;Line#388        if (!ButtonValue)                   // 按键释放

 	;NEI1 L282 ,_ISR_isr_data@0 ,#0
	__SelectBANK _ISR_isr_data@0
	MOV A, _ISR_isr_data@0
	CMPRS A, #0x00
	JMP L282
.stabn 0xC0,0,3,L376-_ISR_isr
L376:
.stabn 0x44,0,389,L377-_ISR_isr
L377:
;Line#389       {

 .stabn 0x44,0,390,L378-_ISR_isr
L378:
;Line#390          if(flag & BUTTON_GEARS_WAIT)      //按键“档位”正等待确认

 	;ANDU1 WG ,_flag ,#4
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x04
	;EQ L299 ,WG ,#0
	AND A, #0xFF
	JEQ L299
.stabn 0xC0,0,4,L379-_ISR_isr
L379:
.stabn 0x44,0,391,L380-_ISR_isr
L380:
;Line#391 		{

 .stabn 0x44,0,392,L381-_ISR_isr
L381:
;Line#392 			flag |= BUTTON_GEARS;          //按键“档位” 置确认标志

 	;ORU1 _flag ,_flag ,#32
	MOV A, #0x20
	OR _flag, A
.stabn 0x44,0,393,L382-_ISR_isr
L382:
;Line#393 			flag &= ~(uchar8)BUTTON_GEARS_WAIT;  //清等待确认标志

 	;ANDU1 _flag ,_flag ,#251
	MOV A, #0xfb
	AND _flag, A
.stabn 0xE0,0,4,L383-_ISR_isr
L383:
.stabn 0x44,0,394,L384-_ISR_isr
L384:
;Line#394 		 }

L299:
.stabn 0x44,0,395,L385-_ISR_isr
L385:
;Line#395 		 if(flag & BUTTON_TIMING_WAIT)      //按键“定时”等待确认

 	;ANDU1 WG ,_flag ,#2
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x02
	;EQ L301 ,WG ,#0
	AND A, #0xFF
	JEQ L301
.stabn 0xC0,0,4,L386-_ISR_isr
L386:
.stabn 0x44,0,396,L387-_ISR_isr
L387:
;Line#396 		{

 .stabn 0x44,0,397,L388-_ISR_isr
L388:
;Line#397 			flag |= BUTTON_TIMING;          //按键“定时” 置确认标志

 	;ORU1 _flag ,_flag ,#16
	MOV A, #0x10
	OR _flag, A
.stabn 0x44,0,398,L389-_ISR_isr
L389:
;Line#398 			flag &= ~(uchar8)BUTTON_TIMING_WAIT;  //清等待确认标志

 	;ANDU1 _flag ,_flag ,#253
	MOV A, #0xfd
	AND _flag, A
.stabn 0xE0,0,4,L390-_ISR_isr
L390:
.stabn 0x44,0,399,L391-_ISR_isr
L391:
;Line#399 		 }

L301:
.stabn 0x44,0,400,L392-_ISR_isr
L392:
;Line#400 		 if(flag & BUTTON_BACK_LIGHT_WAIT)      //按键“背光”等待确认

 	;ANDU1 WG ,_flag ,#1
	__SelectBANK _flag
	MOV A, _flag
	AND A, #0x01
	;EQ L303 ,WG ,#0
	AND A, #0xFF
	JEQ L303
.stabn 0xC0,0,4,L393-_ISR_isr
L393:
.stabn 0x44,0,401,L394-_ISR_isr
L394:
;Line#401 	 	{

 .stabn 0x44,0,402,L395-_ISR_isr
L395:
;Line#402 			flag |= BUTTON_BACK_LIGHT;          //按键“背光” 置确认标志

 	;ORU1 _flag ,_flag ,#8
	MOV A, #0x08
	OR _flag, A
.stabn 0x44,0,403,L396-_ISR_isr
L396:
;Line#403 			flag &= ~(uchar8)BUTTON_BACK_LIGHT_WAIT;  //清等待确认标志

 	;ANDU1 _flag ,_flag ,#254
	MOV A, #0xfe
	AND _flag, A
.stabn 0xE0,0,4,L397-_ISR_isr
L397:
.stabn 0x44,0,404,L398-_ISR_isr
L398:
;Line#404 		 }	

L303:
.stabn 0x44,0,405,L399-_ISR_isr
L399:
;Line#405         Button_flag = ButtonSearchStatus;  // 按键下一个状态为查询状态     

 	;MOVU1 _Button_flag ,#1
	MOV A, #0x01
	__SelectBANK _Button_flag
	MOV _Button_flag, A
.stabn 0xE0,0,3,L400-_ISR_isr
L400:
.stabn 0x44,0,406,L401-_ISR_isr
L401:
;Line#406       }

 .stabn 0xE0,0,2,L402-_ISR_isr
L402:
.stabn 0x44,0,407,L403-_ISR_isr
L403:
;Line#407      }  

 .stabn 0x44,0,408,L404-_ISR_isr
L404:
;Line#408      default : break;

 .stabn 0xE0,0,1,L405-_ISR_isr
L405:
.stabn 0x44,0,409,L406-_ISR_isr
L406:
;Line#409    }

L282:
.stabn 0x44,0,410,L407-_ISR_isr
L407:
;Line#410    FT0IRQ = 0;     //清除中断标志位

 	;MOVX1 0xC8.4 ,#0
	B0BCLR 0xC8.4
.stabs "s_counter:V9",38,0,0,_sdata274
.stabs "ms_counter:V9",38,0,0,_sdata273
.stabn 0xE0,0,0,L408-_ISR_isr
L408:
.stabn 0x44,0,412,L409-_ISR_isr
L409:
;Line#412 }

L272:
	__POP_REG 2
	RETI
.stabs "PwmOut:F13",36,0,0,_PwmOut
_Function_PwmOut_code SEGMENT CODE INBANK USING _Function_PwmOut_data
_PwmOut:
.stabn 0xC0,0,0,L426-_PwmOut
L426:
.stabn 0x44,0,415,L427-_PwmOut
L427:
;Line#415 {

 .stabn 0x44,0,416,L428-_PwmOut
L428:
;Line#416 	if(Lcd_flag1 & LcdGearsNew)  //需要更新PWM输出

 	;ANDU1 W0 ,_Lcd_flag1 ,#128
	__SelectBANK _Lcd_flag1
	MOV A, _Lcd_flag1
	AND A, #0x80
	;EQ L411 ,W0 ,#0
	AND A, #0xFF
	JEQ L411
.stabn 0xC0,0,1,L429-_PwmOut
L429:
.stabn 0x44,0,417,L430-_PwmOut
L430:
;Line#417 	{

 .stabn 0x44,0,418,L431-_PwmOut
L431:
;Line#418 		switch(Lcd_flag1 & LcdGearsMask)  //获取新输出档位

 	;ANDU1 _PwmOut_data@0 ,_Lcd_flag1 ,#15
	MOV A, _Lcd_flag1
	AND A, #0x0f
	__SelectBANK _PwmOut_data@0
	MOV _PwmOut_data@0, A
	ADD A, #0x80
	CMPRS A, #0x88
	B0BTS0 FC
	JMP L484
	SUB A, #0x80
	B0BTS1 FC
	JMP L484
	B0ADD PCL, A
	JMP L416
	JMP L417
	JMP L418
	JMP L419
	JMP L420
	JMP L421
	JMP L422
	JMP L423
L484:
	JMP L414
.stabn 0xC0,0,2,L432-_PwmOut
L432:
.stabn 0x44,0,419,L433-_PwmOut
L433:
;Line#419 		{

L416:
.stabn 0x44,0,420,L434-_PwmOut
L434:
;Line#420 			case 0: FTC0ENB = 0; //禁止TC0时钟

 	;MOVX1 0xDA.7 ,#0
	B0BCLR 0xDA.7
.stabn 0x44,0,421,L435-_PwmOut
L435:
;Line#421 			break;

	JMP L414
L417:
.stabn 0x44,0,422,L436-_PwmOut
L436:
;Line#422 			case 1: TC0R = 30;	//占空比为30/256

 	;MOVU1 0xCD ,#30
	MOV A, #0x1e
	B0MOV 0xCD, A
.stabn 0x44,0,423,L437-_PwmOut
L437:
;Line#423 			break;

	JMP L414
L418:
.stabn 0x44,0,424,L438-_PwmOut
L438:
;Line#424 			case 2: TC0R = 60;	//占空比为60/256

 	;MOVU1 0xCD ,#60
	MOV A, #0x3c
	B0MOV 0xCD, A
.stabn 0x44,0,425,L439-_PwmOut
L439:
;Line#425 			break;

	JMP L414
L419:
.stabn 0x44,0,426,L440-_PwmOut
L440:
;Line#426 			case 3: TC0R = 90;	//占空比为90/256

 	;MOVU1 0xCD ,#90
	MOV A, #0x5a
	B0MOV 0xCD, A
.stabn 0x44,0,427,L441-_PwmOut
L441:
;Line#427 			break;

	JMP L414
L420:
.stabn 0x44,0,428,L442-_PwmOut
L442:
;Line#428 			case 4: TC0R = 120;	//占空比为120/256

 	;MOVU1 0xCD ,#120
	MOV A, #0x78
	B0MOV 0xCD, A
.stabn 0x44,0,429,L443-_PwmOut
L443:
;Line#429 			break;

	JMP L414
L421:
.stabn 0x44,0,430,L444-_PwmOut
L444:
;Line#430 			case 5: TC0R = 150;	//占空比为150/256

 	;MOVU1 0xCD ,#150
	MOV A, #0x96
	B0MOV 0xCD, A
.stabn 0x44,0,431,L445-_PwmOut
L445:
;Line#431 			break;

	JMP L414
L422:
.stabn 0x44,0,432,L446-_PwmOut
L446:
;Line#432 			case 6: TC0R = 180;	//占空比为180/256

 	;MOVU1 0xCD ,#180
	MOV A, #0xb4
	B0MOV 0xCD, A
.stabn 0x44,0,433,L447-_PwmOut
L447:
;Line#433 			break;

	JMP L414
L423:
.stabn 0x44,0,434,L448-_PwmOut
L448:
;Line#434 			case 7: TC0R = 210;	//占空比为210/256

 	;MOVU1 0xCD ,#210
	MOV A, #0xd2
	B0MOV 0xCD, A
.stabn 0x44,0,435,L449-_PwmOut
L449:
;Line#435 			break;

 .stabn 0x44,0,436,L450-_PwmOut
L450:
;Line#436 			default :break;

 .stabn 0xE0,0,2,L451-_PwmOut
L451:
.stabn 0x44,0,437,L452-_PwmOut
L452:
;Line#437 		}

L414:
.stabn 0x44,0,438,L453-_PwmOut
L453:
;Line#438 		if((Lcd_flag2 & LcdTimingON) && (!(Lcd_flag2 & LcdTimingMask)) )  //如果定时功能使能并且定时时间到零

 	;ANDU1 W0 ,_Lcd_flag2 ,#64
	__SelectBANK _Lcd_flag2
	MOV A, _Lcd_flag2
	AND A, #0x40
	;EQ L424 ,W0 ,#0
	AND A, #0xFF
	JEQ L424
	;ANDU1 W0 ,_Lcd_flag2 ,#63
	MOV A, _Lcd_flag2
	AND A, #0x3f
	;NEI1 L424 ,W0 ,#0
	CMPRS A, #0x00
	JMP L424
.stabn 0x44,0,439,L454-_PwmOut
L454:
;Line#439 			FTC0ENB = 0; //禁止TC0时钟，关闭PWM输出

 	;MOVX1 0xDA.7 ,#0
	B0BCLR 0xDA.7
L424:
.stabn 0x44,0,441,L455-_PwmOut
L455:
;Line#441 	Lcd_flag1 &= ~(uchar8)LcdGearsNew;  //PWM输出更新完毕

 	;ANDU1 _Lcd_flag1 ,_Lcd_flag1 ,#127
	MOV A, #0x7f
	__SelectBANK _Lcd_flag1
	AND _Lcd_flag1, A
.stabn 0xE0,0,1,L456-_PwmOut
L456:
.stabn 0x44,0,442,L457-_PwmOut
L457:
;Line#442 	}

L411:
.stabn 0xE0,0,0,L458-_PwmOut
L458:
.stabn 0x44,0,443,L459-_PwmOut
L459:
;Line#443 }

L410:
	RET
.stabs "main:F1",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L464-_main
L464:
.stabn 0x44,0,447,L465-_main
L465:
;Line#447 {	 

 .stabn 0x44,0,448,L466-_main
L466:
;Line#448 	IoInit();

 	;CALLV _IoInit
	CALL _IoInit
.stabn 0x44,0,449,L467-_main
L467:
;Line#449 	IrqInit();   

 	;CALLV _IrqInit
	CALL _IrqInit
L461:
.stabn 0xC0,0,1,L468-_main
L468:
.stabn 0x44,0,451,L469-_main
L469:
;Line#451 	{

 .stabn 0x44,0,452,L470-_main
L470:
;Line#452 		WDTR=0x5A;      //看门狗清零

 	;MOVU1 0xCC ,#90
	MOV A, #0x5a
	B0MOV 0xCC, A
.stabn 0x44,0,453,L471-_main
L471:
;Line#453 		ButtonScan();   //按键扫描

 	;CALLV _ButtonScan
	CALL _ButtonScan
.stabn 0x44,0,454,L472-_main
L472:
;Line#454 		RefleshBuf();   //刷新显示缓冲区

 	;CALLV _RefleshBuf
	CALL _RefleshBuf
.stabn 0x44,0,455,L473-_main
L473:
;Line#455 		LcdScan();      //扫描Lcd

 	;CALLV _LcdScan
	CALL _LcdScan
.stabn 0x44,0,456,L474-_main
L474:
;Line#456 		PwmOut(); 		//更新PWM输出状态

 	;CALLV _PwmOut
	CALL _PwmOut
.stabn 0xE0,0,1,L475-_main
L475:
.stabn 0x44,0,457,L476-_main
L476:
;Line#457 	}

L462:
.stabn 0x44,0,450,L477-_main
L477:
;Line#450 	while(1)

	JMP L461
.stabn 0x44,0,458,L478-_main
L478:
;Line#458 	return 0;

 	;RETI1 #0
	MOV A, #0x00
.stabn 0xE0,0,0,L479-_main
L479:
.stabn 0x44,0,460,L480-_main
L480:
;Line#460 }

L460:
_main_end:

CALLTREE _main invoke _IoInit,_IrqInit,_ButtonScan,_RefleshBuf,_LcdScan,_PwmOut

.stabs "_intrinsicbitfield:T18=s1bit0:12,0,1;bit1:12,1,1;bit2:12,2,1;\\",128,0,0,0
.stabs "bit3:12,3,1;bit4:12,4,1;bit5:12,5,1;bit6:12,6,1;bit7:12,7,1;;",128,0,0,0
.stabs "", 100, 0, 0,Letext
Letext:
EXTERN CODE __Mov1ByteRomToReg
EXTERN CODE __Add1RomPtr2Ram
EXTERN CODE __AddRomPtr2Ram
