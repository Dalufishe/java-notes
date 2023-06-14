# Java 物件導向進階 1

### static

Java 中 static 修飾符用於修飾類的變數或方法。使用 static 修飾的變數稱靜態變數，方法稱靜態方法。
靜態變數 / 方法的核心思想為變數或方法之`共享性`。

- 靜態屬性是隨著類的加載而加載。
  - 類在方法區加載，
  - 靜態屬性在類加載之後於堆內存的靜態區加載。
- 非靜態屬性是隨著物件的建立而加載。

- 靜態方法/非靜態方法均在方法區被加載。

#### 靜態變數

在 Java 中，靜態變數作為該類之屬性 (推薦) ，也作為該類之實體之共享屬性。

```java
class Student {
    static String teacher = "Alan";
}

Student.teacher // "Alan"

Student s1 = new Student();
s1.teacher // "Alan";

Student s2 = new Student();
s2.teacher // "Alan";
```

#### 靜態方法

在 Java 中，靜態方法作為該類之方法 (推薦) ，也作為該類之實體之共享屬性。

#### 工具類

靜態方法一半定義於工具類。

- 工具類: 用於做一些事情的，但不用於描述事物的類。(不實體化，直接使用他)
- JavaBean 類: 用於描述事物的類 (實體化, 物件導向的主要特色)
- 測試類: 作為程式的入口，有 main 方法的類。

標準的工具類:

- 類名需見明知意 (Math，ArrUtil)
- 私有化構造方法 (實體化工具類無意義)
- 方法定義為靜態 (直接操作類)

#### static 注意事項

- 靜態方法只能訪問該類靜態方法/變數。(靜態屬性/方法為該類的屬性/方法，而非實體)
- 非靜態方法可以訪問所有。
- 靜態方法沒有關鍵字。

#### main 方法

```java
public static void main (String[] args){
    // ...
}
```

- public: 權限修飾符，權限需夠大，被 jvm 識別。
- static: 靜態方法，不須創建物件，jvm 透過類名訪問。
- void: 被 jvm 調用，無返回值。
- main: 被 jvm 識別的名稱。
- String[] args: 早期版本用於接收輸入數據 (通過配置)，現在無用。

### 繼承

繼承，是指一個類和另一個類之間建立繼承關係。

在 Java 中，使用 `extends` 關鍵字建立繼承...

```java
public class Student extends Person {
}
```

Student 類 繼承了 Person 類，Student 為子類，Person 為父類。

#### 物件導向三大特徵

- 封裝
- 繼承
- 多態

#### 使用繼承的好處

- 可把多個子類重複的程式碼抽取至父類中，提高復用性。
- 子類可在父類的基礎上，增添其他功能，使子類更強大。

#### 繼承使用時機

當類和類存在相同的內容，並滿足子類是父類的一種，可考慮使用繼承來優化代碼。

#### 繼承的注意事項

1. Java 只支持單繼承，不支持多繼承 (改善 c++)，但支持多層繼承。

2. 所有 Java 類 (除 Object) 都直接或間接繼承 Object 類。

3. 子類到底能繼承父類那些內容？

構造方法 (constructor)

- 無法繼承

成員變數 (property)

- 非私有: 會繼承
- 私有: 會繼承，但無法訪問

成員方法 (method)

- 非私有: 會繼承
- 私有: 不會繼承

(成員方法透過虛方法表繼承, 非 private, 非 static, 非 final)

#### 繼承中的成員變數

1. 不管私有或非私有，都會繼承，差別在可否訪問。
2. 訪問滿足就近原則，成員變數可覆寫。
3. this 關鍵字可查找屬於該物件之成員變數。
4. super 關鍵字可查找屬於父類之成員變數。

#### 繼承中的成員方法

1. 只有 非 private，非 static，非 final 可被繼承。
2. 調用滿足就近原則。
3. this 關鍵字可查找屬於該物件之成員方法。
4. super 關鍵字可查找屬於父類之成員方法。

方法的覆寫 (Override):

子類的方法覆蓋了父類的方法 (通常是父類滿足不了子類的需求)，稱為方法的覆寫。

@Override 覆寫註解:

加上重寫註解，會被編譯器檢測，偵錯，較驗重寫時格式是否有錯。
更加優雅，安全的寫法。

@Override 規則:

1. 重寫方法名, 形參列表必須保持和父類一致。
2. 子類重寫父類，子類訪問權限 必須大於等於父類。
3. 子類重寫父類，返回值類型需小於打魚父類。
4. 只有被添加至需方法表才能被重寫並加上 @Override。(只有是覆寫方法才能加上 @Override)

#### 繼承中的構造方法

構造方法不會被繼承。

子類中的所有構造方法都會默執行父類的無參構造，再執行自己。

Why ? 子類可能用到父類數據之初始化。

super() 可手動執行無參 / 有參父類構造。

#### this vs super

this: 作為 方法/構造方法 內的局部變數，表示當前調用者的地址值。
super: 表示父類的存儲空間。

this.成員變數 => 調用者之成員變數
this.成員方法 => 調用者之成員方法
this() => 調用者之構造方法

super.成員變數 => 調用者繼承於父類之成員變數
super.成員方法 => 調用者繼承於父類之成員方法
super() => 調用者繼承於父類之構造方法

### 多態

多態就是物件的多種型態。

```java
class Person {
    //　邏輯代碼
}
class Student extends Person {
    //　邏輯代碼
}

// 一般情況: Student 物件存儲在變數 s 中 (變數 s 限制僅能是 Student)
Student s = new Student();
// 多態: Student 物件存儲在變數 p 中 (變數 p 限制僅能存儲 Person 類, Student對象被隱轉為 Person 類型)，因此 Student 同時有 Person 及 Student 兩種型態。
Person p = new Student();
```

```bash
父類類型 物件名稱 = 子類物件
```

#### 多態的前提

- 有繼承 / 實現關係
- 有父類引用指向子類對象

#### 多態的成員

成員變數: 編譯看左邊 (父)，運行看左邊 (父)。
成員方法: 編譯看左邊 (父)，運行看右邊 (子)。

Why ?
編譯時還沒實際運行，編譯器只能通過靜態型別宣告判斷類型 (左邊)。
運行時則是多態規則。

#### 多態的好處

- 復用性 (解決多載函式大量書寫的問題)
- 擴展性

=> 更便利 & 好維護！

#### 多態的弊端

無法調用特有的方法，僅能調用重寫的方法。(編譯過程會被擋住, 靜態語言安全性考量)

若有需要調用特定方法, 可透過強轉 (強制轉換) (+ 型別判斷, 可選) 解決。

- 舊版本: instanceof + (強轉)
- jdk14+: a instanceof 強轉 b

```java

// show() 方法是 Person 類 (父) 的方法
// sayHi() 方法是 Admin 類 (子) 的特定方法

public static void register(Person p) {
    p.show();
    if (p instanceof Admin){
        Admin a = (Admin) p;
        a.sayHi();
    }
}
```

### 包

包就是資料夾，用來管理不同功能的 Java 類，方便後期維護。

```java
package com.speedtypingweb.domain
```

#### 命名規範

公司域名反寫 + 包的作用。全部英文小寫。

包名: com.speedtypingweb.domain

#### 全類名

加上包名的類名稱全類名 (完整的類名)。

類名: User
全類名: com.speedtypingweb.domain.User

### 導入

在 Java 中，將類從 a 處導到 b 處稱導入。通常會從一包內導入類，故又稱導包。

```java
import com.speedtypingweb.domain.User
```

使用限制: 

- 同一個包中的類，不需要導包。
- 使用 java.lang 包中的類，不需要導包。
- 其他情況都需要導包。
- 如果使用兩個包的同名類，需用全類名。

### final

final 表示最終的，不可改變的。

final 修飾方法: 最終方法，不能被重寫 
final 修飾類: 最終類，不能被繼承
final 修飾變數: 常數，只能被賦值一次

#### 權限修飾符

權限修飾符用來控制成員能夠被訪問的範圍。

可以被修飾: 成員變數，方法，構造方法，內部類。

作用範圍: private < 缺省 < protected < public

```bash
private: 僅同一個類中可使用。
缺省: 同一個包中的所有類。
protected: 同一個包中的所有類，加上不同包下的子類。
public: 到處。
```

日常開發僅會用到 private 和 public:

- 成員變數私有，並搭配 getter & setter
- 方法公開，除非共性方法。

### 代碼塊

代碼塊表示用大括號 {} 所圈起來的空間。

#### 局部代碼塊 (淘汰)

```java
public static void main(String[] args) {
    
    int a = 3;
    
    {
        int b = 2;
    }

}
```

局部代碼塊中定義的變數，僅在局部代碼塊中有效，節約內存。(已不再使用, 無必要)

#### 構造代碼塊

```java
public class Student {

    private String name;
    private int age;

    {
        System.out.println("提取重複代碼");
    }

    public Student() {
    }

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```

構造代碼塊用於提取在重載構造方法重複的代碼，提高復用性，並在`物件創建時執行` (優先於構造方法)。
現階段已被 this() 或 提取方法 取代。(不夠靈活)

#### 靜態代碼塊

```java
public class Student {

    private String name;
    private int age;

    static{
        System.out.println("類加載");
    }

    public Student() {
    }

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```

需透過 static 修飾，隨著類的加載而加載並執行，只執行一次。用於在類加載時做初始化時使用。


### 抽象類 & 抽象方法

抽象方法用於強制要求子類須覆寫該方法。(作用)

在將共性的方法抽取到父類之後，由於每個子類執行的內容不一樣，因此不能確定具體的方法體 (問題)。這時可定義抽象方法。

抽象方法所包含的類須強制轉為抽象類。

```java
// 抽象方法
public abstract void method();
// 抽象類
public abstract class Class(){}
```

#### 注意事項

1. 抽象類不能實體化。
2. 抽象類不一定有抽象方法，但有抽象方法的類一定是抽象類。
3. 抽象類可以有構造方法。
4. 抽象類的子類，必須要重寫抽象類所有的抽象方法。( 除非也是抽象類 )