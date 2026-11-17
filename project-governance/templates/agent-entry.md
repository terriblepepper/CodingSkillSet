# Agent 项目治理入口

开始每轮任务前使用 project-governance，读取 Agent_Operate_Guide/README.md、
rules/README.md、rules/project-rules.md 和 details/memory.md 的索引段，按需读取项目地图与相关记忆。
若当前运行器未发现 skill，读取本项目 .agents/skills/project-governance/SKILL.md；
若使用其他安装方式，按已配置的实际 skill 位置读取。

所有 Superpowers/Brooks 临时设计、计划、评审、报告、agent 交接和一次性验证资料，
统一保存到 Agent_Operate_Guide/tmp/<任务标识>/，结束清理；正式测试和文档保留。
每轮最终回复前按记忆协议登记本轮信息。
