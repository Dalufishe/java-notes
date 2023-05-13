# 物件導向

物件導向程序設計，是一種程式設計典範，為程式開發的一種抽象方針。

物件則指的是`類別 (或可達成同樣功能的概念) 的實例`。它將`物件作為程式的基本單元`，並且類別中存在一種`繼承`方案。

物件導向程式設計使操作資料更加方便，並提高程序的擴充性，復用性，更加良好的風格，清晰的程式碼邏輯。

簡單來說，物件導向就是 : 
- 物件 : 當你想做到某件事，操作相對應物件達到相對應的功能。
- 類 : 物件是類 (物件的設計圖) 實體化的產物，
- 繼承 : 並類之間存在至少一種繼承方案。

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

#### JavaBean 類 & 測試類

在 Java 中，作為設計圖使用，用於實體化的類稱作 JavaBean 類，是沒有 main 方法的。
而有 main 方法的類則稱作測試類。