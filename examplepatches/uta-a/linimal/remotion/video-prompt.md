# 紹介動画を作らせるプロンプト

Claude Code などのコーディングエージェントに、Remotion で Linimal の紹介動画を作らせるときのプロンプトです。下の「プロンプト本文」をそのまま渡します。`{ }` の部分は作りたい動画に合わせて書き換えます。

| 変数 | 書くこと | 例 |
| --- | --- | --- |
| `{composition}` | composition の ID | `LinimalVQuiz` |
| `{ファイル}` | 実装するファイル | `src/variants/Quiz.tsx` |
| `{サイズ}` | 幅×高さ | `1920×1080`（16:9）、`1080×1350`（4:5）、`1080×1920`（9:16） |
| `{尺}` | 長さ | `20〜28 秒` |
| `{方向性}` | 見た目と構成の方針、見せ場 | 下の「方向性の例」から選ぶか、自分で書く |
| `{読み手}` | 誰に見せるか | `LINE の一般ユーザー`、`Android の改造に関心のある開発者` |

---

## プロンプト本文

````text
Remotion で Linimal の紹介動画を 1 本実装し、MP4 を書き出してください。コードを書くタスクです。

## 作るもの
- composition: {composition}（{サイズ}、30fps、{尺}、音声なし）
- 実装するファイル: remotion/{ファイル}。React.FC のコンポーネントと、フレーム数の定数を export する。
- composition の登録は remotion/src/Root.tsx に、import の行と Composition の行を足すだけにする（既存の行は変えない）。
- 読み手: {読み手}
- 方向性: {方向性}
- 出力: remotion/out/ に、composition 名に合わせた名前の MP4（H.264、yuv420p）

## プロジェクトの把握
作業ディレクトリは /Users/uta_a/Projects/linimal/remotion（Remotion 4、React 19、TypeScript）。Linimal は、公式 LINE の Android 版向けの Morphe パッチバンドル。次を読んでから始める。
- ../README.md: 機能と、紹介してよい事実の出典
- README.md（remotion/）: 既存の composition と素材の一覧、素材の加工の経緯
- src/shared/screens.tsx: 実機の画面（1220×2712 の座標）を動かす部品。ScreenBox、Layer、Touch、MARKS（Before 画面で消える箇所の座標）、ScrollPreviewScreen、OpenWithoutReceiptScreen、MarkAllReadScreen、NotificationScreen、SettingsScrollScreen、SpeedContext（操作の再生速度）
- src/x/parts.tsx: 文字を叩きつけて出す Slam、入れ替わる見出しの Captions、実画面を跳ねさせて出す Shot（cropTop で上端を切り落とせる）、AlertMarks、Wipe、Progress、Switch、useSpring
- src/x/Wide.tsx: 既存の 16:9 版。構成の参考にする（同じものは作らない）

ほかのファイルは変えない。別の作業が同じディレクトリで同時に進んでいることがある。

## 素材
public/ 以下を staticFile で読む。
- 使ってよい: screenshots/line-*.png（Before / After の組は line-talk-list-before ↔ line-talk-list、line-home-before ↔ line-home、line-settings-top-before ↔ line-settings-top。同じモックデータで描いてあり、重ねて切り替えられる）、screenshots/chat/ の名前が -mock で終わるもの、talk-list-unread-kept.png、talk-list-after-mark-all-read.png、chat-mock-messages-tall*.png、part-*.png、screenshots/readers/*-anonymized.png、brand/icon.svg
- 使わない: screenshots/chat/ の名前が -mock で終わらない実画面と recordings/ の動画（テスト配信の中身が写っている）。.gitignore に挙がっているファイル。

## 内容の決まり
- 紹介してよいのは ../README.md にある事実だけ。数字や実績を作らない（README にある数字の例: Agent i・LINE AI の入口は 9 か所、設定は 7 ページ、下部タブは 5 → 2）。
- 次の 2 つは紹介しない。「送信しても既読を有効にしない」と、Google に署名を公式版と申告する機能（通知、Google ログイン・バックアップ）。README に利用規約上の警告がある。
- 公式 LINE の挙動を描くときは誇張しない。既読は読んだ側ではなく相手側の画面に表示されるので、読む側の画面に「既読」の印を押すような演出はしない。
- 消えた要素を見せるときは、何がなくなったかがわかる範囲で見せる。切り抜いた After が空の箱になると、壊れて見える。
- 最後に必ず入れる: Linimal の文字のワードマーク、github.com/uta-a/linimal、注記「LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。画面の名前とトークは架空です。」

## 見た目の決まり
- 端末の枠（スマホのフレーム）、偽のウィンドウ枠（信号機の 3 点など）、偽のアプリ画面の枠は描かない。実画面は角丸と細い線だけで見せる。
- 発光（glow、光る box-shadow）、グラデーション、イタリックの見出しは使わない。
- LINE の公式の緑（#06C755 など）、LINE のロゴ、LINE の UI をまねた部品は使わない。
- 色はファイル先頭の定数オブジェクトにまとめ、そこから参照する。フォントは 'Hiragino Sans'（W0〜W9）と Menlo。
- 文言は日本語。音声なしで自動再生されても、文字だけで内容が伝わるようにする。

## 動きの決まり
- モーショングラフィックとしてテンポよく。文字の叩きつけ、spring の跳ね、画面へのズームやパン、走査線や分割線での切り替え、場面転換の演出を使う。
- 0 フレーム目で、見出しなどが出そろっていること。X では先頭フレームがサムネイルになる。出現の演出は delay を負にして 0 フレーム目で着地させるか、着地済みの文字に小さな揺れを足す形にする。
- 入れ替わる見出しは、前のものが消えてから次を出す。同じ位置で新旧が重なると読めない。
- 文字やカードを、打ち込んだコマンド、実画面の要点、ほかの文字に重ねない。カードが出てくる途中で文字が枠の外にはみ出さないようにする（overflow: hidden か、同じ transform で動かす）。
- 実画面の上端のステータスバー（時刻、VPN、電波、Wi-Fi、電池）は Shot の cropTop={120} で切り落とす。切り落とした分、画面の座標に合わせて置くラベルの y もずらす（y = 画面の top + (実機の y - 120) × 縮尺）。
- バナーなどに寄るズームは 1.2〜1.3 倍までにする。それ以上だと左右の文字が切れる。
- 操作の演出（Touch、*Screen）は SpeedContext で 1.2〜1.5 倍に速めてよい。

## 確認と書き出し
1. npx tsc --noEmit -p . が通ること。
2. 場面ごとに静止画を書き出して目で確認する。
   npx remotion still {composition} out/_chk<frame>.png --frame=<n> --scale=0.4 --log=error
   見る点: 文字のはみ出し、重なり、切れ。0 フレーム目。見出しの入れ替わりの途中。ズームした瞬間。Before / After の位置ずれ。ラベルと画面の要素の位置。
   画像の読み込みツールが新しいファイルで ENOENT を返すことがある。そのときはもう一度読む。
3. 書き出す。
   npx remotion render {composition} out/<名前>.mp4 --codec=h264 --crf=18 --pixel-format=yuv420p --log=error
4. 書き出した MP4 からもフレームを抜き出して確認する（ffmpeg -ss <秒> -i <MP4> -frames:v 1 ...）。
5. 確認用の一時画像（out/_chk*.png など）を消す。
6. remotion/README.md の該当する節に、composition、出力、方向性、長さを 1 行足す。package.json に render 用の script を足す。

## 報告
場面構成（秒数つき）、使った素材、気になる点を 200 字程度で。演出で事実と違う見せ方をした箇所（ログの体裁など）があれば、それも書く。
````

---

## 方向性の例

今回作った動画の方向性です。`{方向性}` に貼って使えます。同じものを作り直すのではなく、別の題材や尺で作るときの出発点にします。

**基本版（LinimalX / LinimalXWide）**
```text
暗い背景にミントの差し色と太いゴシック。つかみ（「その LINE、ごちゃごちゃしてない？」）→ トーク一覧の Before / After（消える箇所を赤枠、ミントの走査線で切り替え、下部タブ 5→2）→ ホームのスライダー比較 → 章タイトル「既読、つけずに読める。」→ 既読の実演 → 既読者 → 設定のスイッチが順に ON → エンディング。場面転換はミントの面が斜めに横切る演出で統一し、画面下に進行バーを出す。
```

**ターミナル版（LinimalVTerminal）**
```text
開発者向け。黒地に等幅、画面全体を端末に見立てる。README の実際のコマンド（java -jar morphe-desktop-*-all.jar patch ...）を打ち込み、../patches-list.json の実在のパッチ名でログを流す（名前を作らない。ログの体裁は演出でよい）。そのあと diff の形で Before / After、既読の実演に関係するパッチ名を添え、設計方針 2 つ（設定 OFF なら公式と同じ動作、特定できない機能は自動で無効化）で締める。
```

**チャット仕立て版（LinimalVChat）**
```text
明るい紙色の背景。紹介そのものを、架空の 2 人（A と B）のチャットの会話で進める。吹き出しは独自の形で、spring で跳ねて積み上がる。共感から入り（「広告とか AI のアイコン、多くない？」）、実画面は写真が送られてきた形で差し込む。見せ場は、A の送った 3 通に既読がつかない → B が「すべて既読にする」を押すとまとめて既読がつく、の流れ。
```

**Before / After 連打版（LinimalVSplit）**
```text
画面を左右に分け、左が公式の LINE（暗く、赤の印）、右が Linimal（明るく、ミントの印）。15〜20 フレームの拍で題材を切り替える（上部のアイコン、検索欄の Agent i、下部タブ、ホームの Agent i、おすすめ・投稿カード、設定の Agent i、既読）。左は消える要素に赤い ✕ を叩き込み、右は該当箇所が縮んで消える。最後は右が全面に広がり、README の事実（9 か所、7 ページ、個別に ON / OFF、OFF なら公式と同じ動作）を積み上げる。
```

ほかの方向性の案:
- **クイズ形式**: 「LINE のこの画面、何が消えたでしょう？」と出して 2 秒待ち、答えの部分を赤枠で示す。短い問いを 3〜4 問重ねる。
- **1 機能だけの 10 秒版**: 既読をつけずに読む、だけに絞る。長押し → 開く → 「相手には、未読のまま。」→ URL。リプライや引用に貼る用。
- **縦長 9:16 版**: 実画面を縦いっぱいに大きく置き、文字は上下の帯に置く。ストーリーズやショート動画向け。
