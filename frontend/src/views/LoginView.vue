<template>
  <div class="login-container" :class="`theme-${currentTheme}`">
    <!-- 背景效果 -->
    <canvas ref="bgCanvas" class="background-canvas"></canvas>
    
    <!-- 主题选择器 -->
    <div class="theme-selector">
      <el-switch 
        v-model="currentTheme" 
        active-value="orange" 
        inactive-value="blue"
        @change="changeTheme"
        class="theme-switch"
        :active-icon="Sunny"
        :inactive-icon="Cloudy"
        inline-prompt
      >
      </el-switch>
    </div>
    
    <div class="login-card">
      <div class="login-header">
        <h1 class="login-title">ERP系统</h1>
        <p class="login-subtitle">企业资源管理平台</p>
      </div>
      <el-form :model="loginForm" :rules="loginRules" ref="loginFormRef" class="login-form">
        <el-form-item prop="username" class="login-form-item">
          <el-input
            v-model="loginForm.username"
            placeholder="请输入用户名"
            prefix-icon="User"
            class="login-input"
          />
        </el-form-item>
        <el-form-item prop="password" class="login-form-item">
          <el-input
            v-model="loginForm.password"
            type="password"
            placeholder="请输入密码"
            prefix-icon="Lock"
            show-password
            class="login-input"
          />
        </el-form-item>
        <el-form-item class="login-form-item">
          <el-button type="primary" @click="handleLogin" class="login-button">
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, onUnmounted, watch } from 'vue';
import { ElMessage } from 'element-plus';
import { useRouter } from 'vue-router';
import { Cloudy, Sunny } from '@element-plus/icons-vue';

const router = useRouter();
const loginFormRef = ref();
const bgCanvas = ref<HTMLCanvasElement | null>(null);
const animationId = ref<number | null>(null);
const particles = ref<Particle[]>([]);
const shapes = ref<Shape[]>([]);

// 主题配置
const themes = [
  {
    id: 'blue',
    color: '#3b82f6',
    particleColor: 'rgba(59, 130, 246, 0.6)',
    secondaryColor: 'rgba(147, 197, 253, 0.4)',
    bgColor: 'linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%)',
    particleCount: 80,
    shapeCount: 15,
    icon: 'Cloud'
  },
  {
    id: 'orange',
    color: '#f97316',
    particleColor: 'rgba(249, 115, 22, 0.6)',
    secondaryColor: 'rgba(254, 215, 170, 0.4)',
    bgColor: 'linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%)',
    particleCount: 100,
    shapeCount: 20,
    icon: 'Sunny'
  }
];

const currentTheme = ref('blue');

const loginForm = reactive({
  username: '',
  password: ''
});

const loginRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' }
  ]
};

// 粒子类
class Particle {
  x: number;
  y: number;
  size: number;
  speedX: number;
  speedY: number;
  color: string;
  opacity: number;
  life: number;
  maxLife: number;

  constructor(canvas: HTMLCanvasElement, color: string) {
    this.x = Math.random() * canvas.width;
    this.y = Math.random() * canvas.height;
    this.size = Math.random() * 3 + 1;
    this.speedX = (Math.random() - 0.5) * 1;
    this.speedY = (Math.random() - 0.5) * 1;
    this.color = color;
    this.opacity = Math.random() * 0.5 + 0.2;
    this.life = 0;
    this.maxLife = Math.random() * 300 + 200;
  }

  update() {
    this.x += this.speedX;
    this.y += this.speedY;
    this.life++;
    
    // 边界检测
    const canvas = bgCanvas.value;
    if (canvas) {
      if (this.x < 0 || this.x > canvas.width) this.speedX *= -1;
      if (this.y < 0 || this.y > canvas.height) this.speedY *= -1;
    }
    
    // 生命周期
    if (this.life > this.maxLife) {
      this.opacity -= 0.01;
    }
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.save();
    ctx.globalAlpha = this.opacity;
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.restore();
  }
}

// 几何图形类
class Shape {
  x: number;
  y: number;
  size: number;
  type: 'triangle' | 'circle' | 'airplane';
  rotation: number;
  rotationSpeed: number;
  color: string;
  opacity: number;
  scale: number;
  scaleSpeed: number;

  constructor(canvas: HTMLCanvasElement, color: string) {
    this.x = Math.random() * canvas.width;
    this.y = Math.random() * canvas.height;
    this.size = Math.random() * 30 + 10;
    this.type = ['triangle', 'circle', 'airplane'][Math.floor(Math.random() * 3)] as 'triangle' | 'circle' | 'airplane';
    this.rotation = Math.random() * Math.PI * 2;
    this.rotationSpeed = (Math.random() - 0.5) * 0.01;
    this.color = color;
    this.opacity = Math.random() * 0.3 + 0.1;
    this.scale = 0.5 + Math.random() * 0.5;
    this.scaleSpeed = (Math.random() - 0.5) * 0.005;
  }

  update() {
    this.rotation += this.rotationSpeed;
    this.scale += this.scaleSpeed;
    
    if (this.scale > 1.2 || this.scale < 0.3) {
      this.scaleSpeed *= -1;
    }
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.save();
    ctx.globalAlpha = this.opacity;
    ctx.translate(this.x, this.y);
    ctx.rotate(this.rotation);
    ctx.scale(this.scale, this.scale);
    
    ctx.fillStyle = this.color;
    
    switch (this.type) {
      case 'triangle':
        ctx.beginPath();
        ctx.moveTo(0, -this.size);
        ctx.lineTo(this.size, this.size);
        ctx.lineTo(-this.size, this.size);
        ctx.closePath();
        ctx.fill();
        break;
      case 'circle':
        ctx.beginPath();
        ctx.arc(0, 0, this.size, 0, Math.PI * 2);
        ctx.fill();
        break;
      case 'airplane':
        // 简单飞机轮廓
        ctx.beginPath();
        ctx.moveTo(0, -this.size);
        ctx.lineTo(this.size, this.size);
        ctx.lineTo(this.size * 0.3, this.size * 0.5);
        ctx.lineTo(this.size * 0.3, 0);
        ctx.lineTo(-this.size * 0.3, 0);
        ctx.lineTo(-this.size * 0.3, this.size * 0.5);
        ctx.lineTo(-this.size, this.size);
        ctx.closePath();
        ctx.fill();
        break;
    }
    
    ctx.restore();
  }
}

// 初始化Canvas
const initCanvas = () => {
  const canvas = bgCanvas.value;
  if (!canvas) return;
  
  const ctx = canvas.getContext('2d');
  if (!ctx) return;
  
  // 设置Canvas尺寸
  resizeCanvas();
  
  // 清空现有粒子和图形
  particles.value = [];
  shapes.value = [];
  
  // 获取当前主题
  const theme = themes.find(t => t.id === currentTheme.value);
  if (!theme) return;
  
  // 创建粒子
  for (let i = 0; i < theme.particleCount; i++) {
    particles.value.push(new Particle(canvas, theme.particleColor));
  }
  
  // 创建几何图形
  for (let i = 0; i < theme.shapeCount; i++) {
    shapes.value.push(new Shape(canvas, theme.secondaryColor));
  }
  
  // 开始动画
  animate();
};

// 调整Canvas尺寸
const resizeCanvas = () => {
  const canvas = bgCanvas.value;
  if (!canvas) return;
  
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
};

// 动画循环
const animate = () => {
  const canvas = bgCanvas.value;
  if (!canvas) return;
  
  const ctx = canvas.getContext('2d');
  if (!ctx) return;
  
  // 清空画布
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  
  // 更新和绘制粒子
  particles.value.forEach((particle, index) => {
    particle.update();
    particle.draw(ctx);
    
    // 移除死亡粒子并创建新粒子
    if (particle.opacity <= 0) {
      particles.value.splice(index, 1);
      const theme = themes.find(t => t.id === currentTheme.value);
      if (theme) {
        particles.value.push(new Particle(canvas, theme.particleColor));
      }
    }
  });
  
  // 更新和绘制几何图形
  shapes.value.forEach(shape => {
    shape.update();
    shape.draw(ctx);
  });
  
  // 绘制粒子连线
  drawConnections(ctx);
  
  // 继续动画
  animationId.value = requestAnimationFrame(animate);
};

// 绘制粒子连线
const drawConnections = (ctx: CanvasRenderingContext2D) => {
  const theme = themes.find(t => t.id === currentTheme.value);
  if (!theme) return;
  
  for (let i = 0; i < particles.value.length; i++) {
    for (let j = i + 1; j < particles.value.length; j++) {
      const p1 = particles.value[i];
      const p2 = particles.value[j];
      
      const distance = Math.sqrt(
        Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2)
      );
      
      if (distance < 100) {
        ctx.save();
        ctx.globalAlpha = (100 - distance) / 100 * 0.2;
        ctx.beginPath();
        ctx.moveTo(p1.x, p1.y);
        ctx.lineTo(p2.x, p2.y);
        ctx.strokeStyle = theme.particleColor;
        ctx.lineWidth = 0.5;
        ctx.stroke();
        ctx.restore();
      }
    }
  }
};

// 切换主题
const changeTheme = (themeId: string) => {
  initCanvas();
};

// 处理登录
const handleLogin = async () => {
  if (!loginFormRef.value) return;
  
  try {
    await loginFormRef.value.validate();
    // 模拟登录成功
    ElMessage.success('登录成功');
    router.push('/');
  } catch (error) {
    ElMessage.error('请填写正确的登录信息');
  }
};

// 生命周期
onMounted(() => {
  initCanvas();
  window.addEventListener('resize', resizeCanvas);
});

onUnmounted(() => {
  if (animationId.value) {
    cancelAnimationFrame(animationId.value);
  }
  window.removeEventListener('resize', resizeCanvas);
});
</script>

<style scoped>
.login-container {
  min-height: 100vh;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  margin: 0;
  padding: 0;
  transition: background 0.5s ease;
}

/* 主题背景 */
.theme-blue {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
}

.theme-orange {
  background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
}

.theme-purple {
  background: linear-gradient(135deg, #f5f3ff 0%, #ede9fe 100%);
}

/* 背景画布 */
.background-canvas {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  pointer-events: none;
}

/* 主题选择器 */
.theme-selector {
  position: absolute;
  top: 20px;
  right: 20px;
  z-index: 20;
  margin-right: 10px;
}

.theme-switch {
  background-color: transparent;
  padding: 0;
  border-radius: var(--border-radius);
  box-shadow: none;
  border: none;
}

/* 调整Switch内部间距 */
:deep(.el-switch) {
  --el-switch-on-color: #f97316 !important;
  --el-switch-off-color: #3b82f6 !important;
}

:deep(.el-switch__core) {
  width: 60px !important;
  height: 32px !important;
  border-radius: 16px !important;
}

:deep(.el-switch__core .el-switch__button) {
  width: 28px !important;
  height: 28px !important;
  border-radius: 50% !important;
  margin: 2px !important;
}

:deep(.el-switch__icon) {
  font-size: 18px !important;
  color: white !important;
  font-weight: bold !important;
  transform: scale(1) !important;
}

:deep(.el-switch__icon--active) {
  margin-left: -2px !important;
}

:deep(.el-switch__icon--inactive) {
  margin-right: -2px !important;
}

.theme-switch-icon {
  font-size: 18px;
  font-weight: bold;
}

/* 自定义Switch样式 */
:deep(.el-switch) {
  position: relative;
}

:deep(.el-switch__core) {
  width: 70px;
  height: 32px;
  border-radius: 16px;
  overflow: hidden;
}

:deep(.el-switch__core .el-switch__button) {
  /* 保留上面的代码，加上下面这行 */
  display: flex;
  align-items: center;
  justify-content: center;
}



:deep(.el-switch.is-checked .el-switch__core) {
  background-color: #f97316;
}

:deep(.el-switch .el-switch__core) {
  background-color: #3b82f6;
}

.login-card {
  width: 400px;
  padding: var(--spacing-2xl);
  background: rgba(255, 255, 255, 0.9);
  border-radius: var(--border-radius-xl);
  box-shadow: var(--shadow-xl);
  backdrop-filter: blur(10px);
  z-index: 10;
  transition: all var(--transition-normal);
  position: relative;
  overflow: hidden;
}

.login-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, var(--color-primary-400), var(--color-primary-600));
}

.login-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
}

.login-header {
  text-align: center;
  margin-bottom: var(--spacing-xl);
  position: relative;
  z-index: 1;
}

.login-title {
  font-size: var(--font-size-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin: 0 0 var(--spacing-sm) 0;
  font-family: var(--font-family-display);
  animation: fadeInDown 0.6s ease-out;
}

.login-subtitle {
  font-size: var(--font-size-base);
  color: var(--text-secondary);
  margin: 0;
  animation: fadeInUp 0.6s ease-out 0.2s both;
}

.login-form {
  width: 100%;
  position: relative;
  z-index: 1;
}

.login-form-item {
  margin-bottom: var(--spacing-lg);
  animation: fadeInUp 0.6s ease-out;
}

.login-form-item:nth-child(2) {
  animation-delay: 0.3s;
  animation-fill-mode: both;
}

.login-form-item:nth-child(3) {
  animation-delay: 0.4s;
  animation-fill-mode: both;
}

.login-input {
  border-radius: var(--border-radius);
  height: 48px;
  font-size: var(--font-size-base);
  border: 1px solid var(--border-color);
  transition: all var(--transition-fast);
  background: rgba(255, 255, 255, 0.9);
}

.login-input:focus {
  border-color: var(--color-primary-400);
  box-shadow: 0 0 0 3px rgba(255, 152, 0, 0.1);
}

.login-button {
  width: 100%;
  height: 48px;
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-semibold);
  border-radius: var(--border-radius);
  background: linear-gradient(135deg, var(--color-primary-500), var(--color-primary-700));
  border: none;
  transition: all var(--transition-normal);
  color: white;
  position: relative;
  overflow: hidden;
  animation: fadeInUp 0.6s ease-out 0.5s both;
}

.login-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(255, 152, 0, 0.3);
}

.login-button:active {
  transform: translateY(0);
}

.login-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transition: left 0.6s;
}

.login-button:hover::before {
  left: 100%;
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
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
  .login-card {
    width: 90%;
    padding: var(--spacing-xl);
  }
  
  .login-title {
    font-size: var(--font-size-2xl);
  }
  
  .theme-selector {
    top: 10px;
    right: 10px;
    margin-right: 8px;
  }
  
  .theme-switch {
    padding: 0;
  }
  
  .theme-switch-icon {
    font-size: 32px;
  }
  
  :deep(.el-switch__core) {
    width: 50px !important;
    height: 28px !important;
    border-radius: 14px !important;
  }
  
  :deep(.el-switch__core .el-switch__button) {
    width: 24px !important;
    height: 24px !important;
    border-radius: 50% !important;
    margin: 2px !important;
  }
  
  :deep(.el-switch__icon) {
    font-size: 32px !important;
    transform: scale(1) !important;
  }
}

@media (max-width: 480px) {
  .login-card {
    width: 95%;
    padding: var(--spacing-lg);
  }
  
  .login-title {
    font-size: var(--font-size-xl);
  }
  
  .theme-selector {
    top: 10px;
    right: 10px;
    margin-right: 6px;
  }
  
  .theme-switch {
    padding: 0;
  }
  
  .theme-switch-icon {
    font-size: 14px;
  }
  
  :deep(.el-switch__core) {
    width: 45px !important;
    height: 24px !important;
    border-radius: 12px !important;
  }
  
  :deep(.el-switch__core .el-switch__button) {
    width: 20px !important;
    height: 20px !important;
    border-radius: 50% !important;
    margin: 2px !important;
  }
  
  :deep(.el-switch__icon) {
    font-size: 14px !important;
    transform: scale(1) !important;
  }

}
</style>