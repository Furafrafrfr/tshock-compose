# TShock Docker Compose
Terrariaの鯖作るdocker composeとか

## 使い方
### 1. 設定
設定を記述する。`.env`, `config.json`が必要。`.secrets.env`は任意

#### `.env`
中で定義されている変数のみ利用可能。[https://ikebukuro.tshock.co/#/command-line-parameters](https://ikebukuro.tshock.co/#/command-line-parameters)となんとなく対応していたりするので参照。

#### `.secrets.env`

外に漏らしたくない環境変数を定義。

```
PASSWORD=password
```

#### `config.json`

[https://ikebukuro.tshock.co/#/config-file-descriptions](https://ikebukuro.tshock.co/#/config-file-descriptions)と同じ。

### 2. 起動

`docker compose`を直接使うか[task](https://taskfile.dev/)を使う。

#### シェル

```bash
docker compose up
```

#### task

```bash
task start
```

### 3. 初回設定など

ここまでで[TShockの初回設定](https://ikebukuro.tshock.co/#/?id=installing-tshock)の3まで終わった。４からはドキュメントの通りに進める。
