# Flutter 代码规范

## Project Overview
Talker Server client is a client library for the Talker Server backend. It provides a set of APIs to interact with the server, including user authentication, character management, and chat sessions.

## 同步策略
Talker Server client 中的接口和数据模型类需要与 server 端保持一致。
新增或修改 server 端的接口或数据模型类时，需要同步更新 client 端的代码。

## 代码规范
- frzeed 生成的类需要是 abstract class
- 所有的数据模型类都需要实现 toJson, fromJson 方法