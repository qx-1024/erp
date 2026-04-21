<template>
  <div class="about">
    <el-container class="main-container">
      <el-main class="main-content">
        <div class="welcome-section">
          <h2 class="welcome-title">关于系统</h2>
          <p class="welcome-subtitle">ERP管理系统 - 企业资源管理平台</p>
        </div>
        
        <el-card class="about-card" :body-style="{ padding: '24px' }">
          <template #header>
            <div class="card-header">
              <h3 class="card-title">系统信息</h3>
            </div>
          </template>
          <el-descriptions :column="1" border>
            <el-descriptions-item label="系统名称">
              ERP管理系统
            </el-descriptions-item>
            <el-descriptions-item label="版本">
              v1.0.0
            </el-descriptions-item>
            <el-descriptions-item label="开发技术">
              <el-tag>Vue 3</el-tag>
              <el-tag>Element Plus</el-tag>
              <el-tag>Vite</el-tag>
              <el-tag>TypeScript</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="后端技术">
              <el-tag>Spring Boot</el-tag>
              <el-tag>MyBatis-Plus</el-tag>
              <el-tag>Java 21</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="系统功能">
              <el-tag>用户管理</el-tag>
              <el-tag>商品管理</el-tag>
              <el-tag>采购管理</el-tag>
              <el-tag>销售管理</el-tag>
              <el-tag>库存管理</el-tag>
              <el-tag>财务管理</el-tag>
            </el-descriptions-item>
          </el-descriptions>
        </el-card>

        <el-card class="about-card mt-4" :body-style="{ padding: '24px' }">
          <template #header>
            <div class="card-header">
              <h3 class="card-title">系统架构</h3>
            </div>
          </template>
          <el-timeline>
            <el-timeline-item timestamp="前端层" placement="top">
              <el-card shadow="hover">
                <h4>Vue 3 + Element Plus</h4>
                <p>现代化的前端框架，提供良好的用户体验</p>
              </el-card>
            </el-timeline-item>
            <el-timeline-item timestamp="后端层" placement="top">
              <el-card shadow="hover">
                <h4>Spring Boot + MyBatis-Plus</h4>
                <p>高效的后端框架，提供稳定的API服务</p>
              </el-card>
            </el-timeline-item>
            <el-timeline-item timestamp="数据层" placement="top">
              <el-card shadow="hover">
                <h4>MySQL</h4>
                <p>可靠的关系型数据库，存储系统数据</p>
              </el-card>
            </el-timeline-item>
          </el-timeline>
        </el-card>
      </el-main>
      <el-footer class="main-footer">
        <p>© 2026 ERP系统 - 版权所有</p>
      </el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">

</script>

<style scoped>
.about {
  height: 100%;
  background: var(--bg-primary);
}

.main-container {
  height: 100%;
  width: 100%;
}

.main-content {
  padding: var(--spacing-xl);
  overflow-y: auto;
  width: 100%;
  box-sizing: border-box;
  flex: 1;
}

.welcome-section {
  margin-bottom: var(--spacing-xl);
  animation: fadeInUp 0.6s ease-out;
}

.welcome-title {
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin: 0 0 var(--spacing-sm) 0;
}

.welcome-subtitle {
  font-size: var(--font-size-base);
  color: var(--text-secondary);
  margin: 0;
}

.about-card {
  border-radius: var(--border-radius-lg);
  box-shadow: var(--shadow-md);
  background: var(--bg-card);
  transition: all var(--transition-normal);
  animation: fadeInUp 0.6s ease-out;
  overflow: hidden;
  position: relative;
}

.about-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, var(--color-primary-400), var(--color-secondary-400));
}

.about-card:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-2px);
}

.about-card:nth-child(2) {
  animation-delay: 0.2s;
  animation-fill-mode: both;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-lg);
}

.card-title {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-semibold);
  color: var(--text-primary);
  margin: 0;
}

.main-footer {
  background: var(--bg-footer);
  color: var(--text-muted);
  text-align: center;
  padding: var(--spacing-lg);
  box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.08);
  font-size: var(--font-size-sm);
  margin-top: var(--spacing-xl);
}

.mt-4 {
  margin-top: var(--spacing-lg);
}

/* 描述列表样式 */
.el-descriptions {
  border-radius: var(--border-radius);
  overflow: hidden;
}

.el-descriptions__header {
  background-color: var(--color-gray-50);
  font-weight: var(--font-weight-medium);
  color: var(--text-primary);
}

.el-descriptions__body {
  background-color: white;
}

.el-descriptions__row {
  border-bottom: 1px solid var(--border-color);
}

.el-descriptions__cell {
  padding: var(--spacing-md);
}

.el-descriptions__label {
  font-weight: var(--font-weight-medium);
  color: var(--text-secondary);
  background-color: var(--color-gray-50);
}

/* 标签样式 */
.el-tag {
  margin-right: var(--spacing-sm);
  margin-bottom: var(--spacing-sm);
  border-radius: var(--border-radius);
  padding: 2px 12px;
}

/* 时间线样式 */
.el-timeline {
  padding: var(--spacing-md) 0;
}

.el-timeline-item {
  padding-bottom: var(--spacing-lg);
}

.el-timeline-item__node {
  background-color: var(--color-primary-500);
}

.el-timeline-item__content {
  margin-top: var(--spacing-sm);
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .main-header {
    padding: 0 var(--spacing-md);
  }
  
  .main-content {
    padding: var(--spacing-lg);
  }
  
  .welcome-title {
    font-size: var(--font-size-xl);
  }
  
  .el-descriptions__cell {
    padding: var(--spacing-sm);
  }
}
</style>