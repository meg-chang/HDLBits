# Icarus Verilog 仿真 Makefile
# 用法: make        编译
#      make run    编译并仿真
#      make clean  清理

IV  := D:/Program/Icarus/bin/iverilog.exe
VVP := D:/Program/Icarus/bin/vvp.exe

# 自动收集 rtl 目录下所有 .v 源文件(含子模块)
SRC := $(wildcard Modules/Modules/rtl/*.v)
TOP := top_module
OUT := sim/$(TOP).vvp

.PHONY: all run clean

all: $(OUT)

$(OUT): $(SRC)
	mkdir -p sim
	$(IV) -g2012 -o $(OUT) -s $(TOP) $(SRC)

run: $(OUT)
	$(VVP) $(OUT)

clean:
	rm -f $(OUT)
