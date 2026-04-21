<template>
  <div class="home">
    <el-container class="main-container">
      <el-main class="main-content">
        <div class="welcome-section">
          <h2 class="welcome-title">欢迎回来，管理员</h2>
          <p class="welcome-subtitle">今天是 {{ today }}，祝您工作愉快！</p>
        </div>
        
        <el-row :gutter="24" class="stats-section">
          <el-col :span="8">
            <el-card class="stats-card">
              <div class="stats-content">
                <div class="stats-icon blue">
                  <el-icon><Goods /></el-icon>
                </div>
                <div class="stats-info">
                  <div class="stats-label">商品总数</div>
                  <div class="stats-value">1,234</div>
                  <div class="stats-trend positive">+12% 较上月</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card class="stats-card">
              <div class="stats-content">
                <div class="stats-icon green">
                  <el-icon><Connection /></el-icon>
                </div>
                <div class="stats-info">
                  <div class="stats-label">供应商数量</div>
                  <div class="stats-value">56</div>
                  <div class="stats-trend positive">+5% 较上月</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card class="stats-card">
              <div class="stats-content">
                <div class="stats-icon purple">
                  <el-icon><User /></el-icon>
                </div>
                <div class="stats-info">
                  <div class="stats-label">客户数量</div>
                  <div class="stats-value">234</div>
                  <div class="stats-trend positive">+8% 较上月</div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>

        <el-card class="orders-section" :body-style="{ padding: '24px' }">
          <template #header>
            <div class="section-header">
              <h3 class="section-title">最近订单</h3>
              <el-button type="primary" size="small">查看全部</el-button>
            </div>
          </template>
          <el-table :data="orders" style="width: 100%" stripe>
            <el-table-column prop="id" label="订单编号" width="180" />
            <el-table-column prop="customer" label="客户" />
            <el-table-column prop="amount" label="金额" width="120">
              <template #default="scope">
                <span class="amount">{{ scope.row.amount.toLocaleString('zh-CN', { style: 'currency', currency: 'CNY' }) }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="status" label="状态" width="120">
              <template #default="scope">
                <el-tag :type="getStatusType(scope.row.status)">{{ scope.row.status }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="date" label="日期" width="180" />
          </el-table>
        </el-card>
      </el-main>
      <el-footer class="main-footer">
        <p>© 2026 ERP系统 - 版权所有</p>
      </el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import { Goods, Connection, User } from '@element-plus/icons-vue';

const orders = ref([
  { id: 'ORD-20260419-001', customer: '张三', amount: 12345, status: '已完成', date: '2026-04-19' },
  { id: 'ORD-20260418-002', customer: '李四', amount: 8765, status: '处理中', date: '2026-04-18' },
  { id: 'ORD-20260417-003', customer: '王五', amount: 5432, status: '已完成', date: '2026-04-17' },
  { id: 'ORD-20260416-004', customer: '赵六', amount: 9876, status: '待付款', date: '2026-04-16' }
]);

const today = computed(() => {
  const now = new Date();
  return now.toLocaleDateString('zh-CN', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    weekday: 'long'
  });
});

const getStatusType = (status: string) => {
  switch (status) {
    case '已完成':
      return 'success';
    case '处理中':
      return 'warning';
    case '待付款':
      return 'info';
    default:
      return '';
  }
};
</script>

<style scoped>
.home {
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

.stats-section {
  margin-bottom: var(--spacing-xl);
}

.stats-card {
  border-radius: var(--border-radius-lg);
  box-shadow: var(--shadow-md);
  transition: all var(--transition-normal);
  overflow: hidden;
  position: relative;
  background: var(--bg-card);
  padding: var(--spacing-lg);
  animation: fadeInUp 0.6s ease-out;
  min-height: 160px;
  display: flex;
  align-items: center;
}

.stats-card:nth-child(2) {
  animation-delay: 0.2s;
  animation-fill-mode: both;
}

.stats-card:nth-child(3) {
  animation-delay: 0.4s;
  animation-fill-mode: both;
}

.stats-card:hover {
  transform: translateY(-5px);
  box-shadow: var(--shadow-lg);
}

.stats-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 4px;
  height: 100%;
  background: linear-gradient(135deg, var(--color-primary-400), var(--color-primary-600));
}

.stats-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  color: white;
  flex-shrink: 0;
  box-shadow: var(--shadow-md);
  transition: all var(--transition-normal);
}

.stats-card:hover .stats-icon {
  transform: scale(1.1);
}

.stats-icon.blue {
  background: linear-gradient(135deg, var(--color-primary-500), var(--color-primary-700));
}

.stats-icon.green {
  background: linear-gradient(135deg, var(--color-success), #2E7D32);
}

.stats-icon.purple {
  background: linear-gradient(135deg, var(--color-secondary-700), var(--color-secondary-900));
}

.stats-info {
  flex: 1;
}

.stats-label {
  font-size: var(--font-size-sm);
  color: var(--text-secondary);
  margin-bottom: var(--spacing-xs);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.stats-value {
  font-size: var(--font-size-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin-bottom: var(--spacing-xs);
  font-family: var(--font-family-display);
}

.stats-trend {
  font-size: var(--font-size-xs);
  font-weight: var(--font-weight-medium);
  display: flex;
  align-items: center;
  gap: var(--spacing-xs);
}

.stats-trend.positive {
  color: var(--color-success);
}

.orders-section {
  border-radius: var(--border-radius-lg);
  box-shadow: var(--shadow-md);
  background: var(--bg-card);
  animation: fadeInUp 0.6s ease-out 0.6s both;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-lg);
}

.section-title {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-semibold);
  color: var(--text-primary);
  margin: 0;
}

.amount {
  font-weight: var(--font-weight-semibold);
  color: var(--color-primary-600);
}

.main-footer {
  background: var(--bg-footer);
  color: var(--text-muted);
  text-align: center;
  padding: var(--spacing-lg);
  box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.08);
  font-size: var(--font-size-sm);
}

/* 表格样式 */
.el-table {
  border-radius: var(--border-radius);
  overflow: hidden;
}

.el-table th {
  background-color: var(--color-gray-50) !important;
  font-weight: var(--font-weight-medium);
  color: var(--text-primary);
}

.el-table tr:hover {
  background-color: var(--color-gray-50) !important;
}

/* 按钮样式 */
.el-button--primary {
  background: linear-gradient(135deg, var(--color-primary-500), var(--color-primary-700));
  border: none;
  transition: all var(--transition-normal);
}

.el-button--primary:hover {
  background: linear-gradient(135deg, var(--color-primary-600), var(--color-primary-800));
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
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
  
  .stats-section .el-col {
    margin-bottom: var(--spacing-lg);
  }
  
  .stats-content {
    flex-direction: column;
    text-align: center;
  }
  
  .stats-value {
    font-size: var(--font-size-2xl);
  }
}
</style>