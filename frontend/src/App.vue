<template>
  <div class="app">
    <!-- 登录页面不需要侧边栏 -->
    <template v-if="route.path === '/login'">
      <router-view />
    </template>
    <!-- 其他页面显示侧边栏 -->
    <template v-else>
      <div class="app-container">
        <div class="app-aside">
          <el-menu
            :default-active="activeIndex"
            class="el-menu-vertical-demo"
            @select="handleSelect"
            :background-color="'var(--bg-header)'"
            :text-color="'var(--text-primary)'"
            :active-text-color="'var(--color-primary-600)'"
          >
            <div class="menu-logo">
              <el-icon class="logo-icon"><Operation /></el-icon>
              <span class="logo-text">ERP系统</span>
            </div>
            <el-menu-item index="/">
              <el-icon><HomeFilled /></el-icon>
              <span>首页</span>
            </el-menu-item>
            <el-menu-item index="/about">
              <el-icon><InfoFilled /></el-icon>
              <span>关于系统</span>
            </el-menu-item>
            <el-sub-menu index="1">
              <template #title>
                <el-icon><Goods /></el-icon>
                <span>商品管理</span>
              </template>
              <el-menu-item index="/products">商品列表</el-menu-item>
              <el-menu-item index="/categories">分类管理</el-menu-item>
            </el-sub-menu>
            <el-sub-menu index="2">
              <template #title>
                <el-icon><ShoppingCart /></el-icon>
                <span>订单管理</span>
              </template>
              <el-menu-item index="/orders">订单列表</el-menu-item>
              <el-menu-item index="/returns">退货管理</el-menu-item>
            </el-sub-menu>
            <el-sub-menu index="3">
              <template #title>
                <el-icon><User /></el-icon>
                <span>用户管理</span>
              </template>
              <el-menu-item index="/users">用户列表</el-menu-item>
              <el-menu-item index="/roles">角色管理</el-menu-item>
            </el-sub-menu>
          </el-menu>
        </div>
        <div class="main-content-container">
          <div class="top-bar">
            <el-dropdown>
              <span class="user-info">
                <el-avatar size="small" :src="userAvatar" />
                <span class="user-name">管理员</span>
                <el-icon><ArrowDown /></el-icon>
              </span>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item>个人中心</el-dropdown-item>
                  <el-dropdown-item>设置</el-dropdown-item>
                  <el-dropdown-item divided @click="handleLogout">退出登录</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
          <router-view v-slot="{ Component }">
            <transition name="fade" mode="out-in">
              <component :is="Component" />
            </transition>
          </router-view>
        </div>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { Operation, HomeFilled, InfoFilled, Goods, ShoppingCart, User, ArrowDown } from '@element-plus/icons-vue';

const route = useRoute();
const router = useRouter();
const activeIndex = ref('/');
const userAvatar = 'https://trae-api-cn.mchost.guru/api/ide/v1/text_to_image?prompt=professional%20business%20avatar%20portrait&image_size=square';

const handleSelect = (key: string) => {
  router.push(key);
};

const handleLogout = () => {
  ElMessage.success('退出登录成功');
  router.push('/login');
};

const updateActiveIndex = () => {
  activeIndex.value = route.path;
};

onMounted(() => {
  updateActiveIndex();
});

watch(() => route.path, () => {
  updateActiveIndex();
});
</script>

<style scoped>
.app {
  height: 100vh;
  width: 100%;
}

.app-container {
  height: 100vh;
  width: 100%;
  display: flex;
}

.app-aside {
  width: 200px;
  background-color: var(--bg-header);
  box-shadow: var(--shadow-sm);
  overflow-y: auto;
  flex-shrink: 0;
}

.main-content-container {
  flex: 1;
  height: 100%;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
}

.top-bar {
  background-color: var(--bg-header);
  box-shadow: var(--shadow-sm);
  padding: 0 var(--spacing-xl);
  height: 64px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  position: sticky;
  top: 0;
  z-index: var(--z-index-sticky);
}

.user-info {
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
  cursor: pointer;
  padding: var(--spacing-sm) var(--spacing-md);
  border-radius: var(--border-radius);
  transition: all var(--transition-normal);
  position: relative;
}

.user-info:hover {
  background: var(--color-gray-100);
  transform: translateY(-1px);
}

.user-name {
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-medium);
  color: var(--text-primary);
}

.el-menu-vertical-demo {
  height: 100%;
  border-right: none;
}

/* 菜单基础样式重置 */
.app-aside :deep(.el-menu-vertical-demo) {
  background-color: var(--bg-header) !important;
  border-right: none;
}

/* 普通菜单项 */
.app-aside :deep(.el-menu-item) {
  background-color: transparent !important;
  color: var(--text-primary) !important;
  transition: all var(--transition-fast) !important;
}

.app-aside :deep(.el-menu-item:hover) {
  background-color: rgba(255, 152, 0, 0.15) !important;
  color: var(--color-primary-700) !important;
  font-weight: var(--font-weight-medium) !important;
}

.app-aside :deep(.el-menu-item.is-active) {
  background-color: rgba(255, 152, 0, 0.25) !important;
  color: var(--color-primary-700) !important;
  font-weight: var(--font-weight-semibold) !important;
}

/* 子菜单容器 */
.app-aside :deep(.el-sub-menu) {
  background-color: transparent !important;
}

/* 子菜单标题（关键修复） */
.app-aside :deep(.el-sub-menu__title) {
  background-color: transparent !important;
  color: var(--text-primary) !important;
  transition: all var(--transition-fast) !important;
}

.app-aside :deep(.el-sub-menu__title:hover) {
  background-color: rgba(255, 152, 0, 0.15) !important;
  color: var(--color-primary-700) !important;
  font-weight: var(--font-weight-medium) !important;
}

.app-aside :deep(.el-sub-menu.is-active > .el-sub-menu__title) {
  background-color: rgba(255, 152, 0, 0.25) !important;
  color: var(--color-primary-700) !important;
  font-weight: var(--font-weight-semibold) !important;
}

/* 子菜单展开后的面板 */
.app-aside :deep(.el-sub-menu .el-menu) {
  background-color: transparent !important;
}

/* Logo部分样式 */
.menu-logo {
  display: flex;
  align-items: center;
  gap: var(--spacing-md);
  padding: var(--spacing-lg);
  border-bottom: 1px solid var(--border-color);
  margin-bottom: var(--spacing-sm);
}

.logo-icon {
  font-size: 24px;
  color: var(--color-primary-600);
}

.logo-text {
  font-size: var(--font-size-lg);
  font-weight: var(--font-weight-semibold);
  color: var(--text-primary);
}

/* 页面切换动画 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* 滚动动画 */
.scroll-reveal {
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.6s ease;
}

.scroll-reveal.active {
  opacity: 1;
  transform: translateY(0);
}

/* 响应式设计 */
@media (max-width: 768px) {
  .app-aside {
    width: 60px !important;
  }
  
  .menu-logo .logo-text {
    display: none;
  }
  
  .el-menu-item span,
  .el-sub-menu__title span {
    display: none;
  }
  
  .el-menu-item,
  .el-sub-menu__title {
    text-align: center;
    padding: 12px 0 !important;
  }
  
  .el-sub-menu__icon-arrow {
    display: none;
  }
}

@media (max-width: 480px) {
  .app-container {
    flex-direction: column;
  }
  
  .app-aside {
    width: 100% !important;
    height: auto;
  }
  
  .el-menu-vertical-demo {
    display: flex;
    flex-direction: row;
    overflow-x: auto;
  }
  
  .menu-logo {
    display: none;
  }
  
  .el-menu-item,
  .el-sub-menu__title {
    white-space: nowrap;
    padding: 12px 16px !important;
  }
  
  .el-menu-item span,
  .el-sub-menu__title span {
    display: inline;
  }
  
  .el-menu-item {
    margin: 0 4px;
  }
}
</style>
