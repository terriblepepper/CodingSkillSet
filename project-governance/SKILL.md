---
name: project-governance
description: Use when an agent initializes or follows Agent_Operate_Guide in a repository, including code changes, reviews, documentation, tests, Git or network operations, temporary plans, handoffs, and conversation memory.
---

# 项目治理

在当前工作项目执行治理。通过当前工作目录的 `git rev-parse --show-toplevel` 确定项目根目录，
不要从本技能文件的位置推导目标项目；技能可以位于独立维护仓库、安装副本或符号链接中。
只作用于本轮指定的项目，不修改其他项目或用户级配置。

## 入口

读取包内 [操作规则](references/governance.md) 和 [记忆协议](references/memory.md)，
再读取当前项目的 `AGENTS.md`、`Agent_Operate_Guide/README.md`、`rules/README.md`
及 `details/memory.md` 的索引段。用户明确指令和已存在的项目专有规则优先；
按任务读取项目地图与相关编号条目，不全文加载历史。

## 首次接入

项目尚无 guide 时，先阅读相关源码和 Git diff，再在项目根目录建立：

```text
Agent_Operate_Guide/
├── README.md
├── rules/
│   ├── README.md
│   ├── memory.md
│   └── project-map.md
├── tmp/
└── details/
    └── memory.md
```

- 以 [导航模板](templates/guide.md)、[项目地图模板](templates/project-map.md)、
  [空记忆模板](templates/memory.md) 初始化相应位置；将包内操作规则和记忆协议复制到 rules。
  按源码填充职责边界、调用链、正式文档和测试入口，不携带别的项目事实。
- 将 [入口片段](templates/agent-entry.md) 合并到根级 AGENTS.md，保留用户已有说明。
- 在目标项目 `.gitignore` 中忽略 `/Agent_Operate_Guide/` 和本地安装入口
  `/.agents/skills/project-governance`；仅本 skill 新建且尚未跟踪的本地 AGENTS.md 可一并忽略。
  已跟踪文件需先告知用户，不能私自取消跟踪，也不能假称新增忽略规则使旧文件退出 Git。
- guide 已存在时按本轮授权增量修正，不覆盖项目地图或实际记忆，不重复初始化。

## 执行与收尾

先调查调用链、根因、职责和 Git 差异；编码必须使用相关 Superpowers 工作流与 Brooks skill。
过程资料只放目标项目 `Agent_Operate_Guide/tmp/<任务标识>/`，覆盖各 skill 的默认保存目录。
正式文档按本轮 diff 就地维护，测试仅覆盖改动及直接影响；网络保留原代理，反代故障报告用户。

每轮最终回复前将关键事实写入唯一 `details/memory.md` 的 `YYYY-MM-DD-N` 文内条目。
用户手动要求总结/压缩，或编号条目数 **>30 次**、总行数 **>2000 行**时，压缩全部历史，
只留当前日期 `YYYY-MM-DD-1` 最新总结条目，移除之前全部条目，不另存归档；同日下一轮从 2 继续。
清理本任务临时产物，保留正式测试、正式文档、用户数据和其他活跃任务文件，提供实际验证证据。

## 维护源

本 skill 在技能集合的 `<集合根目录>/project-governance/` 内维护。
修改先在该源目录完成并验证，再同步完整目录到用户指定的安装副本；项目地图和实际记忆始终留在项目。
源目录不可用时说明情况，继续可独立开展的调查，不擅自把安装副本当维护源。
