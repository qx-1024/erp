---
name: install-skills-from-git
description: 从 GitHub 仓库克隆并安装 skills 到当前项目。当用户提供 GitHub skill 仓库链接并要求安装时调用此 skill。
---

# Install Skills from Git

帮助用户从 GitHub 仓库克隆并安装 skills 到当前项目的 `.trae/skills/` 目录中。

---

## 适用场景

当用户：
- 提供 GitHub skill 仓库链接并要求安装
- 说"帮我安装这个 skill"并给出 GitHub 链接
- 提到某个 GitHub skill 仓库想在当前项目使用

---

## 安装流程

### 第一步：确认仓库链接

向用户确认 GitHub 仓库链接，确保链接正确无误。

### 第二步：克隆仓库

使用 `git clone` 命令克隆仓库到项目根目录的临时位置。

### 第三步：查找 SKILL.md

在克隆的仓库中查找 `SKILL.md` 文件，确认这是一个有效的 skill 仓库。

### 第四步：读取 skill 信息

读取 `SKILL.md` 文件，获取：
- skill 的 `name`（从 frontmatter 中获取）
- skill 的描述信息

### 第五步：创建目标目录

在 `.trae/skills/` 下创建以 skill name 命名的目录。

### 第六步：复制 SKILL.md

将仓库中的 `SKILL.md` 复制到 `.trae/skills/<skill-name>/` 目录下。

### 第七步：验证安装

读取目标位置的 `SKILL.md` 文件，确认内容正确。

### 第八步：清理临时文件

删除临时克隆的仓库目录，保持项目整洁。

### 第九步：告知用户

向用户确认安装成功，说明：
- skill 名称
- 安装位置
- skill 功能简介

---

## 注意事项

1. **克隆位置**：临时克隆到项目根目录，不要克隆到其他位置
2. **目录命名**：目标目录名称必须与 SKILL.md frontmatter 中的 `name` 字段完全一致
3. **文件复制**：只复制 SKILL.md 文件，不要复制其他无关文件
4. **清理工作**：安装完成后必须删除临时克隆的仓库
5. **错误处理**：如果克隆失败或找不到 SKILL.md，及时告知用户问题

---

## 示例执行命令

```powershell
# 克隆仓库
git clone https://github.com/username/skill-name.git

# 复制文件
Copy-Item "skill-name\SKILL.md" ".trae\skills\skill-name\SKILL.md"

# 删除临时目录
Remove-Item -Recurse -Force "skill-name"
```

---

## 完成后的输出模板

```
✅ **<skill-name> Skill 安装成功！**

已成功安装到：`.trae/skills/<skill-name>/SKILL.md`

**Skill 功能简介：**
<从 SKILL.md 中提取的简短描述>
```
