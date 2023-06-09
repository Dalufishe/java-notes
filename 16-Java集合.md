# Java 集合

Java 中，集合就是長度可變的容器。

在 Java 中，集合只能存儲引用數據類型。

### ArrayList

ArrayList 類是 Java 中集合的一種，也是最常用的一種。

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

### 集合體系結構

Java 中，集合主要可分為兩部分，單列集合 (Collection) 及雙列集合 (Map)。

單列集合一次操作一個數據。
雙列集合一次操作一對數據。

### Collection

單列集合體系的頂層為 `Collection`。其體系表如下:

- Collection (接口)
  - List (接口)
    - ArrayList (實現類)
    - LinkedList (實現類)
    - Vector (實現類)
  - Set (接口)
    - HashSet (實現類)
      - LinkedHashSet (實現類)
    - TreeSet (實現類)

##### 常用方法

- add(E e)
- clear()
- remove(Object o)
- contains(Object obj)
- isEmpty()
- size()

注意:

- Collection 定義的抽象方法是 remove(Object o)，不支持索引 (因為子接口 Set 不支持索引)。
- contains() 方法中是透過 equals 方法比較，必要時須重寫 equals() 方法以達成預期效果。

##### 單列集合之遍歷

注意: Collection 沒有索引概念，故不能使用索引進行遍歷。(Set 子接口的緣故)

###### 方法一: 使用迭代器

迭代是遍歷的一種，指線性 (按照順序) 的遍歷數據。
在 Java 中，迭代器是集合操作迭代的統一解決方案。Java 為各式可遍歷的資料類型實作該資料類型專門的迭代器，通常為最佳迭代的解決方案 (專門為底層數據結構做設計)。
迭代器在 Java 中的接口是 Iterator，並且他是集合專用的遍歷/迭代方式。

- collection.iterator(): 獲取 Collection 物件的迭代器，並設置指針，默認在初始位置。
- iterator.hasNext(): 判斷指針上是否有元素。
- iterator.next(): 獲取指針上元素，並移動指針到後一個位置。

```java
Collection<String> coll = new ArrayList();

coll.add("111");
coll.add("222");
// ...

Iterator<String> it = coll.iterator();
while(it.hasNext()) {
  String str = it.next();
  sout(str);
}
```

注意:

1. 迭代結束，強行調用 next() 會報錯。 (NoSuchElementException)
2. 迭代結束，指針不會歸位。
3. 一個迴圈中最好不要有兩個以上的 next() 方法。
4. 迭代時，不能使用集合方法進行增加或刪除。(僅能使用迭代器提供的 remove() 方法)

###### 方法二: 增強 for 遍歷

增強 for 遍歷 在 JDK5 出現，本質上就是迭代器操作，他是為簡化迭代器而生的。

```java
Collection<String> coll = new ArrayList<>();
coll.add("張三");
coll.add("李四");
coll.add("王五");

for (String str: coll) {
    System.out.println(str);
}
```

除了單列集合，陣列也可以使用 增強 for 遍歷。(特例: 底層並非迭代器)

###### 方法三: forEach 方法

forEach() 方法本質上也是迭代器操作，也是為了簡化迭代器而生。

舊式: 匿名內部類
新式: lambda

```java
Collection<String> coll = new ArrayList<>();
coll.add("張三");
coll.add("李四");
coll.add("王五");

coll.forEach(new Consumer<String>() {
    @Override
    public void accept(String s) {
        System.out.println(s);
    }
});

coll.forEach((s)->{
    System.out.println(s);
});
```

#### List

List，列表，其添加的元素是有序，可重複，有索引。

注意: "有序"表示添加的元素是按添加順序排序存儲。如添加 a, b, c，內部存儲 a, b, c。

##### 常用方法

- Collection 繼承的方法
- 跟索引操作相關的方法

- add(int index, E element)
- remove(int index)
- set(int index, E element)
- get(int index)

##### 列表之遍歷

列表作為 集合體系 Collection 中的子系統，迭代器，增強 for，forEach() 都有支持。

另外還有 for 搭配索引 及 列表迭代器 兩種方式。

##### 特殊方法一: for 搭配索引

最原始操作有索引集合的方式。

##### 特殊方法二: 列表迭代器

對列表支持度較高的迭代器，增添了些方法。

注意: 迭代器並非為有索引之集合設計，Java 僅在 api 支持，並非最適合的方式。

```java
// for (index)
for (int i = 0; i < list.size(); i++) {
    System.out.println(s);
}

// iterator
Iterator<String> iterator = list.iterator();
while (iterator.hasNext()){
    System.out.println(iterator.next());
}

// for-each-inner-class
list.forEach(new Consumer<String>() {
    @Override
    public void accept(String s) {
        System.out.println(s);
    }
});

// for-increase
for (String s : list) {
    System.out.println(s);
}

// for-each-lambda
list.forEach((s)->{
    System.out.println(s);
});

// list-iterator
ListIterator<String> listIterator = list.listIterator();
while (listIterator.hasNext()){
    System.out.println(listIterator.next());
}
```

#### Set

Set，狹義集合，其添加的元素是不重複的。

List: 有序，有索引，可重複
Set: 不可重複

### Map

雙列集合一次操作一對數據，稱鍵值對。鍵是不可重複的，值是可重複的。
鍵和對是一一對應的，每個鍵只能找到自己對應的值。
鍵值對在 Java 中是透過 Entry 物件存儲的，又稱鍵值對物件。

雙列集合體系的頂層為 `Map`。其體系表如下:

- Map
  - HashMap (接口)
    - LinkedHashMap (實現類)
  - TreeMap (實現類)

#### 常用方法

- put(K key, V value)
- remove(Object key)
- clear()
- containsKey(Object key)
- containsValue(Object value)
- isEmpty()
- size()

注意: put() 方法除了可以添加，也有覆蓋效果。

#### 雙列集合之遍歷

方法一: 鍵找值

雙列集合並不支援迭代器，但可以透過 keySet() 方法獲取鍵集合，並操作單列集合 (如使用迭代器) 操作鍵，獲取值。

```java
Map<String, String> map = new HashMap<>();

map.put("Dalufishe", "FrontEnd");
map.put("dfgh012316 ", "BackEnd");
map.put("CatBoxy", "FrontEnd");

Set<String> keys = map.keySet();

for (String key : keys) {
    String s = map.get(key);
    System.out.println(s);
}

```

方法二: 鍵值對

雙列集合並不支援迭代器，但可以透過 entrySet() 方法獲取鍵值對集合，並操作單列集合 (如使用迭代器) 操作鍵值對，獲取鍵或值。

```java
Map<String, Integer> map = new HashMap<>();
map.put("Eason", 17);
map.put("Chad", 18);
map.put("Yang", 17);

Set<Map.Entry<String, Integer>> entries = map.entrySet();

for (Map.Entry<String, Integer> entry : entries) {
    System.out.println(entry.getValue());
}
```

方法三: forEach

forEach 底層是鍵值對，為Java 設計來簡化 Map 遍歷的方式

### Collections

`java.util.Collections` 是集合的工具類。

#### 常用方法

- addAll(Collection<T> c, T... elements): 為單列集合批量添加元素。
- shuffle(List<?> list): 打亂 List 集合元素的順序。
- sort(List<T> list)
- sort(List<T> list, Comparator<T> c)
- binarySearch(List<T> list)
- copy(List<T> dest, List<T> src)
- fill(List<T> list, T obj)
- max/min(Collection<T> coll)
- swap(List<?> list, int i, int j)