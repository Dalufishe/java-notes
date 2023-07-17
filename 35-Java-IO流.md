# Java IO 流

IO 流作為 Java 中寫入和讀取數據的解決方案。(I 表示 input，O 表示 ouput)

例如，File 物件只能代表文件/資料夾本身，並不能進行讀寫操作。
讀寫操作需透過 IO 流來實現。(流，像水流一樣傳輸數據)

IO 流可透過流向分為輸出流及輸入流，也可透過操作文件類型分為字節流及字符流。

### IO 流體系

- IO 流
  - 字節流 (任意文件)
    - InputStream (抽象類)
      - FileInputStream
      - ObjectInputStream
      - BufferedInputStream
      - ...
    - OutputStream (抽象類)
      - FileOutputStream
      - ...
  - 字符流 (純文本)
    - Reader (抽象類)
    - Writer (抽象類)

### FileOutputStream (寫入檔案)

FileOutputStream 是 IO 流體系中處裡字節文件輸出流的類。

#### 流程

1. 創建字節輸出流物件 (建立程序和檔案間的通道)。
   1. 細節一: 構造方法可傳入字串 or File 物件。
   2. 細節二: 若文件不存在，會創建新文件，但須保證父級路徑需存在。
   3. 細節三: 若文件已存在，調用構造方法會清空文件。
2. 寫入數據。
   1. 細節一: write() 方法的參數是整數，實際寫入文件是對應 Ascii 編碼。
3. 關閉 IO 流通道 (釋放資源)。
   1. 細節一: 寫入完畢需釋放資源，否則其他程序無法使用該文件。(解除占用)

```java
FileOutputStream fos = new FileOutputStream("pathname");
fos.write(97);
fos.close();
```

#### 寫入文件的 3 種方式

- write(int b)
- write(byte[] b)
- write(byte[] b, int off, int len)

注意: 可透過 String 物件的 getBytes() 方法將字串轉為 byte 陣列，再傳入 write() 方法。

#### 換行

windows: \r\n
linux: \n
macOS: \r

注意: Java 底層會根據作業系統自動進行補全，因此跨平台仍可以正常運作，寫錯也不要緊。

#### 續寫

構造方法的第二個開關，決定覆寫 or 續寫模式。
默認情況為 false，為覆寫模式。設置為 true 則可續寫。

```java
FileOutputStream(String name, boolean append);
```

### FileInputStream (讀取檔案)

FileInputStream 是 IO 流體系中處裡字節文件輸入流的類。

#### 流程

1. 創建字節輸入流物件 (建立程序和檔案間的通道)。
   1. 細節一: 若文件不存在，直接報錯。
2. 讀取數據。
   1. 細節一: 一次讀一個字節，讀出來的數據在 ascii 對應的數據。
   2. 細節二: 到文件末尾了，read() 方法返回 -1。
3. 關閉 IO 流通道 (釋放資源)。

#### 循環讀取

使用 read() 返回 -1 控制迴圈循環讀取。

```java
String path = "./test.txt";
FileInputStream fis = new FileInputStream(path);

StringBuilder data = new StringBuilder();


while (true) {
    int read = fis.read();
    if (read == -1) break;
    data.append((char) read);
}

System.out.println(data);
```

#### 一次讀取多個檔案

- read(): 一次讀取一個字節，並返回數據。
- read(byte[] buffer): 一次盡可能讀取 buffer.length 個字節，將數據放入 buffer 中，並返回讀取長度。

#### 拷貝文件

核心概念: 讀取文件，將數據寫入另一文件。

##### 基本寫法

將 path1 的數據一字節一字節讀出，並一一寫入 path2 文件。

```java
final String path1 = ".aaa.txt";
final String path2 = ".bbb.txt";

FileInputStream fis = new FileInputStream(path1);
FileOutputStream fos = new FileOutputStream(path2);

while (true) {
    int read = fis.read();
    if (read == -1) break;
    fos.write(read);
}

fos.close();
fis.close();
```

##### 優化寫法

逐一字節讀取寫入效率過低 (操作大量 IO 效率級低)，改寫為一次讀取，寫入一組數據。

```java
final String path1 = "./aaa.txt";
final String path2 = "./bbb.txt";

FileInputStream fis = new FileInputStream(path1);
FileOutputStream fos = new FileOutputStream(path2);

byte[] buffer = new byte[1024 * 5 /* 5kb */];

while (true) {
    int len = fis.read(buffer);
    if (len == -1) break;
    fos.write(buffer, 0, len);
}

fos.close();
fis.close();
```

注意:

1. buffer 陣列勿設置過大:
   1. 陣列占內存。
   2. 若太大則失去 "流" 意義。
2. 通常先開的數據流通道會最後關。

#### IO 異常處理

使用 IO 流相關 API 會報出 IOException 編譯時異常，需進行異常處理。

方案一: throws

處裡編譯時異常，將異常交由調用者處理或執行階段報錯。

方案二: try - catch - finally

處理編譯時異常，將異常轉嫁執行階段，並進行異常處理。

jdk7 前: try - catch - finally。
jdk7 後: 配 AutoCloseable 省略 finally 代碼。
jdk9 後: 配 AutoCloseable 省略 finally 代碼，並更簡化。

### 亂碼處理

#### 字符集

##### ASCII 字符集

0 ~ 127 編碼各對應到一個字符，共 128 個字符。
Ascii 字符集用於存儲英文，僅需一個位元組 (字節) 就足以。若不滿足位元組，則須進行編碼轉換 (在前面補 0)。

##### Unicode 字符集

Unicode 字符集收錄了幾乎所有國家的所有語言文字，使用多種編碼規則，主流的編碼規則 UTF-8 採用 1 ~ 4 個位元組進行保存。

#### 編碼 & 解碼 API

- string.getBytes(): 默認編碼
- string.getBytes(String charsetName): 使用指定方式編碼。
- new String(byte[] bytes): 默認解碼。
- new String(byte[] bytes, String charsetName): 使用指定方式解碼。

#### 為甚麼會造成亂碼 ?

1. 未讀完整個文字 (文字可能使用 3 位元組存儲，但只讀取一位元組)。
2. 編解碼格式不統一。

解決方式:

1. 未讀完整個文字:
   1. 使用 new String(byte[] bytes) 將完整的字節陣列進行解碼。
   2. 使用字符流。
2. 編解碼格式不統一:
   1. 妥善配置編輯器，jvm，編譯器編碼格式。

### FileReader (讀取檔案)

FileReader 不同於 FileInputStream，讀到的數據是解碼過後的字符集編碼(或字符, 使用 buffer)，而非單純的位元組 (字節)。FileReader 會讀取完整的文字，因次可以解決某種程度上的亂碼問題。

### FileWriter (寫入檔案)

FileWriter 不同於 FileOuputStream，寫入的數據會經過編碼，而非單純的位元組 (字節)。

### 字符流 vs 字節流

- 字符流相較字節流更加頂層。
- 字符流會做解編碼的操作。
- 字符流自帶 8192 bytes 的小型緩衝區。
- 字節流可以操作任意文件，字符流只能操作純文本。