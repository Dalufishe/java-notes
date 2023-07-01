# Arrays

Arrays 是操作陣列之工具類。

### 常用方法

- Arrays.toString (array): 將數組拼接成字串。
- Arrays.binarySearch(array, value): 二分搜尋找元素。
- Arrays.copyOf(array, 新陣列長度): 拷貝陣列。
- Arrays.copyOfRange(array, 起始索引, 結束索引): 拷貝陣列。
- Arrays.fill(array, 元素): 填充陣列。
- Arrays.sort(array): 排序數組 (快速排序)。
- Arrays.sort(array, 規則): 排序數組 (插入排序+二元搜尋)，指定規則(順序OR倒序及更細節處理)。

### Arrays.sort()

Arrays.sort() 有兩種形式，一種單純排序，一種可添加規則。

- 單純排序:

```java
Arrays.sort(array)
```

其採用快速排序 (QuickSort)。

- 可添加規則:

```java
Arrays.sort(array, Comparator c)
```

可為其添加規則，指定正序，到序，及更細節處理，故其採用更為靈活的插入排序搭配二分搜尋。

Comparator 是 @FunctionalInterface 函數式接口，可使用 lambda 函式簡化。