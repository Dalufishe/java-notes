# Java 常用 API 2

### BigInteger

`java.math.BigInteger` 用於處理 long 無法處裡的超大整數運算。

BigInteger 物件是不可變的，任何計算均會返回新的物件。

#### 獲取物件

- new BigInteger(String val) 
  - 獲取指定的大整數
- new BigInteger(String val, int radix)
  - 獲取指定進制的大整數
- new BigInteger(int num, Random rnd)
  - 獲取隨機大整數，範圍 [0, 2^num)
- BigInteger.valueOf(long val)
  -  獲取指定的大整數，內部有優化 (BigInterger 提前創建 -16 ~ 16 的 BigInterger 物件，valueOf 調取直接使用，不創建)

#### 常用方法

- add(BigInteger val): 加法
- subtract(BigInteger val): 減法
- multply(BigInteger val): 乘法
- divide(BigInteger val): 除法 (獲取商)
- divideAndRemainder(BigInteger val): 除法 (獲取商和餘)
- equals(Object x): 比較 "值" (非地址值) 是否相同
- pow(int exponent): 次冪
- max/min(BigInteger val): 返回最大/最小
- intValue/longValue(BigInteger val): 轉為 int/long，超出範圍有誤差。
- intValueExact/longValueExact(BigInteger val): 轉為 int/long，超出範圍報錯。

#### 存儲原理 & 上限

BigInteger 底層是透過 正負標誌 (signum) + 陣列補碼存儲 (mag) 超大整數。

BigInteger 理論上能存儲42億 (每一位能表示的數字) 的21億 (陣列最大長度) 次方最大範圍 (趨近無限大)。

### BigDecimal

計算機的小數通常需要大量的位元才能精確的存儲。

0.9: 小數部分需 45 位元
0.226: 小數部分需 55 位元

但是，Java 中的 float 僅能存儲 32 位元 (小數部分只有 23 位元)，double 僅能存儲 64 位元 (小數部分只有 52 位元)，超出的部分會被捨棄，造成不精確。

在銀行，飛機等需精密運算的程序，小數不精確是嚴重的問題。

Java 提供 BigDecimal 用於小數精確運算，也可以用來表示很大的小數。

另外，BigDecimal 和 BigInteger 一樣，是不可變的。

#### 獲取物件

- new BigDecimal(double val)
  - 將 double 表示的小數 (不精確表示) 轉為 BigDecimal，結果有不可預知性。
- new BigDecimal(String val)
  - 將 String 表示的小數 (精確表示) 轉為 BigDecimal，結果是精準的。
- BigDecimal.valueOf(long val)
  - 獲取指定的 BigDecimal ，內部有優化 ( BigDecimal 提前創建 0.0 ~ 10.0 的 BigDecimal 物件，valueOf 調取直接使用，不創建)

#### 常用方法

- add(BigDecimal val): 加法
- subtract(BigDecimal val): 減法
- multply(BigDecimal val): 乘法
- divide(BigDecimal val): 除法
- divide(BigDecimal val, int 精確幾位, RoundingMode 捨入模式): 除法


數字運算底層補碼

BIGINT 類 補碼
BIGDEC 類 ASCII