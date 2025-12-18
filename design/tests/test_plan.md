# 测试计划与用例 — 调宿相关模块

目录
- 概述
- 测试目标
- 测试范围
- 测试环境与依赖
- 设计的测试用例（单元 + 集成）
- 异常/边界用例
- 测试驱动与桩模块
- 运行测试的命令

## 概述
本测试计划针对 `AdjustRoom` 相关服务与控制流程进行单元与集成测试，着重覆盖正常路径与异常情况（如 DB 异常、床位冲突、无记录删除等）。

## 测试目标
- 验证 `AdjustRoomServiceImpl` 的 CRUD 行为；
- 验证 Service 层在异常情况下的异常传播或正确返回值；
- 验证 Spring 上下文中 `AdjustRoomServiceImpl` 正确装配（集成测试），同时使用桩替代底层 Mapper 以避免真实 DB 依赖。

## 测试范围
- 单元测试：`AdjustRoomServiceImplTest`（使用 Mockito 模拟 `AdjustRoomMapper`）；
- 集成测试：`AdjustRoomServiceIntegrationTest`（使用 `@SpringBootTest` 与 `@MockBean`）；

## 测试环境与依赖
- JDK 11+
- Maven (项目使用 Maven 管理依赖)
- 测试框架：JUnit 5（已在项目依赖中）、Mockito（用于模拟 Mapper）

## 设计的测试用例（摘要）
- addApply_success：当 Mapper 正常返回 1，service 返回 1；
- addApply_mapperThrows_exceptionPropagated：Mapper 抛异常时 service 将异常向上抛出；
- find_returnsPage：模拟分页查询返回 Page 对象；
- deleteAdjustment_nonExisting_returnsZero：删除不存在 ID，mapper 返回 0，service 返回 0；
- updateApply_success：更新成功返回 1；
- 集成测试：验证 Spring 能装配 service，并在 @MockBean 下以桩方式运行 addApply 与 find。

## 异常/边界用例（重点）
- Mapper 抛异常（数据库不可达、SQL 错误）：测试 service 层是否合理传播异常或在事务中回滚；
- 传入 null 或必填字段缺失：测试是否会抛出 NPE 或自定义校验失败（目前 service 未做显式校验，建议在 Controller 层校验）；
- 分页参数异常（如 pageNum<=0）：测试 service 的表现（当前直接传给 Page，可能会抛异常或返回空页）。

## 测试驱动与桩模块
- 单元测试使用 Mockito 桩 `AdjustRoomMapper`（位于测试源码中）；
- 集成测试使用 Spring 的 `@MockBean` 注入到应用上下文，替代真实 Mapper，从而在不配置数据库的情况下验证 Spring wiring 与 service 行为。

## 运行测试
在项目根目录（含 `pom.xml`）下运行：
```bash
mvn -DskipTests=false test
```
或只运行调宿相关测试：
```bash
mvn -Dtest=AdjustRoomServiceImplTest#addApply_success test
```

## 后续扩展建议
- 为 `AdjustRoomServiceImpl` 补充业务校验（参数校验）并编写对应单元测试；
- 添加 Controller 层的 MockMVC 测试以验证请求校验与路由；
- 若需真实数据库验证，添加基于 H2 的集成测试 profile 并准备初始化脚本。
