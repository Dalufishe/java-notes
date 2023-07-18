# 17 Java 物件導向進階 2

### 接口

接口設計來解決類、抽象類的繼承不足而生 (靈活性)。
接口更多側重於"行為"，是行為規則的抽取，抽象。(不同於類，是整體事物的抽取，抽象)
另外，接口相較於類的繼承更為自由。

#### 定義 & 使用

- 接口使用 interface 關鍵字來定義。

```java
public interface Interface {}
```

- 接口不是類，不能實體化。
- 接口和類之間為實現關係，通過 implements 關鍵字表示。

```java
public class Class implements Interface {}
```

- 類和類繼承稱父類和子類，類和接口實現稱實現類和接口。
- 實現類必須重寫所有接口定義的抽象方法。(除非為抽象類)
- 類僅能單繼承，接口可多實現。(一類可實現多接口)

#### 接口中的成員

- 成員方法:

接口中的成員方法用於對類進行行為規範。
JDK 7 以前只能是抽象方法。
直到現今，方法默認修飾符為 public abstract

```java
public interface Interface {
    public abstract void print();
}
```

- 成員變數:

接口中的成員變數是設計來使用的，而非進行規範。
只能是私有靜態常數，並且默認修飾符為 public static final

- 接口沒有構造方法

#### 接口和類的關係

類和類的關係: 繼承關係，單繼承，不支持多繼承。
類和接口的關係: 實現關係，支持多實現。
接口和接口的關係: 繼承關係，支持多繼承。

#### 新版本的接口

JDK7 前版本的接口，方法只能定義抽象方法，規定強制重寫。(實現)
JDK8 新增了默認方法及靜態方法。
JDK8 新增了私有方法。

##### 默認方法 (default)

```java
public interface Interface {
    public default void print(){
        sout("Hi")
    };
} // public 可省略
```

默認方法為了解決`接口升級兼容性問題`而存在，他是具有方法主體的方法，使接口和類之間不必強制重寫 (繼承的影子，即使接口和類之間仍稱實現)。

注意: 當多實現同名方法，需強制重寫 (避免方法主體混亂)

##### 靜態方法 (static)

```java
public interface Interface {
    public static void print(){
        sout("Hi")
    };
} // public 可省略
```

透過 Interface 調用靜態方法。

#### 私有方法 (private)

私有方法為接口內部服務，不被外類訪問。

```java
public interface Interface {

 private void aaa(){
        //
    };

 private static void aaa(){
        //
    };

}
```

有 static: 為靜態方法服務
無 static: 為默認方法服務

#### 接口應用

類實現接口: 當類需要某種規則約束，可實現接口。
接口多態: 將接口作為資料型別，解決函式復用性及擴展性問題。

#### 適配器設計模式 (Adapter)

適配器設計模式，解決接口實現後，重寫大量非必要方法造成的難維護問題。

一般情況:

接口 (10 方法) -> 實現 -> 類 (10 方法)

適配器:

接口 (10 方法) -> 實現 -> 適配器類 (10 方法) -> 繼承 -> 類 (1 必要方法)

透過適配器空實現 (重寫空代碼)，達成封裝非必要方法的目的，整潔，清晰。

一般會將適配器設置為 abstract 抽象類。

### 內部類

內部類表示一個在一類中定義的另一個類。

```java
public class Outer {
    public class Inner {

    }
}
```

#### 使用場景

- 內部類表示的事物，是外部類的一部份。
- 內部類單獨出現沒任何意義。

#### 訪問特點

內部類可以直接訪問外部類的成員，包括私有。
外部類無法訪問內部類成員，除非創建物件。

#### 內部類的分類

- 成員內部類
- 靜態內部類
- 局部內部類
- 匿名內部類

#### 成員內部類

寫在成員位置的，屬於外部類的成員。
可被修飾符修飾，如 private、public、static。
成員內部類可訪問外部類的所有成員。

- 創建內部類實體:

1. 外部類名.內部類名 物件名 = new 外部類名().new 內部類名();

```java
public class Outer {
    class Inner {

    }
}
Outer.Inner oi = new Outer().new Inner();
```

2. 在外部類定義方法提供內部類物件。

- 內部類取得變數:

```java
public class Outer {

    private int a = 10;

    class Inner {

        private int a = 20;

        public void show(){

            int a = 30;

            System.out.println(Outer.this.a);
            System.out.println(this.a);
            System.out.println(a);

        }
    }
}
```

若名字並未重複，套用就近原則。
若名字重複，this可指向調用者地址值，外部類.this可指向外部類實體地址值。

注意: 創建內部類實體時，外部類實體也必須被創建 (兩個物件)，可在內部類方法中透過 外部類.this 指向外部類實體。

#### 靜態內部類  

靜態內部類為成員內部類的一種變形，會在前綴加上 static。
靜態內部類只能訪問外部類中的靜態變數和靜態方法。

創建物件格式:

外部類名.內部類名 物件名 = new 外部類名.內部類名();

#### 局部內部類

將內部類定義在方法裡稱局部內部類，類似方法裡的局部變數。
外界無法直接使用，需在方法中創建物件並使用。
局部內部類中可訪問外部類的所有成員。

#### 匿名內部類

這是有名字的類:

```java
class Student {
    public void print(){

    }
}
```

這是只有類主體，沒有名字的類 (概念):

```java
{
    public void print(){

    }
}
```

這是有名字的類，實現 Swim 接口:

```java
class Student implements Swim {
    @Override
    public void swim(){

    }
}
```

這是只有類主體，沒有名字的類，實現 Swim 接口:

```java
Swim {
    @Override
    public void swim(){

    }
}
```

匿名內部類語法 (無效):

```java

繼承類/實現接口 {
    類主體
}

Swim {
    @Override
    public void swim(){

    }
}
```

實體化匿名內部類語法:

```java
//
new 繼承類/實現接口() {
    類主體
}

new Swim() {
    @Override
    public void swim(){

    }
}
```

匿名內部類為 Java 中一種便捷的方式，提供快速`實體化`一`繼承 / 實現`子類的方式。

注意: 匿名內部類實際上有名字，由 java 生成，只是隱藏起來。