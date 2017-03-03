# Music
自己感觉通过添加注解来加事务过于繁琐，所以是通过xml问价文件来添加的
特别注意interceptor中的成员变量是如何赋值的：无法通过 DI 的方式来添加interceptor（添加interceptor时，interceptor已经创建，但整个容器内还
没有进行 DI，所以只能 new，采用 new 时interceptor里的成员变量就无法使用 DI）
