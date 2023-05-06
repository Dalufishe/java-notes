# 10 流程控制語句

流程控制語句為一種述句，用於控制執行流程。

注意: Q: 甚麼是述句 ? A: 述句是程式語言中用於處理邏輯的一種結構。

### 順序結構

Java 預設由上往下執行，為順序結構。

```java
System.out.println("1"); //由
System.out.println("2"); //上
System.out.println("3"); //往
System.out.println("4"); //下
```

### 分支結構

#### if

if 表示當某件事發生時，作相對應的邏輯處理。
if 用於判斷一種情況，並進行邏輯處理。

語法 :

```java
if(// boolean, or expression that returns boolean) {
    // expression / statement
}
```

若語句主體只有一行，則大括號可以省略。

#### if-else

if-else 表示當某件事發生時，作相對應的邏輯處理，若沒，做另外處理。
if 用於判斷兩種情況 (正反)，並進行邏輯處理。

```java
if(// boolean, or expresion that returns boolean) {
    // expression / statement
} else {
    // expresstion / statement
}
```

```java
String now = "night";
if (now == "morning") {
    System.out.println("morning");
} else {
    System.out.println("night");
}
```

#### if-else if-else

if-else if-else 為 if-else 的組合寫法，用於對多種情況進行判斷並進行邏輯處理。

#### switch

switch 解決了大量的 if-else if-else 恐會造成的複雜問題，用於簡化分支流程控制。

語法 :

```java
switch(
    // expresstion that returns a value
    // that can be byte, short, int, char, enum, String.
) {
    case /* literal1*/ :
        // expression / statement
        break;
    case /* literal2*/ :
        // expression / statement
        break;
    case /* literal3*/ :
        // expression / statement
        break;
    default:
        // expression / statement;
        break;
}
```

注意 :

- switch 邏輯判斷運算式只能回傳 byte, short, int, char, enum (jdk5 new), String (jdk7 new).
- case 後面只能接字面量。
- default 可是任意位置，可省略。
- case 匹配後仍會繼續向下進行下一個匹配判斷 (case 穿透)，因此須加上 break，中斷下一個匹配。

switch 語法簡寫 :

```java
switch(
    // expresstion that returns a value
    // that can be byte, short, int, char, enum, String.
){
    case  /* literal1*/  -> {
         // expression / statement
    }
    case  /* literal2*/  -> {
         // expression / statement
    }
    case  /* literal3*/  -> {
         // expression / statement
    }
    default -> {
         // expression / statement
    }
}
```

此種語法簡寫不會有 case 串透問題。

#### if-else if-else 和 switch 比較

if-else if-else 較適用於大範圍、較複雜的比較。

switch 適合於小範圍，單體的比較。

### 循環結構

#### for

語法:

```java
for (/* 初始化表達式 */; /* 條件判斷表達式 */; /* 條件控制表達式 */) {
    // 循環體語句 (運算式 or 述句)
}
```

執行流程:

1. 執行初始化語句 (表達式)。
2. 執行條件判斷語句, 判斷結果為 true 或 false。
   1. 如果是 false，則循環結束。
   2. 如果是 true，則執行循環體語句。
3. 執行條件控制表達式。
4. 回到 2. 執行條件判斷語句。

注意:

- 初始化語句只執行一次。

#### while

#### do-while
