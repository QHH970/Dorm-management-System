**项目概况**:
- 名称: 高校宿舍管理系统（SpringBoot + Vue）
- 位置: `springboot` 模块含后端，`vue` 模块含前端。

**主要用例（摘要）**
- 用户登录（学生 / 宿管 / 管理员）
- 查看“我的宿舍”
- 申请调宿（换宿）并审批
- 报修申请与处理
- 公告发布与查看
- 访客登记
- 学生/房间/管理员 CRUD 管理

**事件流（示例：学生登录）**
1. 前端提交用户名/密码至 `StudentController.login`。
2. `StudentController` 调用 `StudentService.stuLogin(username,password)`。
3. `StudentService` 通过 `StudentMapper` 查询数据库；若验证通过返回 `Student` 实体。
4. `StudentController` 将 `User`/`Student` 对象与 `Identity` 写入 `HttpSession`，返回成功结果；否则返回错误。

**事件流（示例：调宿申请）**
1. 学生提交 `AdjustRoom` 到 `AdjustRoomController.add`。
2. `AdjustRoomService.addApply` 保存申请记录。
3. 宿管审批调用 `AdjustRoomController.update(state=true)`：若通过，先调用 `DormRoomService.adjustRoomUpdate(adjustRoom)` 更新床位字段与容量，再更新 `AdjustRoom` 状态。
4. 返回操作结果或错误（目标床位已占用 / 重复操作）。

**边界类（Controller）**
- `StudentController`：学生登录、增删查改、学生统计、床位查询
- `DormRoomController`：房间 CRUD、床位检查、统计、我的宿舍
- `AdjustRoomController`：调宿申请的增删改查与审批流程
- `RepairController`：报修单增删改查、统计
- `NoticeController`：公告 CRUD、首页公告
- `VisitorController`：访客登记 CRUD
- `DormManagerController` / `AdminController`：管理员相关接口
- `MainController`：会话/身份管理（加载、退出）

**控制类（Service）**
- `StudentService`、`DormRoomService`、`AdjustRoomService`、`RepairService`、`NoticeService`、`VisitorService`、`DormManagerService`、`AdminService`
- 角色：执行业务逻辑、校验、调用 Mapper 持久化操作

**实体类（Entity）**
- `Student`：`username`, `password`, `name`, `age`, `gender`, `phoneNum`, `email`, `avatar`
- `DormRoom`：`dormRoomId`, `dormBuildId`, `floorNum`, `maxCapacity`, `currentCapacity`, `firstBed`, `secondBed`, `thirdBed`, `fourthBed`
- `AdjustRoom`：`id`, `username`, `currentRoomId`, `currentBedId`, `towardsRoomId`, `towardsBedId`, `state`, `applyTime`, `finishTime`
- `Repair`：`id`, `repairer`, `dormBuildId`, `dormRoomId`, `title`, `content`, `state`, `orderBuildTime`, `orderFinishTime`
- `Notice`：`id`, `title`, `content`, `author`, `releaseTime`
- `Visitor`：`id`, `visitorName`, `gender`, `phoneNum`, `originCity`, `visitTime`, `content`
- `DormManager`、`Admin`：管理员用户字段
- `User`：用于登录传递（`username`,`password`,`identity`,`avatar`）

**类图**
- PlantUML 源文件：`design/class_diagram.puml`（已生成）
- 建议渲染方法：使用 VS Code PlantUML 插件或 PlantUML jar 渲染（示例命令在下方）

**本次操作结果**
- 已生成并保存：`design/class_diagram.puml`（PlantUML 源）
- 目标：渲染并保存 `design/class_diagram.png`、`design/class_diagram.svg`

**如何在本机渲染（如果自动渲染失败）**
1. 安装 Java：确保 `java` 可用。
2. 下载 `plantuml.jar`：从 https://plantuml.com/zh/download 下载 `plantuml.jar`。
3. 在 `cmd.exe` 中运行：
```bat
java -jar C:\path\to\plantuml.jar d:\Java_project\springboot+vue高校宿舍管理系统\design\class_diagram.puml
```
4. 或在 VS Code 中安装 `PlantUML` 插件，打开 `class_diagram.puml`，点击预览并导出。

---

如果你允许，我接下来会尝试调用 PlantUML 公共服务器将 `design/class_diagram.puml` 渲染为 PNG 与 SVG 并保存到 `design/`（需要网络访问）。如无网络或请求失败，我会把失败原因和手动渲染步骤写入报告。