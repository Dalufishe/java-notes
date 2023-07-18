# 包裝類

包裝類，目的在於讓基礎數據類型擁有引用數據類型的特性。
說白了，就是將基本數據類型當物件使用。

### 如何實現 ? 

底層實作，就是透過一物件，將基本數據類型包裹起來:

基本數據類型:

```java
int a = 30;
```

包裝類:

```java
public class Interger {
    private int value;
}
```

### 為甚麼需要有包裝類 ? 

許多情況下，被限制僅能使用引用數據類型操作程序 (如多態，泛型)。
若沒有包裝類，程式會有侷限性。
另外，擁有包裝類也使基本數據類型有物件導向的特性，風格更好。

### 8 種包裝類

byte       Byte
short      Short
int        Integer
long       Long
float      Float
double     Double
char       Charactor
boolean    Boolean

### 獲取物件

- new Interger(int value)
- new Interger(String s)
- Interger.valueOf(int value)
- Interger.valueOf(String s)

注意: valueOf() 有優化， 在 -128 到 127 之內預創建對象。

### 操作包裝類物件

jdk5前:

```java
Interger i1 = Interger.valueOf(1);
Interger i2 = Interger.valueOf(2);

int temp = i1.intValue() + i2.intValue();

Interger result = Interger.valueOf(temp);

```

jdk5後 (自動裝箱/自動拆箱):

```java
Interger i1 = 1;
Interger i2 = 2;
Interger result = i1 + i2;
```

### Interger 常用方法

Interger.toBinaryString(int i): 轉2
Interger.toOctalString(int i): 轉8
Interger.toHexString(int i): 轉16
Interger.parseInt(String s): 解析字串成int