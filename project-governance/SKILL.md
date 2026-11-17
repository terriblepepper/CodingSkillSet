---
name: project-governance
description: Use when an agent initializes or follows Agent_Operate_Guide in a repository, including code changes, reviews, documentation, tests, Git or network operations, temporary plans, handoffs, and conversation memory.
---

# 项目治理

在当前工作项目执行治理。通过当前工作目录的 `git rev-parse --show-toplevel` 确定项目根目录，
不要从本技能文件的位置推导目标项目；技能位置不决定当前操作的项目。
只作用于本轮指定的项目，不修改其他项目或用户级配置。

## 入口

读取包内 [操作规则](references/governance.md) 和 [记忆协议](references/memory.md)，
再读取当前项目的 `AGENTS.md`、`Agent_Operate_Guide/README.md`、`rules/README.md`
及 `rules/project-rules.md`、`details/memory.md` 的索引段。专属规则为空时没有附加约束；
用户明确指令和已存在的项目专有规则优先；
按任务读取项目地图与相关编号条目，不全文加载历史。

## 首次接入必须创建配套结构

第一次在用户指定项目引入本 skill 时，必须实际创建下列文件和目录，不能只展示目录树或口头建议。
已有配套结构时只补缺项，保留既有内容、用户修改和实际记忆，不重复初始化或清空旧规则。

```text
项目根目录/
├── .agents/skills/project-governance/   # 唯一的项目 skill 实体安装目录（codex 与 dsh 共同识别）
├── AGENTS.md                          # 合并治理入口，保留已有说明
└── Agent_Operate_Guide/
    ├── README.md
    ├── rules/
    │   ├── README.md                  # 通用操作规则
    │   ├── memory.md                  # 通用记忆协议
    │   ├── project-map.md             # 经源码核验的项目事实
    │   └── project-rules.md           # 项目专属规则，首次创建为零字节空文件
    ├── tmp/
    └── details/
        └── memory.md
```

1. 将本技能完整目录安装到目标项目 `.agents/skills/project-governance/`；已有正确安装时保留。
   项目内只保留这一处实体副本，不再把技能包放到 guide/rules 下。
2. 使用 [导航模板](templates/guide.md)、[项目地图模板](templates/project-map.md)、
   [空记忆模板](templates/memory.md) 初始化对应位置；将包内操作规则和记忆协议复制到 rules。
   阅读相关源码和 Git diff 后填充项目地图，仅写已经核实的职责、调用链、文档和测试入口。
3. 将 [空白专属规则模板](templates/project-rules.md) 复制为 `rules/project-rules.md`，保持零字节。
   不自动把通用规则、源码事实、其他项目要求或 agent 的偏好写成项目专属约束。
4. 将 [入口片段](templates/agent-entry.md) 合并到根级 AGENTS.md，保留用户已有说明。
   在目标项目 `.gitignore` 中写入 `/Agent_Operate_Guide/` 的忽略；
   仅本 skill 新建且尚未跟踪的本地 AGENTS.md 可一并忽略。
   `.agents/` 技能安装目录的忽略由用户自行处理，本 skill 不代为写入。
   已跟踪文件先告知用户，不能私自取消跟踪，不能声称忽略规则使旧文件退出 Git。

## 用户维护项目专属规则

收到用户明确指令时，在当前项目 `Agent_Operate_Guide/rules/project-rules.md` 创建或更新对应规则。
例如用户说“本项目禁止新增 npm 依赖”，则就地记录该项目约束，之后按它执行。
已有专属规则只增量维护、去重并修正冲突；无新指令时保持原样。
专属规则只属于当前项目，不回写通用技能包或其他项目；源码事实仍放 project-map，临时计划仍放 tmp。

## 依赖与安装

本技能依赖以下第三方技能：superpowers（github.com/obra/superpowers）的 using-superpowers、
brainstorming、writing-plans、systematic-debugging、test-driven-development、
verification-before-completion，以及 brooks-lint（github.com/hyhmrright/brooks-lint）的
brooks-review、brooks-audit（专门任务再按需 brooks-debt、brooks-test）。

每次调用本技能时，agent 先检查上述依赖技能是否可用；发现缺失就自行运行包内脚本
`scripts/install-deps.sh` 完成安装后再开始任务：依赖安装到与本技能相同的目录
（项目级 `.agents/skills/` 或所在全局技能目录），用户全局技能中已存在的依赖由脚本自动跳过；
仅当安装失败（网络或源不可用）才报告用户，不能冒称使用。
`.agents/skills/<skill-name>/` 是 codex 与 dsh 安装器共同识别的项目级标准安装位置。

## 执行与收尾

先调查调用链、根因、职责和 Git 差异；编码必须使用相关 Superpowers 工作流与 Brooks skill。
过程资料只放目标项目 `Agent_Operate_Guide/tmp/<任务标识>/`，覆盖各 skill 的默认保存目录。
正式文档按本轮 diff 就地维护，测试仅覆盖改动及直接影响；网络保留原代理，反代故障报告用户。

每轮最终回复前将关键事实写入唯一 `details/memory.md` 的 `YYYY-MM-DD-N` 文内条目。
用户手动要求总结/压缩，或编号条目数 **>30 次**、总行数 **>2000 行**时，压缩全部历史，
只留当前日期 `YYYY-MM-DD-1` 最新总结条目，移除之前全部条目，不另存归档；同日下一轮从 2 继续。
清理本任务临时产物，保留正式测试、正式文档、用户数据和其他活跃任务文件，提供实际验证证据。
