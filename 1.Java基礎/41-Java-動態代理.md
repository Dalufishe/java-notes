# Java 動態代理

動態代理是一種動態的，非侵入式增加代碼功能的方式。
為原本類動態生成代理類，調用者通過調用代理物件的方法，間接調用物件的方法。
Java 使用 Proxy.newProxyInstance() 方法實現動態代理，並通過接口保證代理物件和原始物件方法保持一致。

Student Class:
```java
public class Student implements Study {

    private String name;
    private int age;

    public Student() {
    }

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public void study(String subject) {
        System.out.println(this.getName() + "正在學習" + subject);
    }

    /**
     * 获取
     *
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     *
     * @return age
     */
    public int getAge() {
        return age;
    }

    /**
     * 设置
     *
     * @param age
     */
    public void setAge(int age) {
        this.age = age;
    }

    public String toString() {
        return "Student{name = " + name + ", age = " + age + "}";
    }
}
```

Study Interface
```java
public interface Study {
    public abstract void study(String subject);
}

```

Test (Main Code):
```java
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Test {
    public static void main(String[] args) {

        Student stu = new Student("Eason", 17);
        // 動態代理
        Study proxyStuWithStudy = (Study) Proxy.newProxyInstance(
                Test.class.getClassLoader(),
                new Class[]{Study.class},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if (method.getName().equals("study") && method.getParameters()[0].getType().getName().equals("java.lang.String")) {
                            System.out.println("先喝一杯溫開水");
                        }
                        return method.invoke(stu, args);
                        
                    }
                }
        );

        proxyStuWithStudy.study("國文");

    }
}

```