SSD=QR
TARGET=QR.bbc
BUILD=./build

all::	$(BUILD)/$(TARGET)

X:=$(shell mkdir -p $(BUILD))

$(BUILD)/%.bbc.inf: $(BUILD)/%.bbc
$(BUILD)/%.bbc:	%.bas
	basictool -2 -t $< $@
	echo "$$.$(basename $<) FFFF0E00 FFFF8023" > $@.inf

ssd::	all	
	dfs form -80 $(BUILD)/$(SSD).ssd
	dfs title $(BUILD)/$(SSD).ssd "QRGEN"
	dfs add $(BUILD)/$(SSD).ssd $(BUILD)/*.inf

clean::
	-rm $(BUILD)/$(TARGET)
	-rm $(BUILD)/$(TARGET).*
	-rm $(BUILD)/$(SSD).ssd