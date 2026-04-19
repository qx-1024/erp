# AI对话模块表结构设计

## 1. 对话表 (ai_conversation)

| 字段名 | 数据类型 | 长度 | 是否必填 | 默认值 | 描述 |
|-------|---------|------|---------|--------|------|
| id | BIGINT | - | 是 | 自增 | 对话ID |
| conversation_id | VARCHAR | 50 | 是 | - | 对话编号 |
| user_id | BIGINT | - | 是 | - | 用户ID |
| conversation_type | VARCHAR | 50 | 是 | 普通对话 | 对话类型(普通对话, 业务咨询, 操作指导, 数据分析) |
| status | VARCHAR | 20 | 是 | 进行中 | 状态(进行中, 已结束) |
| start_time | DATETIME | - | 是 | CURRENT_TIMESTAMP | 开始时间 |
| end_time | DATETIME | - | 否 | - | 结束时间 |
| remark | VARCHAR | 200 | 否 | - | 备注 |

## 2. 消息表 (ai_message)

| 字段名 | 数据类型 | 长度 | 是否必填 | 默认值 | 描述 |
|-------|---------|------|---------|--------|------|
| id | BIGINT | - | 是 | 自增 | 消息ID |
| conversation_id | VARCHAR | 50 | 是 | - | 对话编号 |
| message_type | VARCHAR | 20 | 是 | - | 消息类型(用户消息, AI回复) |
| content | TEXT | - | 是 | - | 消息内容 |
| send_time | DATETIME | - | 是 | CURRENT_TIMESTAMP | 发送时间 |
