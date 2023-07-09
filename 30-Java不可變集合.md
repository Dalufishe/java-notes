# 不可變集合

不可變集合是長度不可變，內容不可變的集合。(為集合的特例)

### 應用場景

- 防禦性拷貝的實踐。
- 當集合對象被不可性的庫調用時，不可變形式是安全的。

### 書寫格式

在 List, Set, Map 均有個靜態方法 of()，可以創建不可變集合。

#### List

- List.of(E ...elements)

#### Set

Set.of(E ...elements)

#### Map

Map.of()
Map.ofEntries()
