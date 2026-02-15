# Fix: "npm is not recognized"

This means **Node.js** (which includes `npm`) is not installed or not in your system PATH.

## Step 1: Install Node.js

1. Go to **https://nodejs.org**
2. Download the **LTS** version (e.g. "20.x LTS")
3. Run the installer
4. **Important:** Check the option **"Add to PATH"** (it’s usually checked by default)
5. Finish the installer and **close and reopen** PowerShell/terminal (or restart Cursor)

## Step 2: Verify

Open a **new** PowerShell or terminal and run:

```powershell
node -v
npm -v
```

You should see version numbers (e.g. `v20.x.x` and `10.x.x`). If you do, run:

```powershell
cd "C:\Users\acer\Desktop\New folder"
npm run install:all
npm run dev
```

## If Node is already installed but still "not recognized"

- **Restart Cursor** (or at least open a new terminal inside Cursor).
- Or add Node to PATH manually:
  1. Press **Win + R**, type `sysdm.cpl`, Enter
  2. **Advanced** tab → **Environment Variables**
  3. Under **System variables** or **User variables**, select **Path** → **Edit**
  4. Add: `C:\Program Files\nodejs\` (or where Node was installed)
  5. OK, then open a **new** terminal

## After Node works

From the project folder:

```powershell
npm run install:all
npm run dev
```

Then open **http://localhost:3000** in your browser.
