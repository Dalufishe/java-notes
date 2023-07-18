# Java 反射

反射允許對類本身、成員變量、成員方法和構造方法的信息進行編程訪問。

### 獲取表示類的物件 (Class 類)

1. Class.forName(String 類名)
2. 類名.class
3. 物件.getClass()

第一種方式是從硬碟中獲取字節碼訊息。
第二和第三種方式是從內存中獲取字節碼訊息。

### 獲取構造方法物件 (Constructor)

- getConstructors(): 獲得所有公共的構造方法
- getDeclaredConstructors(): 獲得所有構造方法
- getConstructor(Class<?> ...parameterTypes): 獲取單個公共的構造方法
- getDeclaredConstructors(Class<?> ...parameterTypes): 獲得單個構造方法

#### 獲取修飾符

- getModifiers()

#### 獲取參數

- getParameters()
- getParameterCount()
- getParameterTypes()

#### 實體化物件 &  臨時修改權限 (暴力反射)

- setAccessible(boolean flag);
- newInstance(Object ...initargs);

### 獲取成員變數物件 (Field)

### 獲取成員方法物件 (Method)

