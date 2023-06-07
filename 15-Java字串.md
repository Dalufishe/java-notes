# 字串

Java 中提供了大量跟 String 相關的 API 方便進行文本操作。

在 Java 中，使用雙引號 "" 的字面量都是 String 類的實體 (資料型態為 String)。此外，String 類還提供了諸如比較，檢索，切割等實用方法方便操作。

除了 String 類，還有 StringBuilder，StringJoiner，StringBuffer 等類方便進行字串操作。

### String

`java.lang.String`

Spring 作為字串，是 Java 文本操作的核心類 API，提供大量實用方法。

- 任何雙引號　"" 的字面量都是 String 類的實體。
- 字符串是不可變的 (不可變物件)，你無法去改變字串，任何操作都是回傳新值。

#### 兩種建立 String 物件的方式

- 使用字面量

```java
String s = "Hello World";
```

- 使用 new 關鍵字

```java
// 空參構造 (幾乎不用)
String s1 = new String();
// 傳入 string, 生成新 string (幾乎不用)
String s2 = new String("Hello");
// 傳入 char[] (修改 string 值的一種思路)
String s = new String(new char[]{'H', 'E', 'W'});
// 傳入 bytes[] (網路通信)
String s = new String(new bytes[]{97,98,99,100});
```

使用字面量建立 String 物件，除了`語法較簡單`外，獨有的 String Table 技術可以提高字串的復用性且`節省內存`。

```java
String s1 = "123"; // 在推內存的 StringTable 中建立字串 "123"
String s2 = "123"; // 字串 "123" 已被建立過，重複使用值 (同個記憶體位置)。
```

#### 字符串的比較

- 比較運算子 == 。

== 在進行比較時，對`基本數據類型`是`值的比較`，引用數據類型則是`地址值的比較`

字符串屬於引用數據類型，因此 :

```java
String s1 = "123";
String s2 = "123";
sout(s1 == s2) // true (StringTable)
```

```java
String s1 = "123";
String s2 = new String("123");
sout(s1 == s2) // false (不同地址, 並非相同物件)
```

- equals():
  - 使用比較運算子比較字串，是記憶體地址的比較 (引用數據類型)，若想進行值的比較，可使用 equals() 方法。

#### 遍歷字符串

- charAt():

  - 使用 charAt() 方法可透過索引獲得字串中的字元值。

- length():

  - 使用 length() 方法可以獲得字串的長度。

- 遍歷字串:

```java
Scanner sc = new Scanner(System.in);

// 獲取字串
System.out.println("請輸入一字符串");
String str = sc.next();

// 遍歷字串
for (int i = 0; i < str.length(); i++) {
    System.out.println(str.charAt(i));
}
```

#### 拼接字符串

- 加號 + 運算子用於拼接字串。

```java
// 用於將 array 轉成 string 的方法
public static String arr2str(int array[]) {
    if (array == null) {
        return "";
    } else if (array.length == 0) {
        return "[]";
    } else {

        String result = "[";

        for (int i = 0; i < array.length; i++) {
            if (i == array.length - 1){
                result += array[i];
            } else {
                result += (array[i] + ",");

            }
        }

        result += "]";

        return  result;
    }
}
```

### 擷取字符串

- substring() 方法用於擷取字符串，並返回該一新字串。

- substring(頭, 尾) : 擷取索引頭到索引尾 - 1 的字串。
- substring(頭) : 擷取索引頭到最後的字串。

### 替換字符串

- replace() 方法用於替換字串中的某值，並返回新字串。

- replace(舊值, 新值) : 將舊值替換為新值。

### StringBuilder

`java.lang.StringBuilder`

StringBuilder 類的實體是一個容器，可視為可變版本的 String，通常做為操作 (優化) String 的工具使用。
StringBuilder 透過`減少無意義對象生成`而大幅`提高了字符串的運行效率`。

- String : 不可變之操作文本的對象。
- StringBuilder : 可變之操作文本的對象。

- new StringBuilder()
- new StringBuilder(初始值)

- append() : 添加數據
- reverse() : 反轉容器中的內容
- length() : 取得長度
- toString() : 將 StringBuilder 轉成 String

StringBuilder 也是早期 (jdk8 前) String 使用 + 運算符串接背後的底層實現。(大量單獨使用，因此吃不到優化效果) (最早的功能)

### StringJoiner (JDK 8)

`java.util.StringJoiner`

StringJoiner 可視為 StringBuilder 的改良版，同樣作為容器，其內容是可變的。

同樣作為字串拼接，反轉的優化選擇，StringJoiner 有著更簡潔的語法，操作起來更加方便。

- new StringJoiner(間隔符號)
- new StringJoiner(間隔符號, 開始符號, 結束符號)

- add() : 添加數據
- length() : 取得長度
- toString() : 將 StringJoiner 轉成 String


### 字串拼接的底層實現

- 未使用變數

Java 會在編譯過程就進行字串拼接。

```java
String a = "1" + "2" + "3";
```

編譯後 : 

```java
String a = "123";
```

- 使用變數
  
JDK8 前 : 

透過大量建立 StringBuilder 及 String 物件拼接字符串。

JDK8 後 : 

透過預估長度生成陣列並轉換為字串。

### StringBuilder 會不會爆 ? 

答案是不會的。

底層實現 : 

1. 默認創建長度為 16 的字節數組 (char[])。
2. 添加的 StringBuilder 內容長度 小於等於 16, 直接存。
3. 添加的 StringBuilder 內容長度 大於 16, 進行 原來容量 * 2 + 2 擴容。
4. 擴容仍不夠，以實際長度為準。

```java
StringBuilder sb = new StringBuilder();
System.out.println(sb.capacity()); // 獲取容量 (數組長度)
System.out.println(sb.length()); // 獲取長度 (sb 長度)
```

