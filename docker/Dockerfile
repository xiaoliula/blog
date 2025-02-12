FROM openjdk:8-jre-alpine

# 暴露端口
EXPOSE 8081 9324 465

# 定义启动命令
CMD ["java", "-jar", "-Xms512m", "-Xmx1024m", "-Xmn256m", "-Xss256k", "D:/study/demo/poetize/poetize-server/poetize-server.jar", "--spring.datasource.username=${USERNAME}", "--spring.datasource.password=${PASSWORD}", "--spring.datasource.host=p-mysql"]
