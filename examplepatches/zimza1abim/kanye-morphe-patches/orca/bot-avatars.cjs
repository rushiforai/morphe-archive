// Draws each bot's uploaded picture on Home: the Feed tab's Bots section and the Bots tab
// read the upload's bytes the way a bot's own screen does, instead of its initial.
// Usage: node orca/bot-avatars.cjs <Orca android source checkout>
// Marker-guarded like prepare-source.cjs: an applied edit is skipped, an unexpected source
// layout stops before anything is written, and re-running on a prepared tree changes nothing.
const fs = require('node:fs')
const path = require('node:path')

const AVATARS = 'mobile/src/home/bots/home-bot-avatars.ts'
const AVATAR_FILES = 'mobile/src/home/bots/home-bot-avatar-files.ts'
const VIEWS = 'mobile/src/home/bots/home-bot-row-views.ts'
const ROWS = 'mobile/src/home/bots/home-bot-rows.ts'
const HOME_BOTS = 'mobile/src/home/bots/use-home-bots.ts'
const ROW_VIEW = 'mobile/src/home/bots/MobileHomeBotRow.tsx'
const ROWS_TEST = 'mobile/src/home/bots/home-bot-rows.test.ts'
const AVATARS_TEST = 'mobile/src/home/bots/home-bot-avatars.test.ts'

function applyBotAvatarFix(sourceArg) {
  const source = path.resolve(sourceArg)
  const changes = new Map()
  const read = (relative) =>
    changes.get(path.join(source, relative)) ?? fs.readFileSync(path.join(source, relative), 'utf8')
  const set = (relative, text) => changes.set(path.join(source, relative), text)

  function edit(relative, marker, anchor, replacement) {
    const text = read(relative)
    if (text.includes(marker)) return
    if (text.split(anchor).length !== 2)
      throw Error(`${relative}: expected exactly one insertion anchor for ${JSON.stringify(marker)}`)
    set(relative, text.replace(anchor, replacement))
  }

  // ── the row carries its own picture ──────────────────────────────────────
  edit(VIEWS, "Its picture: Home reads an upload's bytes too", '  | (HomeRowBase & { kind: \'bot\'; bot: PhoneBot; dot: BotRowStatus | null })',
    '  | (HomeRowBase & {\n' +
    "      kind: 'bot'\n" +
    '      bot: PhoneBot\n' +
    "      /** Its picture: Home reads an upload's bytes too, so it draws as its own screen does. */\n" +
    '      avatar: MobileBotAvatarSource\n' +
    '      dot: BotRowStatus | null\n' +
    '    })')

  edit(VIEWS, 'avatarUris: ReadonlyMap<string, string>,',
    '  bot: PhoneBot,\n' +
    '  agents: readonly HomeAgentEntry[],\n' +
    '  now: number\n' +
    '): HomeBotRow {\n',
    '  bot: PhoneBot,\n' +
    '  agents: readonly HomeAgentEntry[],\n' +
    '  avatarUris: ReadonlyMap<string, string>,\n' +
    '  now: number\n' +
    '): HomeBotRow {\n')

  edit(VIEWS, 'avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id))',
    '    bot,\n' +
    '    dot: botDot(agents, bot.paused, now),\n',
    '    bot,\n' +
    '    avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id)),\n' +
    '    dot: botDot(agents, bot.paused, now),\n')

  edit(VIEWS, 'unread: boolean,\n  avatarUris: ReadonlyMap<string, string>,',
    '  unread: boolean,\n' +
    '  now: number\n' +
    '): HomeBotRow {\n' +
    '  const faces = botGroupMemberBots(group, bots).map((bot) => ({\n' +
    '    id: bot.id,\n' +
    '    name: bot.name,\n' +
    '    avatar: mobileBotAvatarSource(bot, undefined)\n' +
    '  }))\n',
    '  unread: boolean,\n' +
    '  avatarUris: ReadonlyMap<string, string>,\n' +
    '  now: number\n' +
    '): HomeBotRow {\n' +
    '  const faces = botGroupMemberBots(group, bots).map((bot) => ({\n' +
    '    id: bot.id,\n' +
    '    name: bot.name,\n' +
    '    avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id))\n' +
    '  }))\n')

  edit(VIEWS, 'lastActivity: Readonly<Record<string, number>>,\n  avatarUris: ReadonlyMap<string, string>,',
    '  lastActivity: Readonly<Record<string, number>>,\n' +
    '  now: number\n' +
    '): HomeBotRow[] {\n',
    '  lastActivity: Readonly<Record<string, number>>,\n' +
    '  avatarUris: ReadonlyMap<string, string>,\n' +
    '  now: number\n' +
    '): HomeBotRow[] {\n')

  // A computer's kept copy draws the picture read while it was live.
  edit(VIEWS, 'avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id)),\n      dot: null',
    "      kind: 'bot',\n" +
    '      bot,\n' +
    '      dot: null\n' +
    '    })),\n' +
    "    ...groups.map((group): HomeBotRow => ({\n",
    "      kind: 'bot',\n" +
    '      bot,\n' +
    '      avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id)),\n' +
    '      dot: null\n' +
    '    })),\n' +
    '    ...groups.map((group): HomeBotRow => ({\n')

  edit(VIEWS, 'avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id))\n      })),',
    '      faces: botGroupMemberBots(group, bots).map((bot) => ({\n' +
    '        id: bot.id,\n' +
    '        name: bot.name,\n' +
    '        avatar: mobileBotAvatarSource(bot, undefined)\n' +
    '      })),\n' +
    '      dot: null\n' +
    '    }))\n' +
    '  ]\n',
    '      faces: botGroupMemberBots(group, bots).map((bot) => ({\n' +
    '        id: bot.id,\n' +
    '        name: bot.name,\n' +
    '        avatar: mobileBotAvatarSource(bot, avatarUris.get(bot.id))\n' +
    '      })),\n' +
    '      dot: null\n' +
    '    }))\n' +
    '  ]\n')

  // ── the rows take the pictures Home read ─────────────────────────────────
  edit(ROWS, 'Each bot\'s uploaded picture as a data URL, by bot id',
    '  worktreeInfo: Readonly<Record<string, HostWorktreeInfo>>\n' +
    '  now: number\n' +
    '}\n',
    '  worktreeInfo: Readonly<Record<string, HostWorktreeInfo>>\n' +
    "  /** Each bot's uploaded picture as a data URL, by bot id: Home draws it like the bot's own screen. */\n" +
    '  avatarUris?: ReadonlyMap<string, string>\n' +
    '  now: number\n' +
    '}\n')

  edit(ROWS, 'const NO_AVATAR_URIS: ReadonlyMap<string, string> = new Map()',
    'const isOwnEntry = (entry: HomeComputerEntry): boolean =>\n' +
    '  entry.key === hostBotsKey(entry.pairedHostId)\n',
    'const isOwnEntry = (entry: HomeComputerEntry): boolean =>\n' +
    '  entry.key === hostBotsKey(entry.pairedHostId)\n' +
    '\n' +
    '/** Before any upload is read: every bot draws its mascot, emoji or initial. */\n' +
    'const NO_AVATAR_URIS: ReadonlyMap<string, string> = new Map()\n')

  edit(ROWS, 'const avatarUris = input.avatarUris ?? NO_AVATAR_URIS',
    'export function homeBotRows(input: HomeBotRowsInput): HomeBots {\n',
    'export function homeBotRows(input: HomeBotRowsInput): HomeBots {\n' +
    '  const avatarUris = input.avatarUris ?? NO_AVATAR_URIS\n')

  edit(ROWS, 'lastActivity, avatarUris, input.now',
    'rows.push(...keptRows(place, answer, entry.mode, groups, lastActivity, input.now))',
    'rows.push(...keptRows(place, answer, entry.mode, groups, lastActivity, avatarUris, input.now))')

  edit(ROWS, 'homes.get(botHomeWorktreeId(bot)) ?? NO_AGENTS,\n            avatarUris,',
    '          botRow(place, answer, bot, homes.get(botHomeWorktreeId(bot)) ?? NO_AGENTS, input.now)\n',
    '          botRow(\n' +
    '            place,\n' +
    '            answer,\n' +
    '            bot,\n' +
    '            homes.get(botHomeWorktreeId(bot)) ?? NO_AGENTS,\n' +
    '            avatarUris,\n' +
    '            input.now\n' +
    '          )\n')

  edit(ROWS, 'unread.has(botHomeWorktreeId(group)),\n              avatarUris,',
    '              unread.has(botHomeWorktreeId(group)),\n' +
    '              input.now\n' +
    '            )\n',
    '              unread.has(botHomeWorktreeId(group)),\n' +
    '              avatarUris,\n' +
    '              input.now\n' +
    '            )\n')

  // ── Home reads the uploads once each; the cache lives with the launch ────
  edit(HOME_BOTS, 'useRef, useState, useSyncExternalStore',
    "import { useEffect, useMemo, useSyncExternalStore } from 'react'\n",
    "import { useEffect, useMemo, useRef, useState, useSyncExternalStore } from 'react'\n")

  edit(HOME_BOTS, 'LOCAL_EXECUTION_HOST_ID } from',
    "import { HOST_LIST_TARGET, NO_HOST_LIST_INPUT } from '../../host-screen/catalog/host-list-queries'\n",
    "import { LOCAL_EXECUTION_HOST_ID } from '../../../../src/shared/execution-host/execution-host'\n" +
    "import { HOST_LIST_TARGET, NO_HOST_LIST_INPUT } from '../../host-screen/catalog/host-list-queries'\n")

  edit(HOME_BOTS, "import { createHomeBotAvatarFiles } from './home-bot-avatar-files'",
    "import { homeBotsQuery, type HomeComputerBots } from './home-bots-query'\n",
    "import {\n" +
    '  keptHomeBotAvatars,\n' +
    '  NO_AVATAR_URIS,\n' +
    '  readHomeBotAvatarUploads,\n' +
    '  sameAvatarUris\n' +
    "} from './home-bot-avatars'\n" +
    "import { createHomeBotAvatarFiles } from './home-bot-avatar-files'\n" +
    "import { homeBotsQuery, type HomeComputerBots } from './home-bots-query'\n")

  edit(HOME_BOTS, 'const keptPictures = useMemo(',
    '  const bots = useMemo(\n',
    "  // Each bot's uploaded picture: a kept one draws at once, the rest are read together.\n" +
    '  const avatarCache = useRef(new Map<string, string>())\n' +
    '  const avatarFiles = useMemo(() => createHomeBotAvatarFiles(), [])\n' +
    '  const listed = useMemo(\n' +
    '    () =>\n' +
    '      homeHosts.flatMap(({ hostId, client }) => {\n' +
    '        const read = reads[hostId]\n' +
    '        if (!client || !read) {\n' +
    '          return []\n' +
    '        }\n' +
    '        // Bots run on the paired computer itself; a relayed server lists its own through it.\n' +
    '        const bots = read.answers.flatMap((entry) =>\n' +
    "          entry.executionHost === LOCAL_EXECUTION_HOST_ID && entry.answer.kind === 'bots'\n" +
    '            ? entry.answer.bots\n' +
    '            : []\n' +
    '        )\n' +
    '        return bots.length > 0 ? [{ client, bots }] : []\n' +
    '      }),\n' +
    '    [homeHosts, reads]\n' +
    '  )\n' +
    '  const keptPictures = useMemo(() => keptHomeBotAvatars(listed, avatarFiles), [listed, avatarFiles])\n' +
    '  const [avatarRead, setAvatarRead] = useState(NO_AVATAR_URIS)\n' +
    '  useEffect(() => {\n' +
    '    if (listed.length === 0) {\n' +
    '      return\n' +
    '    }\n' +
    '    let cancelled = false\n' +
    '    void readHomeBotAvatarUploads(listed, avatarCache.current, avatarFiles).then((next) => {\n' +
    '      if (!cancelled) {\n' +
    '        setAvatarRead((previous) => (sameAvatarUris(previous, next) ? previous : next))\n' +
    '      }\n' +
    '    })\n' +
    '    return () => {\n' +
    '      cancelled = true\n' +
    '    }\n' +
    '  }, [listed, avatarFiles])\n' +
    '  const avatarUris = useMemo(() => {\n' +
    '    if (keptPictures.size === 0 || avatarRead.size === 0) {\n' +
    '      return keptPictures.size === 0 ? avatarRead : keptPictures\n' +
    '    }\n' +
    '    const merged = new Map(keptPictures)\n' +
    '    for (const [botId, uri] of avatarRead) {\n' +
    '      merged.set(botId, uri)\n' +
    '    }\n' +
    '    return merged\n' +
    '  }, [keptPictures, avatarRead])\n' +
    '  const bots = useMemo(\n')

  edit(HOME_BOTS, '        worktreeInfo,\n        avatarUris,',
    '        worktreeInfo,\n' +
    '        now\n' +
    '      }),\n',
    '        worktreeInfo,\n' +
    '        avatarUris,\n' +
    '        now\n' +
    '      }),\n')

  edit(HOME_BOTS, 'worktreeInfo, avatarUris, now]',
    '    [hosts, hostStates, unreachableHosts, reads, fresh, kept, hydrated, worktreeInfo, now]\n',
    '    [hosts, hostStates, unreachableHosts, reads, fresh, kept, hydrated, worktreeInfo, avatarUris, now]\n')

  // ── the row draws what it carries ────────────────────────────────────────
  edit(ROW_VIEW, 'draws once its bytes are here',
    "import { mobileBotAvatarSource } from '../../bots/host-bot-row-facts'\n",
    '')

  edit(ROW_VIEW, '<MobileBotRowAvatar avatar={row.avatar}',
    '          // Uploaded pictures need their own read; Home draws mascots, else the initial.\n' +
    '          <MobileBotRowAvatar\n' +
    '            avatar={mobileBotAvatarSource(row.bot, undefined)}\n' +
    '            dot={row.dot}\n' +
    '            surface={surface}\n' +
    '          />\n',
    "          // Its picture, read with Home's bots: an upload draws once its bytes are here.\n" +
    '          <MobileBotRowAvatar avatar={row.avatar} dot={row.dot} surface={surface} />\n')

  // ── the tests that keep it so ────────────────────────────────────────────
  edit(ROWS_TEST, 'draws an uploaded picture once Home has its bytes',
    "  it('lists a server two computers relay once, under its own name', () => {\n",
    "  it('draws an uploaded picture once Home has its bytes, and the initial before that', () => {\n" +
    "    const ux = bot('ux', 'ux-designer', { avatar: 'upload:abc123' })\n" +
    '    const drawn = (avatarUris?: ReadonlyMap<string, string>) =>\n' +
    '      homeBotRows(\n' +
    '        input({\n' +
    "          botsByHost: { studio: on(computer('studio', 'local', listed('studio', [ux]))) },\n" +
    '          ...(avatarUris ? { avatarUris } : {})\n' +
    '        })\n' +
    "      ).rows.map((row) => (row.kind === 'bot' ? row.avatar : null))\n" +
    "    expect(drawn()).toEqual([{ kind: 'text', text: 'U' }])\n" +
    "    expect(drawn(new Map([['ux', 'data:image/png;base64,AAAA']]))).toEqual([\n" +
    "      { kind: 'image', uri: 'data:image/png;base64,AAAA' }\n" +
    '    ])\n' +
    '  })\n' +
    '\n' +
    "  it('lists a server two computers relay once, under its own name', () => {\n")

  // The modules and their tests travel with the edit: a build exports all of them or none.
  const templates = {
    'home-bot-avatars.ts': AVATARS,
    'home-bot-avatar-files.ts': AVATAR_FILES,
    'home-bot-avatars.test.ts': AVATARS_TEST
  }
  for (const [template, destination] of Object.entries(templates)) {
    set(destination, fs.readFileSync(path.join(__dirname, 'bot-avatars', template), 'utf8'))
  }

  for (const [file, contents] of changes) {
    fs.mkdirSync(path.dirname(file), { recursive: true })
    if (!fs.existsSync(file) || fs.readFileSync(file, 'utf8') !== contents) fs.writeFileSync(file, contents)
  }
  return { files: [...changes.keys()].map((file) => path.relative(source, file)) }
}

module.exports = applyBotAvatarFix
if (require.main === module) {
  if (process.argv.length !== 3) throw Error('Supply the Orca android source checkout')
  const result = applyBotAvatarFix(process.argv[2])
  process.stdout.write(`Draws Home's bot pictures (${result.files.length} files).\n`)
}
