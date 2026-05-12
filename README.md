# video-agent-skills

Reusable agent skills for video creation workflows.

用于视频创作流程的可复用 Agent Skills。

## Skills / 技能

- `storyboard-lite`: generate a lightweight storyboard table from script text. It automatically extracts characters, scenes, and props without requiring asset IDs.
- `storyboard-lite`：根据剧本文本生成轻量级分镜表。它会自动提取角色、场景和道具，不需要用户提供资产 ID。

## Repository Layout / 仓库结构

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

## Install / 安装

Run the installer from this repository:

在本仓库目录下运行安装脚本：

```bash
./install.sh
```

The installer creates symlinks, so future edits in this repository are picked up by each agent runtime automatically. By default it installs links for:

安装脚本会创建软链接，因此后续你在本仓库中修改 skill，各个 Agent 运行环境会自动使用最新版本。默认会安装到：

- Codex: `~/.codex/skills/storyboard-lite`
- Claude Code: `~/.claude/skills/storyboard-lite`
- OpenClaw: `~/.openclaw/skills/storyboard-lite`
- Shared agents directory: `~/.agents/skills/storyboard-lite`

You can also install manually by copying or symlinking:

你也可以手动复制或创建软链接：

```bash
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.codex/skills/storyboard-lite
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.claude/skills/storyboard-lite
ln -s /path/to/video-agent-skills/skills/storyboard-lite ~/.openclaw/skills/storyboard-lite
```

## Verify / 验证

After installing, confirm that the skill is visible to your agent runtime, then invoke it with a short script:

安装后，先确认你的 Agent 运行环境可以看到该 skill，然后用一小段剧本测试：

```text
Use $storyboard-lite to generate a storyboard table from this script:
女主推开办公室门，看见桌上的合同。老板说：“你终于来了。”
```

Expected behavior:

预期行为：

- The agent states the assumed story type and art style if you did not provide them.
- The output includes an automatically extracted asset list.
- The storyboard table includes scene, related assets, shot duration, dialogue, action, and sound fields.
- 如果你没有提供故事类型和美术风格，Agent 会先说明默认假设。
- 输出包含自动提取的资产清单。
- 分镜表包含场景、关联资产、时长、台词、角色动作、音效等字段。

## Uninstall / 卸载

Remove the symlinks created by the installer:

删除安装脚本创建的软链接即可：

```bash
rm ~/.codex/skills/storyboard-lite
rm ~/.claude/skills/storyboard-lite
rm ~/.openclaw/skills/storyboard-lite
rm ~/.agents/skills/storyboard-lite
```

## Usage / 使用方式

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

## Notes / 说明

The skill is standalone. It does not depend on any specific project, app, repository, API, or external asset database.

该 skill 是独立的，不依赖任何特定项目、应用、仓库、API 或外部资产数据库。
