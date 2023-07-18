# lambda 表達式

lambda 表達式為 JDK8 新增的語法形式，其為函數式編程 (functional programming) 在 Java 中的體現。他省略了物件導向複雜的語法，專注於做甚麼，而非誰在做。

lambda 核心概念:

- 函數式編程實現
- 簡化語法 (物件導向簡化等等)
- 專注於行為

```java
Arrays.sort(arr2, (Integer o1, Integer o2) -> {

        return o1 - o2;
});
```

### 使用場景

lambda 可用於簡化匿名內部類的寫法。

注意: 
1. 僅能是函數式接口(接口中僅有一抽象方法)。
2. 你可以在函數式接口上添加 @FunctionalInterface 註解進行更嚴格的檢查及增加辨識度。

### 語法簡化

lambda 表達式自身可再簡化:

- 參數類型可省略不寫。
- 若只有一個參數，括號可省略。
- 若函式主體只有一行，大括號，分號，return 可省略 (需同時)。