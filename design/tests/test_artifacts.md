# 测试产物与桩说明

本文档列出本次新增测试所包含的桩（stub）与驱动模块的位置，便于审阅与复用。

1) 单元测试（桩）
 - 文件：`springboot/src/test/java/com/example/springboot/service/impl/AdjustRoomServiceImplTest.java`
 - 使用：Mockito `@Mock` 注入的 `AdjustRoomMapper` 作为桩。通过 `when(...).thenReturn(...)` 或 `thenThrow(...)` 来驱动不同场景。

2) 集成级别的桩（Spring 桩注入）
 - 文件：`springboot/src/test/java/com/example/springboot/service/AdjustRoomServiceIntegrationTest.java`
 - 使用：`@MockBean AdjustRoomMapper` 将 Mapper 替换为 Spring 上下文中的桩，从而测试 Service 在 Spring 环境下的装配与行为，而无需真实数据库。

3) 运行日志与结果
 - 建议将本地 mvn test 的输出保存为 `design/tests/test_results.txt` 以便持续集成时参考。

4) 扩展说明
 - 若需对 Controller 编写 MockMvc 驱动的集成测试，可添加 `@WebMvcTest` 并使用 `@MockBean` 注入底层 Service。该方法同样无需真实 DB。
