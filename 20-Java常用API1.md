# Java 常用 API 1

### Math 

`java.lang.Math` 類作為工具類，包含諸多執行基本數學運算的方法。

#### 常用屬性

- Math.E: 自然底數
- Math.PI: 圓周率

#### 常用方法

- Math.abs(): 絕對值
- Math.log(): 指數
- Math.max(): 最大值
- Math.min(): 最小值
- Math.ceil(): 無條件進位
- Math.floor(): 無條件退位
- Math.round(): 四捨五入
- Math.pow(): 冪運算
- Math.sqrt(): 開平方根
- Math.cbrt(): 開立方根
- Math.random(): 隨機數, [0.0, 1,0)

### System

`java.lang.System` 類作為工具類，提供了一些與系統相關的方法。

#### 常用方法

- System.exit(): 終止當前運行的 java 虛擬機。
- System.currentTimeMillis(): 返回當前系統時間毫秒值形式。
- System.arraycopy(): 陣列拷貝。

### Runtime

`java.lang.Runtime` Javabean 類表示當前虛擬機的運行環境。

#### 獲取物件

- Java.getRuntime()

#### 常用方法

- exit(): 停止虛擬機。
- avaliableProcessors(): 獲取 cpu 線程數。
- maxMemory(): jvm能從系統獲取總內存大小。
- totalMemory(): jvm已從系統獲取總內存大小。
- freeMemory(): jvm剩餘內存大小。
- exec(): 執行 cmd 命令。

### Object 

Object 是 Java 中的頂級父類，所有的類都直接或間接繼承於 Object 類。(除了 Object 本身)。

Object 作為頂級父類，其方法大多會被繼承，調用/覆寫繼承方法，為 Object 常見用途。

#### 常用方法

- toString(): 返回物件的字串表現形式。

注意: 輸出語句 (如 System.out.println) 內部會自動調用並印出物件的 toString() 值，因此手動覆寫 toString() 方法可改變物件的印出形式。

- equals(): 判斷兩物件地址值是否相等 (等同於 == 比較)。

注意: 你可以覆寫 equals() 方法，重新定義相等規則。(如 String 類重新定義了 equals() 規則，規定內容相等及相等)

- clone(): 克隆物件。

注意: 1. clone() 方法是受保護的，需重寫該方法以使用他。 2. 需將類實現 Cloneable 接口 (標記性接口)，才可克隆其實體。 3. clone() 是淺克隆，對基礎數據類型成員複製值，引用數據類型成員複製地址值。

淺克隆: 基本數據類型複製值，引用數據類型複製地址值(淺的，共享物件)
深克隆: 所有類型完全複製 (除了 String) ，前後不影響。(深的，保持獨立)

### Objects

Objects 是一個工具類，提供些方法用於操作物件。

#### 常用方法

- equals(): 先進行非空判斷，再進行比較。

注意: 過去使用 a.equals(b)，當 a 為 null，則報錯，否則加上非空判斷。Objects.equals(a, b) 的優勢在於加上非空判斷，簡化代碼。

- isNull(): 判斷引用數據類型是否為 null
- nonNull(): 判斷引用數據類型是否不為 null (和 isNull() 相反)

