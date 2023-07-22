# MySQL

MySQL 是一款基於 SQL 查詢語言的資料庫管理系統。
MySQL 由 `MySQL AB 公司` 開發，後續被 SUN、Oracle 公司相繼收購。

### 安裝 MySQL 注意事項

- mysql 默認的端口號是 3306。
- 須注意 mysql 的字符集 & 編碼 (建議 Unicode, UTF-8)。
- 須注意配置環境變數。
- 須注意配置超級管理員用戶名密碼。

### 卸載 MySQL 注意事項

- 點擊 MySQL 安裝包卸載。
- 須注意刪除 Program File & Program File (X86) 裡的 MySQL 資料夾。
- 須注意刪除 隱藏資料夾 ProgramData 裡的 MySQL 資料夾。

### 查看 MySQL 服務

在 cmd 輸入:

```bash
services.msc
```

找到服務名為 MySQL (有些會帶後綴)。可點選設置啟動規則 (預設為自動)、啟動、關閉等。

### 啟動 / 停止 MySQL 服務

除了到服務選單啟動 / 停止服務外，也可透過 cmd 命令:

```bash
net start MySQL
net stop MySQL
```

### 登入 MySQL 服務

使用 `mysql` 命令工具:

```bash
mysql -u用戶名 -p密碼
```

### MySQL 常用命令

`mysql` 命令工具有一些常用命令須特別注意:

- exit 退出
- \c 終止 sql 語句輸入
- show databases; 顯示數據庫
- create database xxx; 創建資料庫 xxx
- use xxx; 使用資料庫 xxx

demo 演示:

```bash
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
10 rows in set (0.00 sec)
```

- select version(); 查看版本
- select database(); 查看目前資料庫

注意: `mysql` 命令工具不見分號不執行 sql 語句。