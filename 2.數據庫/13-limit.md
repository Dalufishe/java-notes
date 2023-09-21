# limit

limit 用於將查詢結果一部分取出來，通常使用在分頁查詢中。

限制 100 條:

```sql
select 
    id, name 
from country
limit
    100
```

從索引 100 開始，限制 100 條:

```sql
select 
    id, name 
from country
limit
    100, 200
```

倒敘執行。從索引 100 開始，限制 100 條:

```sql
select
    id, name 
from country
order by
    desc
limit
    100, 200
```

注意: limit 需在書寫在 order by 之後，並在其之後執行。
