# 隱式轉換 vs 顯式轉換

### 隱式轉換 (自動類型提升)

在 Java 中，隱式轉換為 Java `自動`幫你進行的類型轉換，他會在取值範圍小須轉換為取值範圍大的情況下發生。 (自動類型提升)。

也就是說，Java 會在需要`小轉大`時進行自動類型提升。

甚麼樣的情況會需要小轉大？

- `賦值`: 範圍小的類型(的值)須到範圍大的類型(的變數)中。

```java
int a = 3;
double b = a;
// 進行隱式轉換 int -> double
```

- `不同類型的值運算`: 如整數和小數的運算。

```java
int a = 10;
double b = 12.3;
System.out.println(a + b) // 數據類型為 double
```

- `byte、short、char 的運算`: Java 規則，三種類型在運算時會須被轉為 int。

```java
byte a = 10;
byte b = 20;
System.out.println(a + b) // 數據類型為 int
```

注意: 取值範圍大小 byte < short < int < long < float < double

另外，Java 也會在 `字符串拼接` 及 `byte, short, char賦值` 時進行隱轉換。

```java
String s1 = "123" + 123;
// 123 被隱轉為 字串 "123"
String s2 = "234" + 'f';
// f 字符 被隱轉為 字串 "f";
```

### 強制轉換 (手動轉換)

你可以透過下列語法強制轉換型別。

```java
double a = 12.3;
int b = (int) a;
// 將 double 轉為 int
```

常見用法是在需要將取值範圍大轉為取值範圍小時 (大轉小)，使用強制類型轉換。(小轉大也可以，只是沒必要，Java 會進行隱式轉換。)

強制轉換不局限於數值類型轉換，但須注意，強制轉換可能會造成數據錯誤的問題，請小心使用。
