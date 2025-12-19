
## 6. 开发环境快速上手 (Local Development)

### 6.1 启动基础设施 (Infrastructure Only)

为了在本地进行高效开发（利用 IDE 的调试功能），建议使用 `docker-compose.dev.yml` 仅启动数据库和中间件。

```bash
# 启动 Postgres, Redis, MongoDB 以及管理面板
docker-compose -f docker-compose.dev.yml up -d
```

### 6.2 访问管理面板

*   **pgAdmin (PostgreSQL GUI):** [http://localhost:5050](http://localhost:5050)
    *   Email: `admin@talker.com`
    *   Password: `admin`
    *   *连接数据库时 Host 请填写 `db` (如果在 docker 网络内) 或 `host.docker.internal` (如果从外部)*
*   **Mongo Express (MongoDB GUI):** [http://localhost:8081](http://localhost:8081)

### 6.3 本地运行代码

确保基础设施启动后，在本地终端运行：

```bash
# 安装依赖
uv sync

# 启动 FastAPI
uv run uvicorn app.main:app --reload

# 启动 Celery Worker
uv run celery -A app.worker.celery_app worker --loglevel=info
```
