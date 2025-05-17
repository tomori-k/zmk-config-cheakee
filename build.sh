mkdir -p build
cd /workspaces/zmk/app
west build -d build/left -b seeeduino_xiao_ble -- -DSHIELD=cheakee_left -DZMK_CONFIG="/workspaces/zmk-config/config" -DZMK_EXTRA_MODULES="/workspaces/zmk-config/;/workspaces/zmk-config/zmk-pmw3610-driver"
west build -d build/right -b seeeduino_xiao_ble -- -DSHIELD=cheakee_right -DZMK_CONFIG="/workspaces/zmk-config/config" -DZMK_EXTRA_MODULES="/workspaces/zmk-config;/workspaces/zmk-config/zmk-pmw3610-driver"

cp /workspaces/zmk/app/build/left/zephyr/zmk.uf2 /workspaces/zmk-config/build/left.uf2
cp /workspaces/zmk/app/build/right/zephyr/zmk.uf2 /workspaces/zmk-config/build/right.uf2
