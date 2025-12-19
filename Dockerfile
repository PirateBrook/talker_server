FROM python:3.11-slim-bookworm

# 替换 Debian 软件源为阿里云
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list.d/debian.sources

# 安装 uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

# 利用 Docker 缓存层
COPY pyproject.toml uv.lock ./

# 使用 uv 系统级安装依赖 (不创建 venv，直接装在容器 python 环境中)
# 配置阿里云 PyPI 镜像
ENV UV_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/

RUN uv sync --frozen --no-cache

COPY . .

# 启动命令 (生产环境使用 gunicorn 管理 uvicorn)
CMD ["gunicorn", "app.main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "-b", "0.0.0.0:8000"]
