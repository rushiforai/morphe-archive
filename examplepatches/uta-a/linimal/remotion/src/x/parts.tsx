// X 向け短尺版（4:5 の LinimalX と 16:9 の LinimalXWide）で共有する部品と場面の長さ。
import React from 'react';
import {AbsoluteFill, Easing, interpolate, spring, useCurrentFrame, useVideoConfig} from 'remotion';
import {Mark, SH, ScreenBox, widthFor} from '../shared/screens';
import {X} from './tokens';

export const clamp = {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'} as const;
export const expoOut = Easing.bezier(0.16, 1, 0.3, 1);

// 場面の並びと長さ（フレーム、30fps）
export const SCENES = [
  ['hook', 60],
  ['talk', 150],
  ['home', 120],
  ['read', 60],
  ['demo', 200],
  ['readers', 140],
  ['switches', 100],
  ['end', 120],
] as const;
export type SceneId = (typeof SCENES)[number][0];
export const START = {} as Record<SceneId, number>;
let acc = 0;
for (const [id, len] of SCENES) {
  START[id] = acc;
  acc += len;
}
export const X_TOTAL = acc;
export const LEN = Object.fromEntries(SCENES) as Record<SceneId, number>;

// ---------- 部品 ----------

export const Bg: React.FC<{color?: string; children: React.ReactNode}> = ({color = X.paper, children}) => (
  <AbsoluteFill style={{background: color, color: X.ink, fontFamily: X.fontSans, overflow: 'hidden'}}>{children}</AbsoluteFill>
);

export const useSpring = (delay: number, config = {damping: 13, stiffness: 190, mass: 0.7}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  return spring({frame: f - delay, fps, config});
};

// 文字を叩きつけるように出す。per > 0 なら 1 文字ずつずらす
export const Unit: React.FC<{text: string; at: number; size: number}> = ({text, at, size}) => {
  const f = useCurrentFrame();
  const s = useSpring(at);
  const o = interpolate(f - at, [0, 3], [0, 1], clamp);
  return (
    <span style={{display: 'inline-block', whiteSpace: 'pre', opacity: o, transform: `translateY(${(1 - s) * size * 0.45}px) scale(${1 + (1 - s) * 0.45})`}}>
      {text}
    </span>
  );
};
export const Slam: React.FC<{text: string; at: number; size: number; color?: string; per?: number; style?: React.CSSProperties}> = ({
  text, at, size, color = X.ink, per = 0, style,
}) => (
  <div style={{fontSize: size, fontWeight: 800, lineHeight: 1.18, letterSpacing: '-0.03em', color, whiteSpace: 'nowrap', ...style}}>
    {per > 0 ? [...text].map((c, i) => <Unit key={i} text={c} at={at + i * per} size={size} />) : <Unit text={text} at={at} size={size} />}
  </div>
);

// 一定時間ごとに入れ替わる見出し。前のものは上へ抜ける
export type Cap = {at: number; small?: string; big: string; color?: string};
export const Captions: React.FC<{items: Cap[]; top: number; size: number; left?: number; width?: number; smallSize?: number}> = ({items, top, size, left = X.margin, width, smallSize = 40}) => {
  const f = useCurrentFrame();
  return (
    <>
      {items.map((c, i) => {
        const end = items[i + 1]?.at ?? 100000;
        if (f < c.at || f >= end + 8) return null;
        const inP = interpolate(f, [c.at + (i > 0 ? 5 : 0), c.at + (i > 0 ? 15 : 10)], [0, 1], {...clamp, easing: expoOut});
        const outP = interpolate(f, [end, end + 6], [0, 1], {...clamp, easing: Easing.in(Easing.cubic)});
        return (
          <div key={i} style={{position: 'absolute', left, ...(width ? {width} : {right: X.margin}), top, opacity: inP * (1 - outP), transform: `translateY(${(1 - inP) * 50 - outP * 50}px)`}}>
            {c.small ? <div style={{fontSize: smallSize, fontWeight: 700, color: X.ink2, marginBottom: 8}}>{c.small}</div> : null}
            <div style={{fontSize: size, fontWeight: 800, letterSpacing: '-0.03em', lineHeight: 1.2, color: c.color ?? X.ink, whiteSpace: 'pre'}}>{c.big}</div>
          </div>
        );
      })}
    </>
  );
};

// 実画面。枠は描かず、角丸と細い線だけ。下から跳ねて入る
// cropTop を指定すると、画面の上端（実機座標）をその分だけ切り落とす（ステータスバーを隠す用途）
export const Shot: React.FC<{h: number; top: number; left?: number; at?: number; cropTop?: number; children: React.ReactNode}> = ({h, top, left, at = 0, cropTop = 0, children}) => {
  const {width} = useVideoConfig();
  const s = useSpring(at, {damping: 16, stiffness: 140, mass: 0.8});
  const w = widthFor(h);
  const cut = (cropTop * h) / SH;
  return (
    <div style={{position: 'absolute', left: left ?? (width - w) / 2, top, transform: `translateY(${(1 - s) * 260}px) scale(${0.88 + s * 0.12})`, opacity: Math.min(1, s * 2)}}>
      {cut > 0 ? (
        <div style={{width: w, height: h - cut, overflow: 'hidden', borderRadius: 30, outline: `2px solid ${X.rule}`}}>
          <ScreenBox height={h} style={{marginTop: -cut}}>{children}</ScreenBox>
        </div>
      ) : (
        <ScreenBox height={h} style={{borderRadius: 30, outline: `2px solid ${X.rule}`}}>{children}</ScreenBox>
      )}
    </div>
  );
};

// 消える箇所の囲み（画面座標）。gone は 0→1 で消える
export const AlertMarks: React.FC<{marks: Mark[]; at: number; step?: number; gone?: (m: Mark) => number}> = ({marks, at, step = 7, gone}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  return (
    <>
      {marks.map((m, i) => {
        const s = spring({frame: f - at - i * step, fps, config: {damping: 11, stiffness: 220, mass: 0.6}});
        const g = gone ? gone(m) : 0;
        return (
          <div key={i} style={{
            position: 'absolute', left: m[0], top: m[1], width: m[2] - m[0], height: m[3] - m[1],
            border: `12px solid ${X.alert}`, borderRadius: 30, opacity: Math.min(1, s * 2) * (1 - g),
            transform: `scale(${1.25 - s * 0.25})`,
          }} />
        );
      })}
    </>
  );
};

// 場面転換。ミントの面が斜めに横切る
export const Wipe: React.FC<{at: number; dir?: 1 | -1}> = ({at, dir = 1}) => {
  const f = useCurrentFrame();
  if (f < at - 12 || f > at + 13) return null;
  const x = f <= at
    ? interpolate(f, [at - 12, at], [-130, 0], {...clamp, easing: Easing.in(Easing.cubic)})
    : interpolate(f, [at, at + 12], [0, 130], {...clamp, easing: Easing.out(Easing.cubic)});
  return (
    <AbsoluteFill style={{pointerEvents: 'none'}}>
      <div style={{position: 'absolute', top: -200, bottom: -200, left: '-15%', width: '130%', background: X.accent, transform: `translateX(${x * dir}%) skewX(-12deg)`}} />
    </AbsoluteFill>
  );
};

// 画面下の進行バー
export const Progress: React.FC = () => {
  const f = useCurrentFrame();
  const {durationInFrames} = useVideoConfig();
  return <div style={{position: 'absolute', left: 0, bottom: 0, height: 8, width: `${(f / (durationInFrames - 1)) * 100}%`, background: X.accent}} />;
};

// 設定のスイッチ。ON への切り替えを跳ねさせる
export const Switch: React.FC<{at: number}> = ({at}) => {
  const s = useSpring(at, {damping: 14, stiffness: 260, mass: 0.6});
  const on = Math.min(1, Math.max(0, s));
  return (
    <div style={{position: 'relative', width: 132, height: 76, borderRadius: 38, background: on > 0.5 ? X.accent : X.rule}}>
      <div style={{position: 'absolute', top: 8, left: 8 + s * 56, width: 60, height: 60, borderRadius: 30, background: X.ink}} />
    </div>
  );
};
