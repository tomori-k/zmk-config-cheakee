west build -d build/reset -b seeeduino_xiao_ble -- -DSHIELD=settings_reset -DZMK_CONFIG="/workspaces/zmk-config/config"
cp /workspaces/zmk/app/build/reset/zephyr/zmk.uf2 build/reset.uf2
