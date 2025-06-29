# 使用官方的 OpenJDK 17 基础镜像（Alpine 版本更轻量）
FROM openjdk:17-jdk-alpine

# 时区
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 创建工作目录 /app
WORKDIR /app

# 复制本地构建的 Spring Boot JAR 包到镜像中的 /app 目录
# 假设 JAR 文件位于项目根目录下的 target 文件夹中
COPY target/jdk17jenkins.jar /app.jar

# 暴露 Spring Boot 应用的默认端口 8080
EXPOSE 8080

# 定义容器启动时执行的命令，运行 JAR 文件
ENTRYPOINT ["java", "-jar", "/app.jar"]
