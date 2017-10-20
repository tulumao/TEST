# SONIX DSP Makefile Version:1.0.0.2
# Defination
COMPILER = "d:\sonix\sn8_c_studio_v154(580.219)\bin\build\sn8pc.exe"
GMA = "D:\Sonix\SN8_C_Studio_V154(580.219)\Bin\Build\gma.exe"
LINKER = "D:\Sonix\SN8_C_Studio_V154(580.219)\Bin\Build\slink.exe"
CONVERT = "D:\Sonix\SN8_C_Studio_V154(580.219)\Bin\Build\RcvSN8.exe"

# Define Path Macro
PRJ_PATH=.
OBJ_PATH=.\Obj
INC_PATH=.\Include
LIB_PATH=.\Lib
C_INC_PATH=D:\Sonix\SN8_C_Studio_V154(580.219)\C\include
OUT_PATH=.\Bin
VPATH=.\:$(OBJ_PATH):$(LIB_PATH):$(INC_PATH):$(C_INC_PATH):$(OUT_PATH)

# Define Option Flags
COMPILER_FLAGS = -target=SN8P2501B -INI="D:\Sonix\SN8_C_Studio_V154(580.219)\Bin\Build\SN8P2600.ini" -PROJECTNAME=".\MyBelt.prj" -WL=3 -Chip_Series=2 -A -g -I.\Include -ID:\Sonix\SN8_C_Studio_V154(580.219)\C\include -NoCALLHL -NoMUL -NoHL -NoX -PUSH2 -NoGlobalOpt -tempdir="$(OBJ_PATH)"  -cpp_skip_asm -DICE_Mode=0
GMA_FLAGS = /INI:"SN8P2600.ini" /ID1:0 /ID2:0  /MACHINE:SN8P2501B  /Chip_Series:2 /NOPeephole: /PATH:".\Include" /PROJECTNAME:".\MyBelt.prj" /WL:3 /DEFINE:ICE_Mode=0 /DEFINE:SN8P2501B=1  /OutputPath:"$(OBJ_PATH)" 
LINK_FLAGS = /MACHINE:SN8P2501B /Chip_Series:2 /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/MyBelt.out"  /MAP:"$(OBJ_PATH)\MyBelt.map"   /LISTFILE:  /STDLIB:".\Obj"    /PATH:"$(LIB_PATH)" /STACK: /PROJECTNAME:".\MyBelt.prj"
CONV_FLAGS = /MACHINE:SN8P2501B /INI:"SN8P2600.ini" /WL:3 /OutputFile:"$(OUT_PATH)/MyBelt.sn8"  /PROJECTNAME:".\MyBelt.prj" /IDSVersion:V154(580.219) /Chip_Series:2 /OSLIB:".\Obj"  
LINK_DEP_FILES = $(OBJ_PATH)\my_belt.o   \

# Define Rule
$(OBJ_PATH)\my_belt.asm: .\Src\my_belt.c $(C_INC_PATH)\SN8P2501B.h $(PRJ_PATH)\MyBelt.cfg
	@$(COMPILER) $(COMPILER_FLAGS) -o $@ $^ 

$(OBJ_PATH)\my_belt.o: $(OBJ_PATH)\my_belt.asm $(PRJ_PATH)\MyBelt.cfg
	@$(GMA) $(GMA_FLAGS) /CSource: /CASE: $< 

$(OUT_PATH)\MyBelt.out: $(LINK_DEP_FILES) $(PRJ_PATH)\MyBelt.cop
	@$(LINKER) $(LINK_FLAGS) /CSource: /CASE: $(LINK_DEP_FILES) 

$(OUT_PATH)\MyBelt.sn8: $(OUT_PATH)\MyBelt.out $(PRJ_PATH)\MyBelt.cop
	@$(CONVERT) $(CONV_FLAGS) $^ 


# Define Clean Rule
Clean:
	@del /F /Q $(OBJ_PATH)\*.*;
	@if EXIST .\MyBelt.prj.stb del .\MyBelt.prj.stb;
	@if EXIST .\MyBelt.out del .\MyBelt.out;
	@if EXIST .\MyBelt.sn8 del .\MyBelt.sn8;
	@if EXIST .\MyBelt.sn8.dep del .\MyBelt.sn8.dep;
	@if EXIST $(OUT_PATH)\MyBelt.out del $(OUT_PATH)\MyBelt.out;
	@if EXIST $(OUT_PATH)\MyBelt.sn8 del $(OUT_PATH)\MyBelt.sn8;
	@if EXIST $(OUT_PATH)\MyBelt.sn8.dep del $(OUT_PATH)\MyBelt.sn8.dep;

# Don't keep invalid files, command line must return non-zero(1 or 2) value 
# to validate delete on error mechanism 
# else return 0 for success

.DELETE_ON_ERROR:

Begin: 

Build: Begin All 

Rebuild: Clean Build 

All:$(OUT_PATH)\MyBelt.out $(OUT_PATH)\MyBelt.sn8
