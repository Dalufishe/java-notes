# Java 異常處理

程序中出現的問題叫做異常。

異常告訴開發者程序可能發生的問題，並使開發者能作相對應的處理。
開發者也可以為程序擲出異常告訴另一開發者某情況可能出現的錯誤。

### 異常體系

- Throwable
  - Error (錯誤)
  - Exception (異常)
    - RuntimeException (運行時異常)

異常體系從 Exception 以下開始。

#### Error

Error 代表系統級別的錯誤 (屬於嚴重問題, 如內存溢出)。
Error 是 Java 自己使用的，平常書寫的代碼是不會使用到的。

#### Exception

Exception 代表程序出現的問題，稱作異常。

#### 運行時異常 vs 編譯時異常

- 運行時異常:
  編譯時不會出現的異常提醒，通常封裝在 RuntimeException 及其子類 (如陣列索引越界異常)。

- 編譯時異常:
  編譯時就會出現的異常提醒 (如日期解析異常)。

#### 擲出異常

`throw` 關鍵字表示擲出異常。

#### 異常處裡

- JVM 默認處理方式:

1. 把異常的名稱，異常原因，及異常出現的位置輸出在控制台。
2. 程序停止執行。

- 手動處理:

```java
try {
    // 可能出現異常的代碼
} catch (異常類型 變數名) {
    // 異常處理
}
```

手動做異常處理，程序會繼續運行。

#### Throwable 常用方法

- getMessage(): 返回 throwable 的詳細消息字串。
- toString(): 返回可拋出的簡短描述。
- printStackTrace(): 將異常的錯誤訊息及軌跡輸出在控制台 (以紅色字體呈現)，並且不會停止程序運行。

#### throws vs throw

- throws: 寫在方法定義處，表示 `聲明` 一個異常，告訴調用者，使用本方法可能會有異常。(通常用於編譯時異常)
- throw: 寫在方法內，結束方法。手動拋出異常物件，交給調用者。

#### 自訂義異常

自訂義異常使開發者能更靈活的擲出異常，並更靈活地做相對應的處理。

1. 定義異常類。
2. 繼承 RuntimeException。
3. 寫空參，帶參構造方法。