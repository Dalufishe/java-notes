# Java 多線程

### 線程 & 多線程

#### 線程

線程指作業系統中，能夠進行運算調度的最小單位。他被包含在進程 (處理程序) 之中，是進程中的實際運作單位。

#### 多線程

多線程指在一個進程當中，cpu 能夠調度切換不同線程進行操作 (或同時進行操作)。
多線程縮短了程序中的等待時間，提高效率。

#### 多線程應用場景

多線程適合用來處裡非同步的程式 (指會阻塞代碼運行的程式):

- 軟件的耗時操作
- 遷移、拷貝文件
- 加載大量資源文件
- 網路 (聊天程式、伺服器)

### 併發和並行

多線程的兩大概念，併發和並行:

- 併發: 在同一時刻，有多個指令在單個 CPU 上交替執行
- 並行: 在同一時刻，有多個指令在多個 CPU 上同時執行

### 第一種: 繼承 Thread 類

實現多線程的方式之一。
核心邏輯: 寫線程，寫任務，實體化並啟用。

1. 繼承 Thread 類

```java
public class ThreadDemo extends Thread{
}
```

2. 重寫 run() 方法

```java
public class ThreadDemo extends Thread{
    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            System.out.println("Hello World Thread !");
        }
    }
}
```

3. 啟用線程

```java
FirstThread t1 = new FirstThread();
t1.start();
```

### 第二種: 實現 Runable 接口

實現多線程的方式之一。
核心邏輯: 寫任務，實體化線程並傳入任務，再啟用。

1. 實現 Runable 接口

```java
public class FirstRun implements Runnable{
}
```

2. 重寫 run() 方法

```java
public class FirstRun implements Runnable{
    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            System.out.println("Hello World Thread !");
        }
    }
}

```

3. 啟用線程 

```java
Thread t2 = new Thread(new FirstRun());
t2.start();
```

Thread 的擴展性差 (不能再繼承其他類)，故 Runable 使用接口的方式實現多線程，其擴展性佳，只是編寫上較麻煩。

使用 Runable 接口實現的類無法直接取得當前線程的資訊，需透過下列方式獲取:

```java
Thread.currentThread(); // 判斷調用方法所在執行緒
```

### 第三種: 利用 Callable 和 FutureTask  

實現多線程的方式之一。

第一種 (Thread) 及第二種 (Runable) 為擴展性的差異，而第三種則是功能上的差異。

利用 Callable 接口 和 FutureTask 類實現的多線程，可以返回線程的運行結果。

```java
public class FirstCallable implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {

        int sum = 0;
        for (int i = 0; i <= 10000; i++) {
            sum += i;
        }

        return sum;
    }
}
```

```java
FirstCallable fc = new FirstCallable();
FutureTask<Integer> ft = new FutureTask<>(fc );
Thread t1 = new Thread(ft);
t1.start();
Integer result = ft.get();
System.out.println(result);
```

### Thread 類的常用成員方法

- getName()
- setName(String name)
- Thread.currentThread()
- Thread.sleep(long time): 線程休眠, 單位為毫秒

### 線程的優先級

Java 的多線程採用搶佔式調度，故線程的執行權是隨機的。
我們可透過設置優先級，調整線程執行的機率，1 ~ 10，10 機率最高，1 機率最小。

- setPriority(int newPriority): 設置優先級
- getPriority()

### 守護線程

當其他的非守護線程執行完畢後，守護線程會陸續結束。

- setDaemon(boolean on)

### 禮讓線程

禮讓線程表示出讓 CPU 的執行權。

- Thread.yeild()

### 插入線程

插入線程表示將一線程插入到另一線程前，並優先執行完畢。

- thread.join(): 將 thread 線程插入到當前線程之前。

### 線程的安全問題

當多個線程操作同一組數據，可能會出現以下問題:

- 相同的值出現了多次
- 出現了超出範圍的值

根本原因: 線程執行時具有隨機性，隨時可能被其他線程搶奪執行權。

解決方法: 同步代碼塊 synchronized。

### 同步代碼塊

使用同步代碼塊，可確保代碼塊內的程式能被該線程運行完畢後，才能被其他線程執行 (就算被其他線程搶奪執行權，仍會被阻擋在代碼塊之外)。

```java
synchronized (/*鎖, 一般用 類名.class 表示該類的物件 */) {
    // 同步代碼塊內要執行的代碼
}
```

注意: 鎖物件可以是任意物件，但要確保是唯一的 (識別那些線程須被同步代碼塊阻擋)。

### 同步方法

除了同步代碼塊，也可以在方法上加上 synchronized 關鍵字編寫同步方法。

和同步代碼塊的差別: 

同步方法無法手動指定鎖，java 會根據當前是否為靜態方法決定鎖物件。

靜態方法: 類.class 
一般方法: this

### Lock 類 

除了使用同步代碼塊 / 同步方法解決數據安全性問題，也可使用 lock 類解決。

同步代碼塊 / 同步方法是自動上鎖、解鎖的，lock 鎖與其相反，是需手動上鎖、解鎖的。

```java
public class MyRun implements Runnable {

    int tickets = 0;
    Lock lock = new ReentrantLock();

    @Override
    public void run() {
        while (true) {
            try {
                lock.lock();
                if (tickets == 100) break;
                tickets++;
                System.out.printf(Thread.currentThread().getName() + "票賣了%s張\n", tickets);
            } finally {
                lock.unlock();
            }
        }
    }
}
```

### 死鎖

當兩個以上的代碼執行處，都在等待對方停止執行，以取得系統資源，但是沒有一方提前登出時，就稱為死鎖。

避免嵌套鎖可有效避免死鎖的發生。

### 生產者 & 消費者 (等待喚醒機制)

生產者和消費者模式是一個可被用於多線程協作的解決方案，又叫等待喚醒機制。

obj.wait(): 在該線程等待，等待，並綁定 obj。
obj.notifyAll(): 將所有綁定 obj 的線程喚醒。

### 線程的生命週期

可透過線程的 getState() 方法 獲得線程當前的狀態。

#### 新建狀態

`getState() == "NEW"`

創建線程時的狀態。

沒有執行權，沒有執行資格。

#### 就緒狀態

`getState() == "RUNNABLE"`

調用 start() 方法時的狀態。

沒有執行權，有執行資格。

#### 運行狀態

`Java 並沒有定義此狀態，僅為方便理解。`

當線程搶奪到 CPU 的執行權時的狀態。

有執行權，有執行資格。

#### 阻塞狀態

`getState() == "BLOCK"`

當線程被鎖阻擋 (同步代碼塊，Lock 物件) 時的狀態。

沒有執行權，沒有執行資格。

#### 等待狀態

`getState() == "WAITING"`

在該線程中，調用 wait() 方法時的狀態。

沒有執行權，沒有執行資格。

#### 計時等待狀態

`getState() == "TIME_WAITING"`

在該線程中，調用 sleep() 方法時的狀態。

沒有執行權，沒有執行資格。

#### 死亡狀態

`getState() == "TERMINATED"`

線程中的代碼執行完畢 (run() 方法)。

沒有執行權，沒有執行資格。

### 線程池

每次建立線程 & 廢棄線程對資源過度浪費，故有線程池，提高線程的復用性。

#### 運作流程

1. 創立線程池，池子是空的
2. 提交任務。
   1. 創建線程物件 (池子是空的)
   2. 復用已存在的線程物件 (有未使用的線程物件)
   3. 等待 (池子已滿，並且沒有空閒線程)
3. 關閉線程池。

#### Executors 工具類

使用 Executors 工具類創建線程池，較容易，但功能較少。

- 建立線程池，無上限線程數。

```java
ExecutorService pool = Executors.newCachedThreadPool();
```

- 建立線程池，對線程數上限進行設置。

```java
ExecutorService pool = Executors.newFixedThreadPool(int nThreads);
```

- 提交任務

```java
pool.submit()
```

- 關闢線程池

```java
pool.shutdown()
```

#### ThreadPoolExecutor

使用 ThreadPoolExecutor JavaBean 類創建線程池，較為複雜，但具有更多可配置性。( 同時作為 Executors 工具類創建線程池的底層 )

```java
ThreadPoolExecutor pool = new ThreadPoolExecutor(
        3, // 核心線程數量
        6, // 最大線程數量
        60, // 臨時線程最大存活時間
        TimeUnit.SECONDS, // 臨時線程最大存活時間單位
        new ArrayBlockingQueue<>(3), // 任務佇列
        Executors.defaultThreadFactory(), // 創建線程工廠
        new ThreadPoolExecutor.AbortPolicy() // 任務拒絕策略
);
```

線程池的底層: 核心線程、等待佇列、臨時線程及任務拒絕策略。

#### 線程池多大合適

CPU 密集型: 最大並行數 + 1

IO 密集型: 最大並行數 * 期望 CPU 使用率 * (CPU 計算時間 + 等待時間 / CPU 計算時間)