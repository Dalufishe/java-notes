# 01-Java 基礎

### 註解 (註釋)

註釋是在程序指定位置添加的說明性訊息。
簡單來說就是對代碼的一種解釋。

- 單行註釋 (// comment)
- 多行註釋 (/_ comment _/)
- 文擋註釋 (/\*_ comment _/)

```java
public class HelloWorld {
	/*
	 * main方法
	 * 會被java所調用，作為程序的主入口
	 */
	public static void main(String[] args) {
		System.out.println("你好 世界");
	}
}
```

注意:

- 註釋不會參與編譯與運行，僅是對代碼的解釋性說明。
- 最好不要嵌套註釋，可能會發生錯誤。

### 關鍵字

關鍵字就是被賦予特殊意義的英文單詞。(被 Java 賦予)

- 在 Java 中，關鍵字全部小寫。
- 常用的代碼編輯器，會針對關鍵字進行相對應的高亮處理。

### class

在 Java 中，class (類) 是最基本的組成單元。(Java 遵循嚴格的物件導向設計)。

```java
public class HelloWorld {}
```

class 關鍵字表示定義一個類。

### 字面量

字面量即表示數據在程序中的書寫格式。

- 整數字面量 :
  - 不帶小數的數字, 如
  - 666, -88
- 小數字面量 :
  - 帶小數點的數字, 如
  - 13.14, -2.43
- 字串字面量 :
  - 用雙引號括起來的內容, 如
  - "Hello World"
- 字符字面量 :
  - 用單引號括起來的內容, 如
  - 'A', '0'
- 布林值字面量 :
  - true 或 false
- 空類型字面量 :
  - null

#### 字串/字符字面量的轉譯字元

- \t (製表符)
  - 把前面字串長度補齊到 8 或 8 的整數倍。

```java
System.out.println("1234\t5");
```

```bash
output:
1234    5
```

- \n (跳脫字元)
  - 用於換行。

```java
System.out.println("1234\n5");
```

```bash
output:
1234
5
```

### System.out.println()

在 Java 中，System.out.println() 函式用於打印。

```java
// print number
System.out.println(234);
// print float
System.out.println(1.23);
// print string
System.out.println("123");
// print char
System.out.println('1');
// print boolean
System.out.println(true);
```

注意: 空類型 null 無法被打印。

### 變數

變數為程序在運行過程中，其值有可能發生改變的存儲結構。
變數用於儲存值，利於重複使用。

#### 語法結構

```java
數據類型 變數名 = 數據值;
int a = 3;
```

指定數據類型旨在添加限制，為變數賦予靜態屬性 (Java 是靜態語言)。

#### 使用方式

- 輸出打印 (作為函式引數)

```java
int num = 3;
System.out.print(num); // 3
```

- 參與計算

```java
int num1 = 3;
int num2 = 5;
System.out.print(num1 + num2); // 8
```

- 修改變數的值

```java
int num = 10;
num = 20;
System.out.println(num) // 20
```

### 注意事項

- 變數僅能存一個值。
- 變數不能重複定義。
- 變數在使用前須賦值(初始化)。
- 變數作用域。
