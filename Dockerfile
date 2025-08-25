FROM openjdk:8-jre-alpine

# 暴露端口
EXPOSE 8081 9324 465

# 复制可执行的 JAR 文件到容器中
COPY    1.jar /app/1.jar

# 定义启动命令
CMD ["java", "-jar", "-Xms512m", "-Xmx1024m", "-Xmn256m", "-Xss256k", "/app/1.jar", "--spring.datasource.username=${USERNAME}", "--spring.datasource.password=${PASSWORD}", "--spring.datasource.host=p-mysql"]
