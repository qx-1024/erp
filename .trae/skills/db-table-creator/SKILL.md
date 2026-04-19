***

name: "db-table-creator"
description: "生成数据库表结构，包含必填公共字段，支持字典字段和状态字段配置。Invoke when user wants to create a database table structure, especially when needing common fields like gmt\_create, gmt\_modified, is\_del, etc."
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# DB Table Creator

这个skill帮助用户快速生成数据库表结构，确保包含必填的公共字段，并支持字典字段和状态字段的配置。

## 使用流程

### 第一步：收集表基本信息

先向用户询问以下基本信息：

1. **表名**：表的英文名称（如 biz\_travel\_application）
2. **表注释**：表的中文描述（如 出差申请表）
3. **业务字段**：从用户描述中提取业务字段（如图片、文字描述等）

### 第二步：询问tenant\_id默认值

每次使用时必须询问用户：

> "请问 tenant\_id 的默认值是什么？（例如：1897910660227903490）"

### 第三步：检查字段类型

对每个业务字段，询问用户：

1. **如果字段看起来像字典值（如状态、类型等）**：
   > "字段 \[字段名] 是否是字典字段？如果是，请提供字典值说明（例如：01-待审核, 02-已通过, 03-已拒绝）"
   - 如果是字典字段，使用 varchar(2)
2. **如果字段涉及"是否"**：
   > "字段 \[字段名] 是'是否'类型吗？"
   - 如果是，使用 int 类型，默认值 0（0=否 1=是）
3. **其他字段**：
   - 合理推测数据类型和长度
   - 询问用户确认

### 第四步：生成建表语句

生成完整的建表SQL语句，必须包含以下公共字段：

```sql
`gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
`op_create_id` bigint DEFAULT NULL COMMENT '创建人ID',
`op_modified_id` bigint DEFAULT NULL COMMENT '修改人ID',
`op_create_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
`op_modified_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
`is_del` int DEFAULT '0' COMMENT '是否删除（0=否 1=是）',
`tenant_id` bigint DEFAULT '用户提供的值' COMMENT '租户ID',
```

### 第五步：输出完整SQL

输出完整的建表语句，包含：

- 主键 id (bigint)
- 业务字段
- org\_id (bigint) 字段
- status (varchar(2)) 字段
- 所有公共字段
- 表注释
- 字符集设置（utf8mb4）
- 引擎设置（InnoDB）

## 示例

用户输入：

> "根据图中的字段帮我整理好需要的字段：出差申请人、出差地点、出差开始日期、出差结束日期、原因，然后加上一个orgId（bigint）、status（vachar(2)）的字段"

处理流程：

1. 询问表名和表注释
2. 询问 tenant\_id 默认值
3. 检查每个字段类型
4. 生成完整建表语句

输出示例：

```sql
CREATE TABLE `biz_travel_application` (
  `id` bigint(0) NOT NULL COMMENT '主键ID',
  `applicant_id` bigint(0) NULL DEFAULT NULL COMMENT '出差申请人ID',
  `applicant_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出差申请人名称',
  `travel_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出差地点',
  `start_date` date NULL DEFAULT NULL COMMENT '出差开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '出差结束日期',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出差原因',
  `org_id` bigint(0) NULL DEFAULT NULL COMMENT '组织ID',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `op_create_id` bigint DEFAULT NULL COMMENT '创建人ID',
  `op_modified_id` bigint DEFAULT NULL COMMENT '修改人ID',
  `op_create_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
  `op_modified_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人名称',
  `is_del` int DEFAULT '0' COMMENT '是否删除（0=否 1=是）',
  `tenant_id` bigint DEFAULT '1897910660227903490' COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic COMMENT = '出差申请表';
```

