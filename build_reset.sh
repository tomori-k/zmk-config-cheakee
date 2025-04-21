mkdir -p build
cd /workspaces/zmk/app
west build -d build/reset -b seeeduino_xiao_ble -- -DSHIELD=settings_reset -DZMK_CONFIG="/workspaces/zmk-config/config" -DZMK_EXTRA_MODULES="/workspaces/zmk-config/zmk-pmw3610-driver"
cp /workspaces/zmk/app/build/reset/zephyr/zmk.uf2 /workspaces/zmk-config/build/reset.uf2
