# CodingSkillSet

个人维护的编写代码的 Agent 技能集合仓库。每个技能位于根目录下与技能同名的文件夹中，
包含独立的 `SKILL.md` 及其所需参考文件、模板与脚本；安装时必须复制整个技能目录。

| 技能 | 用途 |
| --- | --- |
| [project-governance](project-governance/SKILL.md) | 项目规则、架构调查、文档与测试治理、代理约束、临时信息和分层记忆 |

## 安装（统一标准）

技能包为含 `SKILL.md` 的自包含目录，适配 codex 与 dsh 的技能安装器：

- 项目级：复制到目标项目 `.agents/skills/<技能名>/`（两种安装器共同识别）；
- 全局：codex 安装到 `~/.codex/skills/<技能名>/`，dsh 安装到 `~/.agents/skills/<技能名>/`。

例如在目标项目根目录中：

```bash
mkdir -p .agents/skills
cp -R /path/to/CodingSkillSet/project-governance .agents/skills/project-governance
```

使用 `$project-governance` 初始化或遵循当前项目的 `Agent_Operate_Guide/`。
首次引入必须实际创建配套目录和文件；项目地图按当前源码核验填写，
专属规则文件初始为空，只按用户明确指令维护。

## 依赖技能

技能若依赖其他技能，包内提供依赖安装脚本，安装到与本技能相同的目录；
用户全局技能中已存在的依赖自动跳过。`project-governance` 依赖
superpowers（obra/superpowers）与 brooks-lint（hyhmrright/brooks-lint）中的相关技能：

```bash
bash .agents/skills/project-governance/scripts/install-deps.sh
```

## 访问

仓库公开可读；仓库写权限仅授予所有者，不添加其他协作者。
公开读取、fork 或提交 PR 不授予写权限。
