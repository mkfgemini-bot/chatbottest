# Q1 Digital - Assistente de IA WhatsApp
# Base fixada em bookworm (estável) com Chromium para o whatsapp-web.js
FROM node:20-bookworm-slim

# Chromium + dependências de runtime do Puppeteer
RUN apt-get update && apt-get install -y --no-install-recommends \
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
    libasound2 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    libcairo2 \
    libatspi2.0-0 \
 && rm -rf /var/lib/apt/lists/*

# Usa o Chromium do sistema (não baixar outro)
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production

WORKDIR /app

# Instala dependências (sem precisar de lockfile perfeito)
COPY package.json ./
RUN npm install --omit=dev --no-audit --no-fund

# Copia o restante do projeto
COPY . .

ENV PORT=3000
EXPOSE 3000

CMD ["node", "agenteq1.js"]
