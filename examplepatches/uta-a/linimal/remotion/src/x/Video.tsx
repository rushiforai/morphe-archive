// X（旧 Twitter）向けの短尺版。4:5（1080×1350）、約 31 秒、音声なし。
// 音を出さずに見られる前提で、文字だけで内容が伝わるようにする。
// 実画面はモック画像だけを使い、端末の枠は描かない（src/shared/screens.tsx を共有）。
import React from 'react';
import {AbsoluteFill, Easing, Img, Sequence, interpolate, spring, staticFile, useCurrentFrame, useVideoConfig} from 'remotion';
import {
  Layer, MARKS, MarkAllReadScreen, Mark, OpenWithoutReceiptScreen, ScreenBox, ScrollPreviewScreen,
  SH, SW, SpeedContext, widthFor,
} from '../shared/screens';
import {X} from './tokens';
import {
  AlertMarks, Bg, Captions, LEN, Progress, SCENES, START, SceneId, Shot, Slam, Switch, Wipe, clamp, expoOut, useSpring,
} from './parts';

const M = X.margin;
export {X_TOTAL} from './parts';

// ---------- 場面 ----------

const Hook: React.FC = () => {
  const f = useCurrentFrame();
  const shake = f >= 22 && f < 46 ? Math.sin(f * 2.7) * 12 * interpolate(f, [22, 46], [1, 0]) : 0;
  const push = interpolate(f, [40, 60], [1, 1.14], {...clamp, easing: Easing.in(Easing.cubic)});
  return (
    <Bg>
      <div style={{position: 'absolute', left: M, top: 330, transform: `scale(${push})`, transformOrigin: '0% 50%'}}>
        <Slam text="その LINE、" at={-3} size={88} />
        <div style={{transform: `translateX(${shake}px)`, marginTop: 24}}>
          <Slam text="ごちゃごちゃ" at={8} per={2} size={150} color={X.alert} />
        </div>
        <Slam text="してない？" at={24} size={132} style={{marginTop: 12}} />
      </div>
    </Bg>
  );
};

const SCREEN_H = 980;
const SCREEN_TOP = 310;
const K = SCREEN_H / SH;
const SCREEN_LEFT = (X.W - widthFor(SCREEN_H)) / 2;

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
  const tab = Math.round(interpolate(f, [100, 116], [5, 2], clamp));
  const tabIn = useSpring(100);
  return (
    <Bg>
      <Captions top={70} size={96} items={[
        {at: 4, small: '公式の LINE', big: 'アイコンだらけ。'},
        {at: 96, small: 'Linimal なら', big: 'すっきり。', color: X.accent},
      ]} />
      <Shot h={SCREEN_H} top={SCREEN_TOP}>
        <Layer src="screenshots/line-talk-list-before.png" />
        <Layer src="screenshots/line-talk-list.png" style={{clipPath: `inset(0 0 ${100 - p}% 0)`}} />
        <AlertMarks marks={MARKS.talkBefore} at={16} gone={gone} />
        {p > 0 && p < 100 ? <div style={{position: 'absolute', left: 0, right: 0, top: scanY - 10, height: 20, background: X.accent}} /> : null}
      </Shot>
      {labels.map(([text, m], i) => {
        const y = SCREEN_TOP + ((m[1] + m[3]) / 2) * K;
        const x0 = SCREEN_LEFT + m[2] * K;
        const o = interpolate(f, [20 + i * 7, 26 + i * 7], [0, 1], clamp) * (1 - gone(m));
        return (
          <div key={text} style={{position: 'absolute', left: x0, top: y - 20, display: 'flex', alignItems: 'center', opacity: o}}>
            <div style={{width: 788 - x0 - 10, height: 4, background: X.alert}} />
            <div style={{marginLeft: 10, fontSize: 28, fontWeight: 800, color: X.alert, lineHeight: '40px', whiteSpace: 'nowrap'}}>{text}</div>
          </div>
        );
      })}
      <div style={{position: 'absolute', left: 790, top: 1110, opacity: Math.min(1, tabIn * 2), transform: `scale(${0.6 + tabIn * 0.4})`, transformOrigin: '0% 50%'}}>
        <div style={{fontSize: 30, fontWeight: 700, color: X.ink2}}>下部タブ</div>
        <div style={{fontSize: 104, fontWeight: 800, color: X.accent, fontFamily: X.fontSans, lineHeight: 1, letterSpacing: '-0.04em'}}>
          5→{tab}
        </div>
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
      <Captions top={70} size={76} items={[{at: 2, small: 'ホームも', big: 'おすすめも、Agent i も。'}]} />
      <Shot h={SCREEN_H} top={SCREEN_TOP}>
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
      <div style={{position: 'absolute', left: M, top: SCREEN_TOP + SCREEN_H - 50, fontFamily: X.fontMono, fontSize: 30, color: X.alert, opacity: tagO}}>Before</div>
      <div style={{position: 'absolute', right: M, top: SCREEN_TOP + SCREEN_H - 50, fontFamily: X.fontMono, fontSize: 30, color: X.accent, opacity: tagO}}>After</div>
    </Bg>
  );
};

const ReadTitle: React.FC = () => {
  const subO = interpolate(useCurrentFrame(), [24, 32], [0, 1], clamp);
  return (
    <Bg color={X.accent}>
      <div style={{position: 'absolute', left: M, top: 280}}>
        <Slam text="既読、" at={2} size={184} color={X.accentInk} />
        <Slam text="つけずに" at={9} size={184} color={X.accentInk} />
        <Slam text="読める。" at={16} size={184} color={X.accentInk} />
        <div style={{marginTop: 36, fontSize: 46, fontWeight: 700, color: X.accentInk, opacity: subO}}>長押しメニューから。通知からも。</div>
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
      <Captions top={110} size={64} items={[
        {at: 0, big: 'トークを長押しして'},
        {at: 50, big: '「既読をつけずに読む」'},
        {at: 98, big: '相手には、未読のまま。', color: X.accent},
        {at: 132, big: '読み終えたら、まとめて既読。'},
      ]} />
      <Shot h={1000} top={290}>
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

// 既読者。画像座標（chat-anonymized.png 1220×500）
const CHAT_W = 1000;
const CK = CHAT_W / 1220;
const Readers: React.FC = () => {
  const f = useCurrentFrame();
  const chatIn = useSpring(6, {damping: 16, stiffness: 150, mass: 0.8});
  const dim = interpolate(f, [70, 84], [1, 0.22], clamp);
  const dialog = useSpring(72, {damping: 17, stiffness: 130, mass: 0.9});
  const rings: [number, number, number, number][] = [[406, 86, 574, 150], [738, 318, 906, 382]];
  const tap = f - 56;
  return (
    <Bg>
      <div style={{position: 'absolute', left: M, top: 56}}>
        <Slam text="グループで、" at={0} size={100} />
        <Slam text="誰が読んだか。" at={6} size={100} color={X.accent} />
      </div>
      <Captions top={318} size={40} items={[
        {at: 20, big: '既読の横に、読んだ人のアイコン'},
        {at: 74, big: 'タップで、既読・未読の一覧'},
      ]} />
      <div style={{position: 'absolute', left: 40, top: 410, width: CHAT_W, opacity: dim, transform: `translateX(${(1 - chatIn) * 1100}px)`}}>
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
      <div style={{position: 'absolute', left: (X.W - 500) / 2, top: 450, width: 500, transform: `translateY(${(1 - dialog) * 1000}px)`}}>
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
      <div style={{position: 'absolute', left: M, top: 70}}>
        <Slam text="ぜんぶ、" at={0} size={104} />
        <Slam text="スイッチひとつ。" at={6} size={104} color={X.accent} />
      </div>
      {SWITCHES.map((label, i) => {
        const at = 12 + i * 6;
        const s = spring({frame: f - at, fps: 30, config: {damping: 18, stiffness: 180, mass: 0.7}});
        return (
          <div key={label} style={{
            position: 'absolute', left: M, right: M, top: 410 + i * 140, height: 140, borderTop: `2px solid ${X.rule}`,
            display: 'flex', alignItems: 'center', justifyContent: 'space-between',
            opacity: Math.min(1, s * 2), transform: `translateX(${(1 - s) * 400}px)`,
          }}>
            <div style={{fontSize: 48, fontWeight: 700}}>{label}</div>
            <Switch at={at + 10} />
          </div>
        );
      })}
      <div style={{position: 'absolute', left: M, top: 1130, fontSize: 38, fontWeight: 700, color: X.ink2, opacity: noteO}}>
        OFF なら、公式の LINE と同じ動き。
      </div>
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
      <div style={{position: 'absolute', left: 0, right: 0, top: 250, display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
        <Img src={staticFile('brand/icon.svg')} style={{width: 200, height: 200, transform: `scale(${icon}) rotate(${(1 - icon) * -40}deg)`}} />
        <div style={{marginTop: 40}}><Slam text="Linimal" at={6} size={160} /></div>
        <div style={{marginTop: 24, fontSize: 46, fontWeight: 700, color: X.ink2, opacity: fade(16), transform: `translateY(${rise(16)}px)`}}>
          Android 版 LINE 向けのパッチ
        </div>
        <div style={{marginTop: 60, fontSize: 44, fontFamily: X.fontMono, color: X.accent, opacity: fade(24), transform: `translateY(${rise(24)}px)`}}>
          github.com/uta-a/linimal
        </div>
      </div>
      <div style={{position: 'absolute', left: M, right: M, top: 1150, fontSize: 26, lineHeight: 1.6, color: X.ink3, textAlign: 'center', opacity: fade(30)}}>
        LINE・Morphe の公式プロジェクトではありません。<br />
        対象は LINE 26.16.0。画面の名前とトークは架空です。
      </div>
    </Bg>
  );
};

const COMPONENTS: Record<SceneId, React.FC> = {
  hook: Hook, talk: Talk, home: Home, read: ReadTitle, demo: Demo, readers: Readers, switches: Switches, end: End,
};

export const LinimalX: React.FC = () => (
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
