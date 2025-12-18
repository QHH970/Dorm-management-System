**宿舍管理系统 — 类图 v2 说明**

文件：`design/class_diagram_v2.puml`（图像已渲染为 PNG/SVG）

目的：用更直观的图形元素展示类之间的关系（继承、组合/聚合、关联、依赖），并标注典型的多重性（multiplicity），便于开发与数据库建模。

主要类和关键设计点：
- `User`（抽象基类）：抽象出所有用户共有字段（id、username、password、phoneNum、email）。
  - `Student`、`Admin`、`DormManager` 继承 `User`（泛化/继承关系）。
- `DormRoom`：表示宿舍房间，包含容量、楼栋、楼层等；与 `Bed` 组成关系（composition）。
- `Bed`：床位作为资源，被 `DormRoom` 组合管理（`DormRoom *-- Bed`），床位可被 `Student` 占用。
- `Repair`：报修单，关联 `DormRoom` 与 `Student`（报修人），一对多关系（一个房间可有多条报修记录）。
- `AdjustRoom`：调房申请，指向申请学生与来源/目标床位（或房间），作为独立的申请记录实体。
- `Notice`：公告，由 `Admin` 发布（多条公告由一名管理员发布）。
- `Visitor`：访客记录，可与 `DormRoom` 建立访问关系（若需记录历史，应扩展为 `VisitRecord` 实体）。

关系与多重性要点（图中直接标注）：
- `DormRoom "1" *-- "1..4" Bed : contains`：房间与床位是组合关系，房间负责床位的生命周期；一间房有 1..4 张床（可根据实际宿舍类型调整）。
- `Student "0..1" --> "0..1" Bed : occupies`：学生可能占用一个床位（入学/分配前为 0），床位也可能为空（0..1）。
- `Repair "0..*" --> "1" DormRoom : relatedTo` 与 `Repair "0..*" --> "1" Student : reportedBy`：房间与学生可产生多条报修记录。
- `AdjustRoom` 指向申请人与源/目标床位，表示调房流程的历史记录。
- `Visitor "0..*" --> "1" DormRoom : visits`：访客可多次访问某房间（若需记录每次访问，建议建 `VisitRecord`）。
- `Notice "0..*" --> "1" Admin : publishedBy`：管理员发布公告关系。

在代码中如何验证/映射到实体/字段：
- 外键字段：在实体中查找 `bedId`, `dormRoomId`, `dormBuildId`, `applicantId` 等字段；这些是最直接的关联证据。
- 注解/映射：若使用 JPA，查看 `@OneToMany`, `@ManyToOne`, `@OneToOne`, `@ManyToMany`, `@JoinColumn`；若使用 MyBatis，查看 Mapper 的 SQL 与实体字段。
- 服务/控制器：Controller -> Service 为依赖关系（图中以接口形式表示服务），例如 `StudentController` 调用 `IStudentService`。

设计建议（若要进一步完善）：
- 把床位抽象为 `Bed` 有利于灵活分配与床位状态管理（换床、空床、维护中等）。
- 访客建议引入 `VisitRecord`：记录被访人、时间、时长、出入许可等审计信息。
- 报修与调房建议保留完整审批/处理历史（`RepairHistory` / `AdjustRoomHistory`），便于追踪状态变化与操作员信息。

如需：我可以
- 将 `class_diagram_v2.puml` 渲染为 SVG/PNG（我可以现在生成并把文件路径告诉你），
- 基于实际实体源码（例如 `springboot/src/main/java/.../entity/*.java`）自动核对并把确切的字段/注解写入说明以修正多重性。

---
文件路径：
- `design/class_diagram_v2.puml`
- `design/class_diagram_v2.png`（若已渲染）
- `design/class_diagram_v2.svg`（若已渲染）
