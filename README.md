# CodingSkillSet

个人维护的编程 Agent 技能集合。每个技能位于根目录下与技能同名的文件夹中，包含独立的
`SKILL.md` 及其所需参考文件、模板；复制安装时必须复制整个技能目录。

| 技能 | 用途 |
| --- | --- |
| [project-governance](project-governance/SKILL.md) | 项目规则、架构调查、文档与测试治理、代理约束、临时信息和分层记忆 |

## 使用

将需要的技能完整复制到目标项目的 `.agents/skills/<技能名>/`。例如，在目标项目根目录中：

```bash
mkdir -p .agents/skills
cp -R /path/to/CodingSkillSet/project-governance .agents/skills/project-governance
```

使用 `$project-governance` 初始化或遵循当前项目的 `Agent_Operate_Guide/`。
首次引入必须创建配套目录和文件；项目地图根据当前源码核验填写，专属规则文件初始为空，
只按用户明确指令维护。项目内技能只安装到 `.agents/skills/project-governance/`，
guide 保存项目配置、地图和记忆。私有记忆和临时信息保留在目标项目内，不提交到本集合。
此技能要求编码时使用相关 Superpowers、Brooks skill；它不包含或安装这些第三方技能。

## 访问

仓库公开可读；仓库写权限仅授予所有者，不添加其他协作者。公开读取、fork 或提交 PR 不授予写权限。
