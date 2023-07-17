# Java 網路爬蟲

網路爬蟲表示將網路資料抓取，並進行分析。

### 網路爬取

使用 URL 類向網路抓取資料。

```java
public static String webCrawler(String strUrl) throws IOException {

        StringBuilder data = new StringBuilder();

        URL url = new URL(strUrl);
        URLConnection conn = url.openConnection();
        InputStreamReader isr = new InputStreamReader(conn.getInputStream(), Charset.forName("UTF-8"));
        char[] buffer = new char[1024 * 1024];
        while (true) {
            int read = isr.read(buffer);
            if (read == -1) break;
            data.append(buffer, 0, read);
        }
        isr.close();

        return data.toString();
    }
```

### 分析數據

使用正規表達式 (Pattern + Matcher) 分析數據。
