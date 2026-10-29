# Ollama Cheat Sheet — Print One Page

**Asdale Dynamics, LLC** — Local AI for beginners. No account. No paid tier.
Print this sheet and keep it by your computer.

---

## Install Ollama

**Mac / Linux:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**Windows:** download the installer from [ollama.com](https://ollama.com)

**Check it worked:**
```bash
ollama --version
```

---

## Your first model

Download and start chatting:

```bash
ollama run llama3.2:3b
```

At the `>>>` prompt, type a message and press Enter.

Exit the chat:
- Type `/bye`, or
- Press `Ctrl+D`

---

## Common models

| Model | Download size | RAM needed | Good for |
|-------|---------------|------------|----------|
| `llama3.2:1b` | ~1 GB | 4–8 GB | Old/slow computers |
| `llama3.2:3b` | ~2 GB | 8 GB | Everyday chatting |
| `llama3.1:8b` | ~4.7 GB | 8–16 GB | Smarter answers |
| `nomic-embed-text` | ~274 MB | 4 GB | Text embeddings (advanced) |

Download only: `ollama pull llama3.2:3b`

---

## Manage models

```bash
ollama list            # show downloaded models
ollama pull <model>    # download a model
ollama run <model>     # download + chat
ollama rm <model>      # delete a model
ollama --help          # all commands
```

---

## Free offline frontends

- **Ollama terminal:** `ollama run <model>` — works offline after download
- **Enchanted:** Mac/iPhone/iPad app connecting to local Ollama
- **Msty:** Windows/Mac/Linux desktop app for local models
- **Open WebUI:** web interface running on your computer (advanced)

Frontends need internet once to install; after that, Ollama runs offline.

---

## Troubleshooting

- `ollama: command not found` → restart your terminal
- Slow chat → choose a smaller model, close other apps
- Out of memory → pick a smaller model (try `llama3.2:1b`)
- Frontend can't connect → run `ollama serve` in a terminal

---

**Credit:** Dylan Asdale, Asdale Dynamics, LLC (Indiana, formed October 2026).
Copyright (c) 2026 Asdale Dynamics, LLC. MIT License.
Educational information only — not medical advice.
