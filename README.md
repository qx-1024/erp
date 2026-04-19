# ERP系统

## 项目简介

ERP（Enterprise Resource Planning）系统是一个集成化的企业管理系统，旨在帮助企业实现资源的有效管理和业务流程的优化。本项目是一个基于Java技术栈开发的ERP系统后端，提供了完整的企业管理功能模块。

## 技术栈

- **Java环境**：Java 21
- **Web框架**：Spring Boot 3.2.0
- **数据持有层**：MyBatis-Plus 3.5.3
- **安全框架**：Sa-Token
- **数据库**：MySQL
- **构建工具**：Maven

## 项目结构

```
erp/
├── db/                # 数据库相关文件
│   ├── create_tables.sql   # 数据库表结构创建脚本
│   ├── design/            # 数据库设计文档
│   └── test.sql           # 测试SQL脚本
├── system/            # 后端系统代码
│   ├── src/            # 源代码
│   │   ├── main/java/com/qiu/system/  # 主代码包
│   │   │   ├── config/         # 配置类
│   │   │   ├── controller/     # 控制器
│   │   │   ├── entity/         # 实体类
│   │   │   ├── exception/      # 异常处理
│   │   │   ├── mapper/         # 数据访问层
│   │   │   ├── service/        # 业务逻辑层
│   │   │   ├── utils/          # 工具类
│   │   │   └── SystemApplication.java  # 应用入口
│   │   └── resources/         # 资源文件
│   │       ├── mapper/         # MyBatis映射文件
│   │       └── application.yml # 应用配置
│   └── pom.xml        # Maven配置文件
├── CLAUDE.md          # 编码规范和行为准则
├── LICENSE            # 许可证文件
└── README.md          # 项目说明文档
```

## 核心功能模块

1. **用户权限模块**：用户管理、角色管理、权限管理
2. **基础数据模块**：商品分类、计量单位、商品信息、供应商、客户、仓库
3. **采购管理模块**：采购申请、采购订单、采购入库、采购付款
4. **销售管理模块**：销售订单、销售出库、销售收款
5. **库存管理模块**：库存查询、库存流水、库存盘点、库存调拨
6. **财务管理模块**：应收账款、应付账款、费用管理、收付款记录
7. **字典管理模块**：字典类型、字典项管理

## 快速开始

### 环境准备

1. 安装JDK 21或以上版本
2. 安装MySQL 5.7或以上版本
3. 安装Maven 3.6或以上版本

### 数据库配置

1. 创建数据库 `erp_system`
2. 执行 `db/create_tables.sql` 脚本创建表结构

### 项目配置

修改 `system/src/main/resources/application.yml` 文件中的数据库配置：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/erp_system?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
    username: root
    password: 123456
    driver-class-name: com.mysql.cj.jdbc.Driver
```

### 项目运行

1. 进入 `system` 目录
2. 执行 `mvn clean install` 编译项目
3. 执行 `mvn spring-boot:run` 启动项目
4. 项目将在 `http://localhost:8080` 上运行

## 编码规范

请参考项目根目录下的 `CLAUDE.md` 文件，其中包含了详细的编码规范和行为准则。

## 贡献指南

1. Fork 本仓库
2. 创建 feature 分支
3. 提交代码
4. 发起 Pull Request

## 许可证

本项目采用 MIT 许可证，详见 `LICENSE` 文件。

## 联系方式

如有问题或建议，欢迎联系项目维护者。