CHIP SN8P2501B
EXTERN DATA X
EXTERN DATA H
EXTERN DATA L
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
	MOV A,#0x1
	MOV _LcdScan_row,A
_flag@segment SEGMENT DATA INBANK
	_flag DS 1
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	MOV A,#0xC0
	MOV _flag,A
_Lcd_flag1@segment SEGMENT DATA INBANK
	_Lcd_flag1 DS 1
_Lcd_flag2@segment SEGMENT DATA INBANK
	_Lcd_flag2 DS 1
_Button_flag@segment SEGMENT DATA INBANK
	_Button_flag DS 1
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	MOV A,#0x1
	MOV _Button_flag,A
_databuf@segment SEGMENT DATA INBANK
	_databuf DS 4
_DATA_INIT_CODE SEGMENT CODE INBANK
_databuf_initial_value:
	DB 0xEE, 0xBB, 0xEE, 0xBB
_SGV_INIT_CODE SEGMENT CODE BANK 0x0 INBANK
	extern code __INIT@global_
	B0MOV 132, #(_databuf_initial_value)$M
	B0MOV 131, #(_databuf_initial_value)$L
	MOV A, #(_databuf)$M
	B0MOV H, A
	MOV A, #(_databuf)$L
	B0MOV L, A
	MOV A, #(4)
	B0MOV X, A
	CALL __INIT@global_
_table1@segment SEGMENT CODE INBANK
_table1:
	DB 0xEE, 0xBB, 0xEE, 0xBB, 0x44, 0x11, 0x44, 0x11, 0xAA, 0xEE, 0x55, 0xBB, 0xEE, 0x55, 0x55, 0xBB, 0x44, 0x55, 0xFF, 0x11, 0xEE, 0x55, 0xBB, 0xAA, 0xEE, 0xFF, 0xBB, 0xAA, 0x44, 0x11, 0x44, 0xBB, 0xEE, 0xFF, 0xFF, 0xBB, 0xEE, 0x55, 0xFF, 0xBB, 0x0, 0x44, 0x11, 0x0, 0x11, 0x0, 0x0, 0x44
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
_InterruptBackupData SEGMENT DATA BANK 0 INBANK COMMON
	_bufT ds 1
	_bufI ds 1
	_bufY ds 1
	_bufZ ds 1
	_bufR ds 1
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
 .stabn 0x44,0,115,L12-_IoInit
L12:
	B0BSET 0xC1.0
.stabn 0x44,0,116,L13-_IoInit
L13:
	B0BSET 0xC2.5
.stabn 0x44,0,117,L14-_IoInit
L14:
	B0BSET 0xB8.0
.stabn 0x44,0,118,L15-_IoInit
L15:
	B0BCLR 0xD0.0
.stabn 0x44,0,120,L16-_IoInit
L16:
	MOV A, #0x61
	B0MOV 0xDA, A
.stabn 0x44,0,124,L17-_IoInit
L17:
	CLR (0xDB &  0xFF)
.stabn 0x44,0,125,L18-_IoInit
L18:
	CLR (0xCD &  0xFF)
.stabn 0x44,0,127,L19-_IoInit
L19:
	B0BCLR 0xC1.1
.stabn 0x44,0,128,L20-_IoInit
L20:
	B0BCLR 0xC1.2
.stabn 0x44,0,129,L21-_IoInit
L21:
	B0BCLR 0xC1.3
.stabn 0x44,0,130,L22-_IoInit
L22:
	MOV A, #0x0e
	OR (0xD1 &  0xFF), A
.stabn 0x44,0,132,L23-_IoInit
L23:
	MOV A, #0x0c
	B0MOV 0xE1, A
.stabn 0x44,0,133,L24-_IoInit
L24:
	B0BSET 0xC2.4
.stabn 0x44,0,134,L25-_IoInit
L25:
	B0BSET 0xD2.4
.stabn 0x44,0,136,L26-_IoInit
L26:
	MOV A, #0xf0
	AND (0xC2 &  0xFF), A
.stabn 0xE0,0,0,L27-_IoInit
L27:
.stabn 0x44,0,137,L28-_IoInit
L28:
L1:
	RET
.stabs "IrqInit:F13",36,0,0,_IrqInit
_Function_IrqInit_code SEGMENT CODE INBANK USING _Function_IrqInit_data
_IrqInit:
.stabn 0xC0,0,0,L34-_IrqInit
L34:
.stabn 0x44,0,141,L35-_IrqInit
L35:
 .stabn 0x44,0,142,L36-_IrqInit
L36:
	MOV A, #0x30
	OR (0xD8 &  0xFF), A
.stabn 0x44,0,143,L37-_IrqInit
L37:
	MOV A, #0x06
	B0MOV 0xD9, A
.stabn 0x44,0,145,L38-_IrqInit
L38:
	B0BCLR 0xC8.4
.stabn 0x44,0,146,L39-_IrqInit
L39:
	B0BSET 0xC9.4
.stabn 0x44,0,147,L40-_IrqInit
L40:
	B0BSET 0xD8.7
.stabn 0x44,0,148,L41-_IrqInit
L41:
	B0BSET 0xDF.7
.stabn 0xE0,0,0,L42-_IrqInit
L42:
.stabn 0x44,0,150,L43-_IrqInit
L43:
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
 .stabn 0x44,0,154,L50-_Get_TensPlace_Number
L50:
	CLR _Get_TensPlace_Number_data@0
	JMP L46
L45:
.stabn 0xC0,0,1,L51-_Get_TensPlace_Number
L51:
.stabn 0x44,0,156,L52-_Get_TensPlace_Number
L52:
 .stabn 0x44,0,157,L53-_Get_TensPlace_Number
L53:
	INCMS _Get_TensPlace_Number_data@0
	NOP
.stabn 0x44,0,158,L54-_Get_TensPlace_Number
L54:
	MOV A, #0xf6
	ADD _Get_TensPlace_Number_arg@0, A
.stabn 0xE0,0,1,L55-_Get_TensPlace_Number
L55:
.stabn 0x44,0,159,L56-_Get_TensPlace_Number
L56:
L46:
.stabn 0x44,0,155,L57-_Get_TensPlace_Number
L57:
	MOV A, _Get_TensPlace_Number_arg@0
	SUB A, #0x0a
	b0bts0	134.2
	JMP	L45
.stabn 0x44,0,160,L58-_Get_TensPlace_Number
L58:
	MOV A, _Get_TensPlace_Number_data@0
.stabn 0xE0,0,0,L59-_Get_TensPlace_Number
L59:
.stabn 0x44,0,161,L60-_Get_TensPlace_Number
L60:
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
	JMP L63
L62:
.stabn 0x44,0,168,L67-_Get_OnesPlace_Number
L67:
	MOV A, #0xf6
	ADD _Get_OnesPlace_Number_arg@0, A
L63:
.stabn 0x44,0,167,L68-_Get_OnesPlace_Number
L68:
	MOV A, _Get_OnesPlace_Number_arg@0
	SUB A, #0x0a
	b0bts0	134.2
	JMP	L62
.stabn 0x44,0,169,L69-_Get_OnesPlace_Number
L69:
	MOV A, _Get_OnesPlace_Number_arg@0
.stabn 0xE0,0,0,L70-_Get_OnesPlace_Number
L70:
.stabn 0x44,0,170,L71-_Get_OnesPlace_Number
L71:
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
 .stabn 0x44,0,175,L87-_ButtonScan
L87:
	MOV A, _flag
	AND A, #0x20
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L73
.stabn 0xC0,0,1,L88-_ButtonScan
L88:
.stabn 0x44,0,176,L89-_ButtonScan
L89:
 .stabn 0x44,0,177,L90-_ButtonScan
L90:
	MOV A, _Lcd_flag1
	AND A, #0x0f
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,178,L91-_ButtonScan
L91:
	MOV A, #0xf0
	AND _Lcd_flag1, A
.stabn 0x44,0,179,L92-_ButtonScan
L92:
	INCMS _ButtonScan_data@0
	NOP
.stabn 0x44,0,180,L93-_ButtonScan
L93:
	MOV A, _ButtonScan_data@0
	CMPRS A, #0x0f
	B0BTS1	134.2
	JMP	L75
.stabn 0x44,0,181,L94-_ButtonScan
L94:
	CLR _ButtonScan_data@0
L75:
.stabn 0x44,0,182,L95-_ButtonScan
L95:
	MOV A, _ButtonScan_data@0
	OR _Lcd_flag1, A
.stabn 0x44,0,184,L96-_ButtonScan
L96:
	MOV A, #0xdf
	AND _flag, A
.stabn 0x44,0,185,L97-_ButtonScan
L97:
	MOV A, #0x40
	OR _flag, A
.stabn 0x44,0,186,L98-_ButtonScan
L98:
	MOV A, #0x80
	OR _Lcd_flag1, A
.stabn 0xE0,0,1,L99-_ButtonScan
L99:
.stabn 0x44,0,187,L100-_ButtonScan
L100:
L73:
.stabn 0x44,0,190,L101-_ButtonScan
L101:
	MOV A, _flag
	AND A, #0x10
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L77
.stabn 0xC0,0,1,L102-_ButtonScan
L102:
.stabn 0x44,0,191,L103-_ButtonScan
L103:
 .stabn 0x44,0,192,L104-_ButtonScan
L104:
	MOV A, _Lcd_flag2
	AND A, #0x3f
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,193,L105-_ButtonScan
L105:
	MOV A, _Lcd_flag2
	AND A, #0x40
	MOV _Lcd_flag2, A
	CMPRS A, #0x00
	JMP L79
.stabn 0xC0,0,2,L106-_ButtonScan
L106:
.stabn 0x44,0,194,L107-_ButtonScan
L107:
 .stabn 0x44,0,195,L108-_ButtonScan
L108:
	MOV A, #0x40
	AND _Lcd_flag2, A
.stabn 0x44,0,196,L109-_ButtonScan
L109:
	MOV A, #0xc0
	AND _Lcd_flag2, A
.stabn 0xE0,0,2,L110-_ButtonScan
L110:
.stabn 0x44,0,197,L111-_ButtonScan
L111:
	JMP L80
L79:
.stabn 0x44,0,198,L112-_ButtonScan
L112:
	MOV A, #0x0a
	ADD A, _ButtonScan_data@0
	CMPRS A, #0x46
	JMP L81
.stabn 0xC0,0,2,L113-_ButtonScan
L113:
.stabn 0x44,0,199,L114-_ButtonScan
L114:
 .stabn 0x44,0,200,L115-_ButtonScan
L115:
	MOV A, #0xbf
	OR _Lcd_flag2, A
.stabn 0xE0,0,2,L116-_ButtonScan
L116:
.stabn 0x44,0,201,L117-_ButtonScan
L117:
	JMP L82
L81:
.stabn 0xC0,0,2,L118-_ButtonScan
L118:
.stabn 0x44,0,203,L119-_ButtonScan
L119:
 .stabn 0x44,0,204,L120-_ButtonScan
L120:
	MOV A, _ButtonScan_data@0
	MOV _Get_TensPlace_Number_arg@0, A
	CALL _Get_TensPlace_Number
	MOV _ButtonScan_data@0, A
.stabn 0x44,0,205,L121-_ButtonScan
L121:
	MOV A, #0xc0
	AND _Lcd_flag2, A
.stabn 0x44,0,206,L122-_ButtonScan
L122:
	MOV A, #0x0a
	ADD A, _ButtonScan_data@0
	OR _Lcd_flag2, A
.stabn 0xE0,0,2,L123-_ButtonScan
L123:
.stabn 0x44,0,207,L124-_ButtonScan
L124:
L82:
L80:
.stabn 0x44,0,208,L125-_ButtonScan
L125:
	MOV A, #0xef
	AND _flag, A
.stabn 0x44,0,209,L126-_ButtonScan
L126:
	MOV A, #0x40
	OR _flag, A
.stabn 0xE0,0,1,L127-_ButtonScan
L127:
.stabn 0x44,0,210,L128-_ButtonScan
L128:
L77:
.stabn 0x44,0,212,L129-_ButtonScan
L129:
	MOV A, _flag
	AND A, #0x08
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L83
.stabn 0xC0,0,1,L130-_ButtonScan
L130:
.stabn 0x44,0,213,L131-_ButtonScan
L131:
 .stabn 0x44,0,214,L132-_ButtonScan
L132:
	MOV A, _ButtonScan_data@0
	XOR A, #0xFF
	B0MOV W0, A
	B0BSET 0xD2.4
	B0BTS0 W0.0
	JMP L481
	B0BCLR 0xD2.4
L481:
.stabn 0x44,0,215,L133-_ButtonScan
L133:
	MOV A, #0xf7
	AND _flag, A
.stabn 0xE0,0,1,L134-_ButtonScan
L134:
.stabn 0x44,0,216,L135-_ButtonScan
L135:
L83:
.stabn 0xE0,0,0,L136-_ButtonScan
L136:
.stabn 0x44,0,218,L137-_ButtonScan
L137:
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
 .stabn 0x44,0,222,L153-_LcdScan
L153:
	CLR _LcdScan_data@0
.stabn 0x44,0,222,L154-_LcdScan
L154:
	CLR _LcdScan_data@1
.stabn 0x44,0,223,L155-_LcdScan
L155:
	MOV A, _flag
	AND A, #0x80
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L139
.stabn 0xC0,0,1,L156-_LcdScan
L156:
.stabn 0x44,0,224,L157-_LcdScan
L157:
 .stabn 0x44,0,225,L158-_LcdScan
L158:
	MOV A, _LcdScan_row
	AND A, #0x08
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L141
.stabn 0xC0,0,2,L159-_LcdScan
L159:
.stabn 0x44,0,226,L160-_LcdScan
L160:
 .stabn 0x44,0,227,L161-_LcdScan
L161:
	MOV A, #0x7f
	AND _flag, A
.stabn 0x44,0,228,L162-_LcdScan
L162:
	MOV A, #0x01
	MOV _LcdScan_row, A
.stabn 0xE0,0,2,L163-_LcdScan
L163:
.stabn 0x44,0,229,L164-_LcdScan
L164:
	JMP L142
L141:
.stabn 0x44,0,231,L165-_LcdScan
L165:
	B0BCLR 134.2
	RLCM _LcdScan_row
L142:
.stabn 0x44,0,232,L166-_LcdScan
L166:
	MOV A, _LcdScan_row
	MOV _LcdScan_data@1, A
	JMP L144
L143:
.stabn 0x44,0,234,L167-_LcdScan
L167:
	INCMS _LcdScan_data@0
	NOP
L144:
.stabn 0x44,0,233,L168-_LcdScan
L168:
	B0BCLR 134.2
	RRC _LcdScan_data@1
	MOV _LcdScan_data@1, A
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L143
.stabn 0x44,0,235,L169-_LcdScan
L169:
	MOV A, _LcdScan_data@0
	B0MOV 132, #(_databuf)$M
	B0MOV 131, #(_databuf)$L
	B0ADD 131, A
	B0MOV A, 231
	XOR A, #0xFF
	MOV _DataPut_arg@0, A
	CALL _DataPut
.stabn 0x44,0,237,L170-_LcdScan
L170:
	B0MOV A, 0xC2
	AND A, #0xf0
	OR A, _LcdScan_row
	B0MOV 0xC2, A
.stabn 0x44,0,238,L171-_LcdScan
L171:
	B0MOV A, 0xD2
	AND A, #0xf0
	OR A, _LcdScan_row
	B0MOV 0xD2, A
.stabn 0xE0,0,1,L172-_LcdScan
L172:
.stabn 0x44,0,239,L173-_LcdScan
L173:
	JMP L140
L139:
.stabn 0xC0,0,1,L174-_LcdScan
L174:
.stabn 0x44,0,241,L175-_LcdScan
L175:
 .stabn 0x44,0,242,L176-_LcdScan
L176:
	MOV A, _LcdScan_row
	AND A, #0x08
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L146
.stabn 0xC0,0,2,L177-_LcdScan
L177:
.stabn 0x44,0,243,L178-_LcdScan
L178:
 .stabn 0x44,0,244,L179-_LcdScan
L179:
	MOV A, #0x80
	OR _flag, A
.stabn 0x44,0,245,L180-_LcdScan
L180:
	MOV A, #0x01
	MOV _LcdScan_row, A
.stabn 0xE0,0,2,L181-_LcdScan
L181:
.stabn 0x44,0,246,L182-_LcdScan
L182:
	JMP L147
L146:
.stabn 0x44,0,248,L183-_LcdScan
L183:
	B0BCLR 134.2
	RLCM _LcdScan_row
L147:
.stabn 0x44,0,250,L184-_LcdScan
L184:
	MOV A, _LcdScan_row
	MOV _LcdScan_data@1, A
	JMP L149
L148:
.stabn 0x44,0,252,L185-_LcdScan
L185:
	INCMS _LcdScan_data@0
	NOP
L149:
.stabn 0x44,0,251,L186-_LcdScan
L186:
	B0BCLR 134.2
	RRC _LcdScan_data@1
	MOV _LcdScan_data@1, A
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L148
.stabn 0x44,0,253,L187-_LcdScan
L187:
	MOV A, _LcdScan_data@0
	B0MOV 132, #(_databuf)$M
	B0MOV 131, #(_databuf)$L
	B0ADD 131, A
	B0MOV A, 231
	MOV _DataPut_arg@0, A
	CALL _DataPut
.stabn 0x44,0,255,L188-_LcdScan
L188:
	B0MOV A, 0xC2
	AND A, #0xf0
	OR A, _LcdScan_row
	B0MOV 0xC2, A
.stabn 0x44,0,256,L189-_LcdScan
L189:
	B0MOV A, 0xD2
	AND A, #0xf0
	B0MOV W0, A
	MOV A, _LcdScan_row
	XOR A, #0xFF
	AND A, W0
	B0MOV 0xD2, A
.stabn 0xE0,0,1,L190-_LcdScan
L190:
.stabn 0x44,0,257,L191-_LcdScan
L191:
L140:
.stabn 0xE0,0,0,L192-_LcdScan
L192:
.stabn 0x44,0,258,L193-_LcdScan
L193:
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
 .stabn 0x44,0,263,L201-_DataPut
L201:
	B0BCLR 0xD0.0
.stabn 0xC0,0,1,L202-_DataPut
L202:
.stabn 0x44,0,264,L203-_DataPut
L203:
	CLR _DataPut_data@0
	JMP L198
L195:
.stabn 0xC0,0,2,L204-_DataPut
L204:
.stabn 0x44,0,265,L205-_DataPut
L205:
 .stabn 0x44,0,266,L206-_DataPut
L206:
	B0BCLR 0xD1.0
.stabn 0x44,0,268,L207-_DataPut
L207:
	MOV A, _DataPut_arg@0
	AND A, #0x01
	B0MOV W0, A
	B0BSET 0xD2.5
	B0BTS0 W0.0
	JMP L482
	B0BCLR 0xD2.5
L482:
.stabn 0x44,0,270,L208-_DataPut
L208:
	B0BSET 0xD1.0
.stabn 0x44,0,271,L209-_DataPut
L209:
	B0BCLR 134.2
	RRCM _DataPut_arg@0
.stabn 0xE0,0,2,L210-_DataPut
L210:
.stabn 0x44,0,272,L211-_DataPut
L211:
L196:
.stabn 0x44,0,264,L212-_DataPut
L212:
	INCMS _DataPut_data@0
	NOP
L198:
.stabn 0x44,0,264,L213-_DataPut
L213:
	MOV A, _DataPut_data@0
	SUB A, #0x08
	B0BTS1	134.2
	JMP	L195
.stabn 0xE0,0,1,L214-_DataPut
L214:
.stabn 0x44,0,273,L215-_DataPut
L215:
 .stabn 0x44,0,273,L216-_DataPut
L216:
	B0BSET 0xD0.0
.stabn 0xE0,0,0,L217-_DataPut
L217:
.stabn 0x44,0,274,L218-_DataPut
L218:
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
 .stabn 0xC0,0,1,L226-_TableToBuf
L226:
.stabn 0x44,0,279,L227-_TableToBuf
L227:
	CLR _TableToBuf_data@0
	JMP L223
L220:
.stabn 0xC0,0,2,L228-_TableToBuf
L228:
.stabn 0x44,0,280,L229-_TableToBuf
L229:
 .stabn 0x44,0,281,L230-_TableToBuf
L230:
	MOV A, _TableToBuf_data@0
	B0MOV W0, A
	CLR W1
	MOV A, _TableToBuf_arg@1
	B0MOV W2, A
	CLR W3
	B0BCLR 134.2
	RLCM W2
	RLCM W3
	B0BCLR 134.2
	RLCM W2
	RLCM W3
	MOV A, #(W2)$M
	B0MOV H, A
	MOV A, #(W2)$L
	B0MOV L, A
	MOV A, #(_table1)$M
	B0MOV 130, A
	MOV A, #(_table1)$L
	B0MOV 131, A
	B0MOV A, 130
	B0MOV 132, A
	B0MOV A, W3
	B0MOV 130, A
	B0MOV A, W2
	CALL __AddRomPtr2Ram
	MOV A, #(W0)$M
	B0MOV H, A
	MOV A, #(W0)$L
	B0MOV L, A
	B0MOV A, W3
	B0MOV 130, A
	B0MOV A, W2
	B0MOV 131, A
	B0MOV A, 130
	B0MOV 132, A
	B0MOV A, W1
	B0MOV 130, A
	B0MOV A, W0
	CALL __Add1RomPtr2Ram
	B0MOV A, W1
	B0MOV 132, A
	B0MOV A, W0
	B0MOV 131, A
	CALL __Mov1ByteRomToReg
	AND A, _TableToBuf_arg@0
	MOV _TableToBuf_data@1, A
.stabn 0x44,0,282,L231-_TableToBuf
L231:
	MOV A, _TableToBuf_data@0
	CLR W1
	ADD A, #(_databuf)$L
	B0MOV 131, A
	MOV A, #(_databuf)$M
	ADC A, W1
	B0MOV 132, A
	MOV A, _TableToBuf_arg@0
	XOR A, #0xFF
	B0MOV L, A
	AND 231, A
.stabn 0x44,0,283,L232-_TableToBuf
L232:
	MOV A, _TableToBuf_data@0
	CLR W1
	ADD A, #(_databuf)$L
	B0MOV 131, A
	MOV A, #(_databuf)$M
	ADC A, W1
	B0MOV 132, A
	MOV A, _TableToBuf_data@1
	B0MOV L, A
	OR 231, A
.stabn 0xE0,0,2,L233-_TableToBuf
L233:
.stabn 0x44,0,284,L234-_TableToBuf
L234:
L221:
.stabn 0x44,0,279,L235-_TableToBuf
L235:
	INCMS _TableToBuf_data@0
	NOP
L223:
.stabn 0x44,0,279,L236-_TableToBuf
L236:
	MOV A, _TableToBuf_data@0
	SUB A, #0x04
	B0BTS1	134.2
	JMP	L220
.stabn 0xE0,0,1,L237-_TableToBuf
L237:
.stabn 0x44,0,285,L238-_TableToBuf
L238:
 .stabn 0xE0,0,0,L239-_TableToBuf
L239:
.stabn 0x44,0,285,L240-_TableToBuf
L240:
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
 .stabn 0x44,0,290,L248-_RefleshBuf
L248:
	MOV A, _flag
	AND A, #0x40
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L242
.stabn 0xC0,0,1,L249-_RefleshBuf
L249:
.stabn 0x44,0,291,L250-_RefleshBuf
L250:
 .stabn 0x44,0,293,L251-_RefleshBuf
L251:
	MOV A, _Lcd_flag1
	AND A, #0x0f
	MOV _RefleshBuf_data@0, A
.stabn 0x44,0,294,L252-_RefleshBuf
L252:
	MOV _Get_TensPlace_Number_arg@0, A
	CALL _Get_TensPlace_Number
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,295,L253-_RefleshBuf
L253:
	MOV _TableToBuf_arg@1, A
	MOV A, #0xc0
	MOV _TableToBuf_arg@0, A
	CALL _TableToBuf
.stabn 0x44,0,297,L254-_RefleshBuf
L254:
	MOV A, _RefleshBuf_data@0
	MOV _Get_OnesPlace_Number_arg@0, A
	CALL _Get_OnesPlace_Number
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,298,L255-_RefleshBuf
L255:
	MOV _TableToBuf_arg@1, A
	MOV A, #0x30
	MOV _TableToBuf_arg@0, A
	CALL _TableToBuf
.stabn 0x44,0,302,L256-_RefleshBuf
L256:
	MOV A, _Lcd_flag2
	AND A, #0x40
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L244
.stabn 0xC0,0,2,L257-_RefleshBuf
L257:
.stabn 0x44,0,303,L258-_RefleshBuf
L258:
 .stabn 0x44,0,304,L259-_RefleshBuf
L259:
	MOV A, _Lcd_flag2
	AND A, #0x3f
	MOV _RefleshBuf_data@0, A
.stabn 0x44,0,305,L260-_RefleshBuf
L260:
	MOV _Get_TensPlace_Number_arg@0, A
	CALL _Get_TensPlace_Number
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,306,L261-_RefleshBuf
L261:
	MOV _TableToBuf_arg@1, A
	MOV A, #0x0c
	MOV _TableToBuf_arg@0, A
	CALL _TableToBuf
.stabn 0x44,0,308,L262-_RefleshBuf
L262:
	MOV A, _RefleshBuf_data@0
	MOV _Get_OnesPlace_Number_arg@0, A
	CALL _Get_OnesPlace_Number
	MOV _RefleshBuf_data@1, A
.stabn 0x44,0,309,L263-_RefleshBuf
L263:
	MOV _TableToBuf_arg@1, A
	MOV A, #0x03
	MOV _TableToBuf_arg@0, A
	CALL _TableToBuf
.stabn 0xE0,0,2,L264-_RefleshBuf
L264:
.stabn 0x44,0,310,L265-_RefleshBuf
L265:
	JMP L245
L244:
.stabn 0x44,0,311,L266-_RefleshBuf
L266:
	MOV A, #0x0b
	MOV _TableToBuf_arg@1, A
	MOV A, #0x0f
	MOV _TableToBuf_arg@0, A
	CALL _TableToBuf
L245:
.stabn 0x44,0,316,L267-_RefleshBuf
L267:
	MOV A, #0xbf
	AND _flag, A
.stabn 0xE0,0,1,L268-_RefleshBuf
L268:
.stabn 0x44,0,317,L269-_RefleshBuf
L269:
L242:
.stabn 0xE0,0,0,L270-_RefleshBuf
L270:
.stabn 0x44,0,318,L271-_RefleshBuf
L271:
L241:
	RET
CALLTREE _RefleshBuf invoke _Get_TensPlace_Number,_TableToBuf,_Get_OnesPlace_Number
.stabs "ISR:F13",36,0,0,_ISR_isr
_interrupt@_ISR_isr SEGMENT CODE AT 0x8 INBANK
_vector_for_ISR_isr:
	JMP _ISR_isr
_Function_ISR_isr_code SEGMENT CODE INBANK USING _Function_ISR_isr_data
_ISR_isr:
	PUSH
	B0MOV A, 132
	B0MOV _bufY, A
	B0MOV A, 131
	B0MOV _bufZ, A
	B0MOV A, 130
	B0MOV _bufR, A
	B0MOV A, T
	B0MOV _bufT, A
	B0MOV A, I
	B0MOV _bufI, A
.stabs "ButtonValue:9",128,0,0,_ISR_isr_data@0
.stabn 0xC0,0,0,L305-_ISR_isr
L305:
.stabn 0x44,0,322,L306-_ISR_isr
L306:
 .stabn 0x44,0,329,L307-_ISR_isr
L307:
	MOV A, _Lcd_flag2
	AND A, #0x3f
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L275
.stabn 0xC0,0,1,L308-_ISR_isr
L308:
.stabn 0x44,0,330,L309-_ISR_isr
L309:
 .stabn 0x44,0,331,L310-_ISR_isr
L310:
	MOV A, _sdata273
	SUB A, #0xfa
	B0BTS1	134.2
	JMP	L277
.stabn 0xC0,0,2,L311-_ISR_isr
L311:
.stabn 0x44,0,332,L312-_ISR_isr
L312:
 .stabn 0x44,0,333,L313-_ISR_isr
L313:
	CLR _sdata273
.stabn 0x44,0,334,L314-_ISR_isr
L314:
	INCMS _sdata274
	NOP
.stabn 0xE0,0,2,L315-_ISR_isr
L315:
.stabn 0x44,0,335,L316-_ISR_isr
L316:
	JMP L278
L277:
.stabn 0xC0,0,2,L317-_ISR_isr
L317:
.stabn 0x44,0,336,L318-_ISR_isr
L318:
 .stabn 0x44,0,337,L319-_ISR_isr
L319:
	INCMS _sdata273
	NOP
.stabn 0xE0,0,2,L320-_ISR_isr
L320:
.stabn 0x44,0,338,L321-_ISR_isr
L321:
L278:
.stabn 0x44,0,340,L322-_ISR_isr
L322:
	MOV A, _sdata274
	SUB A, #0x78
	B0BTS1	134.2
	JMP	L279
.stabn 0xC0,0,2,L323-_ISR_isr
L323:
.stabn 0x44,0,341,L324-_ISR_isr
L324:
 .stabn 0x44,0,342,L325-_ISR_isr
L325:
	CLR _sdata274
.stabn 0x44,0,343,L326-_ISR_isr
L326:
	DECMS _Lcd_flag2
	NOP
.stabn 0x44,0,344,L327-_ISR_isr
L327:
	MOV A, #0x40
	OR _flag, A
.stabn 0xE0,0,2,L328-_ISR_isr
L328:
.stabn 0x44,0,345,L329-_ISR_isr
L329:
	JMP L276
L279:
.stabn 0xC0,0,2,L330-_ISR_isr
L330:
.stabn 0x44,0,346,L331-_ISR_isr
L331:
 .stabn 0x44,0,347,L332-_ISR_isr
L332:
	INCMS _sdata274
	NOP
.stabn 0xE0,0,2,L333-_ISR_isr
L333:
.stabn 0x44,0,348,L334-_ISR_isr
L334:
 .stabn 0xE0,0,1,L335-_ISR_isr
L335:
.stabn 0x44,0,349,L336-_ISR_isr
L336:
	JMP L276
L275:
.stabn 0xC0,0,1,L337-_ISR_isr
L337:
.stabn 0x44,0,351,L338-_ISR_isr
L338:
 .stabn 0x44,0,352,L339-_ISR_isr
L339:
	CLR _sdata273
.stabn 0x44,0,353,L340-_ISR_isr
L340:
	CLR _sdata274
.stabn 0x44,0,354,L341-_ISR_isr
L341:
	MOV A, #0x80
	OR _Lcd_flag1, A
.stabn 0xE0,0,1,L342-_ISR_isr
L342:
.stabn 0x44,0,355,L343-_ISR_isr
L343:
L276:
.stabn 0x44,0,358,L344-_ISR_isr
L344:
	B0MOV A, 0xD1
	XOR A, #0xFF
	AND A, #0x0e
	MOV _ISR_isr_data@0, A
.stabn 0x44,0,359,L345-_ISR_isr
L345:
	MOV A, _Button_flag
	AND A, #0x03
	MOV _ISR_isr_data@1, A
	SUB A, #0x01
	B0BTS0	134.0
	JMP	L284
	MOV A, _ISR_isr_data@1
	SUB A, #0x02
	B0BTS0	134.0
	JMP	L287
	MOV A, _ISR_isr_data@1
	SUB A, #0x03
	B0BTS0	134.0
	JMP	L296
	JMP L282
.stabn 0xC0,0,1,L346-_ISR_isr
L346:
.stabn 0x44,0,360,L347-_ISR_isr
L347:
L284:
.stabn 0xC0,0,2,L348-_ISR_isr
L348:
.stabn 0x44,0,362,L349-_ISR_isr
L349:
 .stabn 0x44,0,363,L350-_ISR_isr
L350:
	MOV A, _ISR_isr_data@0
	B0BTS0	134.0
	JMP	L282
.stabn 0x44,0,364,L351-_ISR_isr
L351:
	MOV A, #0x02
	MOV _Button_flag, A
.stabn 0xE0,0,2,L352-_ISR_isr
L352:
.stabn 0x44,0,365,L353-_ISR_isr
L353:
 .stabn 0x44,0,365,L354-_ISR_isr
L354:
	JMP L282
L287:
.stabn 0xC0,0,2,L355-_ISR_isr
L355:
.stabn 0x44,0,368,L356-_ISR_isr
L356:
 .stabn 0x44,0,369,L357-_ISR_isr
L357:
	MOV A, _ISR_isr_data@0
	CMPRS A, #0x00
	JMP L288
.stabn 0x44,0,370,L358-_ISR_isr
L358:
	MOV A, #0x01
	MOV _Button_flag, A
	JMP L282
L288:
.stabn 0xC0,0,3,L359-_ISR_isr
L359:
.stabn 0x44,0,372,L360-_ISR_isr
L360:
 .stabn 0x44,0,373,L361-_ISR_isr
L361:
	MOV A, _ISR_isr_data@0
	AND A, #0x04
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L290
.stabn 0x44,0,374,L362-_ISR_isr
L362:
	MOV A, #0x04
	OR _flag, A
L290:
.stabn 0x44,0,376,L363-_ISR_isr
L363:
	MOV A, _ISR_isr_data@0
	AND A, #0x08
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L292
.stabn 0x44,0,377,L364-_ISR_isr
L364:
	MOV A, #0x02
	OR _flag, A
L292:
.stabn 0x44,0,379,L365-_ISR_isr
L365:
	MOV A, _ISR_isr_data@0
	AND A, #0x02
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L294
.stabn 0x44,0,380,L366-_ISR_isr
L366:
	MOV A, #0x01
	OR _flag, A
L294:
.stabn 0x44,0,382,L367-_ISR_isr
L367:
	MOV A, #0x03
	MOV _Button_flag, A
.stabn 0xE0,0,3,L368-_ISR_isr
L368:
.stabn 0x44,0,383,L369-_ISR_isr
L369:
 .stabn 0xE0,0,2,L370-_ISR_isr
L370:
.stabn 0x44,0,384,L371-_ISR_isr
L371:
 .stabn 0x44,0,384,L372-_ISR_isr
L372:
	JMP L282
L296:
.stabn 0xC0,0,2,L373-_ISR_isr
L373:
.stabn 0x44,0,387,L374-_ISR_isr
L374:
 .stabn 0x44,0,388,L375-_ISR_isr
L375:
	MOV A, _ISR_isr_data@0
	CMPRS A, #0x00
	JMP L282
.stabn 0xC0,0,3,L376-_ISR_isr
L376:
.stabn 0x44,0,389,L377-_ISR_isr
L377:
 .stabn 0x44,0,390,L378-_ISR_isr
L378:
	MOV A, _flag
	AND A, #0x04
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L299
.stabn 0xC0,0,4,L379-_ISR_isr
L379:
.stabn 0x44,0,391,L380-_ISR_isr
L380:
 .stabn 0x44,0,392,L381-_ISR_isr
L381:
	MOV A, #0x20
	OR _flag, A
.stabn 0x44,0,393,L382-_ISR_isr
L382:
	MOV A, #0xfb
	AND _flag, A
.stabn 0xE0,0,4,L383-_ISR_isr
L383:
.stabn 0x44,0,394,L384-_ISR_isr
L384:
L299:
.stabn 0x44,0,395,L385-_ISR_isr
L385:
	MOV A, _flag
	AND A, #0x02
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L301
.stabn 0xC0,0,4,L386-_ISR_isr
L386:
.stabn 0x44,0,396,L387-_ISR_isr
L387:
 .stabn 0x44,0,397,L388-_ISR_isr
L388:
	MOV A, #0x10
	OR _flag, A
.stabn 0x44,0,398,L389-_ISR_isr
L389:
	MOV A, #0xfd
	AND _flag, A
.stabn 0xE0,0,4,L390-_ISR_isr
L390:
.stabn 0x44,0,399,L391-_ISR_isr
L391:
L301:
.stabn 0x44,0,400,L392-_ISR_isr
L392:
	MOV A, _flag
	AND A, #0x01
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L303
.stabn 0xC0,0,4,L393-_ISR_isr
L393:
.stabn 0x44,0,401,L394-_ISR_isr
L394:
 .stabn 0x44,0,402,L395-_ISR_isr
L395:
	MOV A, #0x08
	OR _flag, A
.stabn 0x44,0,403,L396-_ISR_isr
L396:
	MOV A, #0xfe
	AND _flag, A
.stabn 0xE0,0,4,L397-_ISR_isr
L397:
.stabn 0x44,0,404,L398-_ISR_isr
L398:
L303:
.stabn 0x44,0,405,L399-_ISR_isr
L399:
	MOV A, #0x01
	MOV _Button_flag, A
.stabn 0xE0,0,3,L400-_ISR_isr
L400:
.stabn 0x44,0,406,L401-_ISR_isr
L401:
 .stabn 0xE0,0,2,L402-_ISR_isr
L402:
.stabn 0x44,0,407,L403-_ISR_isr
L403:
 .stabn 0x44,0,408,L404-_ISR_isr
L404:
 .stabn 0xE0,0,1,L405-_ISR_isr
L405:
.stabn 0x44,0,409,L406-_ISR_isr
L406:
L282:
.stabn 0x44,0,410,L407-_ISR_isr
L407:
	B0BCLR 0xC8.4
.stabs "s_counter:V9",38,0,0,_sdata274
.stabs "ms_counter:V9",38,0,0,_sdata273
.stabn 0xE0,0,0,L408-_ISR_isr
L408:
.stabn 0x44,0,412,L409-_ISR_isr
L409:
L272:
	B0MOV A, _bufT
	B0MOV T, A
	B0MOV A, _bufI
	B0MOV I, A
	B0MOV A, _bufY
	B0MOV 132, A
	B0MOV A, _bufZ
	B0MOV 131, A
	B0MOV A, _bufR
	B0MOV 130, A
	POP
	RETI
.stabs "PwmOut:F13",36,0,0,_PwmOut
_Function_PwmOut_code SEGMENT CODE INBANK USING _Function_PwmOut_data
_PwmOut:
.stabn 0xC0,0,0,L426-_PwmOut
L426:
.stabn 0x44,0,415,L427-_PwmOut
L427:
 .stabn 0x44,0,416,L428-_PwmOut
L428:
	MOV A, _Lcd_flag1
	AND A, #0x80
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L411
.stabn 0xC0,0,1,L429-_PwmOut
L429:
.stabn 0x44,0,417,L430-_PwmOut
L430:
 .stabn 0x44,0,418,L431-_PwmOut
L431:
	MOV A, _Lcd_flag1
	AND A, #0x0f
	MOV _PwmOut_data@0, A
	ADD A, #0x80
	CMPRS A, #0x88
	B0BTS0 134.2
	JMP L484
	SUB A, #0x80
	B0BTS1 134.2
	JMP L484
	B0ADD 206, A
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
L416:
.stabn 0x44,0,420,L434-_PwmOut
L434:
	B0BCLR 0xDA.7
.stabn 0x44,0,421,L435-_PwmOut
L435:
	JMP L414
L417:
.stabn 0x44,0,422,L436-_PwmOut
L436:
	MOV A, #0x1e
	B0MOV 0xCD, A
.stabn 0x44,0,423,L437-_PwmOut
L437:
	JMP L414
L418:
.stabn 0x44,0,424,L438-_PwmOut
L438:
	MOV A, #0x3c
	B0MOV 0xCD, A
.stabn 0x44,0,425,L439-_PwmOut
L439:
	JMP L414
L419:
.stabn 0x44,0,426,L440-_PwmOut
L440:
	MOV A, #0x5a
	B0MOV 0xCD, A
.stabn 0x44,0,427,L441-_PwmOut
L441:
	JMP L414
L420:
.stabn 0x44,0,428,L442-_PwmOut
L442:
	MOV A, #0x78
	B0MOV 0xCD, A
.stabn 0x44,0,429,L443-_PwmOut
L443:
	JMP L414
L421:
.stabn 0x44,0,430,L444-_PwmOut
L444:
	MOV A, #0x96
	B0MOV 0xCD, A
.stabn 0x44,0,431,L445-_PwmOut
L445:
	JMP L414
L422:
.stabn 0x44,0,432,L446-_PwmOut
L446:
	MOV A, #0xb4
	B0MOV 0xCD, A
.stabn 0x44,0,433,L447-_PwmOut
L447:
	JMP L414
L423:
.stabn 0x44,0,434,L448-_PwmOut
L448:
	MOV A, #0xd2
	B0MOV 0xCD, A
.stabn 0x44,0,435,L449-_PwmOut
L449:
 .stabn 0x44,0,436,L450-_PwmOut
L450:
 .stabn 0xE0,0,2,L451-_PwmOut
L451:
.stabn 0x44,0,437,L452-_PwmOut
L452:
L414:
.stabn 0x44,0,438,L453-_PwmOut
L453:
	MOV A, _Lcd_flag2
	AND A, #0x40
	AND A, #0xFF
	B0BTS0	134.0
	JMP	L424
	MOV A, _Lcd_flag2
	AND A, #0x3f
	CMPRS A, #0x00
	JMP L424
.stabn 0x44,0,439,L454-_PwmOut
L454:
	B0BCLR 0xDA.7
L424:
.stabn 0x44,0,441,L455-_PwmOut
L455:
	MOV A, #0x7f
	AND _Lcd_flag1, A
.stabn 0xE0,0,1,L456-_PwmOut
L456:
.stabn 0x44,0,442,L457-_PwmOut
L457:
L411:
.stabn 0xE0,0,0,L458-_PwmOut
L458:
.stabn 0x44,0,443,L459-_PwmOut
L459:
L410:
	RET
.stabs "main:F1",36,0,0,_main
_Function_main_code SEGMENT CODE INBANK USING _Function_main_data
_main:
.stabn 0xC0,0,0,L464-_main
L464:
.stabn 0x44,0,447,L465-_main
L465:
 .stabn 0x44,0,448,L466-_main
L466:
	CALL _IoInit
.stabn 0x44,0,449,L467-_main
L467:
	CALL _IrqInit
L461:
.stabn 0xC0,0,1,L468-_main
L468:
.stabn 0x44,0,451,L469-_main
L469:
 .stabn 0x44,0,452,L470-_main
L470:
	MOV A, #0x5a
	B0MOV 0xCC, A
.stabn 0x44,0,453,L471-_main
L471:
	CALL _ButtonScan
.stabn 0x44,0,454,L472-_main
L472:
	CALL _RefleshBuf
.stabn 0x44,0,455,L473-_main
L473:
	CALL _LcdScan
.stabn 0x44,0,456,L474-_main
L474:
	CALL _PwmOut
.stabn 0xE0,0,1,L475-_main
L475:
.stabn 0x44,0,457,L476-_main
L476:
L462:
.stabn 0x44,0,450,L477-_main
L477:
	JMP L461
.stabn 0x44,0,458,L478-_main
L478:
	MOV A, #0x00
.stabn 0xE0,0,0,L479-_main
L479:
.stabn 0x44,0,460,L480-_main
L480:
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
