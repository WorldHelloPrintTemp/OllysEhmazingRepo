FROM node:bookworm-slim AS builder
ENV NODE_ENV=production
WORKDIR /app
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"
COPY ["package.json", "bun.lock", "./"]
RUN bun install
COPY . .
RUN bun run build
EXPOSE 3000
CMD ["bun", "run", "start"]
