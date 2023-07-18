# Java 高級 IO 流

上一篇講的是 IO 流中的基本流。高級流在基本流之上，提供了更多的特性及 api 以利於特操作。

### 緩衝流

緩衝流也分為字節流和字符流，輸入流和輸出流:

- BufferedInputStream : 字節緩衝輸入流
- BufferedOutputStream : 字節緩衝輸出流
- BufferedReader : 字符緩衝輸入流
- BufferedWriter : 字符緩衝輸出流

緩衝流在底層自帶了緩衝區，默認為長度為 8192 的陣列，提高性能。

#### 獲取緩衝流物件

透過包裝: 將基本流包裝成緩衝流，增加緩衝功能。

- new BufferedInputStream(InputStream is);
- new BufferedInputStream(InputStream is, int size);

#### 緩衝流的注意點

1. 過去基本流可以配置緩衝區 (byte[])，相同方式在緩衝流是作為緩衝區溝通的陣列，並非取代緩衝區。
2. 字符基本流原先就自帶緩衝區。使用緩衝流的意義是使用其獨有的 newLine() 和 readLine() 方法。

### 轉換流

轉換流屬於字符流，具有輸入及輸出流。

- InputStreamReader: 字符轉換輸入流
- OutputStreamWriter 字符轉換輸出流

轉換流作為字符流和字節流之間的橋樑。

轉換流主要用於解編碼及後續操作 (字符流作用, 可被 FileReader 取代) 及使字節流使用字符流上的方法。

#### 將字節流轉為轉換流 (字符流)

- InputStreamReader(InputStream is)

#### 轉換流的注意點

1. 轉換流屬於字符流，目的在於將字節流轉為字符流 (底層會做解編碼)。
2. 轉換流為基本字符流的底層，早期版本甚至沒有基本字符流。
3. 解編碼相關的 api 均需指定編碼格式，如 string.getBytes(), FileReader 構造，InputStreamReader 構造。

### 序列化 (反) 流

序列化 (反) 流屬於字節流，具輸入 (反序列化) 及輸出 (序列化) 流。

- ObjectOutputStream: 序列化流
- ObjectInputStream: 反序列化流

#### 序列化流

序列化流用於將 Java 中的物件寫到本地文件中，並是人類無法讀懂的格式。

- ObjectOutputStream(OutputStream os): 把基本流包裝成高級流。
- writeObject(Object obj): 序列化物件到文件中。

注意: 類必須實現 Serializable 標記型接口，其實體才可被序列化。

#### 反序列化流

- ObjectInputStream(InputStream is): 把基本流包裝成高級流。
- readObject(): 將文件反序列化的文件。

#### 序列版本 UID

默認情況下，Java 會為實現 Serializable 的類生成序列版本 UID。他會隨著類的內容改變而改變。

這會造成問題，當有新版本 JavaBean，舊版本的序列化文件就無法被讀取。

解決方法: 可透過手動設置序列版本 UID，避免其改變。

```java
private static final long serialVersionUID = 1L;
```

#### transient

transient 關鍵字作用在於不使成員被序列化至文件。

### 打印流

打印流分為字節流及字符流，僅具有輸出流。

- PrintStream: 字節打印流
- PrintWriter: 字符打印流

打印流用於將數據打印至文件，提供諸如 print, println, printf 等方法。

字節打印流和字符打印流的差別:

1. 字符打印流有緩衝區，會比字節打印流更高效。
2. 因字符打印流有緩衝區，若需要自動刷新需手動開啟。

### 壓縮流 (解) 流

壓縮流 (解) 流屬於字節流，具輸入 (解壓縮) 及輸出 (壓縮) 流。

- ZipInputStream: 解壓縮流
- ZipOutputStream: 壓縮流

### Commons-io

Commons-io 是 Apache 提供的一組簡化 IO 操作的開源工具包。

#### 下載連結

[https://commons.apache.org/proper/commons-io/download_io.cgi](https://commons.apache.org/proper/commons-io/download_io.cgi)

#### FileUtils 工具類

- FileUtils.copyFile(src, dest);
- FileUtils.copyDirectory(src, dest);
- FileUtils.copyDirectoryToDirectory(src, dest);
- FileUtils.delete(file);
- FileUtils.deleteDirectory(dir);
- FileUtils.cleanDirectory(dir);
