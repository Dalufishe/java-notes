# Java 簡介

### Hello World

- 建立 HelloWorld.java

```java
public class HelloWorld {
    public static void main(String[] args){
        System.out.println("Hello World");
    }
}
```

- 編譯 HelloWorld.java

```bash
javac HelloWorld.java
```

- 運行 HelloWorld.class

```bash
java HelloWorld
```

- 注意：編譯時須加上後綴名，執行則不用。

### Java 的歷史

Sun 公司 James Gosling 領導的 Green 計畫，開發了 Oak 語言 (用於智能家電)。
James Gosling 使用 Oak 開發了 WebRunner 瀏覽器，打算為 Oak 註冊商標。
然而 Oak 商標已被註冊，改名為 Java。

- 1996 年推出 Java 1.0。
- 2009 年被 Oracle 收購。

### Java 版本

Java 版本主要分成過度版本及長期支持版本(LTS)。

- Java 8 市面上最多的 Java 版本。
- Java 17 目前最新的 LTS 版本。

### Java 平台

- Java SE
- Java ME
- Java EE

#### Java SE

Java 語言的標準版，用於桌面應用的開發。

#### Java ME

Java 語言的小型版，用於嵌入式開發或小型移動設備。

#### Java EE

Java 語言的企業版，用於 Web 網站開發 (server 端)。

### Java 能做甚麼

- 桌面應用開發
  - IDEA，Clion，Pycharm
- 伺服器開發
  - 微服務，spring
- 移動應用開發
  - android
- 科學計算
  - matlab
- 大數據開發
  - hadoop
- 遊戲開發
  - Minecraft

### Java 優勢

Java 用戶量多，適用面廣，生態系大，與時俱進。
Java 支持物件導向。
Java 安全性強，漏洞少，
Java 支持多執行緒。
Java 開源。
Java 跨平台 (Write once, run anywhere)。

### Java 跨平台 & 虛擬機

Java 是混合型 (編譯 + 直譯) 的程式語言，工作流如下：

- 編譯 java 文件
  - .java -> 編譯 -> .class
- 將 class 文件交給虛擬機運行
  - .class -> 虛擬機直譯 -> 機器碼

Java 透過虛擬機 (jvm) 的原理，實現了單文件 (.class) 跨平台的功能。

### Java JDK & JRE

JDK 是一套集成的 Java 開發包，包含 jvm，標準函式庫，開發工具 (javac java) 等。

JRE 是 Java 運行環境，包含 jvm，標準函式庫，運行工具。若只需要運行 Java 程序而非開發，則下載 JRE (佔用空間較小)。

JDK 包含 JRE
JRE 包含 JVM
