# GEMINI ANTIGRAVITY — WORKSPACE / AGENT INSTRUCTIONS

1. Open the actual Rex IG Lite repository as the workspace root.
2. Copy this package's `Screenshots/` folder and documentation into a `design-reference/` directory in the workspace (or keep the package read-only and link it in the task context).
3. If Antigravity supports project rules, add this document as workspace rules or provide `MASTER_PROMPT.md` to the agent as the system-level task brief.
4. Start in Plan mode. Ask the agent to read the master prompt, reference catalog, task checklist and all 28 screenshots. Require a source-evidence audit and implementation plan before code changes.
5. Review the plan for package/version assumptions, risky refactors, data migrations and unsupported features.
6. Switch to implementation/Agent mode. Permit safe file edits and test commands. Require approval for destructive shell commands, broad replacement scripts, force pushes, signing/release operations and file deletion.
7. Use a dedicated feature branch/worktree. Commit by stage: baseline audit, media adapter, contextual controls, design system/icons, settings, updater, tests.
8. Attach Piko IG Lite and Piko Main source repos/archives before asking for the actual merge. Their sources are not part of the screenshot ZIP.
9. Require the agent to keep `TASK_CHECKLIST.md` updated and attach evidence to each completed task.
10. Before finalising, require fresh build logs, install/runtime verification, screenshots and PASS/FAIL/BLOCKED/NOT TESTED report.

Do not tell the agent to “force success” or ignore failures. Force completeness and evidence, not unsafe tool execution or fake test results.
