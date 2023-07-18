# Java 常見算法

算法，又稱演算法，是一套套經過定義的標準程序，用於解決問題。

### 查找 (搜尋) 算法

查找就是在一堆數據中找到想要的值。

常見的查找算法:

- 基本查找
- 二分查找
- 插值查找
- 分塊查找
- 斐波那契查找
- 樹表查找
- 哈希查找

#### 基本查找 (線性搜尋)

基本查找，又稱順序查找，其核心為將數據放入一容器 (如陣列)，並從索引 0 按各往後查找。

流程:

1. 設置陣列
2. 按索引遍歷陣列
3. 查找想要的值 (O)
4. 遍歷結束，則沒有該值 (X)

```java
public static boolean isExist(int[] arr, int number) {
    for (int i = 0; i < arr.length; i++) {
        if (arr[i] == number) return true;
    }
    return false;
}

public static int findIndex(int[] arr, int number) {
    for (int i = 0; i < arr.length; i++) {
        if (arr[i] == number) return i;
    }
    return -1;
}

public static ArrayList<Integer> findIndexAll(int[] arr, int number) {
    ArrayList<Integer> list = new ArrayList<>();
    for (int i = 0; i < arr.length; i++) {
        if (arr[i] == number) {
            list.add(i);
        }
        ;
    }
    return list;
}
```

#### 二分查找 (二元搜尋)

二分查找，又稱折半查找，其核心為其核心為將數據放入一容器 (如陣列)，每次排除一半的查找範圍，直到查找到想要的值。

前提條件: 數據必須是有序的。

流程:

1. 設置陣列
2. 找到最小索引 (min)，最大索引 (max)，默認 0 和 length - 1
3. 獲取中間索引 (mid) 的值 (mid = (min + max) / 2)
4. 比較中間索引的值和要查找的值
5. 縮小範圍，修改最小索引或最大索引
   1. 若要查找的值在 mid 的值的左邊，min 不變 max = mid - 1
   2. 若要查找的值在 mid 的值的右邊，max 不變 min = mid + 1
6. 重複 3 - 6 直到查找到想要的值 (O)
7. 若 min > max，則沒有該值 (X)

```java
public static int findIndex(int[] arr, int number) {

    int min = 0;
    int max = arr.length - 1;
    int mid;

    while (true) {
        // no value
        if (min > max) {
            return -1;
        }

        mid = (min + max) / 2;

        if (number > arr[mid]) {
            min = mid + 1;
        }
        else if (number < arr[mid]) {
            max = mid - 1;
        }
        // number == arr[mid]
        else {
            return mid;
        }
    }
    }
```

特色:

- 相較基本查找效率更高
- 僅能處裡有序數據
- 若為無序數據，可先排序後查找，但有侷限性 (索引無意義)

變化:

二分查找透過中間索引 ((mid + max) / 2) 作為斷點做查詢:

mid = (min + max) / 2

第一種變化:

斷點使用的的是值在陣列中較可能出現的位置 (偏移 + 占比)，盡可能靠近要查找的數據，不再是中間索引:

mid = min + key-arr[min] / arr[max] - arr[min] \* (max - min)

此為二分查找的改良版，叫做`插值查找`，在處裡較為`分布的數據`時，效能會比二分查找高。

第二種變化:

斷點使用黃金分割點 (1 : 0.618)，不再是中間索引:

mid = min = 黃金分割點左半邊長度 - 1

此為二分查找的改良版，叫做`斐波那契查找`。

#### 分塊查找

`基本查找`適合處裡完全無序的數據。
`二分查找`、`插值查找`、`斐波那契查找`僅能處裡有序的數據。

但現實生活中的數據，常常是有序數據中混雜點無序數據。

`分塊查找`解決了上述的問題。其適合處裡介於完全無序和有序間的數據。

其核心概念為三:

1. 將數據分塊，塊的數量通常等於數字的個數開更號，
2. 前一塊最大的數據，小於後一塊所有的數據。(塊內無序，塊間有序) (有例外情況)
3. 先確定查找的元素在哪一塊，在從塊中按個查找。

### 排序算法

排序算法就是將一系列無序的數據排成有序的數據。
有序數據可是由小到大，也可由大到小。

常見的排序算法:

- 冒泡排序
- 選擇排序
- 插入排序
- 快速排序
- 希爾排序
- 堆排序
- 桶排序
- 歸併排序
- 計數排序
- 基數排序

#### 冒泡排序

冒泡排序，其核心為將數據放入一容器中，相鄰的數據兩兩比較，小的放前，大的放後，反覆循環，直到結束。運作起來看起來就像最大數值一一浮出來一般。

優化:

1. 整體僅需要重複 arr.length -1 次。
2. 兩兩比較，可以省略比較過之最大值個數。 (arr.length - i - 1)

```java
public static void sort(int[] arr) {
    // arr.length - 1 表示反覆循環 長度 - 1
    for (int i = 0; i < arr.length - 1; i++) {
    // arr.length - 1 - i 表示比較 長度 - 1 - 最大值個數
        for (int j = 0; j < arr.length -1 - i; j++) {

            if (arr[j+1] < arr[j]){
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}
```

#### 選擇排序

選擇排序，其核心為將數據放入一容器中，將 0 索引的元素和後面的元素一一比較，小的放前，大的放後，反覆循環，直到結束。運作起來看起來就像最小數值一一抓出來一般。

優化:

1. 整體僅需要重複 arr.length -1 次。
2. 反覆循環可以省略比較過之最小值個數。

```java
public static void sort(int[] arr){
    for (int i = 0; i < arr.length - 1;i++) {
        for (int j = i+1; j < arr.length - 1; j++){
            if (arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }

    }
}
```

#### 插入排序

插入排序，其核心為將 0 索引的元素到 n 索引的元素看作是有序的，把 n+1 索引的元素到最後一位元素看作是無序的。遍歷無序數據，將遍歷到的元素一個個插入到有序序列的適當位置。

```java
public static void sort(int[] arr) {

    int startIndex = -1;
    // 找到無序數據起始索引
    for (int i = 0; i < arr.length - 1; i++) {
        if (arr[i] > arr[i + 1]) {
            startIndex = i;
            break;
        }
    }

    // 遍歷無序數據
    for (int i = startIndex; i < arr.length; i++) {
        int j = i;
        while (j > 0 && arr[j] < arr[j - 1]) {
            int temp = arr[j];
            arr[j] = arr[j - 1];
            arr[j - 1] = temp;
            j--;
        }
    }
}
```

##### 先備知識: 遞歸算法

遞歸算法的核心就是在方法中調用該方法，並設置出口點 (甚麼時候不調用該方法) 及規則。

遞歸算法善於將複雜的問題轉成與原問題相似但規模較小的問題。使用遞歸通常只需要少量的程序就可以描述解題過程需要的多次重覆計算。

求總和:

```java
public static int getOneToN(int n) {
    if (n == 1) {
        return  1;
    }
    return n + getOneToN(n-1);
}
```

求階乘:

```java
public static int getFactorial(int n) {
    if (n == 1) {
        return 1;
    }
    return  n * getFactorial(n - 1);
}
```

#### 快速排序

快速排序，其核心為將排序範圍中的第一個數字設為基準數，再定義兩個變數 start 和 end，end 從後往前找比基準數小，start 從前往後找比基準數大，找到後交換 start 和 end，並循環此過程，直到 start 和 end 處於同一個位置，該位置是基準數中在陣列中應存入的位置，在讓基準數歸位。反覆此動作，直到所有數據完成排序。

```java
private static void _sort(int[] arr, int i, int j) {

    int start = i;
    int end = j;

    if (start > end) {
        return;
    }

    int base = arr[i];

    while (start != end) {
        while (true) {
            if (start == end || arr[end] < base) {
                break;
            }
            end--;
        }
while (true) {
    if (start == end || arr[start] > base) {
        break;
    }
    start++;
}
int temp = arr[start];
arr[start] = arr[end];
arr[end] = temp;
}

int temp = arr[i];
arr[i] = arr[start];
arr[start] = temp;

_sort(arr, i, start - 1);
_sort(arr, start + 1, j);
}

public static void sort(int[] arr) {
    _sort(arr, 0, arr.length - 1);
}
```
