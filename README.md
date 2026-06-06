# Q1 Digital · Assistente de IA + Chatbot WhatsApp

Painel ultramoderno para conectar o WhatsApp, ativar a IA (Groq) e configurar os fluxos de
atendimento da **Q1 Digital**. O QR Code aparece direto na tela do navegador — sem terminal.

> Engenharia de conversão, automação e presença online para marcas que exigem evolução rápida.

---

## Recursos

- 🤖 Respostas automáticas por **fluxos** (palavras-chave) com a linguagem da Q1 Digital
- 🧠 **IA Groq** para responder qualquer pergunta fora dos fluxos
- 📲 **QR Code no navegador** para conectar o WhatsApp
- 🔒 Painel protegido por **senha** (Basic Auth) quando publicado online
- ⏸️ Pausa automática quando um humano assume a conversa

---

## Rodar localmente (no seu PC)

```bash
npm install
npm start
```

Abra **http://localhost:3000**, escaneie o QR Code e pronto.

---

## Publicar online no Railway (acessar o QR Code por um link)

O WhatsApp Web precisa de um servidor rodando 24h com Chromium — por isso usamos o **Railway**
(não funciona no Netlify/Vercel, que são apenas para sites estáticos).

### Passo a passo

1. Suba este projeto para um repositório no **GitHub**.
2. Acesse **https://railway.app** e faça login com o GitHub.
3. Clique em **New Project → Deploy from GitHub repo** e escolha este repositório.
4. O Railway detecta o `Dockerfile` automaticamente e faz o build.
5. Em **Variables**, adicione:

   | Variável | Valor | Para quê |
   |---|---|---|
   | `GROQ_API_KEY` | sua chave `gsk_...` | chave da IA (não fica no código) |
   | `PAINEL_SENHA` | uma senha forte | protege o painel público |
   | `PAINEL_USUARIO` | `q1` (opcional) | usuário de login do painel |

6. Em **Settings → Networking**, clique em **Generate Domain** para gerar a URL pública.
7. Acesse a URL, faça login (usuário `q1` + a senha definida) e escaneie o QR Code.

> 💡 Mantenha o serviço sempre ativo no Railway para o WhatsApp não desconectar.

---

## Variáveis de ambiente

| Variável | Obrigatória | Descrição |
|---|---|---|
| `GROQ_API_KEY` | recomendada | Chave da IA Groq. Tem prioridade sobre o painel. |
| `PAINEL_SENHA` | recomendada (online) | Ativa o login do painel. Sem ela, o painel fica aberto (uso local). |
| `PAINEL_USUARIO` | não | Usuário do login. Padrão: `q1`. |
| `PORT` | não | Porta do servidor. O Railway define automaticamente. |
| `PUPPETEER_EXECUTABLE_PATH` | não | Caminho do Chromium. Já configurado no `Dockerfile`. |

---

## Segurança

- A chave Groq **não** deve ficar no código. Use a variável `GROQ_API_KEY` no Railway.
- A pasta `.wwebjs_auth/` (sessão do WhatsApp) está no `.gitignore` e nunca vai para o GitHub.
- Sempre defina `PAINEL_SENHA` ao publicar online.

---

Projeto desenvolvido para a **Q1 Digital** · contato@q1digital.com.br · https://q1digital.com.br
