# zmk-config-cheakee

## ファームウェアのローカルでのビルド

### 初回設定

1. プロジェクト管理用ディレクトリに移動
1. `git clone https://github.com/zmkfirmware/zmk.git`
1. `cd zmk`
1. `git checkout v0.2.1`
1. Docker ボリュームの作成
    - `docker volume create --driver local -o o=bind -o type=none -o device="このリポジトリのローカル環境でのディレクトリへの絶対パス" zmk-config`
    - プロジェクト管理用ディレクトリに `zmk-modules` というディレクトリを作成し、 `docker volume create --driver local -o o=bind -o type=none -o device="zmk-modulesへの絶対パス" zmk-modules`
1. VS Code で "Reopen in Container"
1. west のセットアップ
    ```
    west init -l app/ # Initialization
    west update       # Update modules
    ```

### ビルド

1. clone した zmk リポジトリを開発コンテナで開く
1. zmk-config のフォルダを VS Code で開く
    ```
    cd /workspaces/zmk-config
    code .
    ```

    これでコンテナ上で zmk-config-cheakee が開かれる
1. この開発コンテナ上で `./build.sh` を実行