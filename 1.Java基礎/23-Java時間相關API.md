# Java 時間相關 API

- JDK7 前的時間相關類
  - Date 類
  - SimpleDateFormat 類
  - Calendar 類
  - TimeZone 類
  - Locale 類

- JDK8 後的時間相關類
  - ZoneId 類
  - Instant 類
  - ZoneDateTime 類
  - DateTimeFormatter 類
  - LocaleDate, LocalTime, LocalDateTime 類
  - Duration, Period, ChronoUnit 類

### 時間標準

全世界的時間，是有統一的標準的。
各地區再透過該標準，透過經度線計算各地時間。

- 格林威治標準時間 (GMT):
  - 地球自轉一天是 24 小時，太陽直射格林威治為正午 12 點。
  - 缺陷: 有誤差，需調時。
  - 2012 已被棄用，不再是世界標準時間。

- 世界標準時間 (UTC):
  - 利用銫原子鐘的振動頻率計算出的時間。
  - 極為精準 (號稱 2000 萬年才誤差一秒)。
  - 作為現今的世界標準時間。

### 時間換算

1秒 = 1000毫秒
1毫秒 = 1000微秒
1微秒 = 1000納秒

### Date

`java.util.Date` 是用於描述時間的 Javabean 類。

#### 創建時間物件

- new Date()
  - 創建 Date 物件，表示當前時間。
- new Date(long date)
  - 創建 Date 物件，表示指定時間。
  - long date 傳入距離時間原點 (1970/1/1) 毫秒數。
  
#### 常用方法

- getTime(): 獲取時間 (距離原點毫秒數)
- setTime(long time): 設置時間 (距離原點毫秒數)
- toString(): 獲取時間字串 (本地化處裡)

### SimpleDateFormat

`java.text.SimpleDateFormat` Javabean 類設計來格式化時間，也能夠解析時間字串。

- 格式化: Date 物件 -> 時間字串
- 解析: 時間字串 -> Date 物件

#### 創建時間格式器物件

- new SimpleDateFormat()
  - 創建時間格式器物件，默認模式。
- new SimpleDateFormat(String Pattern)
  - 創建時間格式器物件，指定模式。

#### 常用模式 (Pattern)

- y: 年
- M: 月
- d: 日
- H: 小時 (0-23)
- m: 分
- s: 秒
- S: 毫秒
- E: 星期
- a: AM/PM

#### 常用方法

- format(Date date): 格式化時間
- parse(String source): 解析字串

### Calendar 

`Java.util.Calendar` 是一個 Javabean 類，代表了系統當前時間的日曆物件，可以單獨修改，獲取時間中的年、月、日。

Calendar 為抽象類，不能直接創建物件。

為甚麼？

Calendar.getInstance() 會根據電腦本地化資訊建立不同地區的日曆物件 (子類物件)，再進行多態處裡。(Calendar 類作為中間人使用)

#### 獲取物件

- Calendar.getInstance()
  - 獲取當前時間，當地格式的日曆物件
- Calendar.getInstance(Locale aLocale)
  - 獲取當前時間，指定地區格式的日曆物件

#### 常用方法

- getTime(): 獲取 Date 物件。
- setTime(Date date): 給日曆設置 Date 物件。
- getTimeInMillis(): 獲取時間毫秒值。
- setTimeInMillis(long millis): 設置時間毫秒值。
- get(int field): 取得日曆某字段訊息。
- set(int field, int value): 設置日曆某字段訊息。
- add(int field, int amount): 為某字段訊息增加/減少指定值。

#### field 傳入

get, set, add 方法根據傳入不同的日曆字段訊息 (field) 進行相關操作。

field 為一整數，表示日曆物件內部陣列存儲的索引值。

可以訪問 Calendar 的靜態常數獲取對應的索引值。

#### 注意

- Calendar 為抽象類，你操作的本體實際上為 Calendar 的子類。
- Calendar.getInstance() 會默認根據電腦地區獲取不同的日曆物件，並表示目前時間。
- 日曆物件會把時間中的紀元，年，月，日，時，分，秒，星期等等放入一陣列中。
- 月份範圍為 0 ~ 11。
- 星期範圍為 1 ~ 7，1 表示周日。

### jdk7 vs jdk8

JDK7 和 JDK8 在時間相關類的差異主要體現在 `代碼層面` 及 `安全層面` 上。

JDK7 在處理時間相關 計算/比較 常常需轉換為毫秒值再計算。
JDK8 提供了許多方法簡化上述操作。

JDK7 在多線程環境會可能會導致數據安全的問題。
JDK8 時間日期對象都是不可變的，解決了這個問題。

### ZoneId

ZoneId 為 JDK8 後新增的表示時區的類。
ZoneId 主要和其他 Api 搭配使用。

#### 獲取物件

- ZoneId.systemDefault()
  - 獲取系統默認時區。
- ZoneId.of(String zoneId)
  - 獲取指定時區。

#### 查看 Java 支持時區

- Zone.getAvailableZoneIds()
  - 獲取 Java 中支持的所有時區 (Set<String>)。
  - 共 600 (多) 個時區。
  
### Instant

Instant (時間戳) 為 JDK8 後新增的描述時間戳的類。
Instant 是不計算時區的，採用標準時間。

Instant 的作用是將 Date 物件中時間戳的概念獨立為一類，並支持許多實用的方法。

#### 獲取物件

- Instant.now(): 獲取當前時間的 Instant 物件。
- Instant.ofXXX(): 根據秒/毫秒/納秒值獲取 Instant 物件。

#### 常用方法

- toEpochMilli(): 獲取時間戳 (等同於 Date 物件的 getTime())
- atZone(ZoneId zone): 返回 ZoneDateTime 物件。 
- isXXX(Instant otherInstant): 判斷系列方法。
- minusXXX(long ...): 減少時間系列方法。
- plusXXX(long ...): 增加時間系列方法。


### ZoneDateTime

ZoneDateTime 為 JD8 後新增的描述地區時間的類。

ZoneDateTime 的作用是將 Date 物件中當地時間的概念獨立為一類，並支持許多實用的方法。

#### 獲取物件

- ZoneDateTime.now(): 獲取當前時間 (本地時間) 的 ZoneDateTime 物件。
- ZoneDateTime.ofXXX(): 根據秒/毫秒/納秒值獲取 ZoneDateTime 物件。

#### 常用方法

- withXXX(): 修改時間
- minusXXX(): 減少時間
- plusXXX(): 增加時間

注意: 新版時間相關物件是不可變的，方法均會返回新物件。

### DateTimeFormatter

DateTimeFormatter 是新版用於格式化日期的類。

### LocaleDate, LocalTime, LocalDateTime

LocalDate, LocalTime, LocalDateTime, ZoneDateTime 均可以作為新版 Calendar，操作日曆，對年，月，日，小時 等進行單獨處理。

### Duration, Period, ChronoUnit

工具類，計算時間間隔。

- Duration: 秒, 納秒
- Period: 年, 月, 日
- ChronoUnit: 所有