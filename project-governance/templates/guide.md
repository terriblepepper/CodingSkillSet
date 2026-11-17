# Agent_Operate_Guide

当前项目的本地 Agent 治理入口。用户明确要求同步的文件以外，guide 和本地技能安装入口均由 Git 忽略。

| 位置 | 用途 |
| --- | --- |
| [rules/README.md](rules/README.md) | 通用操作规则 |
| [rules/project-rules.md](rules/project-rules.md) | 项目专属规则：初始空白，仅按用户指令维护 |
| [rules/project-map.md](rules/project-map.md) | 经源码核实的职责、调用链、正式文档和测试入口 |
| [rules/memory.md](rules/memory.md) | 分层读取、文内编号和全历史压缩 |
| `tmp/<任务标识>/` | 所有 skill 的临时计划、评审、报告和 agent 交接，任务结束清理 |
| [details/memory.md](details/memory.md) | 唯一信息文档，顶部索引和 YYYY-MM-DD-N 内部条目 |

每轮读取本页、核心规则和信息文档索引，按需读取项目地图和相关条目。
修改前理解调用链和 Git diff；收尾同步必要正式文档、记忆，清理自己的临时文件，提供实际验证证据。

project-governance 为通用技能；维护在技能集合的 project-governance/ 源目录，修改验证后同步安装副本。
本项目的地图、实际记忆和临时数据留在本项目，不回传技能集合。
