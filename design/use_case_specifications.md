# 用例规约（Use Case Specifications）

## 用例 UC_Login — 登录
- 参与者: Student / DormManager / Admin
- 描述: 用户输入用户名和密码，系统验证并建立会话。
- 前置条件: 用户在系统中已有账户。
- 触发条件: 用户在前端点击“登录”。
- 主成功场景:
  1. 前端提交 `username` 和 `password` 到对应 Controller（如 `StudentController.login`）。
  2. Controller 调用 Service（如 `StudentService.stuLogin`）。
  3. Service 查询数据库验证凭证，返回用户对象。
  4. Controller 将 `User` 对象和 `Identity` 写入 `HttpSession`，返回成功响应。
- 例外/扩展:
  - 3a. 验证失败 -> 返回错误信息“用户名或密码错误”。
  - 3b. 数据库异常 -> 返回通用错误响应。
- 结果: 成功后用户处于认证状态并能访问受限接口。

---

## 用例 UC_ViewMyRoom — 查看我的宿舍
- 参与者: Student
- 描述: 学生查看其所在宿舍及床位信息。
- 前置条件: 学生已登录并存在床位信息。
- 触发条件: 前端请求 `/room/getMyRoom/{name}`。
- 主成功场景:
  1. Controller (`DormRoomController`) 调用 `DormRoomService.judgeHadBed(name)`。
  2. Service 检索宿舍表（`dorm_room`）中 `firstBed/secondBed/...` 字段匹配该学生。
  3. 返回包含床位信息的 `DormRoom` 实体给前端。
- 扩展:
  - 如果未找到 -> 返回“不存在该生”。
- 结果: 前端展示宿舍与床位信息。

---

## 用例 UC_ApplyAdjust — 申请调宿/换宿
- 参与者: Student
- 描述: 学生提交调宿申请。
- 前置条件: 学生已登录，目标床位存在且未被占用。
- 触发条件: 前端提交 `AdjustRoom` 表单到 `/adjustRoom/add`。
- 主成功场景:
  1. `AdjustRoomController.add` 接收 `AdjustRoom` 对象。
  2. 调用 `AdjustRoomService.addApply` 将申请记录写入数据库。
  3. 返回成功。
- 扩展/异常:
  - 目标床位已被占用 -> 返回错误。
  - 重复申请 -> 返回特定错误码（例如 -2）。
- 结果: 申请记录在 `adjust_room` 表中可供宿管审批。

---

## 用例 UC_ApproveAdjust — 宿管审批调宿
- 参与者: DormManager
- 描述: 宿管审核并批准/拒绝调宿申请；批准则更新床位信息。
- 前置条件: 宿管已登录，待审批申请存在。
- 触发条件: 宿管在管理界面触发审批 -> 调用 `/adjustRoom/update/{state}`（state=true 表示批准）。
- 主成功场景:
  1. Controller 若 `state=true`，先调用 `DormRoomService.adjustRoomUpdate(adjustRoom)` 更新 `dorm_room` 中的床位字段与容量。
  2. 然后调用 `AdjustRoomService.updateApply(adjustRoom)` 更新申请状态（如已完成、记录 finish_time）。
  3. 返回成功。
- 扩展/异常:
  - 更新床位时发生冲突（目标床位已占） -> 返回错误并不更新申请状态。
  - 并发冲突 -> 返回冲突提示。
- 结果: 宿舍数据与申请状态一致。

---

## 用例 UC_SubmitRepair — 提交报修
- 参与者: Student
- 描述: 学生提交宿舍维修工单。
- 前置条件: 学生已登录。
- 触发条件: 提交 `/repair/add`。
- 主成功场景:
  1. `RepairController.add` 接收 `Repair` 对象。
  2. `RepairService.addNewOrder` 保存工单，设置初始 `state`、`orderBuildTime`。
  3. 返回成功。
- 扩展: 管理员或维修人员更新 `state` 与 `orderFinishTime`。

---

## 用例 UC_ViewNotice / UC_ManageNotice — 公告查看与管理
- 参与者: Student / DormManager / Admin
- 描述: 发布者（Admin）可以新增/更新/删除公告；所有用户可以查看首页公告。
- 触发条件: `/notice/*` 路径。

---

## 用例 UC_RegisterVisitor — 访客登记
- 参与者: Student / Visitor
- 描述: 提交访客信息，保存到 `visitor` 表。

---

其它管理类用例（学生管理、房间管理等）沿用 CRUD 模式，主成功场景为 Controller -> Service -> Mapper -> DB 的典型流程。
