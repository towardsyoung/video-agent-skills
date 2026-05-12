---
name: storyboard-lite
description: Generate a lightweight storyboard table from a script. Use when the user asks for a storyboard, shot list, shot breakdown, video storyboard table, short drama storyboard, or visual scene breakdown. The user only needs to provide script text; story type and art style are optional; assets are extracted automatically without asset IDs.
---

# Storyboard Lite

Use this skill to turn script text into a practical storyboard table with minimal user input. This skill is standalone and does not depend on any specific project, app, repository, API, or external asset database.

## Inputs

Required:

- Script text.

Optional:

- Story type.
- Art style.
- Output format.
- Whether to include or omit the extracted asset list.

Defaults:

- Story type: 都市职场
- Art style: 真人现代都市
- Output format: Markdown
- Asset mode: extract asset names automatically; do not generate asset IDs.

If the user only provides a script, proceed with defaults and briefly state the assumed story type and art style before the output. If the user asks what options are available, show the concise option lists in "Option Prompt".

## Story Type Options

Use these as suggested options, not hard limits. Accept custom user-provided story types.

- 都市职场
- 甜宠恋爱
- 悬疑惊悚
- 热血动作
- 仙侠玄幻
- 家庭温情
- 喜剧幽默
- 科幻末世
- 历史史诗
- 心理剧情
- 恐怖超自然
- 成长剧情

## Art Style Options

Use these as suggested options, not hard limits. Accept custom user-provided art styles.

- 真人现代都市
- 真人古装中国
- 真人武侠
- 2D 国风
- 2D 日漫
- 2D 扁平设计
- 2D 成熟都市恋爱
- 3D 动画
- 3D 国风
- 3D 国风赛博
- 3D 黏土定格

## Asset Extraction

Before the storyboard table, extract assets from the script unless the user asks to omit the asset list.

Extract:

- 角色: named characters and clear role aliases such as 男主, 女主, 母亲, 老板.
- 场景: explicit locations and repeated implied locations such as 办公室, 客厅, 医院走廊.
- 道具: plot-relevant objects such as 手机, 合同, 钥匙, 药瓶.

Rules:

- Do not invent asset IDs.
- Use only names that are explicit in the script or conservative neutral labels.
- If a character's name is unknown, use stable neutral labels such as 女主, 男主, 母亲.
- If the user later supplies real assets, align names to those assets but still omit IDs unless requested.
- Asset extraction output must use exactly these columns: `名称`, `类型`, `描述词`, `出镜位置`.
- `类型` must be one of: `角色`, `场景`, `道具`.
- `描述词` should be concise visual or narrative descriptors extracted from the script, separated with `、`, such as `年轻女性、焦虑、职业装` or `办公室、现代、会议桌`.
- `出镜位置` should identify where the asset appears in the script or storyboard, such as `第1场`, `第2-3镜`, `开场`, or a short quoted script cue. Use the most specific reliable position available.

## Output Format

Default output:

```md
假设：故事类型为「都市职场」，美术风格为「真人现代都市」。

## 自动提取资产清单

| 名称 | 类型 | 描述词 | 出镜位置 |
|---|---|---|---|

## 分镜表

| 序号 | 画面描述 | 场景 | 关联资产名称 | 时长 | 景别 | 运镜 | 角色动作 | 朝向 | 空间关系 | 情绪 | 台词 | 音效 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
```

If the user requests CSV, XML, or JSON, keep the same fields and omit asset IDs.

## Storyboard Rules

- Follow the script order exactly.
- Do not add plot events that are not in the script.
- Do not omit dialogue.
- Copy dialogue verbatim into the `台词` field.
- Every shot needs a scene.
- Visible characters and plot-relevant props must appear in `关联资产名称`.
- `角色动作` should start with `(开篇)` or `(承接上镜:...)`.
- Maintain visual continuity for facing direction and spatial relation within the same scene.
- Use `朝向` for character facing; use `—` for empty shots or pure object closeups.
- Use `空间关系` for multi-character shots; use `—` for single-character, empty, or object shots.
- Dialogue shot duration must be long enough for the line. Use roughly 4 chars/sec for anger, 3 chars/sec for normal speech, 2 chars/sec for sadness, whispering, or weakness, then add about 1 second.
- Non-dialogue shots should usually be 6 seconds or shorter.
- `音效` may include only concrete physical sound sources, environment sound, action sound, or foley. Do not write BGM, 配乐, 旋律, or instruments as mood scoring.
- Avoid unnecessary decorative shots. Merge adjacent shots if they repeat the same information.

## Option Prompt

When the user asks for choices, show concise choices:

```text
故事类型可选：都市职场、甜宠恋爱、悬疑惊悚、热血动作、仙侠玄幻、家庭温情、喜剧幽默、科幻末世、历史史诗、心理剧情、恐怖超自然、成长剧情。也可以直接写其他类型。

美术风格可选：真人现代都市、真人古装中国、真人武侠、2D 国风、2D 日漫、2D 扁平设计、2D 成熟都市恋爱、3D 动画、3D 国风、3D 国风赛博、3D 黏土定格。也可以直接写其他风格。
```

