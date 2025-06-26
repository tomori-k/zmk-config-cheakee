# ZMK Build Makefile for Cheakee keyboard

# Build directory paths
ZMK_APP_DIR = /workspaces/zmk/app
OUTPUT_DIR = /workspaces/zmk-config/build
LEFT_BUILD_DIR = $(ZMK_APP_DIR)/build/left
RIGHT_BUILD_DIR = $(ZMK_APP_DIR)/build/right

# ZMK configuration paths
ZMK_CONFIG = /workspaces/zmk-config/config
ZMK_EXTRA_MODULES = /workspaces/zmk-config/;/workspaces/zmk-config/zmk-pmw3610-driver

# Output UF2 files
LEFT_UF2 = $(OUTPUT_DIR)/left.uf2
RIGHT_UF2 = $(OUTPUT_DIR)/right.uf2

# ログを有効化
ifeq ($(DEBUG),1)
	EXTRA_FLAGS = -S zmk-usb-logging
endif

.PHONY: all left right clean

# Build both halves
all: left right

# Ensure build directory exists
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Build left half
left: $(OUTPUT_DIR)
	cd $(ZMK_APP_DIR) && \
	west build -d build/left -b seeeduino_xiao_ble $(EXTRA_FLAGS) -- \
		-DSHIELD=cheakee_left \
		-DZMK_CONFIG="$(ZMK_CONFIG)" \
		-DZMK_EXTRA_MODULES="$(ZMK_EXTRA_MODULES)"
	cp $(LEFT_BUILD_DIR)/zephyr/zmk.uf2 $(LEFT_UF2)
	@echo "Left half build complete: $(LEFT_UF2)"

# Build right half
right: $(OUTPUT_DIR)
	cd $(ZMK_APP_DIR) && \
	west build -d build/right -b seeeduino_xiao_ble $(EXTRA_FLAGS) -- \
		-DSHIELD=cheakee_right \
		-DZMK_CONFIG="$(ZMK_CONFIG)" \
		-DZMK_EXTRA_MODULES="$(ZMK_EXTRA_MODULES)"
	cp $(RIGHT_BUILD_DIR)/zephyr/zmk.uf2 $(RIGHT_UF2)
	@echo "Right half build complete: $(RIGHT_UF2)"

# Clean build artifacts
clean:
	rm -rf $(OUTPUT_DIR)
	rm -rf $(ZMK_APP_DIR)/build
	@echo "Build directories cleaned"