# MySQL 表

表 (table) 作為數據庫 (SQL) 最基本的單元。

### 什麼是表 ?

數據庫是以 "表格" 的方式表示數據的。
任何一張表都有行和列，行稱為紀錄，列稱為字段。

```bash
姓名  性別  年齡 (列: 字段)
-------------
張三  男    20   -> 行 (紀錄)
李四  女    19   -> 行 (紀錄)
王武  男    20   -> 行 (紀錄)
```

如姓名字段、字別字段、年齡字段。

先情提要:

- 每個字段名都有: 字段名，數據類型，約束。

### 使用命令工具查看表

```bash
mysql> use myblog;
Database changed
mysql> show tables;
+------------------+
| Tables_in_myblog |
+------------------+
| blogs            |
| users            |
+------------------+
2 rows in set (0.00 sec)
```

### 查看表中的數據

從表查詢所有 (\*) 數據:

```bash
mysql> select * from blogs;
```

### 查看表的結構

```bash
mysql> desc blogs;
```
