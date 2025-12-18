**宿舍管理系统 — 边界类（Controller）、控制类（Service）与实体类说明**

说明：以下内容基于用例图中发现的用例—角色对（例如：学生提交调宿申请、宿管处理报修、管理员发布公告等），将用例映射为边界（Controller）接口、控制（Service）接口以及实体（Domain）模型。文档模仿之前图像与说明格式，便于开发与审阅。

---

**一、边界类（Controller） — 职责与代表用例**

1) `StudentController`（学生相关接口）
  - 职责：处理与学生直接交互的 HTTP 请求（登录认证、学生信息管理、统计、床位查询等）。
  - 代表用例：学生登录、学生注册/新增、删除学生、查询学生详情、修改学生信息、学生统计（按楼栋/年级/性别等）、床位查询（我的床位/可用床位）。
  - 常见 API：
    - `POST /student/login`：学生登录
    - `POST /student`：新增学生
    - `GET /student/{id}`：查询学生
    - `PUT /student/{id}`：更新学生
    - `DELETE /student/{id}`：删除学生
    - `GET /student/stats`：学生统计
    - `GET /student/my-room`：查询我的宿舍与床位

2) `DormRoomController`（房间/床位相关接口）
  - 职责：房间与床位的 CRUD、床位可用性检查、房间统计、查询“我的宿舍”等。
  - 代表用例：房间新增/编辑/删除/查询、床位检查（是否满员）、按楼栋/楼层统计、返回某学生的宿舍信息。
  - 常见 API：
    - `POST /dormroom`：新增房间
    - `GET /dormroom/{id}`：查询房间
    - `PUT /dormroom/{id}`：更新房间
    - `DELETE /dormroom/{id}`：删除房间
    - `GET /dormroom/{id}/beds`：床位检查/状态
    - `GET /dormroom/stats`：房间/宿舍统计

3) `AdjustRoomController`（调宿申请与审批）
  - 职责：处理学生发起的调宿申请及管理员/宿管的审批流程。
  - 代表用例：发起调宿申请、修改/撤销申请、审批（通过/拒绝）、查询申请状态、申请列表（按申请人/状态/时间）。
  - 常见 API：
    - `POST /adjust`：发起申请
    - `GET /adjust/{id}`：查询申请
    - `PUT /adjust/{id}`：更新申请（例如管理员审批）
    - `DELETE /adjust/{id}`：撤销申请
    - `GET /adjust`：按条件查询申请（申请人/状态/时间区间）

4) `RepairController`（报修单管理）
  - 职责：创建与处理报修单，支持查询、更新状态、统计（按楼栋/工单状态/时间）。
  - 代表用例：提交报修、修改报修、删除/关闭工单、查看报修列表、统计报修数量与处理时长。
  - 常见 API：
    - `POST /repair`：提交报修
    - `GET /repair/{id}`：查询报修单
    - `PUT /repair/{id}`：更新（派单、完成）
    - `DELETE /repair/{id}`：删除/撤销
    - `GET /repair/stats`：报修统计

5) `NoticeController`（公告管理）
  - 职责：公告的增删查改与首页公告查询（即公开展示）。
  - 代表用例：管理员发布公告、编辑公告、删除公告、首页获取最新公告。
  - 常见 API：
    - `POST /notice`：发布公告
    - `GET /notice/{id}`：查询公告
    - `PUT /notice/{id}`：编辑公告
    - `DELETE /notice/{id}`：删除公告
    - `GET /notice/latest`：首页公告

6) `VisitorController`（访客登记）
  - 职责：访客登记、访问记录的增删查改与查询。
  - 代表用例：登记访客、查询访客记录、编辑/撤销访客记录。
  - 常见 API：
    - `POST /visitor`：登记访客
    - `GET /visitor/{id}`：查询访客记录
    - `PUT /visitor/{id}`：更新访客记录
    - `DELETE /visitor/{id}`：删除访客记录

7) `AdminController`（管理员接口）
  - 职责：管理员账户与管理相关接口（身份管理、权限、系统统计等）。
  - 代表用例：管理员登录、管理员管理、查看系统总体统计、对报修/调宿进行高权限操作。
  - 常见 API：
    - `POST /admin/login`：管理员登录
    - `GET /admin/stats`：系统统计
    - `POST /admin`、`PUT /admin/{id}`：管理员帐号管理

---

**二、控制类（Service） — 业务逻辑集中地**

（每个 Controller 对应的 Service，用于封装业务规则、事务控制与持久层交互）

- `StudentService`：学生相关业务（注册/登录/信息维护/统计/床位查询/分配逻辑）。
- `DormRoomService`：房间与床位管理（创建房间、检查床位可用性、更新当前容量、房间统计）。
- `AdjustRoomService`：调宿申请逻辑（申请入库、审批流程、座位互换与分配冲突检测）。
- `RepairService`：报修工单管理（工单创建、派单、完成、统计报表）。
- `NoticeService`：公告发布/检索/缓存策略（首页公告可加缓存）。
- `VisitorService`：访客登记记录、历史查询与核验。
- `AdminService`：管理员权限、系统级操作（如重置数据、统计报表聚合）。

注：Service 层将调用 Mapper/Repository（持久层）来进行 CRUD，并负责事务与一致性（例如分配床位时必须在事务中同时修改 `DormRoom.currentCapacity` 与 `Student` 的床位引用）。

---

**三、实体类（Entity / Domain）与字段建议**

以下实体字段为建议模型，基于类图与常见实现。可根据实际数据库结构（如 `dormitory.sql`）或项目实体类做微调。

1) `User`（抽象基类）
  - id: Integer（主键）
  - username: String
  - password: String
  - phoneNum: String
  - email: String
  - createdAt: DateTime
  - updatedAt: DateTime
  - 说明：抽象公共字段，学生、管理员与宿管继承。

2) `Student`（继承 User）
  - studentId: Integer（主键或外键指向 User）
  - name: String
  - gender: String
  - age: Integer
  - dormBuildId: Integer（可空）
  - dormRoomId: Integer（可空）
  - bedId / bedLabel: String（可空）
  - avatar: String
  - status: String（在校/毕业/退宿）
  - 说明：学生为主体对象，参与报修、访客被访、调宿申请等。

3) `DormBuild`（楼栋信息）
  - dormBuildId: Integer
  - name: String
  - address: String
  - totalFloors: Integer
  - totalRooms: Integer
  - managerId: Integer（负责宿管）
  - 说明：楼栋是房间的上层组织，统计通常按楼栋聚合。

4) `DormRoom`（房间）
  - dormRoomId: Integer
  - dormBuildId: Integer（外键）
  - floorNum: Integer
  - roomNumber: String
  - maxCapacity: Integer
  - currentCapacity: Integer
  - status: String（正常/维修/封闭）
  - 说明：包含床位集合或床位标签；currentCapacity 与学生占用保持一致性。

5) `Bed`（床位，可选建模）
  - bedId: Integer
  - dormRoomId: Integer
  - bedLabel: String（first/second/third/fourth 或编号）
  - status: String（空闲/占用/维护）
  - occupantStudentId: Integer（可空）
  - 说明：若要灵活管理床位（换床、维护），建议单独建模，否则可用 `DormRoom` 的若干 bed 字段代替。

6) `AdjustRoom`（调宿申请）
  - adjustId: Integer
  - applicantId: Integer（Student）
  - applicantName: String
  - fromDormBuildId: Integer / fromRoomId / fromBedId
  - toDormBuildId: Integer / toRoomId / toBedId
  - reason: String
  - state: String（pending/approved/rejected/cancelled）
  - applyTime: DateTime
  - finishTime: DateTime
  - auditorId: Integer（管理员/宿管）
  - auditRemark: String
  - 说明：记录申请历史与审批结果，便于审计。

7) `Repair`（报修）
  - repairId: Integer
  - reporterId: Integer（Student 或 Visitor 或 DormManager）
  - reporterName: String
  - dormBuildId: Integer
  - dormRoomId: Integer
  - title: String
  - content: String
  - attachments: String / JSON（图片列表）
  - state: String（new/assigned/in_progress/completed/closed）
  - assignedTo: Integer（DormManager）
  - orderBuildTime: DateTime
  - orderFinishTime: DateTime
  - 说明：工单生命周期与处理记录可另建 history 表。

8) `Notice`（公告）
  - id: Integer
  - title: String
  - content: Text
  - authorId: Integer（Admin）
  - authorName: String
  - releaseTime: DateTime
  - scope: String（全校/指定楼栋/指定角色）
  - 说明：首页展示 latest 公告，可缓存。

9) `Visitor`（访客）
  - id: Integer
  - visitorName: String
  - phoneNum: String
  - originCity: String
  - visitTime: DateTime
  - visitedStudentId: Integer（被访学生）
  - visitedRoomId: Integer
  - reason: String
  - status: String（登记/离开/拒绝）
  - 说明：若需审计出入，建议扩展为 `VisitRecord`。

10) `DormManager`（宿管，继承 User）
  - managerId: Integer
  - username / password（继承）
  - dormBuildId: Integer（负责楼栋）
  - name / phoneNum / email
  - 说明：宿管承担工单处理、调宿审批等操作。

11) `Admin`（管理员，继承 User）
  - adminId: Integer
  - username / password（继承）
  - role: String（超级管理员/普通管理员）
  - name / phoneNum / email
  - 说明：系统管理与统计权限。

---

**四、从用例到类的映射（示例）

- 用例 “学生提交报修” → `StudentController` 调用 `RepairService.createRepair(repairDto)` → 新建 `Repair` 实体，写入 `dormRoomId`、`reporterId` 等字段。
- 用例 “宿管审批调宿” → `AdjustRoomController` 调用 `AdjustRoomService.audit(adjustId, auditorId, result)` → 更新 `AdjustRoom.state`、`finishTime`，若通过则在事务中更新 `Bed.occupantStudentId` 与 `DormRoom.currentCapacity`。
- 用例 “首页公告” → `NoticeController` 的 `GET /notice/latest` 调用 `NoticeService.getLatest()`（可启缓存）。

---

如果你需要，我可以：
- 基于 `springboot/src/main/java/com/example/springboot/entity/*.java` 自动对比并把每个实体的精确字段与注解写入此文档，修正上面建议字段为真实字段；
- 将上述说明与 `class_diagram_v2.puml` 中的类字段保持一致并重新渲染图像；
- 输出一个用于数据库迁移的初始 DDL 脚本草案（`dormitory_schema.sql`）。

文件已保存：`design/boundary_control_entity_spec.md`。
