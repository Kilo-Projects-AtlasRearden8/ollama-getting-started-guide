# Local AI with Ollama: A Beginner's Manual

**Asdale Dynamics, LLC** — beginner-friendly AI education, plain English, step by step.
No account. No paid tier. Everything runs on your own computer.

---

## 1. What is Ollama?

Ollama is a free, open-source app that lets you run large language models (LLMs) — the
kind of AI behind chatbots — directly on your own computer instead of on someone else's
server.

Why that matters:

- **Privacy.** Your chats and files stay on your machine. Nothing is uploaded to Asdale
  Dynamics, LLC or any other company.
- **Offline.** After you download a model once, you can chat with it with no internet.
- **Free.** No sign-up, no credit card, no monthly subscription.
- **You choose the model.** Small models for old laptops, bigger models for powerful
  desktops.

This manual walks you through installing Ollama, picking a model, running your first
chat, and using free frontends that work offline. It is written for complete beginners
and assumes no programming experience.

---

## 2. What you need

| Item | Requirement |
|------|-------------|
| Computer | Mac, Linux, or PC (Windows 10/11) |
| Memory (RAM) | 8 GB minimum; 16 GB+ recommended |
| Disk space | At least 5–10 GB free per model |
| Internet | Needed only to install Ollama and download models |
| Account | None required |

### How much RAM does a model need?

As a rough guide, a model needs about 1 GB of RAM per billion parameters (written as
"1B", "7B", "32B", etc.), plus a little extra for your system:

- **1B–3B models:** run well on 8 GB RAM machines
- **7B–8B models:** the sweet spot for most beginners; 8–16 GB RAM
- **14B–32B models:** want 16–32 GB RAM
- **70B+ models:** typically need a PC with a strong graphics card and 48 GB+ RAM

You can always delete a model and try a smaller one if your computer feels slow.

---

## 3. Install Ollama

### macOS

1. Go to [ollama.com](https://ollama.com) and download Ollama for Mac, or open Terminal
   and run:

   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

2. Drag Ollama into your Applications folder if you downloaded the app.
3. Open Ollama. It will place an icon in your menu bar.
4. In Terminal, check that it works:

   ```bash
   ollama --version
   ```

   You should see something like `ollama version is 0.6.x`.

### Linux

1. Open a terminal and run the official install script:

   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

2. The script installs Ollama and starts a background service.
3. Check the version:

   ```bash
   ollama --version
   ```

   If the command is not found, log out and back in, or run:

   ```bash
   source ~/.profile
   ```

### Windows

1. Go to [ollama.com](https://ollama.com) and download Ollama for Windows.
2. Run the installer and follow the prompts.
3. Open PowerShell or Command Prompt and check:

   ```powershell
   ollama --version
   ```

---

## 4. Verify the installation

Run:

```bash
ollama --version
```

If you see a version number, Ollama is installed and ready.

---

## 5. Pick your first model

Models are the AI "brains" you chat with. Browse available models at
[ollama.com/library](https://ollama.com/library).

Good beginner models:

| Model | Size | Best for |
|-------|------|----------|
| `llama3.2:1b` | ~1 GB | Very old or slow computers |
| `llama3.2:3b` | ~2 GB | Fast, everyday chats on most laptops |
| `llama3.1:8b` | ~4.7 GB | Smarter answers; needs 8–16 GB RAM |
| `nomic-embed-text` | ~274 MB | Turning text into numbers (advanced) |

To download and run a model in one step:

```bash
ollama run llama3.2:3b
```

Ollama downloads the model (this may take a few minutes) and opens a chat prompt
that looks like:

```
>>> 
```

Type your message and press Enter. Type `/bye` to exit, or press `Ctrl+D`.

---

## 6. Run your first chat

1. Open your terminal (macOS/Linux) or PowerShell (Windows).
2. Start a model:

   ```bash
   ollama run llama3.2:3b
   ```

3. At the `>>>` prompt, type something like:

   ```
   Hello! Can you explain what AI is, like I'm new to this?
   ```

4. Press Enter and read the reply.

5. Try another:

   ```
   Write a three-sentence bedtime story about a robot nurse.
   ```

6. When you are done, type `/bye` or press `Ctrl+D`.

That's it — you just ran AI locally on your own computer.

---

## 7. Manage your models

| What you want | Command |
|---------------|---------|
| See downloaded models | `ollama list` |
| Download a model | `ollama pull llama3.2:3b` |
| Run a model | `ollama run llama3.2:3b` |
| Delete a model | `ollama rm llama3.2:3b` |
| See all commands | `ollama --help` |

Example session:

```bash
ollama list
ollama pull llama3.1:8b
ollama run llama3.1:8b
# ... chat ...
# press Ctrl+D or type /bye
ollama rm llama3.2:3b
```

---

## 8. Free frontends that work offline

Ollama's terminal chat is free and works offline, but many people prefer a visual app
with a chat window. Here are free frontends you can run locally:

### Ollama itself (always offline)

The `ollama run` command needs no internet after the model is downloaded. This is the
simplest offline option and works on every platform.

### Enchanted (macOS, iOS)

A free, open-source chat app for Mac and iPhone/iPad that connects to a local Ollama.
Works offline once installed. Download from the App Store or GitHub.

### Msty (Windows, macOS, Linux)

A free desktop app for local AI models with a polished chat interface. It connects to
Ollama running on your machine and can be used offline after setup.

### Open WebUI (local network, advanced)

A feature-rich web interface for Ollama. It runs on your computer (usually via Docker)
and lets multiple people on your network chat with local models. Requires internet for
the initial setup, then works locally.

> **Important:** Any frontend you download needs internet the first time to install.
> After that, Ollama + your chosen model run entirely offline on your hardware.

---

## 9. Saving and sharing chats

Ollama does not sync chats to the cloud (that is the privacy benefit). If you want to
keep a conversation:

- Copy and paste the chat into a text file on your computer.
- Use a frontend such as Enchanted or Open WebUI, which stores chat history locally.

---

## 10. Troubleshooting

| Problem | Fix |
|---------|-----|
| `ollama: command not found` | Restart your terminal, or log out and back in after installation |
| Download is slow | Your internet speed and model size determine download time; try a smaller model |
| Chat is very slow | Close other apps; choose a smaller model (e.g. `llama3.2:1b`) |
| `out of memory` | Your RAM is full; pick a smaller model or restart your computer |
| Frontend cannot connect | Make sure Ollama is running (`ollama serve` in a terminal) |

---

## 11. Keep learning

- Official docs: [ollama.com](https://ollama.com)
- Model library: [ollama.com/library](https://ollama.com/library)
- More beginner guides from Asdale Dynamics, LLC: [dylanasdale.github.io](https://dylanasdale.github.io)

---

## Printable cheat sheet

A one-page command cheat sheet is available at [docs/cheat-sheet.md](docs/cheat-sheet.md)
and as HTML at `cheat-sheet.html`. Print it and keep it by your computer.

---

**Credit:** Written by Dylan Asdale for Asdale Dynamics, LLC (Indiana, formed October
2026). Copyright (c) 2026 Asdale Dynamics, LLC. Licensed under the MIT License. This
guide is educational information only and is not medical advice.
