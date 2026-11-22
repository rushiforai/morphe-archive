# X 投稿文

紹介動画（`out/` に書き出したもの）に添える X の投稿文です。文字数は X の数え方（全角 2、半角 1、URL は 23、上限 280）で数えています。改行を保つため、本文はコードブロックに入れています。

## ① 基本版に添える

- 添える動画: `linimal-x.mp4`（4:5）または `linimal-x-wide.mp4`（16:9）
- 文字数: 259 / 280

```text
LINE の広告と AI のアイコン、消せるようにしました。

・トーク一覧とホームの広告
・Agent i / LINE AI の入口
・既読をつけずに読む

ぜんぶ LINE の設定から個別に ON / OFF。OFF なら公式と同じ動きです。

Android 版 LINE 向けパッチ「Linimal」
https://github.com/uta-a/linimal
```

## ② チャット仕立て版に添える

- 添える動画: `linimal-v-chat.mp4`
- 文字数: 209 / 280

```text
「既読つけずに読みたいとき、ない？」

あるので作りました。長押しメニューや通知から、既読をつけずにトークを開けます。読み終えたら、まとめて既読に。

Android 版 LINE 向けパッチ「Linimal」
https://github.com/uta-a/linimal
```

## ③ Before / After 連打版に添える

- 添える動画: `linimal-v-split.mp4`
- 文字数: 197 / 280

```text
左が公式の LINE、右が Linimal。

検索欄の Agent i、使わない下部タブ、ホームのおすすめ。消したいものだけ、設定から個別に消せます。

Android 版 LINE 向けの Morphe パッチです。
https://github.com/uta-a/linimal
```

## ④ ターミナル版に添える

- 添える動画: `linimal-v-terminal.mp4`
- 文字数: 221 / 280

```text
公式 LINE（Android）向けの Morphe パッチバンドルを作っています。

・パッチは文字列や命令の並びで対象を特定
・特定できない機能は自動で無効化
・設定 OFF なら公式と同じ動作

GPL-3.0 で提供しています。
https://github.com/uta-a/linimal
```

## ⑤ 既読の機能を前面に出す別案

- 添える動画: どの動画にも合う
- 文字数: 217 / 280

```text
既読をつけずに読んで、読み終えたら「すべて既読にする」でまとめて既読に。

Android 版 LINE 向けのパッチ「Linimal」で、広告や Agent i の表示を消したり、グループで誰が読んだかを見たりもできます。

https://github.com/uta-a/linimal
```

## 返信: 補足

- 添える動画: 本文への返信としてぶら下げる
- 文字数: 265 / 280

```text
補足
・対象は LINE 26.16.0（arm64-v8a）のみ
・Morphe で APKM にパッチを当てて使います
・LINE・Morphe の公式プロジェクトではありません
・署名が変わるため、公式版からはバックアップして入れ直しが必要です
・動画内の名前とトークは架空です

導入手順は README にあります。
```

## 返信: 導入リンク

- 添える動画: 補足の後に続ける
- 文字数: 126 / 280

```text
このリンクは Android 端末で開いてください。Morphe Manager なら、Linimal をパッチソースに追加できます。
https://morphe.software/add-source?github=uta-a/linimal
```

## 投稿するときの注意

- ハッシュタグは付けていません。`#LINE` を付けると、公式の LINE と誤解されやすくなります。付けるなら `#Android` 程度にとどめます。
- 「送信しても既読を有効にしない」と、Google に署名を公式版と申告する機能は、README に利用規約上の警告があるので、投稿文では紹介していません。質問が来たら README の警告を案内します。
- 本文を書き換えたら、文字数が 280 を超えていないか確かめます。
