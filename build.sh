cd ../zmk/app
west build -d build/left -b seeeduino_xiao_ble -- -DSHIELD=cheakee_left -DZMK_CONFIG="/workspaces/zmk-config/config"
west build -d build/right -b seeeduino_xiao_ble -- -DSHIELD=cheakee_right -DZMK_CONFIG="/workspaces/zmk-config/config"

cp /workspaces/zmk/app/build/left/zephyr/zmk.uf2 build/left.uf2
cp /workspaces/zmk/app/build/right/zephyr/zmk.uf2 build/right.uf2
