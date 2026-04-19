# ERP系统后端 - 编码规范与关键约定

本规范专属于ERP系统及其相关模块。在参与开发时，**必须依据且仅依据本文档的内容为准**。

---

## 🛠️ 后端架构底座核心一览
- **Java环境**：Java 21
- **Web框架**：Spring Boot 3.2.0
- **数据持有层**：MyBatis-Plus 3.5.3
- **统一包前缀约束**：`com.qiu`

## 📝 核心代码规范及范例

### 1. **统一返回包装**
使用 `Response<T>` 作为统一返回格式：
```java
// 所属类 com.qiu.system.entity.Response

// OK的用法示例：
return Response.success(data);
return Response.success();
// 失败处理示例：
return Response.error(400, "操作失败");
```

### 2. **实体类设计**
实体类直接使用MyBatis-Plus的注解：
```java
@TableName("t_user")
@Data
public class User {
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    // 其他字段...
}
```

### 3. **Mapper 继承**
所有的 Mapper 继承自 MyBatis-Plus 的 `BaseMapper<T>`：
```java
public interface UserMapper extends BaseMapper<User> {
}
```

### 4. **Service 体系实现**
Service 继承自 MyBatis-Plus 的 `IService<T>`：
```java
public interface UserService extends IService<User> {
    // 自定义方法
}

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    // 实现方法
}
```

### 5. **Controller 编写守则**
- 使用 `@Resource` 进行 Controller 层和 Service 层的对象依赖注入。
- URL 路径使用 RESTful 风格，带有 `/api` 前缀，如 `/api/user`。
- 使用普通 Java 注释，不使用 Swagger 注解。
- 使用 `@Valid` 注解进行参数校验。
- 所有的逻辑代码都要写到实现类，不要写在Controller，包括公共字段的处理。

### 6. **异常处理**
使用全局异常处理器统一处理异常：
```java
@RestControllerAdvice
public class GlobalExceptionHandler {
    // 异常处理方法
}
```

### 7. **ID生成**
使用雪花算法生成全局唯一ID：
```java
user.setId(SnowflakeUtil.generateId());
```

---

## 📦 统一 Git 提交规范 (Conventional Commits)
所有代码提交均需严格符合以下结构：
`<type>(<scope>): <subject>`

**1. Type 类型说明：**
- `feat`: 新增功能 | `fix`: 修复 Bug | `specs`: 设计与架构文档变更 | `refactor`: 重构代码
- `style`: 格式变动 | `perf`: 性能优化 | `chore`: 构建或依赖库变动

**2. Scope 作用域推荐：**
推荐直接使用相关业务模块名（如 `user`, `product`, `purchase`, `sales`, `inventory` 等）。
示例：`feat(user): 增加用户管理CRUD接口`

---

# 行为准则：减少常见的LLM编码错误

本准则旨在减少大语言模型（LLM）在编码过程中的常见错误。可根据项目具体需求进行调整。

权衡：这些准则更倾向于谨慎而非速度。对于简单任务，请根据判断灵活使用。

## 1. 编码前思考
不要假设。不要隐藏困惑。明确权衡。

在实现之前：
- 明确陈述你的假设。如果不确定，就问。
- 如果存在多种解释，将它们呈现出来 - 不要默默选择一种。
- 如果存在更简单的方法，就说出来。在必要时提出异议。
- 如果有不清楚的地方，停下来。指出困惑之处并询问。

## 2. 简洁优先
用最少的代码解决问题。不要做推测性的实现。

- 不要添加超出需求的功能。
- 不要为一次性使用的代码创建抽象。
- 不要添加未要求的"灵活性"或"可配置性"。
- 不要为不可能的场景添加错误处理。
- 如果你写了200行代码而实际上50行就足够，就重写它。

问自己："资深工程师会认为这太复杂吗？"如果是，就简化。

## 3. 精准修改
只修改你必须修改的部分。只清理你自己造成的混乱。

编辑现有代码时：
- 不要"改进"相邻的代码、注释或格式。
- 不要重构没有问题的代码。
- 匹配现有的代码风格，即使你会用不同的方式写。
- 如果你注意到无关的死代码，提及它 - 但不要删除它。

当你的更改产生了未使用的代码时：
- 删除因你的更改而变得未使用的导入/变量/函数。
- 除非被要求，否则不要删除预先存在的死代码。

测试标准：每一行更改都应该直接追溯到用户的请求。

## 4. 目标驱动执行
定义成功标准。循环直到验证通过。

将任务转化为可验证的目标：
- "添加验证" → "为无效输入编写测试，然后使测试通过"
- "修复bug" → "编写一个重现bug的测试，然后使测试通过"
- "重构X" → "确保测试在重构前后都能通过"

对于多步骤任务，陈述一个简短的计划：
1. [步骤] → 验证：[检查]
2. [步骤] → 验证：[检查]
3. [步骤] → 验证：[检查]

明确的成功标准让你能够独立循环。模糊的标准（如"让它工作"）需要不断的澄清。

这些准则是否有效，可以通过以下方式判断：差异中不必要的更改减少，因过度复杂化而导致的重写减少，以及澄清问题在实现之前而非错误之后提出。