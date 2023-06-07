# Java 集合

陣列的長度是不可變的。
集合 (列表) 的長度是可變的。

在 Java 中，集合只能存儲引用數據類型。

### ArrayList

ArrayList 類是 Java 中操作集合的一種方式。

#### 建構方法:

```java
ArrayList<type> = new ArrayList<>();
```

建立一空集合 (列表) 。

#### 方法:

- 增

```java 
list.add(element);
list.add(index, element);
```

- 刪

```java
list.remove(element);
list.remove(index);
```

- 改

```java
list.set(index, element);
```

- 查

```java
list.get(index);
list.size();
```

#### 包裝類

如何在集合添加基本數據類型？

你無法再集合添加基本數據類型，但可透過將其轉換為包裝類的實體，再進行操作。