#!/usr/bin/env node
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

export const ALLOWED_SECTIONS = new Set([
  '✨ New Features',
  '🐛 Bug Fixes',
  '🔧 Improvements',
  '🗑 Removed',
  '🚀 Updated App Support',
]);

const FORBIDDEN_GENERIC_PHRASES = [
  /^update\s+source$/i,
  /^minor\s+changes?$/i,
  /^misc(\s+changes?)?$/i,
  /^release(\s+v?\d+\.\d+\.\d+)?$/i,
  /^wip$/i,
  /^temp$/i,
  /^fix\s+stuff$/i,
  /^changes?$/i,
  /^обновление$/i,
  /^мелкие\s+правки$/i,
  /^исправления$/i,
];

const BULLET_RE = /^\s*[*+-]\s+(?:\*\*[^*]+:\*\*\s*)?(.+)$/;
const HEADING_RE = /^###\s+(.+)$/;
const COMMIT_LINK_RE = /\s*\(\[[a-f0-9]{7,40}\]\([^)]+\)\)\s*$/i;

export function validateReleaseNotesText(description) {
  const errors = [];

  if (typeof description !== 'string' || description.trim().length === 0) {
    return ['Release description is empty.'];
  }

  const lines = description.split(/\r?\n/);
  const seenBullets = new Set();
  const sectionCounts = new Map();
  let currentSection = null;
  let totalBullets = 0;

  for (const rawLine of lines) {
    const line = rawLine.trim();
    if (!line) continue;

    const headingMatch = line.match(HEADING_RE);
    if (headingMatch) {
      const sectionName = headingMatch[1].trim();
      if (!ALLOWED_SECTIONS.has(sectionName)) {
        errors.push(`Unsupported changelog section heading: "${sectionName}".`);
      }
      currentSection = sectionName;
      if (!sectionCounts.has(sectionName)) {
        sectionCounts.set(sectionName, 0);
      }
      continue;
    }

    const bulletMatch = line.match(BULLET_RE);
    if (bulletMatch) {
      totalBullets += 1;
      if (currentSection) {
        sectionCounts.set(currentSection, (sectionCounts.get(currentSection) ?? 0) + 1);
      }

      const cleanedText = bulletMatch[1]
        .replace(COMMIT_LINK_RE, '')
        .trim();

      if (cleanedText.length < 4) {
        errors.push(`Release note bullet is too short or empty: "${line}".`);
        continue;
      }

      for (const pattern of FORBIDDEN_GENERIC_PHRASES) {
        if (pattern.test(cleanedText)) {
          errors.push(`Forbidden generic release note phrase: "${cleanedText}".`);
        }
      }

      const normalized = cleanedText.toLowerCase().replace(/\s+/g, ' ');
      if (seenBullets.has(normalized)) {
        errors.push(`Duplicate release note entry detected: "${cleanedText}".`);
      } else {
        seenBullets.add(normalized);
      }
    }
  }

  if (totalBullets === 0) {
    errors.push('Release description contains no user-facing change bullets.');
  }

  for (const [section, count] of sectionCounts.entries()) {
    if (count === 0) {
      errors.push(`Empty changelog section without items: "${section}".`);
    }
  }

  return errors;
}

export function validatePatchesBundleObject(bundle) {
  const errors = [];
  if (!bundle || typeof bundle !== 'object') {
    return ['patches-bundle.json must be a JSON object.'];
  }
  if (typeof bundle.version !== 'string' || !bundle.version.trim()) {
    errors.push('patches-bundle.json is missing a valid "version" string.');
  }
  if (typeof bundle.download_url !== 'string' || !bundle.download_url.startsWith('https://')) {
    errors.push('patches-bundle.json is missing a valid HTTPS "download_url".');
  }
  if (typeof bundle.created_at !== 'string' || !bundle.created_at.trim()) {
    errors.push('patches-bundle.json is missing a valid "created_at" timestamp.');
  }
  errors.push(...validateReleaseNotesText(bundle.description));
  return errors;
}

if (import.meta.url === `file://${resolve(process.argv[1] ?? '')}`) {
  const targetPath = resolve(process.argv[2] ?? 'patches-bundle.json');
  const raw = readFileSync(targetPath, 'utf8');
  const bundle = JSON.parse(raw);
  const errors = validatePatchesBundleObject(bundle);
  if (errors.length > 0) {
    console.error(`Release notes validation failed for ${targetPath}:`);
    for (const err of errors) {
      console.error(` - ${err}`);
    }
    process.exit(1);
  }
  console.log(`Release notes validation passed for ${targetPath} (v${bundle.version}).`);
}
