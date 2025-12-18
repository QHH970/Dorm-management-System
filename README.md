## 项目目录结构（已存在）

当前工作区为“Spring Boot 后端 + Vue 前端 + 文档资料”的混合目录，主要结构如下：

- `springboot/`：后端（Maven 工程根：`springboot/pom.xml`）
- `vue/`：前端（工程根：`vue/package.json`）
- `design/`：设计文档与 PlantUML 产物
- `图/`：各类 E-R/结构图
- `答辩视频/`：答辩材料与视频
- `dormitory.sql`：数据库脚本

## 建议之后整理后的结构

为了更清晰、更适合版本管理/部署，建议整理为：

- `backend/`：后端 Spring Boot
- `frontend/`：前端 Vue
- `docs/`：设计文档、图、答辩材料
- `db/`：SQL/数据库相关

对应的迁移建议：

- `springboot/` → `backend/`
- `vue/` → `frontend/`
- `design/`、`图/`、`答辩视频/` → `docs/`
- `dormitory.sql` → `db/dormitory.sql`

> 说明：仓库已提供根目录 `.gitignore`，默认忽略 `target/`、`node_modules/` 等构建产物。

## 启动方式（按当前目录）

### 后端（Spring Boot）

- 进入 `springboot/`
- 使用 Maven 运行（示例）：
  - `mvn spring-boot:run`

### 前端（Vue）

- 进入 `vue/`
- 安装依赖并启动（示例）：
  - `npm install`
  - `npm run serve`




