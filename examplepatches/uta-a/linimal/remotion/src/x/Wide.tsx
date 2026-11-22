// X 向け短尺版の 16:9（1920×1080）。場面・尺・演出は 4:5 版（Video.tsx）と同じで、
// 横長に合わせて「左に文字、右に実画面」の配置にしている。音声なし。
import React from 'react';
import {AbsoluteFill, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame} from 'remotion';
import {
  Layer, MARKS, MarkAllReadScreen, Mark, OpenWithoutReceiptScreen, ScrollPreviewScreen, SH, SW, SpeedContext, widthFor,
} from '../shared/screens';
import {X} from './tokens';
import {
  AlertMarks, Bg, Captions, LEN, Progress, SCENES, START, SceneId, Shot, Slam, Switch, Wipe, clamp, expoOut, useSpring,
} from './parts';

const L = 140; // 文字の列の左端
const SCREEN_H = 960;
// 実画面の上端（ステータスバー: 時刻・VPN・電波・Wi-Fi・電池）を実機座標でこの分だけ切り落とす
const CROP_TOP = 120;
const SCREEN_LEFT = 1200;
const SCREEN_RIGHT = SCREEN_LEFT + widthFor(SCREEN_H);
const K = SCREEN_H / SH;
const VIS_H = SCREEN_H - CROP_TOP * K; // 見えている高さ
const SCREEN_TOP = (1080 - VIS_H) / 2;

const Hook: React.FC = () => {
  const f = useCurrentFrame();
  const shake = f >= 22 && f < 46 ? Math.sin(f * 2.7) * 16 * interpolate(f, [22, 46], [1, 0]) : 0;
  const push = interpolate(f, [40, 60], [1, 1.12], {...clamp, easing: Easing.in(Easing.cubic)});
  return (
    <Bg>
      <div style={{position: 'absolute', left: L, top: 230, transform: `scale(${push})`, transformOrigin: '0% 50%'}}>
        <Slam text="その LINE、" at={-3} size={110} />
        <div style={{transform: `translateX(${shake}px)`, marginTop: 20}}>
          <Slam text="ごちゃごちゃ" at={8} per={2} size={210} color={X.alert} />
        </div>
        <Slam text="してない？" at={24} size={170} style={{marginTop: 8}} />
      </div>
    </Bg>
  );
};

const Talk: React.FC = () => {
  const f = useCurrentFrame();
  const p = interpolate(f, [70, 100], [0, 100], {...clamp, easing: Easing.inOut(Easing.cubic)});
  const scanY = (p / 100) * SH;
  const gone = (m: Mark) => interpolate(scanY, [m[1] - 60, m[1] + 20], [0, 1], clamp);
  const labels: [string, Mark][] = [
    ['上部のアイコン', MARKS.talkBefore[0]],
    ['検索欄の Agent i', MARKS.talkBefore[1]],
    ['使わないタブ', MARKS.talkBefore[2]],
  ];
  const labelX = SCREEN_RIGHT + 30;
  const tab = Math.round(interpolate(f, [100, 116], [5, 2], clamp));
  const tabIn = useSpring(100);
  return (
    <Bg>
      <Captions left={L} width={1040} top={250} size={130} smallSize={52} items={[
        {at: 4, small: '公式の LINE', big: 'アイコンだらけ。'},
        {at: 96, small: 'Linimal なら', big: 'すっきり。', color: X.accent},
      ]} />
      <Shot h={SCREEN_H} top={SCREEN_TOP} left={SCREEN_LEFT} cropTop={CROP_TOP}>
        <Layer src="screenshots/line-talk-list-before.png" />
        <Layer src="screenshots/line-talk-list.png" style={{clipPath: `inset(0 0 ${100 - p}% 0)`}} />
        <AlertMarks marks={MARKS.talkBefore} at={16} gone={gone} />
        {p > 0 && p < 100 ? <div style={{position: 'absolute', left: 0, right: 0, top: scanY - 10, height: 20, background: X.accent}} /> : null}
      </Shot>
      {labels.map(([text, m], i) => {
        const y = SCREEN_TOP + ((m[1] + m[3]) / 2 - CROP_TOP) * K;
        const x0 = SCREEN_LEFT + m[2] * K;
        const o = interpolate(f, [20 + i * 7, 26 + i * 7], [0, 1], clamp) * (1 - gone(m));
        return (
          <div key={text} style={{position: 'absolute', left: x0, top: y - 20, display: 'flex', alignItems: 'center', opacity: o}}>
            <div style={{width: labelX - x0 - 10, height: 4, background: X.alert}} />
            <div style={{marginLeft: 10, fontSize: 26, fontWeight: 800, color: X.alert, lineHeight: '40px', whiteSpace: 'nowrap'}}>{text}</div>
          </div>
        );
      })}
      <div style={{position: 'absolute', left: L, top: 620, opacity: Math.min(1, tabIn * 2), transform: `scale(${0.6 + tabIn * 0.4})`, transformOrigin: '0% 50%'}}>
        <div style={{fontSize: 44, fontWeight: 700, color: X.ink2}}>下部タブ</div>
        <div style={{fontSize: 200, fontWeight: 800, color: X.accent, lineHeight: 1, letterSpacing: '-0.04em'}}>5→{tab}</div>
      </div>
    </Bg>
  );
};

const Home: React.FC = () => {
  const f = useCurrentFrame();
  const d = interpolate(f, [8, 36, 60, 84, 104], [100, 6, 72, 28, 50], {...clamp, easing: Easing.inOut(Easing.cubic)});
  const hx = (d / 100) * SW;
  const tagO = interpolate(f, [6, 14], [0, 1], clamp);
  return (
    <Bg>
      <Captions left={L} width={1040} top={300} size={124} smallSize={52} items={[{at: 2, small: 'ホームも', big: 'おすすめも、\nAgent i も。'}]} />
      <Shot h={SCREEN_H} top={SCREEN_TOP} left={SCREEN_LEFT} cropTop={CROP_TOP}>
        <Layer src="screenshots/line-home.png" />
        <div style={{position: 'absolute', inset: 0, clipPath: `inset(0 ${100 - d}% 0 0)`}}>
          <Layer src="screenshots/line-home-before.png" />
          <AlertMarks marks={MARKS.homeBefore} at={4} step={4} />
        </div>
        <div style={{position: 'absolute', top: 0, bottom: 0, left: hx - 8, width: 16, background: X.accent}} />
        <div style={{position: 'absolute', left: hx - 80, top: SH / 2 - 80, width: 160, height: 160, borderRadius: 80, background: X.accent, color: X.accentInk, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 84, fontWeight: 800, letterSpacing: '0.1em'}}>
          ‹›
        </div>
      </Shot>
      <div style={{position: 'absolute', right: 1920 - SCREEN_LEFT + 30, top: SCREEN_TOP + VIS_H - 50, fontFamily: X.fontMono, fontSize: 32, color: X.alert, opacity: tagO}}>Before</div>
      <div style={{position: 'absolute', left: SCREEN_RIGHT + 30, top: SCREEN_TOP + VIS_H - 50, fontFamily: X.fontMono, fontSize: 32, color: X.accent, opacity: tagO}}>After</div>
    </Bg>
  );
};

const ReadTitle: React.FC = () => {
  const subO = interpolate(useCurrentFrame(), [24, 32], [0, 1], clamp);
  return (
    <Bg color={X.accent}>
      <div style={{position: 'absolute', left: L, top: 230}}>
        <Slam text="既読、" at={2} size={210} color={X.accentInk} />
        <Slam text="つけずに読める。" at={10} size={210} color={X.accentInk} />
        <div style={{marginTop: 40, fontSize: 56, fontWeight: 700, color: X.accentInk, opacity: subO}}>長押しメニューから。通知からも。</div>
      </div>
    </Bg>
  );
};

const Demo: React.FC = () => {
  const f = useCurrentFrame();
  const zoom = interpolate(f, [100, 118], [1, 1.22], {...clamp, easing: expoOut});
  const punch = interpolate(f, [130, 142], [1.12, 1], {...clamp, easing: expoOut});
  return (
    <Bg>
      <Captions left={L} width={1020} top={360} size={96} items={[
        {at: 0, big: 'トークを長押しして'},
        {at: 50, big: '「既読をつけずに読む」'},
        {at: 98, big: '相手には、\n未読のまま。', color: X.accent},
        {at: 132, big: '読み終えたら、\nまとめて既読。'},
      ]} />
      <Shot h={SCREEN_H} top={SCREEN_TOP} left={SCREEN_LEFT} cropTop={CROP_TOP}>
        <Sequence durationInFrames={52} layout="none">
          <SpeedContext.Provider value={1.4}><ScrollPreviewScreen ring={X.accent} /></SpeedContext.Provider>
        </Sequence>
        <Sequence from={52} durationInFrames={78} layout="none">
          <div style={{position: 'absolute', inset: 0, transform: `scale(${zoom})`, transformOrigin: '610px 420px'}}>
            <SpeedContext.Provider value={1.2}><OpenWithoutReceiptScreen ring={X.accent} /></SpeedContext.Provider>
          </div>
        </Sequence>
        <Sequence from={130} layout="none">
          <div style={{position: 'absolute', inset: 0, transform: `scale(${punch})`, transformOrigin: '50% 85%'}}>
            <SpeedContext.Provider value={1.2}><MarkAllReadScreen ring={X.accent} font={X.fontSans} /></SpeedContext.Provider>
          </div>
        </Sequence>
      </Shot>
    </Bg>
  );
};

// 既読者。左にトーク、右に一覧。画像座標は chat-anonymized.png（1220×500）
const CHAT_W = 1000;
const CK = CHAT_W / 1220;
const Readers: React.FC = () => {
  const f = useCurrentFrame();
  const chatIn = useSpring(6, {damping: 16, stiffness: 150, mass: 0.8});
  const dialog = useSpring(72, {damping: 17, stiffness: 130, mass: 0.9});
  const rings: [number, number, number, number][] = [[406, 86, 574, 150], [738, 318, 906, 382]];
  const tap = f - 56;
  return (
    <Bg>
      <div style={{position: 'absolute', left: L, top: 70}}>
        <Slam text="グループで、" at={0} size={120} />
        <Slam text="誰が読んだか。" at={6} size={120} color={X.accent} />
      </div>
      <Captions left={L} width={1040} top={420} size={48} items={[
        {at: 20, big: '既読の横に、読んだ人のアイコン'},
        {at: 74, big: 'タップで、既読・未読の一覧'},
      ]} />
      <div style={{position: 'absolute', left: L, top: 530, width: CHAT_W, transform: `translateX(${(1 - chatIn) * -1300}px)`}}>
        <Img src={staticFile('screenshots/readers/chat-anonymized.png')} style={{display: 'block', width: CHAT_W, borderRadius: 20}} />
        {rings.map((r, i) => {
          const s = spring({frame: f - 26 - i * 8, fps: 30, config: {damping: 10, stiffness: 220, mass: 0.6}});
          return (
            <div key={i} style={{
              position: 'absolute', left: r[0] * CK, top: r[1] * CK, width: (r[2] - r[0]) * CK, height: (r[3] - r[1]) * CK,
              border: `5px solid ${X.accent}`, borderRadius: 40, opacity: Math.min(1, s * 2), transform: `scale(${1.6 - s * 0.6})`,
            }} />
          );
        })}
        {tap >= -4 && tap < 18 ? (
          <div style={{
            position: 'absolute', left: 940 * CK - 44, top: 343 * CK - 44, width: 88, height: 88, borderRadius: 44,
            background: 'rgba(255,255,255,0.25)', border: '4px solid rgba(255,255,255,0.8)',
            opacity: interpolate(tap, [-4, 0, 10, 18], [0, 1, 1, 0], clamp),
          }} />
        ) : null}
      </div>
      <div style={{position: 'absolute', left: 1290, top: 140, width: 500, transform: `translateY(${(1 - dialog) * 1000}px)`}}>
        <Img src={staticFile('screenshots/readers/dialog-anonymized.png')} style={{display: 'block', width: 500, outline: `2px solid ${X.rule}`, borderRadius: 16}} />
      </div>
    </Bg>
  );
};

const SWITCHES = ['広告を表示しない', 'Agent i を表示しない', 'ダークモードを真っ黒に', 'リンクを外部ブラウザで', 'Premium の案内を消す'];
const Switches: React.FC = () => {
  const f = useCurrentFrame();
  const noteO = interpolate(f, [60, 70], [0, 1], clamp);
  return (
    <Bg>
      <div style={{position: 'absolute', left: L, top: 300}}>
        <Slam text="ぜんぶ、" at={0} size={110} />
        <Slam text="スイッチひとつ。" at={6} size={110} color={X.accent} />
        <div style={{marginTop: 40, fontSize: 40, fontWeight: 700, color: X.ink2, opacity: noteO}}>OFF なら、公式の LINE と同じ動き。</div>
      </div>
      {SWITCHES.map((label, i) => {
        const at = 12 + i * 6;
        const s = spring({frame: f - at, fps: 30, config: {damping: 18, stiffness: 180, mass: 0.7}});
        return (
          <div key={label} style={{
            position: 'absolute', left: 1080, right: L, top: 165 + i * 150, height: 150, borderTop: `2px solid ${X.rule}`,
            display: 'flex', alignItems: 'center', justifyContent: 'space-between',
            opacity: Math.min(1, s * 2), transform: `translateX(${(1 - s) * 500}px)`,
          }}>
            <div style={{fontSize: 46, fontWeight: 700}}>{label}</div>
            <Switch at={at + 10} />
          </div>
        );
      })}
    </Bg>
  );
};

const End: React.FC = () => {
  const f = useCurrentFrame();
  const icon = useSpring(0, {damping: 11, stiffness: 160, mass: 0.7});
  const fade = (a: number) => interpolate(f, [a, a + 10], [0, 1], clamp);
  const rise = (a: number) => (1 - interpolate(f, [a, a + 14], [0, 1], {...clamp, easing: expoOut})) * 40;
  return (
    <Bg>
      <div style={{position: 'absolute', left: 0, right: 0, top: 150, display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
        <Img src={staticFile('brand/icon.svg')} style={{width: 180, height: 180, transform: `scale(${icon}) rotate(${(1 - icon) * -40}deg)`}} />
        <div style={{marginTop: 30}}><Slam text="Linimal" at={6} size={170} /></div>
        <div style={{marginTop: 20, fontSize: 50, fontWeight: 700, color: X.ink2, opacity: fade(16), transform: `translateY(${rise(16)}px)`}}>
          Android 版 LINE 向けのパッチ
        </div>
        <div style={{marginTop: 44, fontSize: 46, fontFamily: X.fontMono, color: X.accent, opacity: fade(24), transform: `translateY(${rise(24)}px)`}}>
          github.com/uta-a/linimal
        </div>
      </div>
      <div style={{position: 'absolute', left: L, right: L, top: 950, fontSize: 26, lineHeight: 1.6, color: X.ink3, textAlign: 'center', opacity: fade(30)}}>
        LINE・Morphe の公式プロジェクトではありません。対象は LINE 26.16.0。画面の名前とトークは架空です。
      </div>
    </Bg>
  );
};

const COMPONENTS: Record<SceneId, React.FC> = {
  hook: Hook, talk: Talk, home: Home, read: ReadTitle, demo: Demo, readers: Readers, switches: Switches, end: End,
};

export const LinimalXWide: React.FC = () => (
  <AbsoluteFill style={{background: X.paper}}>
    {SCENES.map(([id]) => {
      const C = COMPONENTS[id];
      return (
        <Sequence key={id} from={START[id]} durationInFrames={LEN[id]}>
          <C />
        </Sequence>
      );
    })}
    <Wipe at={START.talk} />
    <Wipe at={START.read} />
    <Wipe at={START.demo} dir={-1} />
    <Wipe at={START.end} />
    <Progress />
  </AbsoluteFill>
);
