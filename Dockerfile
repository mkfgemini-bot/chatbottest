# Q1 Digital - Assistente de IA WhatsApp
# Desenvolvido por Márcio
FROM node:20-bookworm-slim

# Chromium + dependências de runtime do Puppeteer
# Usamos || true em pacotes que podem ter nomes diferentes entre versões
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    chromium \
    ca-certificates \
    fonts-liberation \
    fonts-freefont-ttf \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    libcairo2 \
    libatspi2.0-0 \
    && (apt-get install -y --no-install-recommends libasound2 || apt-get install -y --no-install-recommends libasound2t64 || true) \
    && rm -rf /var/lib/apt/lists/*

# Usa o Chromium do sistema (não baixar outro)
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production

WORKDIR /app

# Instala dependências
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund

# Copia o restante do projeto
COPY . .

ENV PORT=3000
EXPOSE 3000

CMD ["node", "agenteq1.js"]
