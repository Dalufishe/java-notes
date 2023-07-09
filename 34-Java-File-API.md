# Java File API

File 物件表示文件 & 資料夾，可以是存在的，也可以是不存在的。

### 建立物件

- new File(String pathname)
- new File(String parent, String child)

### 常見方法

#### 判斷 & 獲取

- isDirectory()
- isFile()
- exists()
- length()
- getAbsolutePath()
- getPath()
- getName()
- lastModified()

#### 創建 & 刪除

- createNewFile()
- mkdir()
- mkdirs()
- delete()

#### 獲取並遍歷

- File.listRoots(): 列出可用的系統根。
- list(): 獲取該路徑下的所有內容 (字串)。
- list(FilenameFilter filter): 使用文件名過濾器 (函數式接口)。
- listFiles(): 獲取該路徑下的所有內容 (File 物件)。
- listFiles(FilenameFilter filter): 使用文件名過濾器 (函數式接口)。
- listFiles(FileFilter filter): 使用文件過濾器 (函數式接口)。


### 如何獲取資料夾內所有內容 ? 

核心思想: 遞歸。

流程:

1. 進入資料夾
2. 遍歷資料夾
3. 判斷是否文件
4. 判斷是否資料夾

```java
public static void findJavaFile(File src) {
    // 1. 進入資料夾
    File[] files = src.listFiles();

    // * 特殊情況: 無權限 || 非資料夾返回
    if (files == null) return;

    // 2. 遍歷資料夾
    for (File file : files) {
        // 3. 判斷是否文件
        if (file.isFile()) {
            // 進行邏輯判斷
            if (file.getName().endsWith(".java")) {
                System.out.println(file);
            }
        }
        // 4. 判斷是否資料夾
        else {
            findJavaFile(file);
        }
    }
}
```

### 如何刪除資料夾的所有內容 ? 

File 物件的 delete() 方法只能刪除空資料夾。

必須刪除資料夾內的所有文件 + 資料夾，再刪除自身，才能做到刪除資料夾。

核心思想: 獲取資料夾所有內容 + 刪除。