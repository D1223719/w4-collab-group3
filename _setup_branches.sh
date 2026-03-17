#!/bin/bash
# 老師執行這個腳本，在本地建好所有練習分支後 push 到 GitHub
# 執行前：先建好 GitHub repo，並把 remote 設定好
#
# 用法：
#   chmod +x _setup_branches.sh
#   ./_setup_branches.sh

set -e  # 遇錯就停

echo "=== 初始化 demo repo 分支 ==="

# ── main：乾淨起點（已存在，不需做什麼）──
git checkout main

# ── feature/dark-mode ──
echo ""
echo "建立 feature/dark-mode..."
git checkout -b feature/dark-mode

# 在 style.css 加上 dark mode
cat >> style.css << 'DARK'

/* ===== Dark Mode（feature/dark-mode 分支新增）===== */
body.dark {
  background-color: #1e1e2e;
}
body.dark .container {
  background: #313244;
  color: #cdd6f4;
}
body.dark header {
  background: #1e1e2e;
}
body.dark .message.bot {
  background: #45475a;
  color: #cdd6f4;
}
body.dark .input-area {
  border-top-color: #45475a;
}
body.dark .input-area input {
  background: #45475a;
  color: #cdd6f4;
  border-color: #585b70;
}
DARK

# 在 index.html header 加深色模式切換按鈕
sed -i '' 's|<\/header>|  <button onclick="document.body.classList.toggle('"'"'dark'"'"')" style="margin-top:8px;background:rgba(255,255,255,0.2);border:none;color:white;padding:4px 12px;border-radius:6px;cursor:pointer;font-size:12px">🌙 切換深色模式</button>\n  </header>|' index.html

git add .
git commit -m "feat: 新增深色主題切換功能"

# ── feature/add-counter ──
echo "建立 feature/add-counter..."
git checkout main
git checkout -b feature/add-counter

# 在 index.html 加計數器顯示
sed -i '' 's|<p class="subtitle">W4 Git Branch 練習</p>|<p class="subtitle">W4 Git Branch 練習</p>\n      <p class="counter" id="counter">訊息數：0</p>|' index.html

# 在 style.css 加計數器樣式
cat >> style.css << 'COUNTER'

/* ===== 訊息計數器（feature/add-counter 分支新增）===== */
header .counter {
  font-size: 12px;
  opacity: 0.8;
  margin-top: 4px;
}
COUNTER

# 在 sendMessage 函數裡加計數邏輯
sed -i '' 's|input.value = '"'"''"'"';|input.value = '"'"''"'"';\
\
      // 更新訊息計數\
      const counter = document.getElementById('"'"'counter'"'"');\
      if (counter) {\
        const count = document.querySelectorAll('"'"'.message.user'"'"').length;\
        counter.textContent = '"'"'訊息數：'"'"' + count;\
      }|' index.html

git add .
git commit -m "feat: 新增訊息計數顯示"

# ── conflict-a（藍色按鈕）──
echo "建立 conflict-a..."
git checkout main
git checkout -b conflict-a

sed -i '' 's|background: #4f8ef7;|background: #1a73e8;  /* conflict-a：深藍色按鈕 */|' style.css

git add style.css
git commit -m "style: 把送出按鈕改成深藍色"

# ── conflict-b（粉色按鈕）──
echo "建立 conflict-b..."
git checkout main
git checkout -b conflict-b

sed -i '' 's|background: #4f8ef7;|background: #e84393;  /* conflict-b：粉色按鈕 */|' style.css

git add style.css
git commit -m "style: 把送出按鈕改成粉色"

# ── 切回 main ──
git checkout main

echo ""
echo "=== 所有分支建立完成 ==="
git branch

echo ""
echo "接下來推到 GitHub："
echo "  git remote add origin https://github.com/你的帳號/w4-git-practice.git"
echo "  git push -u origin main"
echo "  git push origin feature/dark-mode feature/add-counter conflict-a conflict-b"
