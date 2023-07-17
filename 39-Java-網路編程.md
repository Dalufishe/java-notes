# Java 網路編程

在網路協議下，不同計算機運上行的程序，進行的數據傳輸。

### 網路編程三要素

IP 地址: IP address, 設備在網路中的地址，是唯一的標示。
端口號: Port, 應用程序在設備中唯一的標示。
通訊協議: Protocal, 數據在網路中傳輸的規則，常見的有 UDP、TCP、http、https、ftp 等。

### IP 地址

全稱 Internet Protocal Address，是互聯網協議地址，也稱 IP 地址。
其作為聯網設備唯一的標示地址。

#### IPv4

網路通訊協議 (IP) 有兩個版本 IPv4 & IPv6。

使用 IPv4 版本的 IP 地址，採用 32 位元地址長度, 分 4 組。

其採用 點分10進制 表示法，每一組 10 進制表示法取值範圍為 0 ~ 255。

```bash
底層2進制: 11000000 10101000 00000001 01000010
點分10進制: 192.168.1.66
```

然而其只有 42 億多組，已在 2019 年被使用完畢。

#### IPv6

使用 IPv6 版本的 IP 地址，採用 128 位元地址長度, 分 8 組。

其採用 冒分16進制 表示法，可省略前面的 0，並可壓縮。

```bash
底層2進制: 00100000 00000001 00001101 10111000 00000000 0000000 00000000 00100011 00000000 00001000 00001000 00000000 00100000 00001100 01000001 01111010
冒分16進制: 2001:DB8:0:23:8:800:200C:417A
```

IPv6 可以有 2^128 次方個 IP 位置，可以說是用不完了。

#### 局域網

Q: 現今 IPv6 尚未普及，但 IPv4 已經用完了，那現今是如何解決 IPv4 不夠的問題 ?

A: 使用局域網 IP。局域網 IP 透過路由器連結到公用網，故可大幅增加連網設備的 IP 位置復用性。

局域網 IP 是 192.168 開頭的。

#### 127.0.0.1

127.0.0.1 指向本機的 IP 位置，並不經過路由器。
一般用於開發應用的測試，演示。

#### InetAddress 類

InetAddress 類在 Java 表示 IP 地址，其會自動識別設備使用 ipv4 或 ipv6。

##### 獲取物件

InetAddress.getByName(String host): 透過 ip 位置或主機名獲得物件。
InetAddress.getLocalHost(): 獲取本機 ip 物件。

##### 常用方法

- getHostName(): 獲得主機名
- getHostAddress(): 獲得主機地址

### 端口號

端口號作為應用程序在設備中唯一的標示。
其取值範圍為 2 個 位元組，十進制表示為 0 ~ 65535。
一個端口號只能被一個應用程序所使用。

### 通訊協議

在計算機網路中，連接和通信的規則被稱為網路通信協議。

#### UDP 協議

用戶數據報協議 (User Datagram Protocal)，屬於傳輸層的協議。
UDP 是`面向無連接`通訊協議 (無須確認連接)。
速度快，但數據不安全，易丟失。
有大小限制，一次最多 64K。

##### DatagramSocket & DatagramPacket 類

在 Java 中，可透過 DatagramSocket & DatagramPacket 類操作 udp 協議 發送/接收 數據。
DatagramSocket 類表示運貨商，DatagramPacket 類表示包裹。

發送流程:

```java
public class SendUDP {
    public static void main(String[] args) throws IOException {

        final InetAddress SEND_IP_ADDRESS = InetAddress.getLocalHost();
        final Integer SEND_PORT = 20000;
        final InetAddress RECEIVE_IP_ADDRESS = InetAddress.getLocalHost();
        final Integer RECEIVE_PORT = 30000;

        String data = "Hello UDP";
        byte[] data_b = data.getBytes();

        DatagramSocket ds = new DatagramSocket(SEND_PORT, SEND_IP_ADDRESS);
        DatagramPacket dp = new DatagramPacket(data_b, data_b.length, RECEIVE_IP_ADDRESS, RECEIVE_PORT);

        System.out.println("發送的數據: " + data);
        System.out.println("接收方: " + RECEIVE_IP_ADDRESS + ":" + RECEIVE_PORT);

        ds.send(dp);
        ds.close();
    }
}
```

接收流程:

```java
public class ReceiveUDP {
    public static void main(String[] args) throws IOException {

        final InetAddress SEND_IP_ADDRESS = InetAddress.getLocalHost();
        final Integer SEND_PORT = 20000;
        final InetAddress RECEIVE_IP_ADDRESS = InetAddress.getLocalHost();
        final Integer RECEIVE_PORT = 30000;

        byte[] data_b = new byte[1024];

        DatagramSocket ds = new DatagramSocket(RECEIVE_PORT, RECEIVE_IP_ADDRESS);
        DatagramPacket dp = new DatagramPacket(data_b, data_b.length);
        ds.receive(dp);

        System.out.println("接收到的數據: " + new String(data_b));
        System.out.println("發送方: " + dp.getAddress() + ":" + dp.getPort());

        ds.close();

    }
}
```

##### UDP 三種通信方式

UDP 支持三種通信方式，單播、組播及廣播。

- 單播: 一對一的通信方式。
  - 使用 DatagramSocket 類。
- 組播: 一對多的通信方式。
  - 使用 MulticastSocket 類。
  - 組播地址為 224.0.0.0 ~ 239.255.255.255。
- 廣播: 一對全 (局域網) 的通信方式。
  - 使用 DatagramSocket 類。
  - 廣播地址為 255.255.255.255



#### TCP 協議

傳輸控制協議 (Transmission Protocal)，屬於傳輸層的協議。
TCP 是`面向連接`通訊協議 (需確認連接)。
速度慢，但數據安全。
無大小限制。

##### Socket & ServerSocket 類

在 Java 中，TCP 連接使用 Socket & ServerSocket 類實作。Socket 表示發送端，ServerSocket 表示接收端。另外，Java 採用 IO 流來處理傳輸數據。

發送流程:

```java
public class SendTCP {
    public static void main(String[] args) throws IOException{
        Socket s = new Socket(InetAddress.getLocalHost(), 10000);
        OutputStream os = s.getOutputStream();
        os.write("Hello TCP".getBytes());
        os.close();
        s.close();
    }
}
```

接收流程:

```java
public class ReceiveTCP {
    public static void main(String[] args) throws IOException {
        ServerSocket ss = new ServerSocket(10000);
        Socket socket = ss.accept();
        InputStream is = socket.getInputStream();
        while (true) {
            int read = is.read();
            if (read == -1) break;
            System.out.print((char) read);
        }
        is.close();
        socket.close();
        ss.close();
    }
}
```

##### 三次握手和四次揮手

三次握手: 確保連接建立
四次揮手: 確保連接斷開