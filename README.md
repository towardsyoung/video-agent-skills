# video-agent-skills

Reusable agent skills for video creation workflows.

## Skills

- `storyboard-lite`: generate a lightweight storyboard table from script text. It automatically extracts characters, scenes, and props without requiring asset IDs.

## Repository Layout

```text
video-agent-skills/
  skills/
    storyboard-lite/
      SKILL.md
      agents/
        openai.yaml
  install.sh
  README.md
```

## Install

Run the installer from this repository:

```bash
./install.sh
```

The installer creates symlinks, so future edits in this repository are picked up by each agent runtime automatically. By default it installs links for:

- Codex: `~/.codex/skills/storyboard-lite`
- Claude Code: `~/.claude/skills/storyboard-lite`
- OpenClaw: `~/.openclaw/skills/storyboard-lite`
- Shared agents directory: `~/.agents/skills/storyboard-lite`

You can also install manually by copying or symlinking:

```bash
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.codex/skills/storyboard-lite
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.claude/skills/storyboard-lite
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.openclaw/skills/storyboard-lite
```

## Verify

After installing, confirm that the skill is visible to your agent runtime, then invoke it with a short script:

```text
Use $storyboard-lite to generate a storyboard table from this script:
女主推开办公室门，看见桌上的合同。老板说：“你终于来了。”
```

Expected behavior:

- The agent states the assumed story type and art style if you did not provide them.
- The output includes an automatically extracted asset list.
- The storyboard table includes scene, related assets, shot duration, dialogue, action, and sound fields.

## Uninstall

Remove the symlinks created by the installer:

```bash
rm ~/.codex/skills/storyboard-lite
rm ~/.claude/skills/storyboard-lite
rm ~/.openclaw/skills/storyboard-lite
rm ~/.agents/skills/storyboard-lite
```

## Usage

Codex:

```text
Use $storyboard-lite to generate a storyboard table from this script:
...
```

Claude Code:

```text
/storyboard-lite
Generate a storyboard table from this script:
...
```

OpenClaw:

```text
Use storyboard-lite to generate a storyboard table from this script:
...
```

## Notes

The skill is standalone. It does not depend on any specific project, app, repository, API, or external asset database.
