# Java 方法引用

方法引用就是把已存在的方法拿來使用，當作函數式接口中抽象方法的方法體。

### 規則

1. 引用處必須是函數式接口。
2. 被引用的方法必須是已存在。
3. 被引用的方法形參和返回值需和抽象方法一致。
4. 被印用方法的功能需滿足當前需求。

### 語法

```java
public class Test {
    public static void main(String[] args) {

        Integer[] arr = {3, 5, 4, 1, 6, 2};
        Arrays.sort(arr, Test::rule);
    }

    public static int rule(Integer o1, Integer o2) {
        return o2 - o1;
    }

}

```

### 一般的引用方式

#### 引用靜態方法

格式: 類名::靜態方法
範例: Integer::parseInt

#### 引用成員方法

格式: 物件::成員方法
- 本類: this::方法名
- 父類: super::方法名

#### 引用構造方法

格式: 類名::new
範例: Student::new

#### 特殊的引用方式

### 類名引用成員方法

格式: 類名::成員方法
範例: String::toUpperCase
特殊規則:
- 被引用的方法返回值需和抽象方法一致，然而，被引用方法的形參，需和抽象方法的第二個形參到最後一個保持一致，抽象方法第一個形參是作為引用方法的調用者。