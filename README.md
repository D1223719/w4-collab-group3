# W4 Git Branch 練習 Repo

這是第四週的練習 repo，包含多個分支，每個分支對應一個練習。

## 開始之前

```bash
git clone https://github.com/老師帳號/w4-git-practice.git
cd w4-git-practice
```

用瀏覽器打開 `index.html` 就能看到 chatbot 介面。

---

## 分支說明

| 分支名稱 | 練習內容 |
|---------|---------|
| `main` | 基本版本（乾淨起點）|
| `feature/dark-mode` | 深色主題功能（觀察 diff）|
| `feature/add-counter` | 訊息計數功能（練習 merge）|
| `conflict-a` | 甲版本的按鈕顏色（練習解 conflict）|
| `conflict-b` | 乙版本的按鈕顏色（練習解 conflict）|

---

## 練習一：觀察分支差異

```bash
# 切換到 dark-mode 分支，看看有什麼不同
git checkout feature/dark-mode
# 打開 index.html，觀察外觀變化

# 切回 main
git checkout main
```

**思考：dark-mode 分支修改了哪些檔案的哪些地方？**

---

## 練習二：Merge feature 分支

```bash
# 確保在 main 分支
git checkout main

# 把 add-counter 功能 merge 進來
git merge feature/add-counter

# 打開 index.html，確認計數功能出現了
```

**思考：merge 後 git log 長什麼樣子？**

---

## 練習三：解決 Merge Conflict

```bash
# 嘗試把兩個衝突分支都 merge 進 main（會產生 conflict）
git checkout main
git merge conflict-a
git merge conflict-b   # ← 這裡會出現 CONFLICT！

# 打開 style.css，找到衝突標記並解決
# 解決完後：
git add style.css
git commit -m "fix: 解決按鈕顏色 merge conflict"
```

---

## 練習四：建立自己的 feature branch

```bash
# 從 main 建立你自己的分支
git checkout -b feature/你的名字

# 修改 index.html 或 style.css 任一內容
# 例如：改標題、改顏色、改按鈕文字

git add .
git commit -m "feat: 加入我的個人化修改"
git push origin feature/你的名字
```
