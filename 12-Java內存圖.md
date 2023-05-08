# 內存圖

### Java 內存分配

JVM 底層運作之內存分配分為 5 大區塊 : 

- 棧
- 堆
- 方法區
- 本地方法棧
- 寄存器

#### 棧 (VM Stack)

`方法`運行時使用的內存，如 main 方法。

#### 堆 (Heap)

存儲使用 `new` 來創建的`物件`。

#### 方法區 (Method Area)

存儲可運行的 class 文件。

#### 本地方法棧 (Native Method Stack)

JVM 使用作業系統功能使用該內存區塊。

和開發無關。

#### 寄存器 (Program Counter Register)

給 CPU 使用。

和開發無關。