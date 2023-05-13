# 物件導向

物件導向程序設計，是一種程式設計典範，為程式開發的一種抽象方針。

物件則指的是`類別 (或可達成同樣功能的概念) 的實例`。它將`物件作為程式的基本單元`，並且類別中存在一種`繼承`方案。

物件導向程式設計使操作資料更加方便，並提高程序的擴充性，復用性，更加良好的風格，清晰的程式碼邏輯。

簡單來說，物件導向就是 : 
- 物件 : 當你想做到某件事，操作相對應物件達到相對應的功能。
- 類 : 物件是類 (物件的設計圖) 實體化的產物，
- 繼承 : 並類之間存在至少一種繼承方案。

總結一句 : 操作物件 + 類的實體化 + 繼承 = 物件導向。

```java
Random rd = new Random(); // 想進行隨機數操作，實體化隨機數物件。
int rd_number = rd.nextInt(10); // 操作物件進行隨機數操作。
```

### 類

類 (class) 在物件導向中扮演設計圖的角色。

在 Java 中，我們可以定義一個類 (class) 並透過 new 關鍵字實體化物件 (object)。

```java

// 定義類

public class Phone {

}

// 實體化物件

Phone myphone = new Phone();

```

#### 屬性 & 方法

在定義類的過程中，我們可以定義屬性及方法，他們會作為實體化後 (物件) 的屬性及方法。

屬性用做名詞，紀錄物件相關資訊，
方法用作動詞，用於物件操作。


```java
public class Phone {

// 定義屬性

// 完整格式 : 
// 修飾符 數據類型 屬性名 = 值;

String brand;
String os = "android";
private int id = new Random().nextInt(10);

// 定義方法

// 完整格式 : 
// 修飾符 回傳數據類型 方法名(){}

public void call() {
    System.out.println("打電話...");
}

public void playGame() {
    System.out.println("打遊戲~~~");
}

}
```

注意: 一個文件中可以有無限多個類，但只能有一個 public 類。

#### 封裝

封裝就是對程序進行包裝，將相同的概念之資料及行為，整合到一塊。(分類)

在 Java 中，透過物件導向程序設計，我們可以輕易地利用類 (class) 封裝程式碼。

我們應該如何根據需求正確地設計屬性及方法 (正確地進行封裝)？

物件/類代表甚麼，就得封裝對應的數據 (屬性) ，提供數據對應的行為 (方法) 。

```java
public class Computer {
    // 該類表示電腦，合理擁有 OS 及 Type。
    String os;
    String type;

    // 電腦合理擁有開機方法。
    public void powerOn(){
    }

    // 電腦合理擁有關機方法。
    public void powerOff(){
    }
}
```

封裝使得我們更好精準的進行操作，並更易於學習。

#### public & private

public / private 關鍵字是權限修飾符，可以修飾類中的成員 (屬性及方法)。

- public : 到處都可以訪問。
- private : 只有在類內部才能被訪問。

使用 private 關鍵字，可提高安全性 (避免意外訪問或調用)。

#### get & set 方法

將 屬性設置為 public，可以使其在類的外部被操作，但是可能會造成設值的結果並非預期 : 

```java
class Person {
    public int age;
}

Person dalufishe = new Person();
dalufishe.age = -17; // 年齡不應該是負數
```

解決方案 : 

將屬性訪問權限設為 private (避免直接改值)，並使用 get 方法 及 set 方法 (對值的設置增加邏輯判斷) 去操作他。


```java
class Person {
    
    private int age;

    public void setAge(int a) {
        if (age < 0 || age > 100) {
            System.out.println("年齡錯誤");
        } else {
            age = a;
        }
    }

    public int getAge() {
        return age;
    }
}
```

#### 就近原則

在絕大部分程式語言中，程序會使用較為靠近的定義的變數 : 

下列程序定義了兩個 age 變數 : 

- 成員變數 (屬性)
- 方法局部變數

getAge() 方法中，根據就近原則，會使用方法局部變數， `return age` 為 15。

```java
class Person {
    public int age;

    public int getAge() {
        int age = 15;
        return age;
    }
}
```

#### this 關鍵字

在 Java 中，我們可以在方法內部使用 this 關鍵字。

this 關鍵字能夠指向該方法之物件本身。也就是說，當在方法內需使用該物件其他屬性，可使用 this.屬姓名 獲取。 

```java
class Person {
    public int age;

    public int getAge() {
        return this.age; // this.age 指向 public int age
    }
}
```

在 Java 中，this 關鍵字可以省略，jvm 會依照就近原則去使用該屬性 (前提沒有被覆寫)。
但當有更接近的變數覆蓋了預期使用的屬性，可明確指定 this 關鍵字去獲取他。

this 的作用 : 

- 指向物件本身。
- 區分局部變數及成員變數 (屬性) 。


#### 構造方法 (constructor)

構造方法，或稱構造器、建構器，會在創建物件 (實體化物件) 時被調用，通常用於初始化成員變數及施加起始操作。

語法 : 

```java
public class 類 {
    修飾符 類 (參數) {
        // 構造方法主體
    }
}
```

##### 無參構造方法 & 有參構造方法

無參構造方法和有參構造方法顧名思義，良好程式碼風格會將它們達成同載關系，以兼容不同的輸入。

注意 : 

- 構造器名稱需和類名完全一致。
- 構造器函式沒有返回值 (連 void 也沒有)，也不能設置返回值。
- 若沒定義構造方法，jvm 會自行定義空參構造方法。

#### JavaBean 類 & 測試類

JavaBean 類 : 在 Java 中，作為設計圖使用，具有特定功能的類，沒有 main 方法。
測試類 : 有 main 方法的類，當作運行的主入口的類。

注意 : 「Bean」是用於Java的可重用軟體組件的慣用叫法。

標準的 JavaBean 類 (風格) :

- 類名需見名知意。(辨識度)
- 屬性需使用 private 修飾。(安全性)
- 須提供屬性相對應的 get / set 方法 (可操作性)
- 至少提供兩個構造方法
  - 無參數構造方法
  - 帶全部參數構造方法