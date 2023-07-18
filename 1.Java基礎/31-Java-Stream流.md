# Stream 流

### 核心思想

數據像流水一樣，一層層做操作，過濾。

一般結合 lambda 表達式簡化操作。

### 使用步驟

1. 先獲取一條 Stream 流，並傳入數據。

- 單列集合: 
  - stream()
- 雙列集合: 
  - 無法直接使用
- 陣列: 
  - Arrays.stream(T[] array)
- 零散數據:
  - Stream.of(T ...values)

2. 調用 stream API。

### 常用方法

#### 中間方法 (調用完可繼續進行鍊式操作)

- filter((v)->{ }): 過濾元素
- limit(int maxSize): 獲取個數
- skip(long n): 跳過元素
- distinct: 去重 (底層使用 HashSet, 須注意重寫 hashcode & equal) 
- Stream.concat(s1, s2): 結合 stream 物件
- map(): 遍歷元素，進行操作再返回。

#### 終結方法 (結束 stream 流)

- forEach(): 遍歷元素。
- count(): 統計。
- toArray(): 轉為陣列。
- collect(Collector collector): 轉為單列集合。
- 
### 注意細節

1. stream 物件只能使用一次。
2. stream 是不可變物件。
=> 每次調用中間方法，均返回新的 stream 物件。