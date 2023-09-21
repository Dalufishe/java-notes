# union

union 用於將查詢結果進行拼接。

```sql
select ename, job from emp where job = 'MANAGER'
union
select ename, job from emp where job = 'SALESMAN';
```

結果等同於:

```sql
select ename, job from emp where job in('MANAGER', 'SALESMAN');
```

注意:
1. 使用 union 在某些情況下效率更高。
2. 將查詢結果拼接時，要求兩結果列數及數據類型一致。

