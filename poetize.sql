/*
 Navicat Premium Data Transfer

 Source Server         : 华为云：poetize
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 120.46.51.106:3306
 Source Schema         : poetize

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 25/08/2025 19:17:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `sort_id` int(0) NOT NULL COMMENT '分类ID',
  `label_id` int(0) NOT NULL COMMENT '标签ID',
  `article_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `article_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博文标题',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博文内容',
  `video_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频链接',
  `view_count` int(0) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `like_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `view_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'public' COMMENT '访问类型',
  `view_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问条件',
  `tips` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示',
  `recommend_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐[0:否，1:是]',
  `comment_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用评论[0:否，1:是]',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最终修改时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最终修改人',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用[0:未删除，1:已删除]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 4, 2, '/static/articleCover/onew11735480820082722.webp', '这只是一个小小的博客', '# 博客诞生记\n终于，我的个人博客上线了！这是一个基于**Spring Boot**后端和**Vue 2/Vue 3**前端的全栈项目。从数据库设计到前端渲染，每一行代码都倾注了无数个深夜的思考与调试。\n# 技术栈\n前端：Vue 2为主，聊天室使用Vue 3\n\n后端：Spring Boot + MySQL，使用JPA实现数据持久化，RESTful API设计规范\n\n部署：Nginx反向代理，Docker容器化\n\n# 代码之外\n在无数个调试Bug的夜晚，我常常想起一句话：\n\n> \"代码不会背叛你，但爱情会。\"\n\n作为一个单身程序员，我的情感生活就像未捕获的异常——总是悄无声息地崩溃。但至少，我的博客会一直在这里，记录我的技术成长与人生感悟。\n\n> \"愿代码与孤独，都能被温柔以待。\"\n—— Onew', 'https://m.douyin.com/share/video/7058623651175828750', 92, 0, 'public', NULL, NULL, 0, 1, '2024-09-03 22:14:44', '2025-02-20 21:03:52', 'onew', 0);
INSERT INTO `article` VALUES (2, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/2.webp', 'Java项目包名该如何命名', '# 1. 基本格式\n  包名的一般格式是：com.公司名.项目名.模块名\n# 2. 示例命名\n  假设你的项目名称为 XXX，可以考虑以下包名：\n（1）根包名：\n如果你有一个域名，例如 example.com，则反向域名为 com.example。\n根包名可以是 com.example.XXX。\n（2）模块包名：\n根据项目的功能模块进一步细分包名。例如，登录、注册等。', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2024-05-20 22:06:00', '2024-09-09 13:57:11', '一个达不刘', 0);
INSERT INTO `article` VALUES (3, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/3.webp', '关于idea报错提示Output directory...', '# 报错提示\n```language\nD:\\XXX\\src\\main\\java\\com\\XXX\\XXX\\base\\BaseApiController.java:11:8java: 写入com.XXX.XXX.base.BaseApiController时出错: Output directory is not specified\n```\n\n# 解决措施：\n\n## 方法一：检查 Maven 配置\n确保 pom.xml 中的 Maven 配置正确设置了输出目录。你可以按照以下步骤检查：\n\n（1）打开 pom.xml 文件。\n\n（2）确保 <build> 部分包含了正确的 <outputDirectory> 和 <testOutputDirectory> 配置。例如：\n\n<build>\n    <outputDirectory>${project.build.directory}/classes</outputDirectory>\n    <testOutputDirectory>${project.build.directory}/test-classes</testOutputDirectory>\n    <!-- 其他配置... -->\n</build>\n（3）配置了正确的输出目录。例如：\n\n<properties>\n    <!-- 其他属性... -->\n    <project.build.directory>target</project.build.directory> <!-- 这里设置了输出目录 -->\n</properties>\n## 方法二：清理 Maven 缓存\n有时 Maven 缓存中的某些问题会导致构建错误。你可以尝试清理 Maven 缓存，然后重新构建项目。你可以使用 Maven 命令 mvn dependency:purge-local-repository 来清理本地 Maven 仓库中的依赖缓存。\n\n## 方法三：检查 IntelliJ IDEA 配置\n确保 IntelliJ IDEA 中的 Maven 配置正确。你可以尝试重新导入项目，或者在 IntelliJ IDEA 中清理缓存（通过 File -> Invalidate Caches / Restart...）来解决问题。\n\n## 方法四：检查项目结构\n确保项目结构正确，所有源代码和资源文件都位于正确的目录中。检查是否有其他因素导致了构建错误，比如文件路径错误或者文件损坏。\n\n## 方法五：查看导出的路径是否正确（本人用此方法解决）\n![image.png](/static/articlePicture/11725861551367686.png)', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2024-05-21 13:57:00', '2024-09-09 14:01:36', NULL, 0);
INSERT INTO `article` VALUES (4, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/4.webp', '将本地 JAR 包安装到本地 Maven 仓库', '# 1.打开终端或命令行\n# 2.运行以下命令，将 JAR 文件安装到本地 Maven 仓库：\n```language\nmvn install:install-file -Dfile=path/to/your/local-jar-file.jar -DgroupId=com.example -DartifactId=your-artifact-id -Dversion=1.0.0 -Dpackaging=jar\n```\n# 3.在 pom.xml 中添加依赖\n安装成功后，可以在 pom.xml 文件中添加对这个 JAR 包的依赖：\n```language\n<dependency>\n    <groupId>com.example</groupId>\n    <artifactId>XXX</artifactId>\n    <version>x.x.xx</version>\n</dependency>\n```\n# 4.刷新 Maven 项目\n打开 IntelliJ IDEA，右键点击项目根目录，选择 Maven -> Reload Project，或者使用右侧的 Maven 工具栏中的刷新按钮。\n# 5.验证依赖是否生效\n在项目中使用 com.example.minio 包中的类，IDEA 应该能自动识别并提供相应的代码提示。如果没有识别，可能需要再次刷新 Maven 项目。\n# 补充：安装多个 JAR 文件\n如果有多个本地 JAR 文件需要安装，可以重复上述步骤，逐个安装每个 JAR 文件，并在 pom.xml 中添加相应的依赖。\n# 使用 mvn deploy:deploy-file 命令（可选）\n如果你希望将本地 JAR 文件部署到一个远程 Maven 仓库（例如公司的私有仓库），可以使用 mvn deploy:deploy-file 命令：\n```language\nmvn deploy:deploy-file -Dfile=path/to/your/local-jar-file.jar -DgroupId=com.example -DartifactId=your-artifact-id -Dversion=1.0.0 -Dpackaging=jar -Durl=repository-url -DrepositoryId=repository-id\n```', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-21 18:48:00', '2024-09-09 14:09:30', NULL, 0);
INSERT INTO `article` VALUES (5, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/5.webp', '本地部署MinIO通过Java实现文件上传', '# 1.添加依赖\n## （1）打开pom.xml文件，将的 MinIO依赖添加进去，并保存文件，示例代码为：\n<dependency>\n    <groupId>io.minio</groupId>\n    <artifactId>minio</artifactId>\n    <version>8.5.10</version>\n</dependency>\n## （2）右键单击文件编辑区域，选择Maven>>>Reload Project，或在右侧的Maven工具窗口中点击刷新按钮。\n2.新建Maven项目\n```language\npackage org.example;\n\nimport io.minio.MinioClient;\nimport io.minio.errors.MinioException;\nimport io.minio.BucketExistsArgs;\nimport io.minio.MakeBucketArgs;\nimport io.minio.PutObjectArgs;\n\nimport java.io.FileInputStream;\nimport java.io.IOException;\nimport java.io.InputStream;\nimport java.security.InvalidKeyException;\nimport java.security.NoSuchAlgorithmException;\n\npublic class MinioUploader {\n\n    public static void main(String[] args) {\n        // MinIO 服务器信息\n        String endpoint = \"http://localhost:9000\";\n        String accessKey = \"YOUR_ACCESS_KEY\";\n        String secretKey = \"YOUR_SECRET_KEY\";\n        String bucketName = \"YOUR_BUCKET_NAME\";\n\n        // 要上传的文件信息\n        String objectName = \"example.jpg\"; // 文件在 MinIO 中的对象键\n        String filePath = \"path/to/your/file/example.jpg\"; // 本地文件路径\n\n        // 初始化 MinIO 客户端\n        try {\n            MinioClient minioClient = MinioClient.builder()\n                    .endpoint(endpoint)\n                    .credentials(accessKey, secretKey)\n                    .build();\n\n            // 检查存储桶是否存在，不存在则创建\n            boolean isExist = minioClient.bucketExists(\n                    BucketExistsArgs.builder().bucket(bucketName).build());\n            if (!isExist) {\n                minioClient.makeBucket(\n                        MakeBucketArgs.builder().bucket(bucketName).build());\n            }\n\n            // 使用文件流上传文件\n            try (InputStream inputStream = new FileInputStream(filePath)) {\n                minioClient.putObject(\n                        PutObjectArgs.builder()\n                                .bucket(bucketName)\n                                .object(objectName)\n                                .stream(inputStream, inputStream.available(), -1)\n                                .build());\n                System.out.println(\"File uploaded successfully.\");\n            } catch (IOException e) {\n                e.printStackTrace();\n            }\n\n        } catch (MinioException | NoSuchAlgorithmException | InvalidKeyException | IOException e) {\n            e.printStackTrace();\n        }\n    }\n}\n```\n3.上传结果\n![image.png](/static/articlePicture/11725862415730969.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-21 20:12:00', '2024-09-09 14:14:03', NULL, 0);
INSERT INTO `article` VALUES (6, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/6.webp', '本地部署MinIO通过Java实现文件下载 ', '# 1.实现代码\n```language\nimport io.minio.MinioClient;\nimport io.minio.GetObjectArgs;\nimport java.io.InputStream;\nimport java.nio.file.Files;\nimport java.nio.file.Paths;\n\npublic class MinioDownloader {\n    public static void main(String[] args) {\n        try {\n            // 初始化 Minio 客户端\n            MinioClient minioClient = MinioClient.builder()\n                .endpoint(\"http://minio.example.com\")  // MinIO 服务器地址\n                .credentials(\"accessKey\", \"secretKey\") // 访问密钥\n                .build();\n\n            // 下载对象到本地文件\n            InputStream inputStream = minioClient.getObject(\n                GetObjectArgs.builder()\n                    .bucket(\"your-bucket-name\") // 存储桶名称\n                    .object(\"image.jpg\")        // 对象键（文件名）\n                    .build()\n            );\n\n            // 保存到本地文件\n            Files.copy(inputStream, Paths.get(\"/path/to/save/image.jpg\"));\n\n            System.out.println(\"文件下载成功！\");\n        } catch (Exception e) {\n            System.out.println(\"文件下载失败：\" + e.getMessage());\n        }\n    }\n}\n```\n# 2.运行结果\n![image.png](/static/articlePicture/11725862526867593.png)', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2024-05-21 21:42:00', '2024-09-09 14:16:05', '一个达不刘', 0);
INSERT INTO `article` VALUES (7, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/7.webp', 'SpringBoot引入MinIO依赖遇到的问题', '参考官方文档SDK：https://docs.min.io/docs/java-client-quickstart-guide.html\nMinIO Java SDK is Simple Storage Service (aka S3) client to perform bucket and object operations to any Amazon S3 compatible object storage service.\nMinIO依赖jar包下载地址：[MinIO](Central Repository: io/minio/minio)\nJDK最低要求：Java 1.8 或更高版本。\n# 【异常1】maven仓库MinIO 8.3.4下载很慢\n解决办法：maven设置依赖下载地址\n```language\n<repositories>\n    <repository>\n        <id>public</id>\n        <name>aliyun nexus</name>\n        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>\n        <releases>\n            <enabled>true</enabled>\n        </releases>\n    </repository>\n</repositories>\n\n<pluginRepositories>\n    <pluginRepository>\n        <id>public</id>\n        <name>aliyun nexus</name>\n        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>\n        <releases>\n            <enabled>true</enabled>\n        </releases>\n        <snapshots>\n            <enabled>false</enabled>\n        </snapshots>\n    </pluginRepository>\n</pluginRepositories>\n```\n# 【异常2】Caused by: java.lang.RuntimeException: Unsupported OkHttp library found. Must use okhttp >= 4.8\n解决办法：maven引入minio排除okhttp依赖并添加高版本的okhttp依赖，如okhttp 4.9.0\n\n```language\n<!-- 对象存储 MinIO -->\n<dependency>\n    <groupId>io.minio</groupId>\n    <artifactId>minio</artifactId>\n    <version>8.3.4</version>\n    <exclusions>\n        <exclusion>\n            <groupId>com.squareup.okhttp3</groupId>\n            <artifactId>okhttp</artifactId>\n        </exclusion>\n    </exclusions>\n</dependency>\n\n<dependency>\n    <groupId>com.squareup.okhttp3</groupId>\n    <artifactId>okhttp</artifactId>\n    <version>4.9.0</version>\n</dependency>\n```\n# 【异常3】NoSuchMethodError kotlin.collections.ArraysKt.copyInto([B[BIII)...\n```language\n<!-- https://mvnrepository.com/artifact/org.jetbrains.kotlin/kotlin-stdlib -->\n<dependency>\n    <groupId>org.jetbrains.kotlin</groupId>\n    <artifactId>kotlin-stdlib</artifactId>\n    <version>1.3.70</version>\n</dependency>\n```\n\n', NULL, 2, 0, 'public', NULL, NULL, 0, 1, '2024-05-23 13:35:00', '2024-09-09 14:20:13', NULL, 0);
INSERT INTO `article` VALUES (8, 1, 5, 9, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/8.webp', '关于Win10如何检查笔记本电脑的电池健康状况', '# 单击开始菜单（或按键盘上的 Windows 键）打开开始菜单并启动 命令提示符\n![image.png](/static/articlePicture/11725862917395780.png)\n\n#  打开命令提示符后，输入 powercfg /batteryreport （确保两个单词之间有一个空格）并按 Enter\n![image.png](/static/articlePicture/11725862942961686.png)\n#  现在找到该报告并打开它。\n![image.png](/static/articlePicture/11725862984062931.png)\n![image.png](/static/articlePicture/1172586302745113.png)', NULL, 2, 0, 'public', NULL, NULL, 0, 1, '2024-05-24 15:08:00', '2024-11-21 18:46:40', 'onew', 0);
INSERT INTO `article` VALUES (9, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/9.webp', '关于Undertow启动时的警告日志 ', '# 错误提示：\n当使用 Undertow 作为 Spring Boot 嵌入式服务器时，启动应用。会看到有一条 WARN 日志，如下：\n```language\nUT026010: Buffer pool was not set on WebSocketDeploymentInfo, the default pool will be used\n```\n# 解决方法如下：\n## 1.排除 undertow-websockets-jsr 依赖\n如果未使用到 WebSocket 技术，那么可以直接从 spring-boot-starter-undertow 中排除 undertow-websockets-jsr 依赖即可，当然，既然引入了那就肯定能用到，参考第二条。\n```language\n<dependency>\n    <groupId>org.springframework.boot</groupId>\n    <artifactId>spring-boot-starter-undertow</artifactId>\n    <exclusions>\n        <!-- 排除 undertow-websockets-jsr 依赖 -->\n        <exclusion>\n            <groupId>io.undertow</groupId>\n            <artifactId>undertow-websockets-jsr</artifactId>\n        </exclusion>\n    </exclusions>\n</dependency>\n```\n## 2.为 WebSocketDeploymentInfo 设置合理的参数\n也可以通过上述的 “编程式” 配置方式，为 WebSocketDeploymentInfo 设置一个合理的参数。如下：\n```language\nimport org.springframework.boot.web.embedded.undertow.UndertowServletWebServerFactory;\nimport org.springframework.boot.web.server.WebServerFactoryCustomizer;\nimport org.springframework.context.annotation.Configuration;\n\nimport io.undertow.server.DefaultByteBufferPool;\nimport io.undertow.websockets.jsr.WebSocketDeploymentInfo;\n\n@Configuration\npublic class UndertowConfiguration implements WebServerFactoryCustomizer<UndertowServletWebServerFactory>{\n\n    @Override\n    public void customize(UndertowServletWebServerFactory factory) {\n        factory.addDeploymentInfoCustomizers(deploymentInfo -> {\n            \n            WebSocketDeploymentInfo webSocketDeploymentInfo = new WebSocketDeploymentInfo();\n            \n            // 设置合理的参数\n            webSocketDeploymentInfo.setBuffers(new DefaultByteBufferPool(true, 8192));\n            \n            deploymentInfo.addServletContextAttribute(\"io.undertow.websockets.jsr.WebSocketDeploymentInfo\", webSocketDeploymentInfo);\n        });\n    }\n}\n```\n经过测试，上述 2 种方式都可以解决 Undertow 启动时有警告日志的问题。\n', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2024-05-26 12:41:00', '2024-09-09 15:17:45', '一个达不刘', 0);
INSERT INTO `article` VALUES (10, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/10.webp', 'Spring使用Undertow作为嵌入式服务器中遇到的问题', '# 背景：\n在做毕业设计的时候发现了使用 Undertow 作为嵌入式服务器上传文件限制的代码不生效，只能上传1MB以内的图片，一旦上传超过1MB的图片就会报错。\n# 代码：\n```language\nspring:\n  datasource:\n    hikari:\n      idle-timeout: 600000  #10 min\n      max-lifetime: 1800000 #30 min\n    servlet:\n      multipart:\n        max-file-size: 10MB\n        max-request-size: 10MB\n```\n# 错误提示：\n```language\nThe maximum size 1048576 for an individual file in a multipart request was exceeded\n```\n# 解决思路：\n一开始以为是Java代码本地的配置覆盖了application.yml或代码中设置了最大文件，但是排查了很久都没有发现问题。然后又去排查检查是否缺少其他 Spring Boot 自动配置与 Undertow 文件上传大小的配置发生冲突，但是，排查完了发现都不是这些问题。\n# 解决方法：\n最后都准备放弃了，想着再检查一遍application.yml配置文件，结果发现是缩进的原因，servlet没有和datasource对齐！！就很气，也很搞笑，就那么个简单的问题，一直迷迷糊糊的没有找到。。。\n![image.png](/static/articlePicture/11725863455928468.png)\n\n', NULL, 2, 0, 'public', NULL, NULL, 0, 1, '2024-05-26 15:24:00', '2024-09-09 15:18:00', '一个达不刘', 0);
INSERT INTO `article` VALUES (11, 1, 5, 10, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/11.webp', 'Python实现批量提取视频 ', '# 前言\n最近在玩nas，但是之前把视频和照片都上传到immich了，因为我可以直接在手机中上传照片，但是因为手机内存不够就把视频全删了的，现在只需要把视频下载下来上传到nas中就OK。但是现在问题是immich这东西不支持批量删选视频，只能全选照片和视频，而且一共有50个G的照片和视频，视频只有三百八十几个，手动提取未免太看得起我了。于是现在就有了下载全部内容，然后待会儿就用Python代码批量提取视频到指定文件夹。（前提：安装7.zip解压缩软件并且能够找到安装目录）\n![image.png](/static/articlePicture/11725863551847104.png)\n![image.png](/static/articlePicture/11725863566415301.png)\n#  Python代码批量提取指定格式的视频\n```language\nimport os\nimport subprocess\nimport glob\n\n# 7-Zip 可执行文件路径（请确认 7z.exe 的路径）\nseven_zip_path = r\"D:\\APP\\7.zip\\7-Zip\\7z.exe\"\n\n# 定义包含多个压缩包的文件夹路径\nzip_folder = r\'D:\\本地文件夹\\桌面\\视频\'\n\n# 定义目标文件夹路径，用于保存所有视频文件\nextract_folder = r\'D:\\本地文件夹\\桌面\\视频1\'\n\n# 创建目标文件夹（如果不存在）\nif not os.path.exists(extract_folder):\n    os.makedirs(extract_folder)\n\n# 获取所有压缩包文件列表（.zip, .rar, .7z）\nzip_files = glob.glob(os.path.join(zip_folder, \'*.zip\'))\n\n# 支持的视频文件扩展名\nvideo_extensions = [\'.mp4\', \'.avi\', \'.mov\', \'.wmv\', \'.flv\', \'.mkv\', \'.3gp\', \'.webm\', \'.mpeg\', \'.mpg\']\n\n# 遍历每个压缩包文件\nfor zip_file in zip_files:\n    print(f\'正在处理压缩包: {zip_file}\')\n    \n    try:\n        # 通过 7-Zip 列出压缩包中的所有文件，并处理中文编码问题\n        command = [seven_zip_path, \'l\', zip_file]\n        result = subprocess.run(command, capture_output=True, text=True, encoding=\'gbk\')\n        \n        # 检查压缩包中是否有视频文件\n        for line in result.stdout.splitlines():\n            for ext in video_extensions:\n                if ext in line:\n                    # 如果有视频文件，则解压\n                    command = [seven_zip_path, \'e\', zip_file, f\'-o{extract_folder}\', f\'*{ext}\', \'-y\']  # \'-y\' 自动跳过覆盖提示\n                    extract_result = subprocess.run(command, capture_output=True, text=True, encoding=\'gbk\')\n                    \n                    # 输出提取的文件信息\n                    if \"Everything is Ok\" in extract_result.stdout:\n                        print(f\'已提取视频文件: {line} from {os.path.basename(zip_file)}\')\n                    else:\n                        print(f\'解压失败: {zip_file}\')\n    \n    except subprocess.CalledProcessError as e:\n        print(f\'压缩包处理失败: {zip_file}, 错误: {str(e)}\')\n\nprint(\'所有压缩包中的视频文件提取完成。\')\n```\n注：我的桌面是转移到了D盘，请勿照抄这部分内容\n# 代码解释\n- 定义文件夹路径：\nzip_folder：指定包含多个压缩包文件的文件夹路径。\nextract_folder：指定解压后保存所有视频文件的目标文件夹路径。\n\n- 创建目标文件夹：\n如果指定的目标文件夹不存在，使用 os.makedirs() 创建它。\n\n- 获取压缩包列表：\n使用 glob.glob() 获取 zip_folder 中所有以 .zip 结尾的文件。\n\n- 遍历压缩包：\n对每个压缩包文件，使用 zipfile.ZipFile(zip_file, \'r\') 打开压缩包。\n\n- 遍历文件：\n使用 zip_ref.namelist() 获取压缩包中的所有文件列表。\n对于每个文件，提取文件名，并检查其扩展名是否属于视频文件的扩展名列表 (video_extensions)。\n\n- 解压视频文件：\n使用 zip_ref.read(file) 读取压缩包中的文件内容。\n使用 open(video_file_in_zip, \'wb\') 打开目标文件，在本地保存解压的视频文件内容。\n# 实现效果\n运行代码中文会乱码是因为编码问题，在网上找到了解决办法，在cmd里运行以下代码\n```language\nset PYTHONIOENCODING=utf-8 \n```\n再执行Python，执行一次就行了，运行别的代码也不会中文乱码了（通过 PYTHONIOENCODING 环境变量解决）。\n![image.png](/static/articlePicture/11725863814762400.png)\n![image.png](/static/articlePicture/11725863834614766.png)\n![image.png](/static/articlePicture/11725863848574105.png)\n# 结果\n一共389个视频，提取出来386个视频，一共23G，有3个没有提取到，不知道是不是格式问题，总的来说问题不大。\n![image.png](/static/articlePicture/1172586389038756.png)\n![image.png](/static/articlePicture/11725863906661140.png)\n![image.png](/static/articlePicture/11725863934692421.png)', NULL, 4, 0, 'public', NULL, NULL, 0, 1, '2024-09-09 00:23:00', '2024-09-09 15:18:15', '一个达不刘', 0);
INSERT INTO `article` VALUES (12, 1, 5, 11, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/12.webp', '单线复用之使用机顶盒直连路由器且不占用带宽', '# 背景\n这学期学了点网络知识，正好前两天回家想起来一直没有解决的问题：光猫到客厅只有一根网线，但是却有路由器和IPTV的需求。所以我就想有没有一种方法能够支持千兆网络的同时也能看IPTV，之前想过用两个交换机来解决这个问题，但是光猫所在的弱电箱太小了，并不足以容纳一个小型的交换机，也想过把墙内本来的一根超五类八芯网线换成单独的两根六类网线，但是无可奈何发现网线在客厅的86盒内就已经是被封死了的。\n# 理论\n正好这学期学了点网络知识，根据所学知识可以用单线复用（前提是路由器具有IPTV的功能，不然也白搭），这个单线复用不是我们平时所熟知的将一根八芯网线拆成两根四芯网线使用（之前我家就一直用的这种方式，这种四芯网线最高只能有百兆的速度）。而是++在光猫的后台将原本IPTV所绑定的端口解绑，再将IPTV的VLAN绑定到一号千兆口（根据个人喜好选择），一号千兆口再连接路由器，在路由器后台开启IPTV功能，路由器再连接机顶盒++，这样路由器不仅具有千兆的速度，而且也能看IPTV且不会占用带宽。理论成立，实践开始。（以下只适用于电信，ZXHN F650，软件版本3.0，别的我没试过不知道能不能行）\n在这次实践中用到了几个工具，分别是小翼管家（推荐使用旧版本），HttpCanary（小黄鸟），雷电模拟器，mt管理器和adb，这几个工具我会放在文章最下方。\n# 抓包预备工作\n想要在网关后台修改VLAN绑定就必须要有超级密码，而获得超级密码的话可以打电话给运营商询问密码，要是像我这种爱瞎折腾又不想麻烦别人的人就可以继续看。在这一步我耽误了一晚上，在网上找了很多资料，走了很多歪路。有默认密码NE7jA%5m，但是这个方法很早就失效了。有插U盘在光猫上通过控制台获取超级密码的，但是这种方法已经失效了，运营商已经设置权限了，无法获得除了U盘之外的数据。也有访问 http://192.168.1.1/backupsettings.conf 获取配置文件的，这种方式类似于第二种方法用U盘插光猫获取后台配置，也失效了。\n后来我找到了一种方法，就是通过抓包获取超级密码，因为小翼管家是可以从外网访问网关的，这必然就会有包的出现，而有包就可以抓。用这种方法的前提是小翼管家要绑定网关，当然，都想要破解超级密码了，肯定都已经绑定自己的网关了。\n抓包使用什么工具抓？这一开始也算是一个问题，因为市面上有很多抓包软件，我也试了几个，比如fiddler\n![image.png](/static/articlePicture/11725865895570471.png)\n\n我感觉是我的配置问题，用这个这个软件抓包会导致手机断网，但是我的证书和代理的都是配好了的 ，希望能有大佬帮忙解惑一下。后来我又在网上找到了HttpCanary（小黄鸟），但是这个APP已经很久没有更新了，现在市面上的都是一些破解版，不过好在我也找到了一个能用的，文末可以获取这个APP。这里我推荐使用模拟器安装HttpCanary，正如我之前所说，这个软件已经很久没有更新了，所以已经支持不了太高的版本了。因为安卓7以上系统就不信任用户自己安装的证书了，所以安装证书到系统证书里的时候需要root权限（不用root权限安装证书的话抓包的时候会导致目标应用断网），为了避免手机变砖，还是用模拟器更合适。\n\n![image.png](/static/articlePicture/11725864437878656.png)\n\n这里我已经在模拟器中装好这三个软件了，在继续下一步之前别忘了开启模拟器的root权限，因为各个模拟器的差异，大家可以网上搜一下如何开启，这里就说一下雷电模拟器如何开启root权限，在右边的设置中找到其他设置，root权限就在这里了（市面上有很多模拟器，都大同小异，各位根据需要选择）。\n\n ![image.png](/static/articlePicture/1172586594911142.png)\n\n 下一步就是安装HttpCanary，无脑下一步就完事了，到这一步就要开始注意了。\n\n![image.png](/static/articlePicture/11725864539610611.png)\n![image.png](/static/articlePicture/11725864631100735.png)\n![image.png](/static/articlePicture/11725864647210902.png)\n\n因为设备差异原因，就算是开启了root权限也可能会导致点击允许后抓包时目标软件没有网络。我们接着走下一步，在HttpCanary中导出证书，在左上角→设置→HttpCanary根证书→导出HttpCanary根证书，选择以.0结尾的文件，导出。使用mt管理器将其复制到电脑共享文件夹，这里我把它复制到桌面了。\n\n![image.png](/static/articlePicture/11725864675508372.png)\n![image.png](/static/articlePicture/11725864691714857.png)\n\n这时我们就要用上adb了（文末有安装包），在电脑中安装好adb后需要配置环境变量，配置好环境变量后在cmd输入adb，adb version会如下页面\n```language\nadb\nadb version\n```\n\n![image.png](/static/articlePicture/11725864739117869.png)\n![image.png](/static/articlePicture/11725864762573976.png)\n![image.png](/static/articlePicture/11725864777329596.png)\n\n接下来我们就要用adb往模拟器的系统证书中导入HttpCanary导出的证书，别问我为什么不直接用mt管理器直接导入，直接导入会导入失败，问就是试过。下面可以直接使用我的代码（如果下面执行出错了大家可以去网上搜一下关键词“抓包安卓7以上ca证书安装方法”，因为这些方法也是我在网上找到的，因为版本差异，不一定都能执行）\n\n```language\nadb root\nadb remount\nadb push 87bc3517.0 /sdcard/\nadb shell\nsu\nmount -o rw,remount /system\nmv /sdcard/87bc3517.0 /system/etc/security/cacerts/\nchmod 644 /system/etc/security/cacerts/87bc3517.0\nreboot\n```\n如果到了这里都很顺利的话那恭喜你，成功一大半了，接下来，我们就可以开始抓包了。\n# 开始抓包\n## 1.先打开HttpCanary，点击右上角目标应用，然后点击左上角加号，添加小翼管家，这样可以避免混淆。\n## 2.再打开小翼管家，在下方导航栏中点击智能，做好抓包的准备。\n## 3.返回HttpCanary，点击左下角的蓝色小飞机，开始抓包，返回小翼管家，点击你的网关>网关设置>指示灯（开）>指示灯（关）>指示灯（开）。\n## 4.返回HttpCanary，我们可以看见有很多包，这时需要找到带有token的post包，如下图。\n\n![image.png](/static/articlePicture/11725864890926961.png)\n\n## 5.然后随便点开一个带有token的post包，长按>编辑重发>大小（xxxb，一般在两百B左右，尽量选这个区间的，成功率高）>在线编辑>全选删除，粘贴如下内容>点击右上角的√>点击右上角的小飞机。\n```language\n{ \"Params\": [], \"MethodName\": \"GetTAPasswd\", \"RPCMethod\": \"CallMethod\", \"ObjectPath\": \"/com/ctc/igd1/Telecom/System\", \"InterfaceName\": \"com.ctc.igd1.SysCmd\", \"ServiceName\": \"com.ctc.igd1\" }\n```\n## 6.这时再找到你刚刚重发的包，如果报错了就另外找一个带有token的post包，重复第5步。\n\n## 7.点击你重发的包，点击响应>点击右下角的预览，这时会出现如下页面，其中“ vxGjB7Te6JA ”就是我们要找的超级密码，有这个超级密码就可以访问管理员后台了。\n\n![image.png](/static/articlePicture/11725865001690259.png)\n![image.png](/static/articlePicture/11725865051002513.png)\n\n# 光猫修改VLAN绑定\n## 1.浏览器地址栏输入 http://192.168.1.1:8080/ ，用户名为 telecomadmin ，密码为刚才抓包获得的密码，点击登录。\n## 2.这样我们就进入了管理员后台了，在这里可以更改网关的连接方式（路由或者桥接，要是不知道怎么弄的话还是别动了，不然到时候上不了网）。\n## 3.点击网络>网络设置>网络连接>连接名称选择other那个>取消勾选ITV。\n\n![image.png](/static/articlePicture/11725865154151483.png)\n\n## 4.点击VLAN绑定>点击表格空白处>绑定VLAN连接名称选择other那个>用户侧VLAN随机填一个就行，我填的787是Internet里面的VLAN（需要记住填写的这个VLAN），到这里光猫后台就配置完了。\n\n![image.png](/static/articlePicture/11725865255274913.png)\n![image.png](/static/articlePicture/11725865269783965.png)\n\n# 路由器IPTV配置\n## 1.浏览器地址中输入  http://192.168.2.1 ，然后登录（各大厂商路由器的登录地址和账户密码都能在路由器背面知晓）。\n\n![image.png](/static/articlePicture/11725865310640498.png)\n\n## 2.点击更多功能>网络设置>IPTV设置（这一步各大厂商的路由器都大同小异）。\n\n![image.png](/static/articlePicture/1172586533622043.png)\n\n## 3.选择开启IPTV网络>LAN口根据个人喜好随便选一个>开启VLAN>VLAN ID就是刚才记的那个，我的是787,802.1p那个不用管，默认就行，然后保存。\n\n![image.png](/static/articlePicture/11725865360067492.png)\n# 打水晶头\n前面都做了就差不多了，我今天下午打的这个水晶头把我人都打麻了，打的每一个都不通，搞的我都怀疑我自己了，还好我之前在学校学打水晶头的时候留了几根打好的网线下来，而且我之前还买了两个免打端口，直接插网线就行。（注意网线连接机顶盒和路由器的时候要连之前在路由器后台设置的那个端口）\n# 结语\n总的来说这两天下来的收获还是挺大的，实践和理论相结合，学到了很多知识，也有自己从未涉及过的领域，比如各种证书的安装，但是至今那个fiddler的证书装上了目标软件还是不能够联网。而且也学会了在正式将全部水晶头剪掉之前之前先将网线连好看能不能通，避免了不通的情况下还要再去找哪一方面的问题，比如配置光猫和路由器，我甚至把战场转移到了厨房进行测试，因为光猫旁边就一个插座，而旁边就是厨房。还有就是昨天晚上因为研究这个方法的原理以及可行性睡觉睡晚了忘记把电暖炉关了，从凌晨开到六点多，浪费了不少电。今天实践了一下午，打水晶头的时候浪费了好几个水晶头，而且端口处的网线越打越短，但是光猫到路由器的网线就是不通，最后实在不行了我才用的免打端口，晚点的时候才发现不是我的问题，是网线钳子的问题。我后来又打了好几个水晶头，然后插上电脑连上路由器，都不通，所以大家以后买钳子还是不要买便宜了，我这个才二十来块钱，算是废了。最后路由器的黄灯亮起的时候瞬间感觉世界都亮了。2024-01-03 23:28:26\n\n![image.png](/static/articlePicture/11725865424529120.png)\n![image.png](/static/articlePicture/11725865439030445.png)\n![image.png](/static/articlePicture/11725865453072795.png)\n![image.png](/static/articlePicture/11725865465508383.png)\n![image.png](/static/articlePicture/11725865473215357.png)\n![image.png](/static/articlePicture/11725865486671430.png)\n![image.png](/static/articlePicture/11725865504437492.png)\n```language\n1 链接：https://pan.baidu.com/s/1mbT8m1_ecSwp1KTaJivqvw?pwd=u2c2 \n2 提取码：u2c2\n```\n——————————————————————————————————————————\n# 更新2024年9月9日16:24:51\n云盘的内容不小心被我删了，有需要的可以联系我获取资源。', NULL, 12, 0, 'public', NULL, NULL, 1, 1, '2024-01-03 23:29:00', '2024-09-09 16:25:00', '一个达不刘', 0);
INSERT INTO `article` VALUES (13, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/13.webp', 'idea中的springboot项目如何重命名而不报错', '在 IntelliJ IDEA 中重命名 Spring Boot 项目需要一些步骤，以确保项目在重命名后不会报错。以下是详细的步骤指南：\n# 1. 重命名项目文件夹\n　　（1）关闭项目：在 IntelliJ IDEA 中关闭当前项目。\n\n　　（2）重命名文件夹：在文件系统中找到项目所在的文件夹，右键重命名文件夹。\n\n　　（3）重新打开项目：在 IntelliJ IDEA 中选择 Open，找到重命名后的文件夹并打开项目。\n\n# 2. 修改项目配置文件\n　　（1）打开pom.xml或build.gradle：根据你使用的构建工具，打开 pom.xml (Maven) 或 build.gradle (Gradle) 文件。\n\n　　（2）修改项目名称：\n\nMaven：修改 <name> 标签中的内容。\nGradle：修改 rootProject.name 属性。\n# 3. 修改 IntelliJ IDEA 的项目名称\n　　（1）右键项目根目录：在 IntelliJ IDEA 的项目视图中，右键点击项目根目录。\n\n　　（2）选择Refactor > Rename：输入新的项目名称。\n\n　　（3）修改.idea文件夹中的配置：\n\n找到 .idea 文件夹，打开 name 文件，修改其中的内容为新项目名称。\n# 4. 更新应用程序属性\n　　（1）修改application.properties或application.yml 文件中涉及旧项目名称的配置（如 spring.application.name）。\n\n　　（2）确保资源文件和配置文件中没有遗留的旧项目名称。\n\n# 5. 清理和重建项目\n　　（1）清理项目：在 IntelliJ IDEA 中，选择 Build > Clean Project。\n\n　　（2）重建项目：选择 Build > Rebuild Project。\n\n# 6. 检查和修复依赖关系\n　　（1）检查依赖关系：确保所有依赖项和包名引用已经更新，没有任何硬编码的旧项目名称。\n\n　　（2）运行项目：启动 Spring Boot 应用，确认应用能够正常运行，没有报错。\n\n# 7. 修改包名（如果需要）\n如果你需要重命名包名，请遵循以下步骤：\n\n　　（1）右键包名：在 IntelliJ IDEA 中的 Project 视图中，右键点击要重命名的包。\n\n　　（2）选择Refactor > Rename：输入新的包名。\n\n　　（3）更新包引用：IDE 会自动更新包引用和导入语句。\n\n# 8. 修改 README 和其他文档\n　　　最后，别忘了更新项目的 README 文件和其他文档，以反映新的项目名称。', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-20 21:53:00', '2024-09-09 15:15:24', NULL, 0);
INSERT INTO `article` VALUES (14, 1, 5, 8, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/14.webp', '执行npm run serve有时提示npm update ', '# 背景\n这个错误虽说无关紧要，但有时候会出现就感觉不爽。\n# 错误提示\n![image.png](/static/articlePicture/11725866378513924.png)\n# 解决方法\n在网络上查阅资料后才知道是因为文件夹权限的问题\n（1.）删除目录configstore\n由于权限问题，该目录经常出现故障。\n如果删除该目录，则下次运行命令时将重新生成该目录。\n（2.）在 Windows 上删除configstore\n在 Windows 上，该目录位于\n```language\nC:\\Users\\<username>\\.config\\configstore\n```\n请确保将<username>的占位符替换为您的实际用户名，\n转到该文件夹并删除该文件夹，或者，您可以使用命令删除该文件夹。\n```language\nrd /s /q \"C:\\Users\\<username>\\.config\\configstore\"\n```\n请务必将 <username> 替换为您的实际用户名。尝试在删除文件夹后发出命令。\n\n声明：该解决方法引自于   Borislav Hadzhiev   的博客，原解决方法的链接为：https://bobbyhadz.com/blog/npm-update-check-failed\n', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2024-05-17 21:55:00', '2024-09-09 15:22:12', NULL, 0);
INSERT INTO `article` VALUES (15, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/15.webp', '将图片上传到七牛云会报错error=incorrect...', '# 报错代码：\n```language\n{ResponseInfo:com.qiniu.http.Response@377fbcac,status:400, reqId:e6sAAAAKAlyhUDwW, xlog:X-Log, xvia:, adress:up.qiniu.com/115.238.101.32:80, duration:0.000000 s, error:incorrect region, please use up-z2.qiniup.com}{\"error\":\"incorrect region, please use up-z1.qiniup.com, bucket is: XXXXX\"}\n```\n# 问题原因：\n创建七牛云存储空间时选择了华南地区，但上传文件的配置类中配置了其他地区。\n![image.png](/static/articlePicture/11725866636211138.png)\n# 解决办法：\n在配置Configuration类的时候，按需选择region的类型即可。\n![image.png](/static/articlePicture/1172586667964010.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-17 21:24:00', '2024-09-09 15:25:24', NULL, 0);
INSERT INTO `article` VALUES (16, 1, 5, 9, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/16.webp', '关于Windows端口被占用', '# cmd查看被占用端口的pid\n```language\nnetstat –aon |findstr “xxxxx”\n```\n# 关闭找到端口被占用对应的PID\n```language\nTASKKILL /PID xxxxx /F\n```\n如：\n![image.png](/static/articlePicture/11725866789961279.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-17 21:13:00', '2024-09-09 15:26:56', NULL, 0);
INSERT INTO `article` VALUES (17, 1, 5, 8, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/17.webp', '关于npm install报错问题', 'npm install安装报错时，可能的原因有很多，以下是一些常见的解决方法：\n1. 清除npm缓存\n有时，npm的缓存可能会导致安装失败。可以通过以下命令清除缓存，然后重新尝试安装：\n```language\nnpm cache clean --force\n```\n2. 检查Node和npm版本\n确保你的Node.js和npm版本与项目要求一致。可以通过以下命令查看当前版本：\n```language\nnode -v\nnpm -v\n\n```\n如果版本不匹配，可以重新安装Node.js和npm，或使用版本管理工具如nvm来管理多个版本。\n3. 更换npm源\n网络问题或npm源速度慢可能导致安装失败。可以将npm源切换到淘宝镜像：\n```language\nnpm config set registry https://registry.npm.taobao.org\n```\n4. 删除package-lock.json文件\n删除package-lock.json文件后重新运行npm install，有时可以解决依赖冲突问题。\n5. 使用--force或--legacy-peer-deps标志\n依赖关系冲突可能导致安装失败。使用以下命令可以强制安装：\n```language\nnpm install --force\nnpm install --legacy-peer-deps\n```\n6. 检查代理设置\n如果你使用了代理，确保npm代理设置正确。可以关闭代理后重新安装：\n```language\nnpm config set proxy false\n```\n7. 网络问题\n确保网络连接稳定，没有防火墙或安全组阻止npm访问外部资源。如果网络不稳定，可以使用不同的网络进行尝试。\n8. 重新安装Node.js和npm\n如果所有方法都不奏效，考虑完全卸载Node.js和npm，然后重新安装最新版本的Node.js，它通常会自带最新的npm。\n9. 手动安装依赖项\n如果npm install失败，可以尝试手动安装项目中的依赖项。查看package.json，使用以下命令逐个安装依赖项：\n复制代码\n```language\nnpm install <package-name>\n```\n10. 使用Yarn作为替代\nYarn与npm类似，在某些情况下更为稳定。如果npm一直出错，可以考虑使用Yarn替代：\n```language\nyarn install\n```\n11. 清理npm缓存并重置配置\n除了清理缓存，还可以重置npm配置，移除代理设置并重置源：\n```language\nnpm cache clean --force\nnpm config rm proxy\nnpm config rm https-proxy\nnpm config set registry https://registry.npmjs.org/\n```\n12. 查看详细日志\n通过运行npm install --verbose查看详细的错误日志，进一步诊断问题。\n13. 检查项目依赖兼容性\n依赖项之间的版本冲突可能导致安装失败。检查package.json中的依赖项版本，并确保其兼容性。\n14. 更新Node.js\nNode.js版本过旧时可能会与npm不兼容。更新Node.js到最新版本后重新安装依赖项。\n15. 使用Docker创建一致环境\n如果你的项目依赖于特定的系统环境，使用Docker创建一致的环境可以避免本地安装时的问题。通过Docker容器执行npm安装，避免环境冲突。\n16. 检查权限问题\n有时权限问题会导致安装失败。在Linux或macOS上，可以使用sudo命令安装：\n```language\nsudo npm install\n```\n在Windows上，以管理员身份运行命令提示符或PowerShell。\n17. 使用不同版本的npm\n有时项目可能需要特定版本的npm。可以通过以下命令安装特定版本：\n```language\nnpm install -g npm@<version>\n```\n以上是常见的npm install报错解决方案。解决问题时，请根据实际情况选择合适的方法。如果所有方法均无效，建议查阅错误日志，或到社区中寻求帮助。', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2024-05-14 17:21:00', '2024-09-09 15:43:38', NULL, 0);
INSERT INTO `article` VALUES (18, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/18.webp', '高数-导数的应用', '# 1.洛必达法则\n![image.png](/static/articlePicture/11725868042473586.png)\n![image.png](/static/articlePicture/11725868050290688.png)\n![image.png](/static/articlePicture/11725868053238215.png)\n![image.png](/static/articlePicture/11725868122586234.png)\n![image.png](/static/articlePicture/11725868135108858.png)\n# 2.函数的单调性\n![image.png](/static/articlePicture/11725868201198760.png)\n![image.png](/static/articlePicture/11725868174579365.png)\n![image.png](/static/articlePicture/11725868214247969.png)\n![image.png](/static/articlePicture/11725868227871842.png)\n![image.png](/static/articlePicture/11725868238482645.png)\n![image.png](/static/articlePicture/11725868248637119.png)\n![image.png](/static/articlePicture/11725868259184349.png)\n# 3.函数的凹凸性和拐点\n![image.png](/static/articlePicture/11725868281668613.png)\n![image.png](/static/articlePicture/11725868302932508.png)\n![image.png](/static/articlePicture/11725868318395508.png)\n![image.png](/static/articlePicture/11725868329688584.png)\n![image.png](/static/articlePicture/11725868339120580.png)\n![image.png](/static/articlePicture/11725868347531946.png)\n![image.png](/static/articlePicture/11725868361263791.png)\n![image.png](/static/articlePicture/11725868384602199.png)\n![image.png](/static/articlePicture/11725868397011992.png)\n![image.png](/static/articlePicture/11725868418090839.png)\n![image.png](/static/articlePicture/11725868504289267.png)\n![image.png](/static/articlePicture/11725868516741702.png)\n# 4.极值及其求法\n![image.png](/static/articlePicture/11725868530823813.png)\n![image.png](/static/articlePicture/11725868540880548.png)\n![image.png](/static/articlePicture/11725868550027847.png)\n![image.png](/static/articlePicture/11725868557714798.png)\n![image.png](/static/articlePicture/11725868566322719.png)\n![image.png](/static/articlePicture/11725868576549886.png)\n![image.png](/static/articlePicture/11725868585292885.png)\n![image.png](/static/articlePicture/11725868595164396.png)\n![image.png](/static/articlePicture/11725868607491821.png)\n![image.png](/static/articlePicture/11725868617286793.png)\n![Snipaste_20240909_155706.png](/static/articlePicture/11725868628093375.png)\n# 5.极值与驻点的关系\n![image.png](/static/articlePicture/11725868650160360.png)\n![image.png](/static/articlePicture/11725868657934590.png)\n![image.png](/static/articlePicture/1172586866558093.png)\n![image.png](/static/articlePicture/1172586867551292.png)\n![image.png](/static/articlePicture/11725868684501689.png)\n# 6.函数的最值\n![image.png](/static/articlePicture/11725868703154222.png)\n![image.png](/static/articlePicture/11725868717968396.png)\n![image.png](/static/articlePicture/11725868727862398.png)\n![image.png](/static/articlePicture/117258687366315.png)\n![image.png](/static/articlePicture/11725868745210246.png)\n![image.png](/static/articlePicture/11725868754791839.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2022-11-28 17:04:00', '2024-09-09 15:59:56', NULL, 0);
INSERT INTO `article` VALUES (19, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/19.webp', '高数-公式', '# 1.导数公式\n![image.png](/static/articlePicture/11725868872691523.png)\n# 2.等价无穷小\n![image.png](/static/articlePicture/1172586888878483.png)', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2022-11-29 15:44:00', '2024-09-09 16:06:03', '一个达不刘', 0);
INSERT INTO `article` VALUES (20, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/20.webp', '高数-不定积分 ', '# 1.不定积分的定义\n![image.png](/static/articlePicture/11725868978707562.png)\n# 2.不定积分的几何含义\n![image.png](/static/articlePicture/11725868991198525.png)\n# 3.不定积分的几个公式\n![image.png](/static/articlePicture/11725869004486167.png)\n# 4.不定积分常用积分表\n![image.png](/static/articlePicture/11725869015566683.png)\n![image.png](/static/articlePicture/11725869043914195.png)\n# 5.不定积分的性质\n![image.png](/static/articlePicture/11725869062275566.png)\n![image.png](/static/articlePicture/11725869076431818.png)\n![image.png](/static/articlePicture/11725869084937343.png)\n![image.png](/static/articlePicture/11725869093507236.png)\n![image.png](/static/articlePicture/11725869108526691.png)\n![image.png](/static/articlePicture/11725869117361696.png)\n![image.png](/static/articlePicture/1172586912630816.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2022-12-13 16:11:00', '2024-09-09 16:05:51', NULL, 0);
INSERT INTO `article` VALUES (21, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/21.webp', '高数-旋转体求体积', '![image.png](/static/articlePicture/11725869209904230.png)', NULL, 2, 0, 'public', NULL, NULL, 0, 1, '2023-03-01 17:46:00', '2024-09-09 16:07:03', NULL, 0);
INSERT INTO `article` VALUES (22, 1, 5, 6, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/22.webp', '关于代码注释', '# 1.前言\n对于一个刚入行的小白来说总是忘了注释的快捷键，也是代码或者注释打少了，所以专门写了篇随笔记一下注释的快捷键，因为vscode用的比较广泛，我就写一个vscode比较通用的吧\n![注释.gif](/static/articlePicture/11725869444230416.gif)\n# 2.行注释\n行注释有以下两种方式！\n## 2.1方式一\n注释：\n```language\nCtrl + K, Ctrl + U\n```\n取消：\n```language\nCtrl + K, Ctrl + U\n```\n![注释1.gif](/static/articlePicture/1172586950786556.gif)\n## 2.2方式二\n注释和取消都是这组快捷键：\n```language\nCtrl + /\n```\n![注释2.gif](/static/articlePicture/11725869547006567.gif)\n# 3.块注释\n注释和取消都是这个快捷键：\n```language\nAlt + Shift + a\n```\n![注释3.gif](/static/articlePicture/11725869574317668.gif)', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2022-10-23 15:47:00', '2024-09-09 16:13:30', NULL, 0);
INSERT INTO `article` VALUES (23, 1, 5, 7, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/23.webp', '闲置的手机秒变随身服务器，隔壁小孩都馋哭了 ', '# 前言\n之前发现了一个好玩的玩法，可以让安卓手机变成一个随身服务器，但是奈何没有什么可以记录下来，最近弄了个博客，就来记录一下吧。这个主要是用ksweb和内网穿透，《KSWEB开源服务器》是由俄罗斯人开发的一款基于Android的开源服务器，使用lighttpd+nginx+apache+php+sql可以使你的安卓手机瞬间变成一台服务器，并且兼容多数主流PHP程序，此款正版软件有5天的试用期，希望有实力的人可以支持正版（PS：没有实力的人可以点击此博客的右侧添加博主的微信或者QQ，备注ksweb）。然后内网穿透的话我用的是花生壳手机版的，要是有别的可以用也行，主要是我找不到...\n# 1.安装软件\n\n![image.png](/static/articlePicture/11725869800347500.png)\n\n# 2.安装ksweb\n刚刚已经说过了，没有什么好说的，安装好了就长这样，因为我懒，都是已经配置好了的，不想再卸载重装了\n\n![image.png](/static/articlePicture/11725869831180786.png)\n\n要说的是那个有个WiFi图标的是局域网的ip地址，我建议是用静态，因为等会儿内网穿透要用到，至于怎么改成静态的ip地址不用我多说了吧。然后点Lighttpd，开启服务即可。\n\n![image.png](/static/articlePicture/11725869857097740.png)\n\n# 3.安装花生壳管理和花生壳内网版\n这个个人版是免费不花钱的，安装好了注册然后实名制就行，至于为什么实名就是怕不法分子拿来搞赌博，颜色。\n\n![image.png](/static/articlePicture/11725869887518664.png)\n\n这个我就直接给出官网地址吧https://hsk.oray.com/download，进去了之后两个都要下载\n\n![image.png](/static/articlePicture/11725869908809152.png)\n\n下载安装注册登陆好了就长这样，因为我懒嘛，懂得都懂\n\n![image.png](/static/articlePicture/11725869966014891.png)\n\n进来了之后点自定义映射最右侧的加号添加映射，然后映射类型选择HTTPS，这样才能在网页端访问，因为是白嫖嘛，所以外网域名是固定的，外网端口443，还记得一开始那个WiFi图标吗，对，就是那个，就在内网主机这填下那个ip地址，内网端口8080，最后保存即可。\n\n![image.png](/static/articlePicture/11725869998335254.png)\n\n然后打开我们刚刚安装的花生壳内网版，登陆，然后就可以看见我们刚刚保存的映射了，然后点开那个网址，如果能正常打开的话就行了，不能正常打开就看看中间哪错了。\n\n![image.png](/static/articlePicture/11725870015839840.png)\n\n# 4.安装文件管理器\n这里我推荐mt管理器，其实你也可以不用安装的，只是为了方便编写代码罢了，因为mt管理器是很强大的，有兴趣的可以去搜一下，有需要的可以在网上搜索下载，也可以点击右侧的微信或者QQ，备注mt就行。打开htdocs，把里面的文件都给删了，然后把你的代码和资源文件放进去，就OK啦\n\n![image.png](/static/articlePicture/11725870052632664.png)\n\n![image.png](/static/articlePicture/1172587006745630.png)\n\n# 总结\n\n总的来说这东西还是挺有意思的，可以用来搭建博客之类的，大家可以自行探索一下，我也是小白一枚，有什么不足的也希望各位大佬能够补充\n![image.png](/static/articlePicture/1172587009781194.png)\n——————————————————————————————————————————\n\n更新2024年9月9日16:23:26\n现在这个方法已经有些不适用了，比如花生壳的内网穿透也不行了，网上有很多免费的，可以慢慢找一下合适的。', NULL, 7, 0, 'public', NULL, NULL, 1, 1, '2022-10-29 17:56:00', '2024-09-20 10:57:47', 'onew', 0);
INSERT INTO `article` VALUES (24, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/24.webp', '高数-导数 ', '# 前言\n以下截图来自bilibili的宋浩老师 陈杰老师，我不生产资源，我只是资源的搬运工。宋浩老师的课适合一刷，陈杰老师的适合二刷，最后就是自己刷题复习了，如果大一大二没有认真听高数课的话，还是比较推荐看一下这些网课的，但最主要的还是自律，要不然再多的资源也是白给，u1s1感觉自己上了个b站大学哈哈哈哈 \n# 1.常用导数公式\n![image.png](/static/articlePicture/11725871215840564.png)\n# 2.求导法则（和差积商）\n![image.png](/static/articlePicture/11725872673861683.png)\n# 3.反函数的求导法则\n![image.png](/static/articlePicture/11725872710334776.png)\n# 4.复合函数求导\n复合函数求导简便方法：从外向里，层层求导\n![image.png](/static/articlePicture/11725872721851800.png)\n![image.png](/static/articlePicture/11725872760950264.png)\n![image.png](/static/articlePicture/11725872775796486.png)\n# 5.分段函数求导\n![image.png](/static/articlePicture/11725873136577375.png)\n![image.png](/static/articlePicture/11725873146174385.png)\n![image.png](/static/articlePicture/11725873156363690.png)\n![image.png](/static/articlePicture/1172587316520056.png)\n![image.png](/static/articlePicture/11725873178447870.png)\n# 6.高阶导数\n![image.png](/static/articlePicture/1172587320359122.png)\n![image.png](/static/articlePicture/11725873215545878.png)\n![image.png](/static/articlePicture/11725873236449557.png)\n![image.png](/static/articlePicture/11725873247137825.png)\n![image.png](/static/articlePicture/11725873254987325.png)\n![image.png](/static/articlePicture/11725873265239124.png)\n![image.png](/static/articlePicture/11725873277609178.png)\n![image.png](/static/articlePicture/11725873288618272.png)\n![image.png](/static/articlePicture/11725873429401591.png)\n![image.png](/static/articlePicture/11725873439158616.png)\n![image.png](/static/articlePicture/11725873446562899.png)\n# 7.隐函数求导\n## 方法一：直接求导\n![Snipaste_20240909_171741.png](/static/articlePicture/1172587346559211.png)\n![Snipaste_20240909_171756.png](/static/articlePicture/11725873477182798.png)\n## 方法二：公式法\n![image.png](/static/articlePicture/11725873487947343.png)\n![image.png](/static/articlePicture/11725873496630527.png)\n![image.png](/static/articlePicture/11725873505789937.png)\n# 8.参数方程求导\n![image.png](/static/articlePicture/11725873515459873.png)\n![image.png](/static/articlePicture/11725873575591753.png)\n# 9.幂指函数求导\n![image.png](/static/articlePicture/11725873583820861.png)\n![image.png](/static/articlePicture/11725873593801546.png)\n##  方法一：对数求导法\n![image.png](/static/articlePicture/11725873602699497.png)\n## 方法二：公式变形法\n![Snipaste_20240909_172010.png](/static/articlePicture/11725873615021298.png)\n## 两种方法的使用范围\n![image.png](/static/articlePicture/11725873625751588.png)\n![Snipaste_20240909_172035.png](/static/articlePicture/11725873636715917.png)\n![image.png](/static/articlePicture/11725873644567128.png)\n![image.png](/static/articlePicture/11725873652096183.png)\n![image.png](/static/articlePicture/11725873659852456.png)\n# 10.变限积分求导\n![image.png](/static/articlePicture/11725873670357787.png)\n![image.png](/static/articlePicture/11725873683599216.png)\n![Snipaste_20240909_172130.png](/static/articlePicture/11725873692495832.png)\n![image.png](/static/articlePicture/11725873707432826.png)', NULL, 0, 0, 'public', NULL, NULL, 0, 1, '2022-10-26 16:10:00', '2024-09-09 17:22:56', NULL, 0);
INSERT INTO `article` VALUES (25, 1, 5, 12, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/25.webp', '高数-微分', '# 1.微分定义\n![image.png](/static/articlePicture/11725954925220795.png)\n![image.png](/static/articlePicture/11725954940027482.png)\n![image.png](/static/articlePicture/11725954954113723.png)\n# 2.基本微分公式与法则\n![image.png](/static/articlePicture/11725954967983376.png)\n![image.png](/static/articlePicture/11725954982432241.png)\n![image.png](/static/articlePicture/11725954994294691.png)\n# 3.复合函数的微分\n![image.png](/static/articlePicture/11725955006650541.png)\n![image.png](/static/articlePicture/11725955057457354.png)\n# 4.微分的几何意义\n![image.png](/static/articlePicture/11725955068922971.png)\n# 5.微分在近似计算中的应用\n![image.png](/static/articlePicture/11725955082104522.png)\n![image.png](/static/articlePicture/11725955135222814.png)\n![image.png](/static/articlePicture/11725955152948737.png)\n# 6.微分中值定理\n![image.png](/static/articlePicture/11725955162986421.png)\n![image.png](/static/articlePicture/11725955173663276.png)\n![image.png](/static/articlePicture/11725955191958997.png)\n![image.png](/static/articlePicture/11725955205274995.png)', NULL, 1, 0, 'public', NULL, NULL, 0, 1, '2022-11-09 14:53:00', '2024-09-10 16:00:32', NULL, 0);
INSERT INTO `article` VALUES (26, 1, 5, 13, '/static/articleCover/onew11726800156562963.jpg', '关于免费域名注册托管到cf以及开启CDN加速', '# 能够免费注册域名的网址\n首先是[dynv6](https://dynv6.com/)，这个网址能注册dynv6的子域名，也可以把域名托管到dynv6，使用ddns-go进行动态解析，免去了手动更新IPv6地址的麻烦。因为是二级域名，不能托管到cf，还有就是注册方便，不用真实的邮箱就能够注册。\n![image.png](/static/articlePicture/11726117618657892.png)\n其二就是[nic.eu.org](https://nic.eu.org/)，eu.org是1996年开始运营的公益域名服务。其设立的主要目的是为那些无力支付付费域名的高额费用的用户或非盈利组织提供永久（至少在2030年之前不会过期）免费且不限量的顶级域名，每个注册用户都可以申请不限量的eu.org域名而且还可以托管到cf。只有一个缺点，就是申请的审核周期很长（可能长达数个月）。申请的时候需要用到真实的邮箱地址以及可以使用虚拟的个人身份信息。（具体的步骤网上有很多，可以参考	[技术爬爬虾](https://www.bilibili.com/video/BV1by411B7Ko/?spm_id_from=333.999.0.0&vd_source=b8b8efdf29404c2fc61dbf5ffffd439a)，就不过多叙述了，这里主要分享免费域名注册）\n![image.png](/static/articlePicture/11726118134357498.png)\n第三个就是[clouddns.net](https://www.cloudns.net/)，ClouDNS是欧洲最大的全球托管DNS服务提供商，包括GeoDNS，Anycast DNS和DDoS保护的DNS。虽然是一个二级域名，但是能够白嫖呀！外加永久buff，这能不心动？注册的时候能够使用QQ邮箱注册，也比较简单，缺点就是只能注册一个免费的二级域名。\n![image.png](/static/articlePicture/11726118755301318.png)\n最后一个就是[US.KG ](us.kg)，这个网址能够注册三个免费的域名，每次能申请一年，只需要每过了半年就可以进行一次续费，而且是免费续费。注册的时候是可以用谷歌账号登录，也可以虚拟信息配合QQ邮箱进行注册。\n![image.png](/static/articlePicture/11726119144156866.png)\n# 托管到cf\n这里托管就用us.kg的域名进行演示，可以提前注册一个cf的账号。域名申请好后进入cf的控制面板，点击添加域\n![image.png](/static/articlePicture/11726119441048703.png)\n输入刚才你注册的域名\n![image.png](/static/articlePicture/11726119504742103.png)\n点击继续，然后往下滑，选择免费，然后无脑下一步\n![image.png](/static/articlePicture/11726119683836745.png)\n![image.png](/static/articlePicture/11726119686825748.png)\n添加完成后上方显示待处理...，先不用管，点击DNS\n![image.png](/static/articlePicture/11726119776986437.png)\n往下滑，找到这个\n![image.png](/static/articlePicture/11726119810290585.png)\n复制下来，然后打开us.kg的控制台页面，在首页往下滑找到manage my domains\n![image.png](/static/articlePicture/11726119947867881.png)\n点击进入选择你要托管的域名，把刚才复制下来的分别填入第一和第二个方框就OK了\n![image.png](/static/articlePicture/11726120034043120.png)\n接下来就等待状态从第一个变成第二个就大功告成了\n![image.png](/static/articlePicture/11726120124786280.png)\n# 白嫖cf的ssl证书\n这里我参考的是B站[技术爬爬虾](https://www.bilibili.com/video/BV1by411B7Ko/?spm_id_from=333.999.0.0)的视频\n# 关于开启CDN加速\n这里[开启CDN加速](https://www.bilibili.com/video/BV1SM4m1176E/?spm_id_from=333.999.0.0)的视频我参考的也是技术爬爬虾，[技术爬爬虾](https://space.bilibili.com/316183842)还是很有实力的', NULL, 5, 0, 'public', NULL, NULL, 0, 1, '2024-09-12 14:06:45', '2024-09-20 10:42:41', 'onew', 0);
INSERT INTO `article` VALUES (27, 1, 5, 14, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/26.webp', '关于PHP报错提示修改配置失败', '# 前言\n今天在部署基于PHP7.4的项目到Nas的时候报错提示修改配置失败，因为在开发环境的时候没有考虑到会有这个问题的具体原因，就随便写的判断，以至于后来只能在网上去一个一个找方案来解决，后来经过仔细排查后才发现是权限的问题。config.php 文件的权限为 -rwxr-xr-x，即文件的所有者具有读、写和执行权限，而组和其他用户只有读和执行权限，PHP进程可以成功写入该文件，就需要调整文件的权限和所有者。通常，PHP进程的用户是 www-data、apache 或 nginx。以下是具体解决问题的步骤。（因为这个问题找到了原因就很简单，所以就没有再复现了）\n## 调整文件权限\n由于文件当前的权限设置为 755（-rwxr-xr-x），应该将其更改为 664，以允许文件所有者和组用户进行读写操作，同时允许其他用户读取文件：\n```language\nchmod 664 /var/www/html/sys/libs/config.php\n```\n## 调整目录权限\n确保目录 /var/www/html/sys/libs 具有适当的权限，使得 PHP 进程能够访问和写入该目录：\n```language\nchmod 775 /var/www/html/sys/libs\n```\n## 调整文件和目录的所有者\n将文件和目录的所有者更改为 PHP 进程的用户，通常在 Docker 容器中是 www-data。如果容器中的用户不同，请相应调整：\n```language\nchown www-data:www-data /var/www/html/sys/libs/config.php\nchown www-data:www-data /var/www/html/sys/libs\n```\n如果不确定容器中的 PHP 用户，可以使用以下命令检查 PHP 进程的用户：\n```language\nps aux | grep php\n```\n确认更改\n## 确保权限和所有者已正确设置：\n```language\nls -l /var/www/html/sys/libs/config.php\nls -ld /var/www/html/sys/libs\n```\n重新启动容器（如果需要）\n如果在配置更改后需要重新启动容器，可以使用：\n```language\ndocker restart Web_MCCMS\n```\n检查 PHP 错误日志\n如果权限和所有者设置正确，但仍然无法写入文件，请检查 PHP 错误日志。可以在容器内部查看日志文件，通常位于 /var/log/apache2/error.log：\n```language\ncat /var/log/apache2/error.log\n```\n# 结语\n通过上面的操作就能完美的写入文件配置了，之前还没有注意过PHP还有权限这一说，学无止境啊\n![image.png](/static/articlePicture/11726295289262883.png)\n![image.png](/static/articlePicture/11726295324385844.png)', NULL, 4, 0, 'public', NULL, NULL, 0, 1, '2024-09-14 14:31:10', '2024-09-20 11:02:19', 'onew', 0);
INSERT INTO `article` VALUES (28, 1, 5, 15, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/27.webp', '关于外网无法通过域名访问Nas', '# 前言\n最近在折腾Nas，然后卡在了外网没法通过域名访问Nas这，在网上也查阅了很多资料，但是都没有我这种情况，我的情况是路由器拨号，开启了公网IPv6，通过ddns-go解析到cf，域名托管在cf，开启了小黄云，在cf的origin rules做了端口转发（不知道我说的对不对，就是可以不用带端口号访问），Nas开放了端口。排查来排查去一直以为是路由器的问题，甚至都准备换一个路由器了，后来在群友的解释下也才知道和路由器没有一毛钱关系\n\n![image.png](/static/articlePicture/onew11726626224218457.png)\n\n我就想着是不是域名的问题，因为我在我的主力域名做了很多设置，于是就开始了排查域名的问题\n# 关掉origin rules中的端口转发\n我在origin rules中做了两个端口转发，一个是我的博客，另外一个是Nas，博客是一直能够访问的，只有Nas无法访问，于是关掉了Nas的端口转发，但是仍旧无法访问\n\n![image.png](/static/articlePicture/onew11726626618083877.png)\n![image.png](/static/articlePicture/onew1172662672149388.png)\n\n将blog的端口转发也关掉，仍旧无法访问，那么就确定了不是origin rules的问题\n\n![image.png](/static/articlePicture/onew11726626763832676.png)\n![image.png](/static/articlePicture/onew1172662672149388.png)\n\n# 关掉小黄云\n我在cf托管域名为了安全是把小黄云开启了的，主要是怕被挖到源IP地址，通过ddns-go解析上来\n\n![image.png](/static/articlePicture/onew11726626918194150.png)\n\n因为blog和Nas的端口转发都关了，所以也和那俩的解析没什么关系了，我先试着关掉主力域名的小黄云看能不能访问\n\n![image.png](/static/articlePicture/onew11726627105531497.png)\n\n很不幸，仍旧无法访问，后来想起来是不是IPv4无法访问到IPv6的原因，因为是在图书馆连图书馆的WiFi就没有考虑过这个问题，于是用手机的5G进入IPv6测试网站（我不确定是不是5G才有IPv6，只能先从5G开始）\n\n![image.png](/static/articlePicture/onew11726627388735382.png)\n\nOK，有IPv6地址，连上热点\n\n![image.png](/static/articlePicture/onew11726627522568654.png)\n\n输入域名加上端口号进行测试\n\n![image.png](/static/articlePicture/onew11726627158344489.png)\n\n很好，通过域名加上端口号能够顺利访问\n\n# 弊端\n虽然这样能够解决我的问题，但是关闭了我的主力域名的小黄云也就意味着能够通过我的博客IP地址从而找到我的Nas的IP地址（因为博客是部署到Nas上的）\n\n![image.png](/static/articlePicture/onew11726627812617825.png)\n\n## 解决方案\n我用我的另外一个域名不开小黄云，同样用ddns—go进行映射，主力域名的小黄云正常开着，同时，origin rules的端口转发也打开（Nas的Dns记录和端口转发可以删掉了，我截图的时候忘了）\n\n![image.png](/static/articlePicture/onew11726628008993337.png)\n![image.png](/static/articlePicture/onew11726628026988980.png)\n![image.png](/static/articlePicture/onew11726627970010853.png)\n\n输入另外一个域名加上IP地址，同时，测试主力域名能否访问\n\n![image.png](/static/articlePicture/onew11726628210089146.png)\n![image.png](/static/articlePicture/onew11726628276292118.png)\n\nOK，主力域名无法访问，另外一个域名能够顺利访问，完美解决，perfect！\n\n# 结语\n虽然这个问题看着很轻易的就解决了，但是这个问题困扰了我好几天，而且在测试的过程中我发现我的另外一个域名挂掉了，这就导致了在解决问题的过程中添加了难度。因为当时并不知道这个域名挂了，直到昨天打开那个域名跳转到了反诈页面才知道挂了。只不过总的来说结果还是好的，我可以继续做我该做的事情咯！\n\n——————————————————————————————————————————\n# 补充\n有人问我为什么现在不做Nas的端口转发了，这我也试过，但是访问页面会报错，报错如下所示\n```language\nThe plain HTTP request was sent to HTTPS port\n```\n因为访问群辉会自动跳转到https，然后显示次连接不安全，我认为还是我域名的原因，虽然在cf能够白嫖证书，但是有点能力还是买国内的域名吧，毕竟稳才是最重要的，万一哪天cf全被墙了就啥也没了。\n——————————————————————————————————————————\n# 更新（2025年3月9日21:17:05）\n最近找到无法通过域名访问Nas的具体原因了，其实就是因为使用了 Cloudflare 的半程 SSL ，也就是说 Cloudflare 到我的Nas没有使用 SSL ，这就会导致握手失败。而解决方法就是Cloudflare 指定子域名 SSL 严格模式。通过 Cloudflare 设定 Configuration Rules，设定自定义筛选表达式。\n当传入请求匹配时…\n|字段|运算符|值|\n|-|-|-|\n|URI 完整|包含|你想设定严格 SSL 的的子域名|\n则设置将为…\nSSL：严格\n这样，我遇到的问题就可以完美解决了，可以通过域名访问Nas而且带有 Cloudflare 的免费证书了（IPv4和IPv6均可访问）。', NULL, 9, 0, 'public', NULL, NULL, 0, 1, '2024-09-18 11:03:38', '2025-03-09 21:32:48', 'onew', 0);
INSERT INTO `article` VALUES (29, 1, 5, 16, '/static/articleCover/onew11726799017300284.jpg', 'Docker常用命令汇总', '# 前言\n最近折腾了一阵docker，每次都有自己不熟悉的命令，就写下这篇文章记录一下，就不用每次都去网上搜了\n# Docker常用命令\n## Docker 服务相关命令\n### 启动 Docker：\n```shell\nsystemctl start docker\n```\n### 停止 Docker：\n```shell\nsystemctl stop docker\n```\n### 重启 Docker：\n```shell\nsystemctl restart docker\n```\n### 查看 Docker 运行状态：\n```shell\nsystemctl status docker\n```\n## 镜像相关命令\n### 列出本地镜像：\n```shell\ndocker images\n```\n### 从 Docker Hub 拉取镜像：\n```shell\ndocker pull <镜像名>:<标签>\n```\n示例：\n```shell\ndocker pull nginx:latest\n```\n### 修改镜像名称：\n```shell\ndocker tag <旧镜像名称或ID> <新镜像名称:标签>\n```\n### 删除本地镜像：\n```shell\ndocker rmi <镜像ID或镜像名>\n```\n### 构建镜像：\n```shell\ndocker build -t <镜像名>:<标签> <Dockerfile所在路径>\n```\n### 查看镜像的详细信息：\n```shell\ndocker inspect <镜像ID或镜像名>\n```\n### 导出镜像文件（导出的是镜像，包括其历史记录和元数据，可以通过 docker load 重新加载）：\n```shell\ndocker save -o [保存路径/文件名.tar] [镜像名]:[标签]\n```\n### 导入镜像文件\n```shell\ndocker load -i [保存路径/文件名.tar] [镜像名]:[标签]\n```\n### 导出镜像文件（只导出容器的文件系统，没有镜像的历史记录和元数据，恢复时需要手动配置）：\n```shell\ndocker export -o [保存路径/文件名.tar] [容器ID或容器名]\n```\n## 容器相关命令\n### 运行容器：\n```shell\ndocker run <选项> <镜像名>\n```\n常用选项：\n-d：后台运行容器\n-p：端口映射，例如 -p 8080:80 表示把本地主机的 8080 端口映射到容器的 80 端口\n--name：为容器指定一个名称\n-v：挂载目录，例如 -v /host/path:/container/path\n-e：设置环境变量，例如 -e ENV_VAR=value\n--rm：容器停止后自动删除\n-it：以交互模式运行容器，通常用于运行命令行程序\n### 列出运行中的容器：\n```shell\ndocker ps\n```\n### 列出所有容器（包括停止的容器）：\n```shell\ndocker ps -a\n```\n### 停止容器：\n```shell\ndocker stop <容器ID或容器名>\n```\n### 启动已停止的容器：\n```shell\ndocker start <容器ID或容器名>\n```\n### 重启容器：\n```shell\ndocker restart <容器ID或容器名>\n```\n### 删除容器：\n```shell\ndocker rm <容器ID或容器名>\n```\n### 查看容器日志：\n```shell\ndocker logs <容器ID或容器名>\n```\n### 进入容器：\n```shell\ndocker exec -it <容器ID或容器名> /bin/shell\n```\n或者使用：\n```shell\ndocker attach <容器ID或容器名>\n```\n## 容器网络相关命令\n### 查看容器网络：\n```shell\ndocker network ls\n```\n### 创建自定义网络：\n```shell\ndocker network create <网络名>\n```\n### 删除网络：\n```shell\ndocker network rm <网络名>\n```\n### 连接容器到网络：\n```shell\ndocker network connect <网络名> <容器ID或容器名>\n```\n### 从网络中断开容器：\n```shell\ndocker network disconnect <网络名> <容器ID或容器名>\n```\n## 数据卷相关命令\n### 创建数据卷：\n```shell\ndocker volume create <卷名>\n```\n### 列出所有卷：\n```shell\ndocker volume ls\n```\n### 删除数据卷：\n```shell\ndocker volume rm <卷名>\n```\n### 查看卷的详细信息：\n```shell\ndocker volume inspect <卷名>\n```\n## Docker Compose 常用命令\n### 启动服务：\n```shell\ndocker-compose up\n```\n### 使用 -d 参数在后台运行：\n```shell\ndocker-compose up -d\n```\n### 停止服务：\n```shell\ndocker-compose down\n```\n### 构建服务：\n```shell\ndocker-compose build\n```\n### 重新启动服务（构建镜像后）：\n```shell\ndocker-compose up --build\n```', NULL, 36, 0, 'public', NULL, NULL, 0, 1, '2024-09-18 20:11:11', '2024-11-16 16:39:20', 'onew', 0);
INSERT INTO `article` VALUES (30, 1, 5, 11, '/static/articlePicture/onew11726703798884247.jpg', '双网口Nas连线图', '# 介绍\n这是一个包含多网口设备的拓扑图，前提是群辉要有两个网口，群辉虚拟机系统上安装了iKuai和iStoreOS（用于存储或虚拟化管理），并通过物理网卡（eth0、eth1、eth2、eth3）与外部网络和其他设备通信，虚拟桥接（vmbr0、vmbr1、vmbr2）用于连接虚拟机之间的通信。\n![双网口Nas连线图.jpg](/static/articlePicture/onew11726703798884247.jpg)', NULL, 10, 0, 'public', NULL, NULL, 0, 1, '2024-09-19 07:57:09', '2024-09-20 09:48:06', 'onew', 0);
INSERT INTO `article` VALUES (31, 1, 5, 11, '/static/articleCover/onew11727399315950783.jpg', '开启IPv6后打开网页卡顿的问题解决', '# 前言\n之前光猫桥接，路由器拨号开启了IPv6，开启之后始终感觉打开网页的速度慢了许多，在Google之后感觉可能是PMTU黑洞的问题。\n# 关于PMTU黑洞\nMTU (Maximum transmission unit) 是一条链路上可以通过的三层数据包的最大尺寸（包含 IP 包头）。以太网上默认的 MTU 是 1500 字节，但是你和目标服务器之间的路径上可能存在小于 MTU 1500 的链路。这条路径上最小的 MTU 值就是整条路径的 PMTU 值。路由器在转发包时，超过 MTU 大小的包会被分片（ Fragmentation ），也就是一个大包会被分切为多个不超过 MTU 的小包进行传输，传输效率会下降。\n\n终端设备在发包时，也可以设置 DF （ Don\'t Fragment ）标记来告诉路由器不要分片。这时中间路由器会丢掉超过 MTU 的包，回复一条 ICMP Fragmentation Needed 消息。发送者收到这个包后，下次就会发小一点的包，这个过程叫做 PMTU Discovery 。现实中可以看到 HTTPS （ TLS ）的流量大都是带 DF 标记的。\n\n然而，互联网上有大量的中间设备为了所谓的“安全”或者没有正确配置，不回应 ICMP Fragmentation Needed 包，这使得访问某些网站时如果某个包的大小超过了 PMTU，会被无声地丢弃，直到 TCP 协议发现超时丢包进行重传，这非常缓慢。遇到这种情况，我们可以说你和目标服务器的路径上存在 PMTU 黑洞。\n\n此外，IPv6 不支持分片，换句话说可以理解为 IPv6 下所有的包都是带 DF 标记的。中间路由器在遇到包尺寸大于 MTU 的情况时，应该回应 ICMPv6 Packet Too Big 消息。同样的，由于种种原因，某些中间设备可能会直接丢包而不回应 ICMPv6 Packet Too Big 消息，直到 TCP 协议发现超时丢包进行重传。\n# 解决方法\n这里提供一个ipv6的检查工具 [http://icmpcheckv6.popcount.org/](http://icmpcheckv6.popcount.org/) ，建议在浏览器里打开这个站点。\n站点页面的显示如下：\n\n![image.png](/static/articlePicture/onew11727398346163390.png)\n\n翻译后：\n\n![image.png](/static/articlePicture/onew11727398385289433.png)\n\n这时我的路由器中最大接受单元（MRU）的值是1478：\n\n![image.png](/static/articlePicture/onew11727398481561458.png)\n\n我们需要把最大接受单元（MRU）的值修改为1200：\n\n![image.png](/static/articlePicture/onew11727398612210350.png)\n\n再次打开 [http://icmpcheckv6.popcount.org/](http://icmpcheckv6.popcount.org/) 进行检测，页面显示如下：\n\n![image.png](/static/articlePicture/onew11727398674527314.png)\n\n翻译如下：\n\n![image.png](/static/articlePicture/onew11727398694296164.png)\n\n值得一提的是这次打开检测站点的速度快了很多，没有再出现转圈或者是响应超时的情况，这样从侧面说明这个问题已经解决了。\n\n# 结语：\n改了之后确实感觉速度快了很多，也不知道是不是心理作用，但是结果总归还是好的。\n\n——————————————————————————————————————————\n# 补充（关于MTU和MRU）\n需要修改的是MTU，但我修改的是MRU，虽然不是同一个东西，可打开网页的速度却是真真实实的提升了，下面我们了解一下它们的概念和区别\n## MTU和MRU概念\nMTU（Maximum Transmission Unit，最大传输单元）。\nMRU（Maximum Receive Unit，最大接收单元）。\nMTU是以太网数据链路层概念，MRU是PPP链路数据链路层的概念.但是都是最大传输单元的意思\n## MTU和MRU区别\n### 方向：\nMTU：主要与数据的发送有关，影响发送方能够发送的数据包大小。\nMRU：主要与数据的接收有关，影响接收方能够处理的数据包大小。\n### 应用场景：\nMTU常用于以太网、IP协议等网络协议中，决定了最大数据帧的大小。\nMRU通常在点对点协议（PPP）中使用，确定接收方处理数据的能力。\nMTU和MRU都是与数据传输相关的参数，但MTU侧重于发送，而MRU侧重于接收。确保这两个值合理设置，可以提高网络的性能和稳定性。\n## 总结\n虽然设置的不是MTU而是MRU，但是也算是歪打正着了吧。', NULL, 14, 0, 'public', NULL, NULL, 0, 1, '2024-09-27 09:08:40', '2024-09-27 09:29:27', 'onew', 0);
INSERT INTO `article` VALUES (32, 1, 5, 10, '/static/articlePicture/onew11730203304146582.png', 'Python批量计算PDF页数', '今天下载了2016年到2024年的国考真题，准备拿在网上去打印出来做，因为想算一下大概多少钱，但是页数太多了不知道多少页，于是写下了以下Python代码来批量计算PDF的页数\n# 安装PyPDF2库：\n```python\npip install PyPDF2\n```\n# Python代码\n```python\nimport PyPDF2\nimport os\n\ndef count_pdf_pages(directory):\n    pdf_page_counts = {}\n    total_pages = 0  # 初始化总页数为0\n    for filename in os.listdir(directory):\n        if filename.endswith(\".pdf\"):\n            filepath = os.path.join(directory, filename)\n            try:\n                with open(filepath, \"rb\") as pdf_file:\n                    pdf_reader = PyPDF2.PdfReader(pdf_file)\n                    page_count = len(pdf_reader.pages)\n                    pdf_page_counts[filename] = page_count\n                    total_pages += page_count  # 累加每个PDF的页数\n            except Exception as e:\n                pdf_page_counts[filename] = f\"Error: {e}\"\n    return pdf_page_counts, total_pages\n\ndirectory_path = \"D:/本地文件夹/桌面/2016-2024国考真题\" # PDF所在的文件夹\npage_counts, total_pages = count_pdf_pages(directory_path)\n\n# 输出每个PDF的页数\nfor filename, page_count in page_counts.items():\n    print(f\"{filename}: {page_count} pages\")\n\n# 输出PDF总页数\nprint(f\"Total pages across all PDFs: {total_pages}\")\n\n```\n# 代码说明\n\ncount_pdf_pages 函数返回一个包含每个 PDF 文件页数的字典 pdf_page_counts，以及所有 PDF 的总页数 total_pages。\n\n代码中使用 total_pages += page_count 来累计页数。\n# 运行效果\n![image.png](/static/articlePicture/onew11730203304146582.png)\n', NULL, 9, 0, 'public', NULL, NULL, 0, 1, '2024-10-29 20:04:06', '2024-10-29 20:17:41', 'onew', 0);
INSERT INTO `article` VALUES (33, 1, 5, 7, '/static/articlePicture/onew11731742346065662.jpg', 'Ubuntu系统安装docker', '# 前言\n昨天在华为云白嫖了一个月的云服务器，想到了博客还运行在家里的nas上，只有IPv6的公网没有IPv4的公网，就想着把博客迁移过来。用的是Ubuntu系统，占用的内存比Windows server少多了，性能也比较好。然后博客是用docker安装的，方便迁移。下面就记录一下Ubuntu下安装docker的命令。\n![Snipaste_20241116_132134.jpg](/static/articlePicture/onew11731735063631643.jpg)\n![Snipaste_20241116_132352.jpg](/static/articlePicture/onew11731735075496547.jpg)\n# 卸载旧版本 Docker（可选）\n如果系统中安装了旧版本的 Docker，可以先卸载它们以避免冲突：\n```shell\nsudo apt-get remove docker docker-engine docker.io containerd runc\n```\n# 更新软件包和依赖\n确保包管理器的索引是最新的：\n```shell\nsudo apt update\nsudo apt upgrade\n```\n# 手动下载并安装 Docker GPG 密钥\n```shell\nwget https://download.docker.com/linux/ubuntu/gpg\n```\n导入密钥：\n```shell\nsudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg gpg\n```\n# 手动添加 Docker APT源\n手动添加 Docker 源，确保 /etc/apt/sources.list.d/ 目录存在，然后运行：\n```shell\necho \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\n```\n# 安装 Docker\n更新包列表并安装 Docker：\n```shell\nsudo apt update\nsudo apt install docker-ce docker-ce-cli containerd.io\n```\n# 启动并启用 Docker 服务\n安装完成后，启动 Docker 服务并设置开机自启：\n```shell\nsudo systemctl start docker\nsudo systemctl enable docker\n```\n# 验证安装\n运行以下命令检查 Docker 是否正确安装：\n```shell\nsudo docker --version\nsudo docker-compose --version\n```\n# 安装docker-compose\n最新版本的 docker-compose 已被整合到 Docker CLI 中，称为 Compose V2，可以通过 Docker 的官方工具安装。\n## 安装 Compose V2 插件\n运行以下命令来安装 Compose 插件：\n```shell\nsudo apt update\nsudo apt install docker-compose-plugin\n```\n## 检查安装版本\n```shell\ndocker compose version\n```\n# 安装完成\n![Snipaste_20241116_153211.jpg](/static/articlePicture/onew11731742346065662.jpg)\n**注意：使用 Compose V2 时，命令改为 docker compose（用空格替代 -）。**', NULL, 21, 0, 'public', NULL, NULL, 1, 1, '2024-11-16 13:30:31', '2024-11-16 15:36:28', 'onew', 0);
INSERT INTO `article` VALUES (34, 1, 2, 17, '/static/articleCover/onew11733367052166248.jpg', '人生失败的那一次', '关于我的第一次表白：我和她是在我大一开学的时候加的老乡群认识的，\n\n![download.png](/static/articlePicture/onew11733326918576964.png)\n\n然后就一直都是不温不火的普通朋友关系，期间她会叫我帮她拿快递，带饭之类的（带饭肯定是给钱了的），她有一次给我了一盒鸡翅，还挺好吃的，\n\n![image_2.webp](/static/articlePicture/onew11733326931350551.webp)\n![image_3.webp](/static/articlePicture/onew11733326939263228.webp)\n\n然后大二上学期聊天就开始逐渐频繁起来了，内容就是每天的琐事之类的，她也会给我发她的自拍照，也会让我在空间给她评论，\n\n![image_4.webp](/static/articlePicture/onew11733326943609785.webp)\n![image_5.webp](/static/articlePicture/onew11733326948766183.webp)\n\n有时候也会叫我宝之类的（我也不想当舔狗啊，可是她叫我宝诶），\n\n![image_6.webp](/static/articlePicture/onew1173332695946816.webp)\n\n她是一个很优秀的女孩子，\n\n![image_7.webp](/static/articlePicture/onew1173332705374099.webp)\n![image_8.webp](/static/articlePicture/onew11733327064340520.webp)\n\n之后她快升本了，我发了朋友圈祝福她希望她能考上理想的本科大学，当然，她最后也考上了，\n\n![image_9.webp](/static/articlePicture/onew1173332707330443.webp)\n\n她开学去学校的时候被人加微信了，\n\n![image_10.webp](/static/articlePicture/onew11733327078597855.webp)\n![image_11.webp](/static/articlePicture/onew11733327083110850.webp)\n\n后来在七月六号的时候她跟我说她分手了快十天，我当时也觉得没什么，也不碍我什么事，也就没怎么在意，还是像以前一样打游戏，就装死直男，\n\n![image_12.webp](/static/articlePicture/onew11733327087663421.webp)\n\n后来我换最右上的沙雕头像的时候她会骂我什么的，开我玩笑之类的，\n\n![image_13.webp](/static/articlePicture/onew11733327094235602.webp)\n![image_14.webp](/static/articlePicture/onew11733327109662246.webp)\n![image_15.webp](/static/articlePicture/onew11733327116174379.webp)\n![image_16.webp](/static/articlePicture/onew11733327123588386.webp)\n\n我有一次给她点了外卖（所谓的秋天第一杯奶茶，也是我第一次请女生喝奶茶），\n\n![image_17.webp](/static/articlePicture/onew11733327128285863.webp)\n\n后来有一次她和室友闹矛盾了，就出去散心，她当时给我打视频的时候我是不敢接的，毕竟是第一次接女孩子视频，后来还是接了，也不能让人家女孩子一个人在外面没人倾诉，\n\n![image_18.webp](/static/articlePicture/onew11733327133817852.webp)\n\n她也会和我吐槽遇到的形形色色的人，\n\n![image_19.webp](/static/articlePicture/onew11733327137793168.webp)\n![image_20.webp](/static/articlePicture/onew11733327141576904.webp)\n\n有时候我遇到的生活上的难题她也会安慰我，就像一个姐姐一样，\n\n![image_21.webp](/static/articlePicture/onew11733327156248354.webp)\n![image_22.webp](/static/articlePicture/onew11733327160367402.webp)\n![image_23.webp](/static/articlePicture/onew11733327167199771.webp)\n\n她和别人出去玩也会跟我说，虽然并不和我说是谁，但是她发了朋友圈的，\n\n![image_24.webp](/static/articlePicture/onew11733327172832382.webp)\n![image_25.webp](/static/articlePicture/onew1173332717637923.webp)\n\n有一次她摔跤了，看着很心疼\n\n![image_26.webp](/static/articlePicture/onew11733327180555694.webp)\n\n有时候她会给我分享一些无厘头的文案，也不知道是从哪儿来的，就感觉奇奇怪怪的，我也询问过抽纸们，他们也给了我回复，我当时也是半信半疑，\n\n![image_27.webp](/static/articlePicture/onew11733327184690802.webp)\n![image_28.webp](/static/articlePicture/onew1173332718914287.webp)\n![image_29.webp](/static/articlePicture/onew11733327194956678.webp)\n\n可能她有时候也会放不下她前男友，也有可能是和前男友有约定，我也并不知道这个兵哥哥是不是她前男友（这里都是我的猜想罢了），\n\n![image_30.webp](/static/articlePicture/onew11733327203258654.webp)\n![image_31.webp](/static/articlePicture/onew11733327207465690.webp)\n![image_32.webp](/static/articlePicture/onew11733327212763588.webp)\n\n有时候我会有一种错觉，就是我以后会和她在一起，真的，这感觉太真实了，\n\n![image_33.webp](/static/articlePicture/onew11733327216240767.webp)\n![image_34.webp](/static/articlePicture/onew11733327220456679.webp)\n![image_35.webp](/static/articlePicture/onew11733327224239378.webp)\n![image_36.webp](/static/articlePicture/onew11733327230531878.webp)\n![image_37.webp](/static/articlePicture/onew11733327234945577.webp)\n![image_38.webp](/static/articlePicture/onew11733327241153441.webp)\n\n她的支付宝小鸡🐥之前也被我用亲情卡带去养了，然后不知道为什么她又带回去了，\n\n![image_39.webp](/static/articlePicture/onew11733327245242413.webp)\n![image_40.webp](/static/articlePicture/onew11733327252242511.webp)\n\n然后前段时间我又给她带过来了，\n\n![image_41.webp](/static/articlePicture/onew11733327256105167.webp)\n\n有次我帮她转发了一个学校投票的链接，上面就是有她的照片，然后有评比什么的，\n\n![image_1.webp](/static/articlePicture/onew11733327271873571.webp)\n![image_2.webp](/static/articlePicture/onew11733327276152121.webp)\n![image_3.webp](/static/articlePicture/onew11733327279671710.webp)\n![image_4.webp](/static/articlePicture/onew11733327283223343.webp)\n![image_5.webp](/static/articlePicture/onew11733327287105216.webp)\n\n有时候她也会分享一些……emmm（每次在拉💩的时候都会发那个表情包）\n\n![image_6.webp](/static/articlePicture/onew11733327291825543.webp)\n![image_7.webp](/static/articlePicture/onew11733327296118195.webp)\n\n然后就是最近这段时间，因为她用iPhone，宿舍的网也不怎么好，她给我分享了一个叫some的歌曲，然后我还特地去下载QQ音乐（之前我一直都是用网易云），这样我分享过去的时候她是可以直接点开听的，\n\n![image_8.webp](/static/articlePicture/onew11733327301105635.webp)\n![image_9.webp](/static/articlePicture/onew11733327334102551.webp)\n![image_10.webp](/static/articlePicture/onew11733327324238378.webp)\n![image_11.webp](/static/articlePicture/onew11733327339709990.webp)\n![image_12.webp](/static/articlePicture/onew11733327343808416.webp)\n![image_13.webp](/static/articlePicture/onew11733327349326832.webp)\n![image_14.webp](/static/articlePicture/onew11733327356416617.webp)\n![image_15.webp](/static/articlePicture/onew11733327360739872.webp)\n![image_16.webp](/static/articlePicture/onew11733327364490490.webp)\n![image_17.webp](/static/articlePicture/onew11733327368872470.webp)\n![image_18.webp](/static/articlePicture/onew11733327372988128.webp)\n![image_19.webp](/static/articlePicture/onew1173332737830688.webp)\n![image_20.webp](/static/articlePicture/onew11733327382636746.webp)\n![image_21.webp](/static/articlePicture/onew11733327387989139.webp)\n![image_22.webp](/static/articlePicture/onew11733327392115188.webp)\n![image_23.webp](/static/articlePicture/onew11733327397648858.webp)\n\nQQ音乐分享的歌左下角不是有那个几人在听嘛，然后我以为是我分享给她，她分享给别人，后来我去搜了一下才发现是QQ音乐当前在听那首歌的人数（她撤回的那条消息“舒服了？”我感觉是在说我搞清楚了不是她分享给别人而舒服了），\n\n![image_24.webp](/static/articlePicture/onew11733327402928349.webp)\n![image_25.webp](/static/articlePicture/onew1173332741393956.webp)\n![image_26.webp](/static/articlePicture/onew11733327418229106.webp)\n![image_27.webp](/static/articlePicture/onew11733327423475561.webp)\n![image_28.webp](/static/articlePicture/onew11733327428598317.webp)\n\n九月初二那天我生日，白天的时候我谁也没有说，然后在晚上的时候买了一瓶百事可乐奖励自己，因为她也喜欢喝百事可乐，我跟她说了之后她给我点了外卖，外卖包装上并没有标明价格之类的单子，送蛋糕的外卖小哥还给我说了一声“生日快乐”，一个甜筒冰淇淋蛋糕，一个巧克力蛋糕，还有一杯益禾堂奶茶叫红沙醉蓬莱，我还专门发了朋友圈，但是不知道为什么我感觉我发了朋友圈之后她不是很高兴，\n\n![image_29.webp](/static/articlePicture/onew11733327438392593.webp)\n![download.png](/static/articlePicture/onew11733327534048793.png)\n![image_31.webp](/static/articlePicture/onew11733327444281981.webp)\n\n最后的最后就是前天的表白了：\n那天晚上告白之后就一直睡不着，一晚上都没有睡，然后第二天早上起来没有吃早饭，第一节课翘课去考科一了，看着题都是眼花的，不过还好91过了，考完科一之后看到她八点多钟发了一个问号，然后回来上第二节课，第二节课下课没有吃午饭，就回寝室睡觉了，等到四五点起来就回复她的问号，等到七点多钟室友去买饭问要不要给我带饭，我说不用，然后过了一会儿另外一个室友打电话要不要带饭，我觉得一天不吃饭也不行，不然等下晚上睡不着，就带了一份炒饭，然后打了一会儿游戏，看了一会儿单词，就睡觉了，睡觉之前她让我给她分享一首歌，我选了QQ音乐日推三十首里面其中好听，她喜欢的风格的一首推了过去，过了半小时左右她又让我分享一首，我没有回，过了会儿她发了一个问号，还有一个生气的表情[发怒]，我没有回，第二天回的，回的语气感觉都不一样了，然后就去睡觉了，\n\n![image_32.webp](/static/articlePicture/onew11733327449604383.webp)\n', NULL, 16, 0, 'password', '2021年10月7日', '找作者问问呗', 0, 1, '2024-12-04 23:41:01', '2024-12-05 10:50:54', 'onew', 0);
INSERT INTO `article` VALUES (35, 1, 2, 17, 'https://gitee.com/xiaoliula/image/raw/master/scenery2/21.webp', '在京东物流做了两个月搬运工的心得体会', '总结一下这两个月吧，十二月十九号放假，二十三号就开始在京东物流做装卸员打寒假工到今天二月十八号，明天后天是休息，所以寒假工生活基本上可以算是结束了。京东物流的月份计算和我们所说的自然月不一样，他是每个月都二十号到下个月的二十号为一个月。在京东物流上班每天五点二十起床，五点五十坐厂车，六点半上班，下午六点下班，没有午休。期间休息了五天而且春节加班没有回家，也就是说从放假到现在一共在家也就待了一个周。说不想家都是假的，特别是没有回家过年是我今年最大的遗憾。当然，我也从来没有说过累了不想做了之类的话，我也从来没有跟我的家人说过很累很辛苦，我都只是说还行吧，不累，我妈也说过要是实在不行就回来吧，可是我认定的事从来都是坚持下来的，几乎没有放弃过。说实话，我们二十岁左右的年纪就怕什么都不做，但是进厂可以做为你最坏的打算。只不过进厂是真的累，不仅是身体累，心也累。我在厂里面是卸货的，一整天都在车厢里面很压抑，特别是一开始的时候，又累又想家，对于一个还没有怎么出社会的大学生来说这可以是最锻炼人的时候。在厂里面你会遇到各种各样的人，特别是一些和一些大妈大叔聊起天来真的很暖心，当然，也有一些不务正业的人。第一个月的工资我用来给我妈买了个手机，之前我也发过了帖子，让我看见了很多抽子都是很有孝心的人，都很棒，我也听取了很多人的建议，也谢谢各位抽子给我的建议。虽然这部手机最后的价格是2999，而且我也觉得我买手机买贵了，被坑了，但是年轻人嘛，总有些弯路要走，走过了就知道该怎么走了。第二个月的工资就用来当我上学的生活费吧，这点钱还是够我潇洒一学期了哈哈哈哈！！（ps：p1是厂里面的环境，因为不能带手机，所以只能拍个大概；p2是京东物流发的鸡汤，鸡肉被我吃完了没拍到，春节礼物，还有元宵节的汤圆；p3是我给妈妈买的手机，被宰了；p4是我第一个月的工资条，第二个月的还没有发，虽然很少，但是我已经很知足了）\n\n![image_1.webp](/static/articlePicture/onew11733327674616601.webp)\n![image_2.webp](/static/articlePicture/onew117333276793641.webp)\n![image_3.webp](/static/articlePicture/onew11733327683530310.webp)\n![image_4.webp](/static/articlePicture/onew1173332768686978.webp)\n![image.png](/static/articlePicture/onew11733327705780530.png)\n', NULL, 2, 0, 'login', '', '', 0, 1, '2024-12-04 23:55:18', '2024-12-05 10:50:11', 'onew', 0);
INSERT INTO `article` VALUES (36, 1, 5, 10, '/static/articleCover/onew1173332798077863.jpg', '从base64格式的HTML中提取图片', '# 前言\n今天准备把前几年在手机上写的小作文转到博客上，但是发现导出的格式是base64的HTML文件（尝试导出过word或者pdf格式，但是不尽人意），其中的图片就不是那么方便复制，而且是原图，占用的空间比较大。于是就有了下面这段Python代码。\n# 代码\n```Python\nimport re\nimport base64\nfrom io import BytesIO\nfrom PIL import Image\n\n# 读取 HTML 文件\nwith open(\"your_file.html\", \"r\", encoding=\"utf-8\") as file:\n    html_content = file.read()\n\n# 查找所有 base64 数据\nbase64_images = re.findall(r\'data:image/[^;]+;base64,([^\\\"]+)\', html_content)\n\n# 保存图片为 WebP 格式\nfor i, base64_data in enumerate(base64_images):\n    try:\n        # 解码 Base64 数据\n        image_data = base64.b64decode(base64_data)\n\n        # 打开图片\n        img = Image.open(BytesIO(image_data))\n\n        # 转换为 RGB 模式（移除透明通道）\n        img = img.convert(\"RGB\")\n\n        # 保存为 WebP 格式文件\n        file_name = f\"image_{i + 1}.webp\"\n        img.save(file_name, \"WEBP\", quality=80)\n        print(f\"图片已保存为 {file_name}\")\n    except Exception as e:\n        print(f\"转换失败：{e}\")\n\n```\n# 效果演示\n![onew11733320984924734.png](/static/articlePicture/onew11733328032136841.png)\n![onew11733321012025315.png](/static/articlePicture/onew11733328040703473.png)', NULL, 3, 0, 'public', NULL, NULL, 0, 1, '2024-12-05 00:00:46', '2024-12-05 00:00:46', NULL, 0);
INSERT INTO `article` VALUES (37, 1, 5, 18, '/static/articleCover/onew1173347444423337.webp', 'Vue项目中实现鼠标悬浮显示微信和QQ二维码', '# 前言\n打算在本博客的基础上增加一些美化，为了实现在鼠标悬停时显示二维码，并且确保显示的内容位于页面的最上层，记录一下代码\n# HTML代码\n鼠标悬停显示二维码：使用 CSS 的 :hover 伪类，使得当鼠标悬停在图标上时，相关的二维码框架（.qr-box）才会显示出来。\n\n二维码框（.qr-box）的显示和隐藏：通过 display: none 和 display: block 控制二维码框的显示与隐藏。display: none 隐藏元素，而 display: block 将其显示出来。\n\n文字提示（.qr-text）：为了在二维码上方添加提示文字（例如：“打开微信扫一扫”），为文字创建一个单独的元素，并使用颜色与微信图标的颜色保持一致。通过 text-align: center 将文字居中显示。\n```html\n<!-- 微信二维码 -->\n<span style=\"margin: 0px 10px; position: relative;\">\n  <span class=\"el-popover__reference-wrapper\">\n    <span class=\"el-popover__reference\" aria-describedby=\"el-popover-wechat\" tabindex=\"0\">\n      <img src=\"/static/assets/ico/wechat.ico\" alt=\"微信图标\" height=\"28\" width=\"28\">\n    </span>\n  </span>\n\n  <!-- 提示文字：打开微信扫一扫 -->\n  <div class=\"qr-text\">打开微信扫一扫</div>\n\n  <!-- 微信二维码 -->\n  <div class=\"qr-box\" style=\"display:none;\">\n    <img src=\"/static/assets/ico/wechat_qr.webp\" alt=\"微信二维码\" width=\"150\" height=\"150\">\n  </div>\n</span>\n```\n# CSS代码\nposition: absolute：用来让元素相对于其最近的已定位父元素（或者页面的视口）进行定位。这个属性使得你能够自由地控制元素的位置。\n\ntop 和 left：这两个属性用来设置元素相对于其定位上下文的位置。通过设置 top: 40px; left: 0;，二维码盒子被放置在距离容器顶部 40px 的位置。\n\npadding：添加内边距，使得二维码周围有空白区域，从而避免二维码和框架的边界紧贴。\n\nbackground-color: rgba(255, 255, 255, 0.9)：设置背景颜色为半透明白色（rgba），0.9 的透明度让背景稍微透明，看起来更美观。\n\nborder-radius：为二维码盒子添加圆角，使其边框更加柔和。\n\nbox-shadow：为二维码盒子添加阴影效果，使其看起来浮动在页面之上，增加层次感。\n\nz-index：控制元素的堆叠顺序。值越大的元素会覆盖在值较小的元素之上。设置 z-index: 9999 确保二维码盒子和提示文字位于最上层。\n```css\n.qr-box {\n  position: absolute;\n  top: 40px;\n  left: 0;\n  padding: 15px;\n  background-color: rgba(255, 255, 255, 0.9); /* 半透明白色背景 */\n  border-radius: 8px; /* 圆角 */\n  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* 阴影效果 */\n  z-index: 9999; /* 确保在最上层 */\n}\n\n.qr-text {\n  color: #C71D23; /* 微信图标的颜色 */\n  font-size: 14px;\n  text-align: center;\n  margin-bottom: 10px; /* 给文字下方留出空隙 */\n  z-index: 9999; /* 确保文字也在最上层 */\n}\n```\n## 关键注意点\nz-index：通过设置高 z-index 值确保二维码框和提示文字在页面的最上层，避免其他元素遮挡。\ndisplay: none 和 display: block：控制二维码框的显示与隐藏。\nposition: absolute：确保二维码框能够精确定位。\n# JS代码\nshowQR函数和hideQR函数通过事件处理来控制二维码的显示和隐藏。为每个图标添加mouseover和mouseout事件，来实现鼠标悬浮时显示二维码，移开时隐藏二维码。\n```js\n<script>\nexport default {\n  data() {\n    return {\n      isQRVisible: {\n        wechat: false,\n        qq: false,\n      },\n    };\n  },\n  methods: {\n    // 显示二维码框\n    showQR(platform) {\n      this.$set(this.isQRVisible, platform, true);\n    },\n    // 隐藏二维码框\n    hideQR(platform) {\n      this.$set(this.isQRVisible, platform, false);\n    },\n  },\n};\n</script>\n```\n# 演示效果\n![onew1173347444423337.jpg](/static/articleCover/onew1173347444423337.webp)\n# 结语\n有空慢慢美化博客，一步一个脚印慢慢来', NULL, 10, 0, 'public', NULL, NULL, 0, 1, '2024-12-06 16:44:32', '2024-12-06 16:49:20', 'onew', 0);
INSERT INTO `article` VALUES (38, 1, 5, 8, '/static/articlePicture/onew11734193571391168.webp', '网页打开弹窗再关闭会导致内容宽度变化', '# 前言\n我的网站是基于的Element，最近在做博客美化和优化的时候发现了一个小小的bug，也不算是bug吧，只是发现了一个以前没有注意到的参数。\n# 问题复现\n就是在打开网页的弹窗的时候会因为滚动条的原因将原本内容的宽度变窄，关闭弹窗后原本内容的宽度会复原，也就是说在关闭的时候会闪烁一下，特别是自定义滚动条过宽的情况下，闪烁一下就很影响美观。\n下面是PC端的闪烁情况（注意看滚动条会闪一下），PC端不会太明显\n\n![Video_20241215001352_compressed.gif](/static/articlePicture/onew11734193166355845.gif)\n\n下面是移动端的闪烁情况，，这就很明显了\n\n![Video_20241215001650_compressed.gif](/static/articlePicture/onew11734193280325567.gif)\n# 解决方案\n后来在Element官网看到了这个\n\n![Snipaste_20241215_002243.webp](/static/articlePicture/onew11734193386599746.webp)\n\n这是一直被忽略没有怎么用的一个属性，它的效果就是在 Dialog 出现时将 body 滚动锁定，加上这个属性就能将滚动锁定\n\n![Snipaste_20241215_002549.webp](/static/articlePicture/onew11734193571391168.webp)\n\nPC端效果：\n![Video_20241215002728_compressed.gif](/static/articlePicture/onew11734193759703286.gif)\n\n移动端效果：\n\n![Video_20241215003021_compressed.gif](/static/articlePicture/onew11734193895982279.gif)\n# 结语\nOK，完美解决，睡觉，晚安！', NULL, 6, 0, 'public', NULL, NULL, 0, 1, '2024-12-15 00:38:07', '2024-12-15 00:39:07', 'onew', 0);
INSERT INTO `article` VALUES (39, 1, 5, 19, '/static/articleCover/onew117364046699359.webp', 'Windows下安装第二个MySQL', '# 前言\n之前我安装了一个MySQL5.7的msi版，最近因为项目学习需要安装MySQL8.0。\n\n# 下载\n如果安装第一个MySQL是msi版，那么第二个MySQL需要zip版本，msi版链接地址：[https://downloads.mysql.com/archives/installer/](https://downloads.mysql.com/archives/installer/)，zip版链接地址：[https://downloads.mysql.com/archives/community/](https://downloads.mysql.com/archives/community/)，这边我使用的MySQL8.0.40的zip版。\n\n# 安装\n下载后的压缩包解压（注意选好安装位置，文件夹路径最好纯英文且不带空格，中文可能出现意想不到的问题）：\n\n![image.png](/static/articlePicture/onew11736400717422830.png)\n\n下面是配置文件my.ini，按需修改，注意端口号不能和第一个MySQL默认的3306重复：\n```bush\n[mysql]\n# 设置mysql客户端默认字符集\ndefault-character-set=utf8mb4\n\n[mysqld]\n# 设置3307端口\nport = 3307\n# 设置mysql的安装目录\nbasedir=D:\\\\study\\\\MySQL8.0.40\\\\mysql-8.0.40-winx64\n# 设置 mysql数据库的数据的存放目录，MySQL 8+ 不需要以下配置，系统自己生成即可\n# datadir=D:\\\\study\\\\MySQL8.0.40\\\\mysql-8.0.40-winx64\\\\data\n# 允许最大连接数\nmax_connections=100\n# 服务端使用的字符集默认为8比特编码的utf8mb4字符集\ncharacter-set-server=utf8mb4\n# 创建新表时将使用的默认存储引擎\ndefault-storage-engine=INNODB\n# 设置bind-address，确保 MySQL 仅接受来自本地的连接\nbind-address = 0.0.0.0\n# 防止不兼容SQL执行\nsql_mode = STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION\n# 设置InnoDB缓存大小\ninnodb_buffer_pool_size = 256M\n# 设置错误日志位置\nlog_error = D:\\\\study\\\\MySQL8.0.40\\\\mysql-8.0.40-winx64\\\\data\\\\mysql_error.log\n\n```\n将配置文件放在解压的根目录下，注意后缀，Windows默认新建txt文件的后缀是txt，如不显示自行百度\n\n![image.png](/static/articlePicture/onew11736401103802572.png)\n\n以管理员身份打开命令行，执行下列命令将目录切换到你解压文件的bin目录\n\n```shell\nd:\ncd study/MySQL8.0.40/mysql-8.0.40-winx64/bin\n```\n![image.png](/static/articlePicture/onew11736401296324885.png)\n\n初始化Mysql，Mysql8.0之后自动生成data文件夹\n```shell\nmysqld  --initialize-insecure （不设置root密码）\n \n//生成的密码在实际连接的时候可能会不小心输入错误或忘记，导致无法连接Mysql\nmysqld  --initialize --console（在控制台生成一个随机的root密码）\n```\n执行命令后会自动生成data文件夹\n\n![image.png](/static/articlePicture/onew1173640150129170.png)\n\n安装MySQL服务，服务名称不能和之前的服务名称相同\n```shell\n//安装mysql服务\nmysqld install mysql8\n \n//卸载mysql服务\nsc delete mysql(需要管理员权限)\n \n//移除mysql服务（需要停止mysql）\nmysqld -remove\n```\n执行命令成功后会出现Service successfully installed\n\n![image.png](/static/articlePicture/onew11736401650896826.png)\n\n开启Mysql服务\n\n```shell\nnet start mysql8\n```\n![image.png](/static/articlePicture/onew11736401789977719.png)\n\n在任务管理器中的服务也可以启动服务\n\n![image.png](/static/articlePicture/onew11736401839950712.png)\n\n登录Mysql\n\n```shell\nmysql -u root -p\n```\n设置（修改）密码\n```shell\n\n//切换数据库\nuse mysql;\n \n//修改root用户的密码为root，根据需要自己设置\nalter user \'root\'@localhost identified by \'root\';\n \n//刷新权限,一般修改密码或授权用户的时候需要使用\nflush privileges;\n \n //退出mysql,两个都可以正常退出数据库\n quit\n exit\n```\n注意：Mysql8.0之后修改密码的方式无法使用password函数!\nNavicat连接MySQL，这里我用的是Navicat15，按需下载，连接名任意，端口为配置文件中的端口号，密码为刚才修改的密码，输入后点击测试连接，连接成功即可。\n\n![image.png](/static/articlePicture/onew11736402013545532.png)\n![image.png](/static/articlePicture/onew11736402116826171.png)\n\n# 额外配置\n## 添加外网访问权限\n```shell\n//切换数据库\nuse mysql\n//更新用户的host\nupdate user set host=\'%\' where user=\'root\';\n//授权\ngrant all privileges on *.* to \'root\'@\'%\' with grant option;\n//刷新\nflush privileges;\n```\n## 创建用户waggag并授远程访问权\n```shell\n//创建用户\ncreate user \'waggag\'@\'%\' identified by \'123456\';\n//授予权限\nGRANT ALL ON *.* TO \'waggag\'@\'%\' WITH GRANT OPTION;\n//刷新权限\nflush privileges;\n```\n\n# 踩的坑\n至于为什么踩的坑最后来写纯粹是因为让看见这篇博客的人再踩一次来根据问题找答案\n## 连接报错Client does not support authentication protocol requested by server\nNavicat 12版本之后不会报错，mysql8.0 引入了新特性 caching_sha2_password；这种密码加密方式客户端不支持；客户端支持的是mysql_native_password 这种加密方式。查看加密方式：\n```shell\nselect host,user,plugin from user;\n```\n![image.png](/static/articlePicture/onew11736402347069920.png)\n\n修改root用户的加密方式：\n```shell\nalter user \'root\'@localhost identified with mysql_native_password BY \'root\';\n```\n注意：一般升级下Navicate的版本即可，不建议修改加密方式。\n### 加密方式\ncaching_sha2_password as the Preferred Authentication Plugin（caching_sha2_password作为首选身份验证插件）\n\nThe caching_sha2_password and sha256_password authentication plugins provide more secure password encryption than the mysql_native_password plugin, andcaching_sha2_password provides better performance than sha256_password. Due to these superior security and performance characteristics of caching_sha2_password, it is as of MySQL 8.0 the preferred authentication plugin, and is also the default authentication plugin rather than mysql_native_password. This change affects both the server and the libmysqlclient client library。\n\n翻译：该caching_sha2_password和 sha256_password认证插件提供比更安全的密码加密mysql_native_password插件，并 caching_sha2_password提供了比更好的性能sha256_password。由于这些优越的安全性和性能特征 caching_sha2_password，它是MySQL 8.0的首选认证插件，也是默认的认证插件而不是 mysql_native_password。此更改会影响服务器和libmysqlclient客户端库。\n\n官方文档：[https://dev.mysql.com/doc/refman/8.0/en/upgrading-from-previous-series.html#upgrade-caching-sha2-password](https://dev.mysql.com/doc/refman/8.0/en/upgrading-from-previous-series.html#upgrade-caching-sha2-password)\n## 启动服务时一直显示正在启动\n当出现这种情况时需要修改mysql8服务的注册表，使用快捷键win+r打开运行窗口，输入regedit然后回车打开注册表，然后根据下面的路径，找到刚才新安装的mysql8\n\n![image.png](/static/articlePicture/onew11736402965361213.png)\n\n这里可以看到我刚才新的mysql8的数值数据指向的地址确实之前安装mysql5的路径，所以这里是不对的，将下面的内容前面的路径内容改为自己mysql8正确的路径即可\n\n修改前：\n![image.png](/static/articlePicture/onew11736403038504221.png)\n\n修改后（(注意只需要修改路径，后面的mysqld mysql8这个内容不需要动)）：\n\n![image.png](/static/articlePicture/onew11736403060904481.png)\n\n现在就可以顺利启动了\n\n## 执行mysqld --initialize --console 命令报错：--initialize specified but the data directory has files in it. Aborting.\n改成如下命令即可执行成功：\n```shell\nmysqld --defaults-file=D:\\Environment\\mysql-8.0.27\\my.ini --initialize --console （注意：修改为自己的my.ini路径！）\n```\n## 连接Navicat报错：Access denied for user ‘root’@’localhost’ (using password:YES)\n首先确认需要连接的端口和密码正确，其次才是后面的解决办法\n### 修改用户表和权限\n需要登录到MySQL。使用以下命令：\n```shell\nmysql -u root -p\n```\n接着，查看当前的用户和主机信息：\n```shell\nSELECT user, host FROM mysql.user;\n```\n这将显示所有用户及其对应的主机。默认情况下，root用户可能只允许从localhost连接。为了允许来自任何IP的连接，需要将host字段设置为\'%\'，这表示任何IP。可以通过以下命令来更新root用户的host值：\n```shell\nUPDATE mysql.user SET host = \'%\' WHERE user = \'root\';\n```\n或者，可以使用GRANT语句来赋予root用户从任何IP连接的权限：\n```shell\nGRANT ALL PRIVILEGES ON *.* TO \'root\'@\'%\' IDENTIFIED BY \'root\';\n```\n这里的*.*表示所有数据库和所有表，\'root\'@\'%\'指定了root用户和任何IP地址。\n\n### 刷新权限和更改认证方式\n\n更改完用户表和权限后，需要刷新权限，使更改生效：\n```shell\nFLUSH PRIVILEGES;\n```\n因为是MySQL 8及以上版本，可能还需要更改用户的认证方式，因为MySQL 8默认使用的加密方式与早期版本不同。可以使用以下命令来更改加密方式：\n```shell\nALTER USER \'root\'@\'%\' IDENTIFIED WITH mysql_native_password BY \'root\';\n```\n这将把root用户的加密方式更改为mysql_native_password，这是与MySQL 5兼容的加密方式。\n# 结语\n其实相对于从本机安装MySQL我更趋向于通过docker安装MySQL，这样就不用配置那么繁琐，只需要修改映射端口即可，下面我给出一份docker-compose文件，各求所需吧（拉取docker的镜像地址：https://one-w.us.kg）：\n```shell\nversion: \'3.8\'  # 指定 Docker Compose 文件格式版本。版本 3.8 是一个常用的、与 Docker 兼容的版本\n\nservices:  # 定义要启动的服务\n  mysql:  # 定义名为 \"mysql\" 的服务\n    image: mysql:8.0  # 使用 MySQL 8.0 官方 Docker 镜像\n    container_name: MySQL8.0  # 给这个 MySQL 容器指定名称为 \"MySQL8.0\"\n    environment:  # 设置环境变量，用于配置容器内部的 MySQL\n      TZ: Asia/Shanghai  # 设置容器内的时区为上海（Asia/Shanghai）\n      MYSQL_ROOT_PASSWORD: root  # 设置 MySQL 的 root 用户密码为 \"root\"\n      MYSQL_ROOT_HOST: \"%\"  # 允许 root 用户从任何 IP 地址（% 代表任意主机）进行连接\n    ports:\n      - \"3306:3306\"  # 映射容器的 3306 端口到主机的 3306 端口（MySQL 默认端口）\n    command:  # 覆盖容器启动时的默认命令，并传入自定义配置参数\n      --default-authentication-plugin=mysql_native_password  # 设置身份验证插件为 `mysql_native_password`，避免出现 `caching_sha2_password` 插件不兼容问题\n      --character-set-server=utf8mb4  # 设置 MySQL 服务器的字符集为 `utf8mb4`，支持完整的 Unicode 字符集\n      --collation-server=utf8mb4_general_ci  # 设置字符集校对规则为 `utf8mb4_general_ci`，适用于 Unicode 字符\n      --bind-address=0.0.0.0  # 将 MySQL 绑定到所有可用的网络接口上，允许外部主机访问（通常与容器网络相关）\n    networks:\n      - mysql_network  # 让该容器连接到名为 `mysql_network` 的自定义网络\n\nnetworks:\n  mysql_network:  # 定义一个名为 `mysql_network` 的自定义网络\n    driver: bridge  # 使用 Docker 默认的桥接网络驱动（`bridge`），使容器可以互相通信\n```\n——————————————————————————————————————————\n# MySQL常用命令\n### 连接 MySQL 数据库\n```shell\nmysql -u username -p\n```\n### 连接到特定的主机和端口：\n```shell\nmysql -h host -P port -u username -p\n```\n### 显示所有数据库\n```shell\nSHOW DATABASES;\n```\n### 选择数据库\n```shell\nUSE database_name;\n```\n### 显示数据库中的所有表\n```shell\nSHOW TABLES;\n```\n### 显示表的结构\n```shell\nDESCRIBE table_name;\n```\n### 创建数据库\n```shell\nCREATE DATABASE database_name;\n```\n### 删除数据库\n```shell\nDROP DATABASE database_name;\n```\n### 创建表\n```shell\nCREATE TABLE table_name (\n    id INT AUTO_INCREMENT PRIMARY KEY,\n    name VARCHAR(255),\n    age INT\n);\n```\n### 删除表\n```shell\nDROP TABLE table_name;\n```\n### 查看当前用户\n```shell\nSELECT USER();\n```\n### 显示所有用户\n```shell\nSELECT user, host FROM mysql.user;\n```\n### 创建用户\n```shell\nCREATE USER \'username\'@\'host\' IDENTIFIED BY \'password\';\n```\n### 删除用户\n```shell\nDROP USER \'username\'@\'host\';\n```\n### 赋予权限\n```shell\nGRANT ALL PRIVILEGES ON database_name.* TO \'username\'@\'host\';\n```\n### 赋予特定权限：\n```shell\nGRANT SELECT, INSERT, UPDATE ON database_name.* TO \'username\'@\'host\';\n```\n### 刷新权限\n```shell\nFLUSH PRIVILEGES;\n```\n### 查看当前权限\n```shell\nSHOW GRANTS FOR \'username\'@\'host\';\n```\n### 查看表中的数据\n```shell\nSELECT * FROM table_name;\n```\n### 插入数据\n```shell\nINSERT INTO table_name (column1, column2) VALUES (value1, value2);\n```\n### 更新数据\n```shell\nUPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;\n```\n### 删除数据\n```shell\nDELETE FROM table_name WHERE condition;\n```\n### 删除所有数据（但保留表结构）\n```shell\nTRUNCATE TABLE table_name;\n```\n### 查找数据（使用条件）\n```shell\nSELECT * FROM table_name WHERE column_name = value;\n```\n### 排序查询结果\n```shell\nSELECT * FROM table_name ORDER BY column_name ASC;  # 升序\nSELECT * FROM table_name ORDER BY column_name DESC; # 降序\n```\n### 限制查询结果数量\n```shell\nSELECT * FROM table_name LIMIT 10;  # 返回前 10 行\n```\n### 修改表（添加列）\n```shell\nALTER TABLE table_name ADD column_name datatype;\n```\n### 修改表（删除列）\n```shell\nALTER TABLE table_name DROP COLUMN column_name;\n```\n### 修改表（更改列数据类型）\n```shell\nALTER TABLE table_name MODIFY column_name new_datatype;\n```\n### 重命名表\n```shell\nRENAME TABLE old_table_name TO new_table_name;\n```\n### 创建索引\n```shell\nCREATE INDEX index_name ON table_name (column_name);\n```\n### 删除索引\n```shell\nDROP INDEX index_name ON table_name;\n```\n### 查看当前数据库的状态\n```shell\nSHOW STATUS;\n```\n### 查看 MySQL 版本\n```shell\nSELECT VERSION();\n```\n### 备份数据库\n```shell\nmysqldump -u username -p database_name > backup.sql\n```\n### 恢复数据库\n```shell\nmysql -u username -p database_name < backup.sql\n```\n### 查看正在运行的查询\n```shell\nSHOW PROCESSLIST;\n```\n### 杀死一个查询\n```shell\nKILL query_id;\n```\n### 设置字符集\n```shell\nSET NAMES \'utf8mb4\';\n```\n### 退出 MySQL\n```shell\nEXIT;\n```\n### 导入 CSV 文件到 MySQL 表\n```shell\nLOAD DATA INFILE \'/path/to/your/file.csv\' INTO TABLE table_name\nFIELDS TERMINATED BY \',\'  # CSV 字段分隔符\nENCLOSED BY \'\"\'           # 如果字段值包含逗号或其他符号，可以加引号\nLINES TERMINATED BY \'\\n\'; # 行分隔符\n```\n### 查询当前日期和时间\n```shell\nSELECT CURDATE();  # 当前日期\nSELECT CURTIME();  # 当前时间\nSELECT NOW();      # 当前日期和时间\n```', NULL, 25, 0, 'public', NULL, NULL, 0, 1, '2025-01-09 14:37:57', '2025-01-09 16:10:04', 'onew', 0);
INSERT INTO `article` VALUES (40, 1, 3, 20, '/static/articleCover/onew11740052926151872.webp', '用代码书写未来：一名技术新人的求职宣言', '# 我是谁？\n我是**小刘同学**（onewa），哈尔滨石油学院计算机科学与技术专业专升本毕业生。从专科到本科的跨越，让我深刻体会到——  \n> \"学历只是起点，代码才是与世界对话的语言。\"\n\n\n# 我的技术足迹\n## 技术栈\n- **后端开发**：Java | PHP | Python | MySQL\n- **前端基础**：HTML/CSS/JavaScript | Vue.js | Element—UI\n- **工程素养**：Git协作 | Docker部署 | API设计\n\n# 我为什么求职？\n## 对技术的热爱\n从第一次用print(\"Hello World\")让屏幕跳出一行文字开始，我就沉迷于用代码解决问题的快感。在准备面试的深夜，当Redis缓存终于成功降低数据库查询压力时，那种成就感让我确信——\"这值得成为我的职业。\"\n\n## 对成长的渴望\n我期待加入这样的团队：\n\n允许犯错但重视复盘的文化\n\n有技术分享和Code Review机制\n\n愿意给新人机会参与核心模块开发\n\n# 我能带来什么？\n## 快速学习能力\n在毕业设计中，利用Docker容器化技术快速搭建和部署开发环境，显著提升开发效率。\n\n通过Docker Compose管理多容器应用，实现服务的快速编排和扩展。\n\n## 团队协作意识\n在毕业设计项目中，使用Docker统一团队开发环境，确保开发、测试和生产环境的一致性，减少“在我机器上能运行”的问题。\n\n通过编写清晰的Dockerfile和文档，帮助团队成员快速理解和部署项目，提升团队协作效率。\n\n## 邀约合作\n如果你正在寻找这样的伙伴：\n\n对技术有原始好奇心\n\n愿意从基础做起但心怀远方\n\n相信\"代码改变世界\"的浪漫主义\n\n欢迎通过以下方式找到我：\n\n📧 邮箱：liuhao4799@qq.com\n\n💻 Blog：/\n\n\n> \"我不是最优秀的候选人，但我会是最珍惜机会的那个。\"\n			—— 正在键盘前敲下这段文字的我\n', NULL, 5, 0, 'public', NULL, NULL, 0, 1, '2025-02-20 20:02:18', '2025-02-20 20:05:54', 'onew', 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `source` int(0) NOT NULL COMMENT '评论来源标识',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论来源类型',
  `parent_comment_id` int(0) NOT NULL DEFAULT 0 COMMENT '父评论ID',
  `user_id` int(0) NOT NULL COMMENT '发表用户ID',
  `floor_comment_id` int(0) NULL DEFAULT NULL COMMENT '楼层评论ID',
  `parent_user_id` int(0) NULL DEFAULT NULL COMMENT '父发表用户名ID',
  `like_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `comment_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论额外信息',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source`(`source`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 'love', 0, 1, NULL, NULL, 0, '你看对面的青山多漂亮！', NULL, '2024-09-08 20:17:12');
INSERT INTO `comment` VALUES (2, 34, 'article', 0, 1, NULL, NULL, 0, '这是在2021年10月9日写的小作文，虽然已经过去1153天了，但是我还是想将它发布出来，也算是一次难得的经历吧，只是自那以后我便很少向除亲人以外的人表达爱意了', NULL, '2024-12-05 00:15:58');

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `bg_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '背景封面',
  `man_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '男生头像',
  `woman_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '女生头像',
  `man_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '男生昵称',
  `woman_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '女生昵称',
  `timing` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计时',
  `countdown_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '倒计时标题',
  `countdown_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '倒计时时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
  `family_info` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '额外信息',
  `like_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最终修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家庭信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES (5, 1, '/static/love/bgCover/11725790513474136.jpg', '/static/love/manCover/11725790521635981.jpg', '/static/love/womanCover/11725797554478913.jpg', 'Onew', '一个达不刘', '2001-10-18 00:00:00', '距离春节还有', '2026-02-17 00:00:00', 1, '还没有对象哈哈哈哈哈哈', 0, '2024-09-08 20:15:53', '2025-02-19 20:18:33');

-- ----------------------------
-- Table structure for history_info
-- ----------------------------
DROP TABLE IF EXISTS `history_info`;
CREATE TABLE `history_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip',
  `nation` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1968 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '历史信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_info
-- ----------------------------
INSERT INTO `history_info` VALUES (1, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-03 21:45:14');
INSERT INTO `history_info` VALUES (2, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-03 21:45:57');
INSERT INTO `history_info` VALUES (3, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-04 00:00:21');
INSERT INTO `history_info` VALUES (4, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-04 00:00:46');
INSERT INTO `history_info` VALUES (5, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-04 11:05:27');
INSERT INTO `history_info` VALUES (6, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-04 11:06:05');
INSERT INTO `history_info` VALUES (7, NULL, '111.43.194.37', '中国', '黑龙江省', '哈尔滨市', '2024-09-04 20:26:19');
INSERT INTO `history_info` VALUES (8, 2, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-04 21:41:52');
INSERT INTO `history_info` VALUES (9, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-05 10:00:38');
INSERT INTO `history_info` VALUES (10, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-05 10:01:04');
INSERT INTO `history_info` VALUES (11, NULL, '240e:430:608a:214:99b7:cbe0:3d08:12c0', NULL, NULL, NULL, '2024-09-05 11:53:56');
INSERT INTO `history_info` VALUES (12, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-05 13:38:48');
INSERT INTO `history_info` VALUES (13, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-06 20:16:18');
INSERT INTO `history_info` VALUES (14, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-08 15:08:10');
INSERT INTO `history_info` VALUES (15, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-08 16:42:10');
INSERT INTO `history_info` VALUES (16, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-08 16:44:49');
INSERT INTO `history_info` VALUES (17, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-09 13:19:36');
INSERT INTO `history_info` VALUES (18, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-09 13:20:56');
INSERT INTO `history_info` VALUES (19, NULL, '240e:330:61e8:ea93:f80f:6ff6:3ce6:e192', NULL, NULL, NULL, '2024-09-10 15:52:26');
INSERT INTO `history_info` VALUES (20, 1, '240e:330:61e8:ea93:f80f:6ff6:3ce6:e192', NULL, NULL, NULL, '2024-09-10 15:53:29');
INSERT INTO `history_info` VALUES (21, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-11 08:07:38');
INSERT INTO `history_info` VALUES (22, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-11 08:08:27');
INSERT INTO `history_info` VALUES (23, 2, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-11 08:28:56');
INSERT INTO `history_info` VALUES (24, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-11 08:30:54');
INSERT INTO `history_info` VALUES (25, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-11 08:31:30');
INSERT INTO `history_info` VALUES (26, NULL, '240e:330:61e8:ea93:d915:eef7:cd61:9c9a', NULL, NULL, NULL, '2024-09-11 21:11:43');
INSERT INTO `history_info` VALUES (27, NULL, '240e:430:6039:246d:1c8b:ae41:ca2b:75b3', NULL, NULL, NULL, '2024-09-11 22:02:51');
INSERT INTO `history_info` VALUES (28, NULL, '156.146.38.170', '美国', '德克萨斯', '达拉斯', '2024-09-11 22:03:09');
INSERT INTO `history_info` VALUES (29, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-12 13:00:00');
INSERT INTO `history_info` VALUES (30, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-12 13:00:23');
INSERT INTO `history_info` VALUES (31, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-12 15:16:14');
INSERT INTO `history_info` VALUES (32, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-13 15:41:26');
INSERT INTO `history_info` VALUES (33, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-13 15:42:05');
INSERT INTO `history_info` VALUES (34, NULL, '240e:330:6127:9329:f9c7:61bf:61dd:cd11', NULL, NULL, NULL, '2024-09-14 13:17:55');
INSERT INTO `history_info` VALUES (35, 1, '240e:330:6127:9329:f9c7:61bf:61dd:cd11', NULL, NULL, NULL, '2024-09-14 13:27:39');
INSERT INTO `history_info` VALUES (36, NULL, '240e:330:6127:9329:cd78:ef26:c03d:5e7', NULL, NULL, NULL, '2024-09-14 13:33:13');
INSERT INTO `history_info` VALUES (37, NULL, '106.92.120.248', '中国', '重庆', '重庆市', '2024-09-14 13:33:14');
INSERT INTO `history_info` VALUES (38, NULL, '192.168.32.1', NULL, NULL, '内网IP', '2024-09-14 13:33:49');
INSERT INTO `history_info` VALUES (39, 1, '192.168.32.1', NULL, NULL, '内网IP', '2024-09-14 13:34:22');
INSERT INTO `history_info` VALUES (40, NULL, '240e:330:6127:9329:2500:9c9d:6249:e9a6', NULL, NULL, NULL, '2024-09-14 14:17:06');
INSERT INTO `history_info` VALUES (41, 1, '240e:330:6127:9329:2500:9c9d:6249:e9a6', NULL, NULL, NULL, '2024-09-14 14:17:13');
INSERT INTO `history_info` VALUES (42, NULL, '106.88.250.49', '中国', '重庆', '重庆市', '2024-09-14 14:33:07');
INSERT INTO `history_info` VALUES (43, NULL, '42.184.5.158', '中国', '黑龙江省', '哈尔滨市', '2024-09-14 14:38:44');
INSERT INTO `history_info` VALUES (44, NULL, '240e:430:60a1:a438:471:27fd:9248:dad7', NULL, NULL, NULL, '2024-09-14 14:41:25');
INSERT INTO `history_info` VALUES (45, NULL, '108.181.24.39', '加拿大', '艾伯塔', '埃德蒙顿', '2024-09-14 19:43:54');
INSERT INTO `history_info` VALUES (46, NULL, '156.146.62.164', '瑞士', 'Zurich', NULL, '2024-09-14 19:44:13');
INSERT INTO `history_info` VALUES (47, NULL, '94.131.118.246', '美国', '新泽西', NULL, '2024-09-14 19:44:52');
INSERT INTO `history_info` VALUES (48, NULL, '240e:330:6127:9329:8ce4:cc1d:b8b2:4eb9', NULL, NULL, NULL, '2024-09-14 19:45:09');
INSERT INTO `history_info` VALUES (49, NULL, '120.227.194.166', '中国', '湖南省', '湘潭市', '2024-09-14 20:01:44');
INSERT INTO `history_info` VALUES (50, NULL, '221.11.78.206', '中国', '陕西省', '咸阳市', '2024-09-14 20:01:51');
INSERT INTO `history_info` VALUES (51, NULL, '194.147.16.117', '西班牙', NULL, NULL, '2024-09-14 22:01:14');
INSERT INTO `history_info` VALUES (52, NULL, '240e:381:1112:6a00:2d69:e596:7e39:ebe5', NULL, NULL, NULL, '2024-09-15 01:25:11');
INSERT INTO `history_info` VALUES (53, NULL, '58.19.1.245', '中国', '湖北省', '武汉市', '2024-09-15 02:28:48');
INSERT INTO `history_info` VALUES (54, NULL, '240e:330:6127:9329:3977:98a1:b18e:9483', NULL, NULL, NULL, '2024-09-15 06:03:59');
INSERT INTO `history_info` VALUES (55, NULL, '240e:430:60a1:a438:471:27fd:9248:dad7', NULL, NULL, NULL, '2024-09-15 06:41:29');
INSERT INTO `history_info` VALUES (56, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-15 07:14:19');
INSERT INTO `history_info` VALUES (57, NULL, '240e:472:fdc0:db78:1d68:9917:c162:7572', NULL, NULL, NULL, '2024-09-15 07:43:00');
INSERT INTO `history_info` VALUES (58, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-15 11:14:25');
INSERT INTO `history_info` VALUES (59, NULL, '38.132.118.76', '美国', '新泽西', NULL, '2024-09-15 11:40:57');
INSERT INTO `history_info` VALUES (60, NULL, '113.246.151.79', '中国', '湖南省', '长沙市', '2024-09-15 12:20:39');
INSERT INTO `history_info` VALUES (61, NULL, '240e:381:1112:6a00:5c55:69c6:c6ca:ef6d', NULL, NULL, NULL, '2024-09-15 12:29:10');
INSERT INTO `history_info` VALUES (62, NULL, '2409:8a6c:170:df40:d80e:f20a:15fa:275a', NULL, NULL, NULL, '2024-09-15 12:35:48');
INSERT INTO `history_info` VALUES (63, NULL, '14.152.91.243', '中国', '广东省', '东莞市', '2024-09-15 17:18:37');
INSERT INTO `history_info` VALUES (64, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-16 13:14:43');
INSERT INTO `history_info` VALUES (65, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-16 13:22:30');
INSERT INTO `history_info` VALUES (66, 2, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-16 13:25:27');
INSERT INTO `history_info` VALUES (67, NULL, '106.84.190.228', '中国', '重庆', '重庆市', '2024-09-16 13:32:30');
INSERT INTO `history_info` VALUES (68, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-17 07:28:38');
INSERT INTO `history_info` VALUES (69, NULL, '192.168.32.1', NULL, NULL, '内网IP', '2024-09-18 09:19:17');
INSERT INTO `history_info` VALUES (70, NULL, '240e:430:6098:d713:e0ce:98e6:1355:4ecb', NULL, NULL, NULL, '2024-09-18 09:43:33');
INSERT INTO `history_info` VALUES (71, NULL, '240e:430:6098:d713:7028:d660:899f:48e4', NULL, NULL, NULL, '2024-09-18 10:14:54');
INSERT INTO `history_info` VALUES (72, 1, '240e:430:6098:d713:7028:d660:899f:48e4', NULL, NULL, NULL, '2024-09-18 10:16:08');
INSERT INTO `history_info` VALUES (73, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-18 11:07:09');
INSERT INTO `history_info` VALUES (74, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-18 11:08:01');
INSERT INTO `history_info` VALUES (75, NULL, '106.83.37.12', '中国', '重庆', '重庆市', '2024-09-18 14:48:23');
INSERT INTO `history_info` VALUES (76, NULL, '173.255.249.184', '美国', '加利福尼亚', '费利蒙', '2024-09-18 14:53:42');
INSERT INTO `history_info` VALUES (77, NULL, '208.87.243.123', '美国', '加利福尼亚', NULL, '2024-09-18 16:16:40');
INSERT INTO `history_info` VALUES (78, NULL, '107.173.151.178', '美国', '纽约', '纽约', '2024-09-18 16:17:16');
INSERT INTO `history_info` VALUES (79, 1, '208.87.243.123', '美国', '加利福尼亚', NULL, '2024-09-18 16:18:39');
INSERT INTO `history_info` VALUES (80, 1, '240e:430:6040:1227:6566:ed7:b57a:af97', NULL, NULL, NULL, '2024-09-18 16:23:58');
INSERT INTO `history_info` VALUES (81, NULL, '34.248.137.227', '爱尔兰', 'Dublin', NULL, '2024-09-18 16:31:25');
INSERT INTO `history_info` VALUES (82, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-09-18 19:13:24');
INSERT INTO `history_info` VALUES (83, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-09-18 19:13:25');
INSERT INTO `history_info` VALUES (84, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-09-18 19:13:25');
INSERT INTO `history_info` VALUES (85, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-18 19:18:33');
INSERT INTO `history_info` VALUES (86, NULL, '240e:430:6040:1227:8188:1649:2a1c:821', NULL, NULL, NULL, '2024-09-18 19:22:09');
INSERT INTO `history_info` VALUES (87, 1, '106.84.230.189', '中国', '重庆', '重庆市', '2024-09-18 20:23:01');
INSERT INTO `history_info` VALUES (88, NULL, '106.84.230.189', '中国', '重庆', '重庆市', '2024-09-18 20:23:18');
INSERT INTO `history_info` VALUES (89, NULL, '104.166.80.102', '美国', '加利福尼亚', NULL, '2024-09-19 00:42:15');
INSERT INTO `history_info` VALUES (90, NULL, '240e:330:6171:a252:8df4:32f3:d3d5:c2e8', NULL, NULL, NULL, '2024-09-19 00:49:42');
INSERT INTO `history_info` VALUES (91, NULL, '106.92.121.26', '中国', '重庆', '重庆市', '2024-09-19 00:57:28');
INSERT INTO `history_info` VALUES (92, NULL, '240e:330:6171:a252:cd78:ef26:c03d:5e7', NULL, NULL, NULL, '2024-09-19 00:57:32');
INSERT INTO `history_info` VALUES (93, NULL, '162.245.206.248', '美国', '加利福尼亚', NULL, '2024-09-19 02:04:58');
INSERT INTO `history_info` VALUES (94, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-19 07:50:26');
INSERT INTO `history_info` VALUES (95, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-19 07:51:11');
INSERT INTO `history_info` VALUES (96, 2, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-19 14:50:17');
INSERT INTO `history_info` VALUES (97, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-19 20:40:45');
INSERT INTO `history_info` VALUES (98, NULL, '240e:330:6179:8d01:4d16:1520:1ba:5339', NULL, NULL, NULL, '2024-09-19 21:12:05');
INSERT INTO `history_info` VALUES (99, NULL, '240e:330:6179:8d01:1611:fed5:d0a3:4844', NULL, NULL, NULL, '2024-09-19 21:29:04');
INSERT INTO `history_info` VALUES (100, NULL, '240e:430:6090:6dd5:a54a:70d8:bf7b:fd41', NULL, NULL, NULL, '2024-09-19 21:29:57');
INSERT INTO `history_info` VALUES (101, NULL, '106.92.122.113', '中国', '重庆', '重庆市', '2024-09-19 21:31:30');
INSERT INTO `history_info` VALUES (102, NULL, '240e:330:6179:8d01:635f:ccbc:f886:87b9', NULL, NULL, NULL, '2024-09-19 21:31:44');
INSERT INTO `history_info` VALUES (103, NULL, '240e:330:6179:8d01:88e0:341:1ed4:eb11', NULL, NULL, NULL, '2024-09-19 22:21:14');
INSERT INTO `history_info` VALUES (104, NULL, '240e:430:6011:3d0b:f471:a196:dcc0:e57', NULL, NULL, NULL, '2024-09-19 22:22:27');
INSERT INTO `history_info` VALUES (105, NULL, '240e:430:6081:225:e5ec:62ca:1905:6810', NULL, NULL, NULL, '2024-09-19 23:23:07');
INSERT INTO `history_info` VALUES (106, NULL, '123.58.220.107', '中国', '香港', NULL, '2024-09-20 02:26:42');
INSERT INTO `history_info` VALUES (107, NULL, '240e:430:60a8:6fa8:99fd:bda2:23ca:ff7', NULL, NULL, NULL, '2024-09-20 02:33:38');
INSERT INTO `history_info` VALUES (108, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-20 09:41:13');
INSERT INTO `history_info` VALUES (109, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-20 09:44:08');
INSERT INTO `history_info` VALUES (110, NULL, '2600:3c07::f03c:95ff:fe8d:2f0f', NULL, NULL, NULL, '2024-09-20 14:34:47');
INSERT INTO `history_info` VALUES (111, NULL, '2600:3c07::f03c:95ff:fe4c:857c', NULL, NULL, NULL, '2024-09-20 14:37:52');
INSERT INTO `history_info` VALUES (112, 1, '2600:3c07::f03c:95ff:fe4c:857c', NULL, NULL, NULL, '2024-09-20 14:38:26');
INSERT INTO `history_info` VALUES (113, NULL, '106.83.18.240', '中国', '重庆', '重庆市', '2024-09-20 14:42:34');
INSERT INTO `history_info` VALUES (114, NULL, '106.84.163.17', '中国', '重庆', '重庆市', '2024-09-20 14:43:35');
INSERT INTO `history_info` VALUES (115, NULL, '240e:330:617a:8c01:f8b6:5275:c753:f3c2', NULL, NULL, NULL, '2024-09-20 22:55:56');
INSERT INTO `history_info` VALUES (116, NULL, '240e:430:60a1:a689:d44b:4ac9:3c11:5277', NULL, NULL, NULL, '2024-09-21 07:47:56');
INSERT INTO `history_info` VALUES (117, NULL, '106.89.37.70', '中国', '重庆', '重庆市', '2024-09-21 07:49:12');
INSERT INTO `history_info` VALUES (118, NULL, '106.92.123.198', '中国', '重庆', '重庆市', '2024-09-22 15:43:22');
INSERT INTO `history_info` VALUES (119, NULL, '2409:8961:614e:cd7a:b83b:4299:b365:fb3b', NULL, NULL, NULL, '2024-09-22 20:18:07');
INSERT INTO `history_info` VALUES (120, NULL, '106.83.20.248', '中国', '重庆', '重庆市', '2024-09-24 16:47:22');
INSERT INTO `history_info` VALUES (121, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-25 09:37:56');
INSERT INTO `history_info` VALUES (122, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-25 09:38:20');
INSERT INTO `history_info` VALUES (123, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-25 10:11:58');
INSERT INTO `history_info` VALUES (124, NULL, '106.83.169.7', '中国', '重庆', '重庆市', '2024-09-25 10:14:48');
INSERT INTO `history_info` VALUES (125, NULL, '106.83.158.142', '中国', '重庆', '重庆市', '2024-09-25 10:15:08');
INSERT INTO `history_info` VALUES (126, NULL, '104.253.214.107', '美国', '加利福尼亚', '圣何塞', '2024-09-25 14:51:59');
INSERT INTO `history_info` VALUES (127, 1, '240e:430:6001:25a:48db:bc86:e267:699f', NULL, NULL, NULL, '2024-09-25 15:02:53');
INSERT INTO `history_info` VALUES (128, NULL, '240e:430:6001:25a:48db:bc86:e267:699f', NULL, NULL, NULL, '2024-09-25 15:11:33');
INSERT INTO `history_info` VALUES (129, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-25 16:51:48');
INSERT INTO `history_info` VALUES (130, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-26 07:41:23');
INSERT INTO `history_info` VALUES (131, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-27 08:41:03');
INSERT INTO `history_info` VALUES (132, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-27 08:41:42');
INSERT INTO `history_info` VALUES (133, NULL, '240e:330:61c2:de30:11c5:1d4b:b2ae:f21a', NULL, NULL, NULL, '2024-09-27 08:43:46');
INSERT INTO `history_info` VALUES (134, NULL, '240e:330:61c3:1604:cc11:8fc0:8f9c:483a', NULL, NULL, NULL, '2024-09-27 09:12:40');
INSERT INTO `history_info` VALUES (135, NULL, '240e:430:6098:d6c4:7d03:71c4:d1ba:f694', NULL, NULL, NULL, '2024-09-28 07:45:47');
INSERT INTO `history_info` VALUES (136, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-28 07:47:25');
INSERT INTO `history_info` VALUES (137, NULL, '240e:430:60b0:759:3465:693a:d3a1:4d2e', NULL, NULL, NULL, '2024-09-28 07:48:20');
INSERT INTO `history_info` VALUES (138, NULL, '205.169.39.64', '美国', NULL, NULL, '2024-09-28 08:17:02');
INSERT INTO `history_info` VALUES (139, NULL, '205.169.39.22', '美国', NULL, NULL, '2024-09-28 08:18:31');
INSERT INTO `history_info` VALUES (140, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-28 08:41:07');
INSERT INTO `history_info` VALUES (141, NULL, '240e:430:6030:7cb:5d72:f65e:319c:ca6b', NULL, NULL, NULL, '2024-09-28 09:28:16');
INSERT INTO `history_info` VALUES (142, NULL, '152.32.172.189', '中国', '香港', NULL, '2024-09-28 09:38:49');
INSERT INTO `history_info` VALUES (143, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-09-28 09:44:38');
INSERT INTO `history_info` VALUES (144, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-09-28 09:44:38');
INSERT INTO `history_info` VALUES (145, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-09-28 09:44:38');
INSERT INTO `history_info` VALUES (146, NULL, '205.169.39.158', '美国', NULL, NULL, '2024-09-28 09:45:08');
INSERT INTO `history_info` VALUES (147, NULL, '205.169.39.47', '美国', NULL, NULL, '2024-09-28 09:46:13');
INSERT INTO `history_info` VALUES (148, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-28 09:53:31');
INSERT INTO `history_info` VALUES (149, NULL, '183.229.56.249', '中国', '重庆', '重庆市', '2024-09-28 11:35:53');
INSERT INTO `history_info` VALUES (150, NULL, '106.83.144.64', '中国', '重庆', '重庆市', '2024-09-28 15:38:48');
INSERT INTO `history_info` VALUES (151, NULL, '54.91.101.10', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:42:57');
INSERT INTO `history_info` VALUES (152, NULL, '18.206.158.113', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:43:14');
INSERT INTO `history_info` VALUES (153, NULL, '18.233.63.56', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:45:59');
INSERT INTO `history_info` VALUES (154, NULL, '44.192.68.140', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:46:14');
INSERT INTO `history_info` VALUES (155, NULL, '44.192.127.88', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:48:59');
INSERT INTO `history_info` VALUES (156, NULL, '18.215.145.102', '美国', '弗吉尼亚', '阿什本', '2024-09-28 15:49:15');
INSERT INTO `history_info` VALUES (157, NULL, '240e:430:60a8:d5d1:b405:9407:82f5:cb27', NULL, NULL, NULL, '2024-09-28 15:55:14');
INSERT INTO `history_info` VALUES (158, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-29 16:52:42');
INSERT INTO `history_info` VALUES (159, NULL, '47.242.206.145', '中国', '香港', NULL, '2024-09-29 17:30:31');
INSERT INTO `history_info` VALUES (160, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-09-30 10:12:07');
INSERT INTO `history_info` VALUES (161, NULL, '108.181.5.131', '加拿大', '艾伯塔', '埃德蒙顿', '2024-09-30 18:01:51');
INSERT INTO `history_info` VALUES (162, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-30 21:44:06');
INSERT INTO `history_info` VALUES (163, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-09-30 21:45:38');
INSERT INTO `history_info` VALUES (164, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-10-01 15:19:32');
INSERT INTO `history_info` VALUES (165, 1, '172.21.0.1', NULL, NULL, '内网IP', '2024-10-01 15:29:38');
INSERT INTO `history_info` VALUES (166, NULL, '152.32.191.153', '中国', '香港', NULL, '2024-10-02 01:13:23');
INSERT INTO `history_info` VALUES (167, NULL, '240e:330:61c3:1604:ab1e:cc61:af4e:9db7', NULL, NULL, NULL, '2024-10-02 22:51:59');
INSERT INTO `history_info` VALUES (168, NULL, '240e:430:6021:a4d6:c951:d162:9330:47a4', NULL, NULL, NULL, '2024-10-02 22:52:18');
INSERT INTO `history_info` VALUES (169, NULL, '106.89.9.171', '中国', '重庆', '重庆市', '2024-10-03 08:43:22');
INSERT INTO `history_info` VALUES (170, NULL, '23.91.97.176', '中国', '香港', NULL, '2024-10-03 17:51:06');
INSERT INTO `history_info` VALUES (171, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-10-03 20:54:34');
INSERT INTO `history_info` VALUES (172, NULL, '240e:330:61c3:1604:fba5:8967:2558:af52', NULL, NULL, NULL, '2024-10-03 23:12:31');
INSERT INTO `history_info` VALUES (173, NULL, '152.32.211.119', '中国', '香港', NULL, '2024-10-05 17:28:37');
INSERT INTO `history_info` VALUES (174, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-05 18:16:51');
INSERT INTO `history_info` VALUES (175, NULL, '104.166.80.213', '美国', '加利福尼亚', NULL, '2024-10-05 23:45:11');
INSERT INTO `history_info` VALUES (176, NULL, '162.245.206.246', '美国', '加利福尼亚', NULL, '2024-10-06 02:46:39');
INSERT INTO `history_info` VALUES (177, NULL, '152.32.171.68', '中国', '香港', NULL, '2024-10-06 17:49:40');
INSERT INTO `history_info` VALUES (178, NULL, '172.21.0.1', NULL, NULL, '内网IP', '2024-10-06 18:52:54');
INSERT INTO `history_info` VALUES (179, NULL, '240e:330:6179:3000:98c7:a5f1:a9c6:91a1', NULL, NULL, NULL, '2024-10-17 22:58:40');
INSERT INTO `history_info` VALUES (180, 1, '240e:330:6179:3000:98c7:a5f1:a9c6:91a1', NULL, NULL, NULL, '2024-10-17 22:59:49');
INSERT INTO `history_info` VALUES (181, NULL, '205.169.39.5', '美国', NULL, NULL, '2024-10-18 00:30:20');
INSERT INTO `history_info` VALUES (182, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2024-10-18 01:06:53');
INSERT INTO `history_info` VALUES (183, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2024-10-18 01:06:53');
INSERT INTO `history_info` VALUES (184, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2024-10-18 01:06:53');
INSERT INTO `history_info` VALUES (185, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2024-10-18 01:06:56');
INSERT INTO `history_info` VALUES (186, NULL, '85.254.84.158', '拉脱维亚', 'Riga', NULL, '2024-10-18 04:44:11');
INSERT INTO `history_info` VALUES (187, NULL, '205.169.39.46', '美国', NULL, NULL, '2024-10-18 05:20:18');
INSERT INTO `history_info` VALUES (188, NULL, '220.196.160.65', '中国', '上海', '上海市', '2024-10-18 06:55:53');
INSERT INTO `history_info` VALUES (189, NULL, '240e:330:6179:3000:9dda:be7b:2887:a651', NULL, NULL, NULL, '2024-10-18 07:03:12');
INSERT INTO `history_info` VALUES (190, NULL, '240e:330:6179:3000:18ad:fa36:6c42:5425', NULL, NULL, NULL, '2024-10-18 09:55:42');
INSERT INTO `history_info` VALUES (191, NULL, '220.196.160.84', '中国', '上海', '上海市', '2024-10-18 11:36:46');
INSERT INTO `history_info` VALUES (192, NULL, '220.196.160.96', '中国', '上海', '上海市', '2024-10-18 11:36:46');
INSERT INTO `history_info` VALUES (193, NULL, '220.196.160.101', '中国', '上海', '上海市', '2024-10-18 11:36:46');
INSERT INTO `history_info` VALUES (194, NULL, '220.196.160.73', '中国', '上海', '上海市', '2024-10-18 11:37:03');
INSERT INTO `history_info` VALUES (195, NULL, '220.196.160.144', '中国', '上海', '上海市', '2024-10-18 22:20:10');
INSERT INTO `history_info` VALUES (196, NULL, '220.196.160.76', '中国', '上海', '上海市', '2024-10-18 22:20:10');
INSERT INTO `history_info` VALUES (197, NULL, '220.196.160.45', '中国', '上海', '上海市', '2024-10-18 22:20:13');
INSERT INTO `history_info` VALUES (198, NULL, '95.108.213.252', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 07:12:02');
INSERT INTO `history_info` VALUES (199, NULL, '5.255.231.36', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 07:12:05');
INSERT INTO `history_info` VALUES (200, NULL, '87.250.224.24', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 07:12:05');
INSERT INTO `history_info` VALUES (201, NULL, '213.180.203.189', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 07:12:07');
INSERT INTO `history_info` VALUES (202, NULL, '213.180.203.110', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 12:37:39');
INSERT INTO `history_info` VALUES (203, NULL, '213.180.203.71', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 12:37:41');
INSERT INTO `history_info` VALUES (204, NULL, '95.108.213.123', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 12:37:42');
INSERT INTO `history_info` VALUES (205, NULL, '213.180.203.177', '俄罗斯', '莫斯科', '莫斯科', '2024-10-19 12:37:42');
INSERT INTO `history_info` VALUES (206, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-10-19 19:29:08');
INSERT INTO `history_info` VALUES (207, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-10-19 19:29:08');
INSERT INTO `history_info` VALUES (208, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-10-19 19:29:11');
INSERT INTO `history_info` VALUES (209, NULL, '205.169.39.11', '美国', NULL, NULL, '2024-10-19 19:29:16');
INSERT INTO `history_info` VALUES (210, NULL, '205.169.39.207', '美国', NULL, NULL, '2024-10-19 19:29:30');
INSERT INTO `history_info` VALUES (211, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2024-10-19 22:37:13');
INSERT INTO `history_info` VALUES (212, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2024-10-19 22:37:13');
INSERT INTO `history_info` VALUES (213, NULL, '129.211.162.110', '中国', '江苏省', '南京市', '2024-10-19 22:37:14');
INSERT INTO `history_info` VALUES (214, NULL, '106.55.202.186', '中国', '广东省', '广州市', '2024-10-20 05:30:38');
INSERT INTO `history_info` VALUES (215, NULL, '240e:430:60c0:1e1b:7dff:bb22:b7ba:fada', NULL, NULL, NULL, '2024-10-21 14:02:11');
INSERT INTO `history_info` VALUES (216, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-10-21 20:01:13');
INSERT INTO `history_info` VALUES (217, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-10-21 20:01:14');
INSERT INTO `history_info` VALUES (218, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-10-21 20:01:14');
INSERT INTO `history_info` VALUES (219, NULL, '205.169.39.3', '美国', NULL, NULL, '2024-10-21 20:03:27');
INSERT INTO `history_info` VALUES (220, NULL, '205.169.39.95', '美国', NULL, NULL, '2024-10-21 20:03:27');
INSERT INTO `history_info` VALUES (221, NULL, '240e:430:60c0:1348:2c77:e418:b454:32b', NULL, NULL, NULL, '2024-10-22 09:42:03');
INSERT INTO `history_info` VALUES (222, 1, '240e:430:60c0:1348:2c77:e418:b454:32b', NULL, NULL, NULL, '2024-10-22 09:42:31');
INSERT INTO `history_info` VALUES (223, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-22 09:48:17');
INSERT INTO `history_info` VALUES (224, NULL, '240e:330:61ba:bb32:5d5b:69a8:5db7:f4e6', NULL, NULL, NULL, '2024-10-25 20:51:06');
INSERT INTO `history_info` VALUES (225, 1, '240e:330:61ba:bb32:5d5b:69a8:5db7:f4e6', NULL, NULL, NULL, '2024-10-25 20:51:39');
INSERT INTO `history_info` VALUES (226, NULL, '172.18.0.1', NULL, NULL, '内网IP', '2024-10-25 20:52:10');
INSERT INTO `history_info` VALUES (227, NULL, '205.169.39.43', '美国', NULL, NULL, '2024-10-25 21:01:57');
INSERT INTO `history_info` VALUES (228, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-26 14:51:19');
INSERT INTO `history_info` VALUES (229, NULL, '175.24.213.48', '中国', '上海', '上海市', '2024-10-27 05:10:27');
INSERT INTO `history_info` VALUES (230, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-27 10:00:03');
INSERT INTO `history_info` VALUES (231, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-27 10:05:05');
INSERT INTO `history_info` VALUES (232, 1, '240e:430:6040:34b4:9422:e2fd:e2ac:249b', NULL, NULL, NULL, '2024-10-27 10:25:00');
INSERT INTO `history_info` VALUES (233, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-10-27 12:19:45');
INSERT INTO `history_info` VALUES (234, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-10-27 12:19:47');
INSERT INTO `history_info` VALUES (235, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-10-27 12:19:49');
INSERT INTO `history_info` VALUES (236, NULL, '205.169.39.128', '美国', NULL, NULL, '2024-10-27 22:35:07');
INSERT INTO `history_info` VALUES (237, 1, '240e:430:6040:34b4:9422:e2fd:e2ac:249b', NULL, NULL, NULL, '2024-10-28 07:11:21');
INSERT INTO `history_info` VALUES (238, NULL, '205.169.39.6', '美国', NULL, NULL, '2024-10-28 15:06:44');
INSERT INTO `history_info` VALUES (239, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-28 15:12:09');
INSERT INTO `history_info` VALUES (240, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-10-28 15:12:21');
INSERT INTO `history_info` VALUES (241, NULL, '39.175.50.178', '中国', '浙江省', '舟山市', '2024-10-28 15:13:46');
INSERT INTO `history_info` VALUES (242, NULL, '205.169.39.11', '美国', NULL, NULL, '2024-10-28 15:13:54');
INSERT INTO `history_info` VALUES (243, NULL, '240e:430:6030:d4f3:ddcf:bccb:b15b:9f1c', NULL, NULL, NULL, '2024-10-28 19:42:16');
INSERT INTO `history_info` VALUES (244, NULL, '47.242.206.145', '中国', '香港', NULL, '2024-10-29 19:11:23');
INSERT INTO `history_info` VALUES (245, NULL, '240e:330:61ba:bb32:1081:fa0d:42dd:1709', NULL, NULL, NULL, '2024-10-29 19:51:05');
INSERT INTO `history_info` VALUES (246, 1, '240e:330:61ba:bb32:1081:fa0d:42dd:1709', NULL, NULL, NULL, '2024-10-29 19:52:04');
INSERT INTO `history_info` VALUES (247, NULL, '172.18.0.1', NULL, NULL, '内网IP', '2024-10-29 22:39:20');
INSERT INTO `history_info` VALUES (248, NULL, '106.83.6.43', '中国', '重庆', '重庆市', '2024-10-30 18:13:04');
INSERT INTO `history_info` VALUES (249, NULL, '240e:330:6100:e476:b09f:a50c:2f82:a840', NULL, NULL, NULL, '2024-10-30 22:03:45');
INSERT INTO `history_info` VALUES (250, 1, '240e:330:6100:e476:b09f:a50c:2f82:a840', NULL, NULL, NULL, '2024-10-30 22:03:45');
INSERT INTO `history_info` VALUES (251, NULL, '240e:330:6100:e476:2d78:912f:7868:e376', NULL, NULL, NULL, '2024-11-02 20:38:35');
INSERT INTO `history_info` VALUES (252, 1, '240e:330:6100:e476:2d78:912f:7868:e376', NULL, NULL, NULL, '2024-11-02 20:38:37');
INSERT INTO `history_info` VALUES (253, 1, '240e:330:6100:e476:5804:7e0:b501:e926', NULL, NULL, NULL, '2024-11-04 19:58:09');
INSERT INTO `history_info` VALUES (254, NULL, '240e:330:6100:e476:5804:7e0:b501:e926', NULL, NULL, NULL, '2024-11-04 19:58:09');
INSERT INTO `history_info` VALUES (255, NULL, '240e:330:6159:554:1ef:4e9d:3f24:e3ee', NULL, NULL, NULL, '2024-11-08 20:50:33');
INSERT INTO `history_info` VALUES (256, NULL, '240e:330:6159:554:a96:31f4:63fd:6ff3', NULL, NULL, NULL, '2024-11-09 06:21:36');
INSERT INTO `history_info` VALUES (257, NULL, '240e:330:6159:554:65a9:1fee:8e22:c65d', NULL, NULL, NULL, '2024-11-09 10:23:02');
INSERT INTO `history_info` VALUES (258, NULL, '240e:330:6159:554:b6f7:880b:291f:3a18', NULL, NULL, NULL, '2024-11-09 22:57:20');
INSERT INTO `history_info` VALUES (259, NULL, '240e:330:6159:554:8bf0:62de:dc5a:63bf', NULL, NULL, NULL, '2024-11-10 21:42:22');
INSERT INTO `history_info` VALUES (260, 1, '240e:330:6159:554:8bf0:62de:dc5a:63bf', NULL, NULL, NULL, '2024-11-10 21:43:06');
INSERT INTO `history_info` VALUES (261, NULL, '106.92.25.124', '中国', '重庆', '重庆市', '2024-11-11 08:46:22');
INSERT INTO `history_info` VALUES (262, 1, '106.92.25.124', '中国', '重庆', '重庆市', '2024-11-11 11:14:30');
INSERT INTO `history_info` VALUES (263, NULL, '240e:430:60a1:3cad:d5f4:41e3:2f40:21f7', NULL, NULL, NULL, '2024-11-12 10:12:20');
INSERT INTO `history_info` VALUES (264, NULL, '240e:330:619d:9811:9c2e:84ab:d694:838a', NULL, NULL, NULL, '2024-11-12 16:28:19');
INSERT INTO `history_info` VALUES (265, NULL, '47.242.206.145', '中国', '香港', NULL, '2024-11-12 23:47:08');
INSERT INTO `history_info` VALUES (266, NULL, '240e:430:60a9:a5fe:95f5:554d:efc9:3165', NULL, NULL, NULL, '2024-11-13 16:49:34');
INSERT INTO `history_info` VALUES (267, NULL, '240e:330:619d:9811:45d:eb53:ebf4:8d0', NULL, NULL, NULL, '2024-11-14 22:51:27');
INSERT INTO `history_info` VALUES (268, NULL, '240e:330:619d:9811:612d:b7b6:c6df:6dc0', NULL, NULL, NULL, '2024-11-15 22:02:52');
INSERT INTO `history_info` VALUES (269, NULL, '240e:330:619d:9811:612d:b7b6:c6df:6dc0', NULL, NULL, NULL, '2024-11-16 00:25:26');
INSERT INTO `history_info` VALUES (270, NULL, '240e:330:619d:9811:c000:baf0:325d:3c6d', NULL, NULL, NULL, '2024-11-16 00:35:55');
INSERT INTO `history_info` VALUES (271, NULL, '240e:330:619d:9811:d9d1:a60b:258e:860d', NULL, NULL, NULL, '2024-11-16 13:11:03');
INSERT INTO `history_info` VALUES (272, 1, '240e:330:619d:9811:d9d1:a60b:258e:860d', NULL, NULL, NULL, '2024-11-16 13:12:49');
INSERT INTO `history_info` VALUES (273, NULL, '172.18.0.1', NULL, NULL, '内网IP', '2024-11-16 15:21:19');
INSERT INTO `history_info` VALUES (274, NULL, '106.92.123.165', '中国', '重庆', '重庆市', '2024-11-16 16:30:52');
INSERT INTO `history_info` VALUES (275, 1, '106.92.123.165', '中国', '重庆', '重庆市', '2024-11-16 16:31:24');
INSERT INTO `history_info` VALUES (276, NULL, '144.24.179.249', '英国', '伦敦', '伦敦', '2024-11-16 22:19:41');
INSERT INTO `history_info` VALUES (277, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2024-11-16 23:37:49');
INSERT INTO `history_info` VALUES (278, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2024-11-16 23:37:49');
INSERT INTO `history_info` VALUES (279, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2024-11-16 23:37:49');
INSERT INTO `history_info` VALUES (280, NULL, '106.55.200.45', '中国', '广东省', '广州市', '2024-11-17 04:34:06');
INSERT INTO `history_info` VALUES (281, NULL, '106.92.123.165', '中国', '重庆', '重庆市', '2024-11-17 18:11:40');
INSERT INTO `history_info` VALUES (282, NULL, '66.228.62.140', '美国', '佐治亚', '亚特兰大', '2024-11-18 04:27:31');
INSERT INTO `history_info` VALUES (283, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-11-18 13:51:31');
INSERT INTO `history_info` VALUES (284, 1, '221.7.66.66', '中国', '重庆', '重庆市', '2024-11-18 13:52:56');
INSERT INTO `history_info` VALUES (285, NULL, '116.205.116.160', '中国', '广东省', '深圳市', '2024-11-18 14:55:56');
INSERT INTO `history_info` VALUES (286, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-11-19 23:19:18');
INSERT INTO `history_info` VALUES (287, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-11-19 23:19:18');
INSERT INTO `history_info` VALUES (288, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-11-19 23:19:18');
INSERT INTO `history_info` VALUES (289, NULL, '205.169.39.243', '美国', NULL, NULL, '2024-11-19 23:20:37');
INSERT INTO `history_info` VALUES (290, NULL, '220.196.160.146', '中国', '上海', '上海市', '2024-11-19 23:39:19');
INSERT INTO `history_info` VALUES (291, NULL, '220.196.160.83', '中国', '上海', '上海市', '2024-11-19 23:39:19');
INSERT INTO `history_info` VALUES (292, NULL, '220.196.160.117', '中国', '上海', '上海市', '2024-11-19 23:39:19');
INSERT INTO `history_info` VALUES (293, NULL, '220.196.160.53', '中国', '上海', '上海市', '2024-11-19 23:39:19');
INSERT INTO `history_info` VALUES (294, NULL, '49.234.25.245', '中国', '上海', '上海市', '2024-11-20 04:34:35');
INSERT INTO `history_info` VALUES (295, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2024-11-20 07:00:47');
INSERT INTO `history_info` VALUES (296, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2024-11-20 07:00:47');
INSERT INTO `history_info` VALUES (297, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2024-11-20 07:00:47');
INSERT INTO `history_info` VALUES (298, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2024-11-20 07:00:48');
INSERT INTO `history_info` VALUES (299, NULL, '106.92.121.126', '中国', '重庆', '重庆市', '2024-11-20 22:04:09');
INSERT INTO `history_info` VALUES (300, NULL, '123.249.78.91', '中国', '贵州省', '黔西南', '2024-11-21 08:10:40');
INSERT INTO `history_info` VALUES (301, NULL, '121.36.46.253', '中国', '北京', '北京市', '2024-11-21 08:10:44');
INSERT INTO `history_info` VALUES (302, NULL, '124.70.101.88', '中国', '北京', '北京市', '2024-11-21 08:10:49');
INSERT INTO `history_info` VALUES (303, NULL, '119.3.178.245', '中国', '北京', '北京市', '2024-11-21 08:10:54');
INSERT INTO `history_info` VALUES (304, NULL, '119.3.238.101', '中国', '北京', '北京市', '2024-11-21 08:11:18');
INSERT INTO `history_info` VALUES (305, NULL, '121.36.61.93', '中国', '北京', '北京市', '2024-11-21 08:11:23');
INSERT INTO `history_info` VALUES (306, NULL, '123.249.89.229', '中国', '贵州省', '黔西南', '2024-11-21 08:12:57');
INSERT INTO `history_info` VALUES (307, NULL, '114.116.253.75', '中国', '广东省', '深圳市', '2024-11-21 08:13:01');
INSERT INTO `history_info` VALUES (308, NULL, '123.249.80.245', '中国', '贵州省', '黔西南', '2024-11-21 08:13:06');
INSERT INTO `history_info` VALUES (309, NULL, '123.60.217.217', '中国', '香港', NULL, '2024-11-21 08:13:25');
INSERT INTO `history_info` VALUES (310, NULL, '106.92.121.126', '中国', '重庆', '重庆市', '2024-11-21 18:42:10');
INSERT INTO `history_info` VALUES (311, 1, '106.92.121.126', '中国', '重庆', '重庆市', '2024-11-21 18:42:10');
INSERT INTO `history_info` VALUES (312, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-11-22 09:37:14');
INSERT INTO `history_info` VALUES (313, NULL, '129.211.167.108', '中国', '江苏省', '南京市', '2024-11-22 23:52:13');
INSERT INTO `history_info` VALUES (314, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2024-11-22 23:52:13');
INSERT INTO `history_info` VALUES (315, NULL, '180.101.244.15', '中国', '江苏省', '南京市', '2024-11-22 23:52:13');
INSERT INTO `history_info` VALUES (316, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2024-11-22 23:52:14');
INSERT INTO `history_info` VALUES (317, NULL, '120.46.51.19', '中国', '北京', '北京市', '2024-11-23 13:30:34');
INSERT INTO `history_info` VALUES (318, NULL, '27.115.124.45', '中国', '上海', '上海市', '2024-11-23 14:04:00');
INSERT INTO `history_info` VALUES (319, NULL, '27.115.124.109', '中国', '上海', '上海市', '2024-11-23 14:04:00');
INSERT INTO `history_info` VALUES (320, NULL, '27.115.124.70', '中国', '上海', '上海市', '2024-11-23 14:04:00');
INSERT INTO `history_info` VALUES (321, NULL, '106.55.202.186', '中国', '广东省', '广州市', '2024-11-24 04:35:28');
INSERT INTO `history_info` VALUES (322, NULL, '147.45.42.188', '俄罗斯', '莫斯科', '莫斯科', '2024-11-24 12:01:29');
INSERT INTO `history_info` VALUES (323, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-11-25 16:30:39');
INSERT INTO `history_info` VALUES (324, NULL, '49.13.50.247', '德国', NULL, NULL, '2024-11-26 00:06:09');
INSERT INTO `history_info` VALUES (325, NULL, '118.24.41.32', '中国', '四川省', '成都市', '2024-11-26 15:20:19');
INSERT INTO `history_info` VALUES (326, NULL, '106.92.121.126', '中国', '重庆', '重庆市', '2024-11-26 21:06:48');
INSERT INTO `history_info` VALUES (327, 1, '106.92.121.126', '中国', '重庆', '重庆市', '2024-11-26 21:07:52');
INSERT INTO `history_info` VALUES (328, NULL, '106.55.200.233', '中国', '广东省', '广州市', '2024-11-27 04:34:33');
INSERT INTO `history_info` VALUES (329, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2024-11-27 06:21:49');
INSERT INTO `history_info` VALUES (330, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2024-11-27 06:21:49');
INSERT INTO `history_info` VALUES (331, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-11-27 06:21:49');
INSERT INTO `history_info` VALUES (332, NULL, '36.138.238.230', '中国', NULL, NULL, '2024-11-27 10:29:30');
INSERT INTO `history_info` VALUES (333, NULL, '221.7.66.66', '中国', '重庆', '重庆市', '2024-11-27 16:42:14');
INSERT INTO `history_info` VALUES (334, NULL, '45.156.128.109', '荷兰', NULL, NULL, '2024-11-28 01:27:06');
INSERT INTO `history_info` VALUES (335, NULL, '47.98.113.229', '中国', '浙江省', '杭州市', '2024-11-28 20:09:05');
INSERT INTO `history_info` VALUES (336, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2024-11-28 23:59:06');
INSERT INTO `history_info` VALUES (337, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2024-11-28 23:59:06');
INSERT INTO `history_info` VALUES (338, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2024-11-28 23:59:06');
INSERT INTO `history_info` VALUES (339, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2024-11-28 23:59:07');
INSERT INTO `history_info` VALUES (340, NULL, '106.92.127.61', '中国', '重庆', '重庆市', '2024-11-29 21:12:56');
INSERT INTO `history_info` VALUES (341, NULL, '1.92.149.201', '中国', '北京', '北京市', '2024-11-30 07:32:00');
INSERT INTO `history_info` VALUES (342, NULL, '1.94.203.12', '中国', '北京', '北京市', '2024-11-30 07:47:11');
INSERT INTO `history_info` VALUES (343, NULL, '103.61.122.62', '中国', '香港', NULL, '2024-11-30 19:24:02');
INSERT INTO `history_info` VALUES (344, NULL, '205.169.39.6', '美国', NULL, NULL, '2024-11-30 22:52:09');
INSERT INTO `history_info` VALUES (345, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-11-30 22:52:11');
INSERT INTO `history_info` VALUES (346, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-11-30 22:52:11');
INSERT INTO `history_info` VALUES (347, NULL, '205.169.39.126', '美国', NULL, NULL, '2024-11-30 22:52:45');
INSERT INTO `history_info` VALUES (348, NULL, '36.139.63.123', '中国', NULL, NULL, '2024-11-30 22:55:11');
INSERT INTO `history_info` VALUES (349, NULL, '106.55.202.193', '中国', '广东省', '广州市', '2024-12-01 04:33:10');
INSERT INTO `history_info` VALUES (350, NULL, '168.151.124.103', '美国', '德克萨斯', '达拉斯', '2024-12-01 10:23:37');
INSERT INTO `history_info` VALUES (351, NULL, '119.12.205.17', '澳大利亚', '昆士兰', '布里斯班', '2024-12-01 10:23:38');
INSERT INTO `history_info` VALUES (352, NULL, '168.151.99.199', '美国', '德克萨斯', '达拉斯', '2024-12-01 10:23:38');
INSERT INTO `history_info` VALUES (353, NULL, '86.106.177.130', '罗马尼亚', NULL, NULL, '2024-12-01 10:23:39');
INSERT INTO `history_info` VALUES (354, NULL, '220.196.160.146', '中国', '上海', '上海市', '2024-12-02 00:05:23');
INSERT INTO `history_info` VALUES (355, NULL, '220.196.160.65', '中国', '上海', '上海市', '2024-12-02 00:05:23');
INSERT INTO `history_info` VALUES (356, NULL, '220.196.160.125', '中国', '上海', '上海市', '2024-12-02 00:05:23');
INSERT INTO `history_info` VALUES (357, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2024-12-04 02:06:01');
INSERT INTO `history_info` VALUES (358, NULL, '129.211.162.158', '中国', '江苏省', '南京市', '2024-12-04 02:06:01');
INSERT INTO `history_info` VALUES (359, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-12-04 02:06:01');
INSERT INTO `history_info` VALUES (360, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2024-12-04 02:06:02');
INSERT INTO `history_info` VALUES (361, NULL, '106.55.200.246', '中国', '广东省', '广州市', '2024-12-04 08:12:36');
INSERT INTO `history_info` VALUES (362, NULL, '114.250.44.120', '中国', '北京', '北京市', '2024-12-04 08:28:44');
INSERT INTO `history_info` VALUES (363, NULL, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-04 20:38:09');
INSERT INTO `history_info` VALUES (364, 1, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-04 20:46:33');
INSERT INTO `history_info` VALUES (365, 1, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-05 00:00:32');
INSERT INTO `history_info` VALUES (366, NULL, '220.196.160.117', '中国', '上海', '上海市', '2024-12-05 00:06:15');
INSERT INTO `history_info` VALUES (367, NULL, '220.196.160.125', '中国', '上海', '上海市', '2024-12-05 00:06:15');
INSERT INTO `history_info` VALUES (368, NULL, '220.196.160.75', '中国', '上海', '上海市', '2024-12-05 00:06:15');
INSERT INTO `history_info` VALUES (369, NULL, '220.196.160.84', '中国', '上海', '上海市', '2024-12-05 00:06:18');
INSERT INTO `history_info` VALUES (370, NULL, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-05 00:17:21');
INSERT INTO `history_info` VALUES (371, 2, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-05 18:14:00');
INSERT INTO `history_info` VALUES (372, NULL, '80.242.208.68', '哈萨克斯坦', 'Almaty', NULL, '2024-12-05 19:06:54');
INSERT INTO `history_info` VALUES (373, 2, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-06 00:37:44');
INSERT INTO `history_info` VALUES (374, NULL, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-06 00:37:46');
INSERT INTO `history_info` VALUES (375, 1, '106.92.123.64', '中国', '重庆', '重庆市', '2024-12-06 00:39:01');
INSERT INTO `history_info` VALUES (376, NULL, '154.39.152.181', '美国', NULL, NULL, '2024-12-06 15:14:28');
INSERT INTO `history_info` VALUES (377, NULL, '106.86.100.22', '中国', '重庆', '重庆市', '2024-12-06 17:19:07');
INSERT INTO `history_info` VALUES (378, NULL, '106.92.125.131', '中国', '重庆', '重庆市', '2024-12-06 20:54:39');
INSERT INTO `history_info` VALUES (379, NULL, '106.92.123.67', '中国', '重庆', '重庆市', '2024-12-07 22:04:26');
INSERT INTO `history_info` VALUES (380, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2024-12-08 00:08:35');
INSERT INTO `history_info` VALUES (381, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2024-12-08 00:08:35');
INSERT INTO `history_info` VALUES (382, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2024-12-08 00:08:35');
INSERT INTO `history_info` VALUES (383, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-12-08 00:08:36');
INSERT INTO `history_info` VALUES (384, NULL, '106.55.202.193', '中国', '广东省', '广州市', '2024-12-08 10:20:14');
INSERT INTO `history_info` VALUES (385, NULL, '124.70.25.74', '中国', '北京', '北京市', '2024-12-08 10:33:30');
INSERT INTO `history_info` VALUES (386, NULL, '185.224.128.43', '荷兰', '北荷兰', NULL, '2024-12-09 05:01:05');
INSERT INTO `history_info` VALUES (387, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-09 19:27:49');
INSERT INTO `history_info` VALUES (388, 1, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-09 19:28:00');
INSERT INTO `history_info` VALUES (389, NULL, '27.115.124.101', '中国', '上海', '上海市', '2024-12-10 10:47:40');
INSERT INTO `history_info` VALUES (390, NULL, '27.115.124.6', '中国', '上海', '上海市', '2024-12-10 10:47:40');
INSERT INTO `history_info` VALUES (391, NULL, '27.115.124.70', '中国', '上海', '上海市', '2024-12-10 10:47:40');
INSERT INTO `history_info` VALUES (392, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-10 16:07:00');
INSERT INTO `history_info` VALUES (393, 1, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-10 16:07:17');
INSERT INTO `history_info` VALUES (394, NULL, '123.125.21.152', '中国', '北京', '北京市', '2024-12-10 20:55:13');
INSERT INTO `history_info` VALUES (395, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2024-12-11 00:19:43');
INSERT INTO `history_info` VALUES (396, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2024-12-11 00:19:43');
INSERT INTO `history_info` VALUES (397, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2024-12-11 00:19:43');
INSERT INTO `history_info` VALUES (398, NULL, '220.196.160.117', '中国', '上海', '上海市', '2024-12-11 01:12:57');
INSERT INTO `history_info` VALUES (399, NULL, '220.196.160.53', '中国', '上海', '上海市', '2024-12-11 01:12:57');
INSERT INTO `history_info` VALUES (400, NULL, '220.196.160.154', '中国', '上海', '上海市', '2024-12-11 01:12:57');
INSERT INTO `history_info` VALUES (401, NULL, '220.196.160.146', '中国', '上海', '上海市', '2024-12-11 01:12:57');
INSERT INTO `history_info` VALUES (402, NULL, '152.32.190.164', '中国', '香港', NULL, '2024-12-11 02:05:35');
INSERT INTO `history_info` VALUES (403, NULL, '106.55.200.45', '中国', '广东省', '广州市', '2024-12-11 09:06:54');
INSERT INTO `history_info` VALUES (404, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-11 20:25:15');
INSERT INTO `history_info` VALUES (405, NULL, '113.248.31.186', '中国', '重庆', '重庆市', '2024-12-12 05:36:37');
INSERT INTO `history_info` VALUES (406, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-12 14:39:12');
INSERT INTO `history_info` VALUES (407, 1, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-12 15:13:32');
INSERT INTO `history_info` VALUES (408, NULL, '111.122.192.64', '中国', '贵州省', '黔东南', '2024-12-12 20:06:05');
INSERT INTO `history_info` VALUES (409, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-13 01:13:14');
INSERT INTO `history_info` VALUES (410, NULL, '114.250.44.120', '中国', '北京', '北京市', '2024-12-13 03:27:29');
INSERT INTO `history_info` VALUES (411, NULL, '58.16.157.111', '中国', '贵州省', '黔东南', '2024-12-13 08:52:46');
INSERT INTO `history_info` VALUES (412, NULL, '101.66.172.251', '中国', '浙江省', '金华市', '2024-12-13 13:33:47');
INSERT INTO `history_info` VALUES (413, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2024-12-14 00:48:07');
INSERT INTO `history_info` VALUES (414, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-12-14 00:48:07');
INSERT INTO `history_info` VALUES (415, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2024-12-14 00:48:07');
INSERT INTO `history_info` VALUES (416, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2024-12-14 00:48:08');
INSERT INTO `history_info` VALUES (417, NULL, '101.66.172.251', '中国', '浙江省', '金华市', '2024-12-14 02:56:56');
INSERT INTO `history_info` VALUES (418, NULL, '167.99.43.24', '荷兰', '阿姆斯特丹', '阿姆斯特丹', '2024-12-14 03:49:23');
INSERT INTO `history_info` VALUES (419, NULL, '121.36.70.64', '中国', '北京', '北京市', '2024-12-14 11:09:32');
INSERT INTO `history_info` VALUES (420, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-14 23:51:22');
INSERT INTO `history_info` VALUES (421, 1, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-14 23:51:57');
INSERT INTO `history_info` VALUES (422, 1, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-15 00:19:27');
INSERT INTO `history_info` VALUES (423, NULL, '106.92.127.224', '中国', '重庆', '重庆市', '2024-12-15 00:38:07');
INSERT INTO `history_info` VALUES (424, NULL, '185.224.128.43', '荷兰', '北荷兰', NULL, '2024-12-15 06:55:44');
INSERT INTO `history_info` VALUES (425, NULL, '180.76.184.14', '中国', '北京', '北京市', '2024-12-15 09:11:14');
INSERT INTO `history_info` VALUES (426, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2024-12-15 09:23:41');
INSERT INTO `history_info` VALUES (427, NULL, '66.249.66.37', '美国', '南卡罗来纳', NULL, '2024-12-15 23:53:23');
INSERT INTO `history_info` VALUES (428, NULL, '222.249.228.245', '中国', '北京', '北京市', '2024-12-16 21:56:22');
INSERT INTO `history_info` VALUES (429, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2024-12-17 00:47:15');
INSERT INTO `history_info` VALUES (430, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2024-12-17 00:47:15');
INSERT INTO `history_info` VALUES (431, NULL, '129.211.167.108', '中国', '江苏省', '南京市', '2024-12-17 00:47:15');
INSERT INTO `history_info` VALUES (432, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2024-12-17 00:47:15');
INSERT INTO `history_info` VALUES (433, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-12-17 00:47:15');
INSERT INTO `history_info` VALUES (434, NULL, '143.110.202.222', '美国', '明尼苏达', NULL, '2024-12-17 03:21:05');
INSERT INTO `history_info` VALUES (435, NULL, '203.81.86.34', '缅甸', NULL, NULL, '2024-12-17 06:10:07');
INSERT INTO `history_info` VALUES (436, NULL, '61.138.167.35', '中国', '吉林省', '松原市', '2024-12-17 23:53:21');
INSERT INTO `history_info` VALUES (437, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2024-12-18 00:55:19');
INSERT INTO `history_info` VALUES (438, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2024-12-18 00:55:19');
INSERT INTO `history_info` VALUES (439, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2024-12-18 00:55:19');
INSERT INTO `history_info` VALUES (440, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2024-12-18 00:55:19');
INSERT INTO `history_info` VALUES (441, NULL, '106.55.200.45', '中国', '广东省', '广州市', '2024-12-18 08:34:49');
INSERT INTO `history_info` VALUES (442, NULL, '120.224.169.28', '中国', '山东省', '日照市', '2024-12-18 08:37:25');
INSERT INTO `history_info` VALUES (443, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-18 10:06:43');
INSERT INTO `history_info` VALUES (444, 1, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-18 10:18:58');
INSERT INTO `history_info` VALUES (445, NULL, '117.72.94.53', '中国', '辽宁省', '大连市', '2024-12-18 15:36:55');
INSERT INTO `history_info` VALUES (446, NULL, '162.55.188.30', '德国', NULL, NULL, '2024-12-19 12:02:14');
INSERT INTO `history_info` VALUES (447, 1, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-19 16:49:08');
INSERT INTO `history_info` VALUES (448, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-19 16:49:08');
INSERT INTO `history_info` VALUES (449, 1, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-20 00:00:16');
INSERT INTO `history_info` VALUES (450, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-20 00:00:16');
INSERT INTO `history_info` VALUES (451, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2024-12-20 00:24:58');
INSERT INTO `history_info` VALUES (452, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2024-12-20 00:24:58');
INSERT INTO `history_info` VALUES (453, NULL, '180.101.244.15', '中国', '江苏省', '南京市', '2024-12-20 00:24:58');
INSERT INTO `history_info` VALUES (454, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2024-12-20 00:24:58');
INSERT INTO `history_info` VALUES (455, NULL, '45.156.129.116', '荷兰', NULL, NULL, '2024-12-20 04:39:49');
INSERT INTO `history_info` VALUES (456, NULL, '130.162.249.131', '荷兰', '阿姆斯特丹', '阿姆斯特丹', '2024-12-20 06:53:37');
INSERT INTO `history_info` VALUES (457, 1, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-21 00:26:24');
INSERT INTO `history_info` VALUES (458, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-21 00:26:24');
INSERT INTO `history_info` VALUES (459, NULL, '20.6.35.227', '美国', '华盛顿', '雷德蒙德', '2024-12-21 11:17:19');
INSERT INTO `history_info` VALUES (460, NULL, '114.250.44.120', '中国', '北京', '北京市', '2024-12-21 15:49:29');
INSERT INTO `history_info` VALUES (461, NULL, '220.196.160.51', '中国', '上海', '上海市', '2024-12-21 18:05:33');
INSERT INTO `history_info` VALUES (462, NULL, '220.196.160.45', '中国', '上海', '上海市', '2024-12-21 18:05:33');
INSERT INTO `history_info` VALUES (463, NULL, '220.196.160.83', '中国', '上海', '上海市', '2024-12-21 18:05:33');
INSERT INTO `history_info` VALUES (464, NULL, '220.196.160.144', '中国', '上海', '上海市', '2024-12-21 18:05:33');
INSERT INTO `history_info` VALUES (465, NULL, '106.88.214.184', '中国', '重庆', '重庆市', '2024-12-21 18:24:46');
INSERT INTO `history_info` VALUES (466, 1, '106.88.214.184', '中国', '重庆', '重庆市', '2024-12-21 18:24:46');
INSERT INTO `history_info` VALUES (467, NULL, '101.66.172.251', '中国', '浙江省', '金华市', '2024-12-22 02:18:01');
INSERT INTO `history_info` VALUES (468, 1, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-22 02:53:29');
INSERT INTO `history_info` VALUES (469, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-22 02:53:29');
INSERT INTO `history_info` VALUES (470, NULL, '106.55.202.193', '中国', '广东省', '广州市', '2024-12-22 08:29:34');
INSERT INTO `history_info` VALUES (471, NULL, '106.85.146.164', '中国', '重庆', '重庆市', '2024-12-22 10:33:18');
INSERT INTO `history_info` VALUES (472, 1, '106.85.146.164', '中国', '重庆', '重庆市', '2024-12-22 10:33:18');
INSERT INTO `history_info` VALUES (473, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2024-12-22 18:39:22');
INSERT INTO `history_info` VALUES (474, NULL, '20.6.35.227', '美国', '华盛顿', '雷德蒙德', '2024-12-22 23:30:08');
INSERT INTO `history_info` VALUES (475, NULL, '220.196.160.75', '中国', '上海', '上海市', '2024-12-23 00:33:49');
INSERT INTO `history_info` VALUES (476, NULL, '220.196.160.61', '中国', '上海', '上海市', '2024-12-23 00:33:49');
INSERT INTO `history_info` VALUES (477, NULL, '220.196.160.53', '中国', '上海', '上海市', '2024-12-23 00:33:49');
INSERT INTO `history_info` VALUES (478, NULL, '220.196.160.154', '中国', '上海', '上海市', '2024-12-23 00:33:50');
INSERT INTO `history_info` VALUES (479, NULL, '220.196.160.101', '中国', '上海', '上海市', '2024-12-23 00:33:50');
INSERT INTO `history_info` VALUES (480, NULL, '106.92.127.140', '中国', '重庆', '重庆市', '2024-12-23 10:42:34');
INSERT INTO `history_info` VALUES (481, NULL, '61.133.195.142', '中国', '宁夏', '银川市', '2024-12-23 10:43:17');
INSERT INTO `history_info` VALUES (482, NULL, '116.163.30.152', '中国', '湖南省', '长沙市', '2024-12-23 15:50:10');
INSERT INTO `history_info` VALUES (483, NULL, '144.126.223.83', '美国', '马里兰', NULL, '2024-12-23 22:43:19');
INSERT INTO `history_info` VALUES (484, NULL, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-24 08:55:08');
INSERT INTO `history_info` VALUES (485, NULL, '220.196.160.73', '中国', '上海', '上海市', '2024-12-25 00:28:04');
INSERT INTO `history_info` VALUES (486, NULL, '220.196.160.125', '中国', '上海', '上海市', '2024-12-25 00:28:04');
INSERT INTO `history_info` VALUES (487, NULL, '220.196.160.45', '中国', '上海', '上海市', '2024-12-25 00:28:04');
INSERT INTO `history_info` VALUES (488, NULL, '220.196.160.84', '中国', '上海', '上海市', '2024-12-25 00:28:06');
INSERT INTO `history_info` VALUES (489, NULL, '106.55.202.186', '中国', '广东省', '广州市', '2024-12-25 08:33:28');
INSERT INTO `history_info` VALUES (490, NULL, '220.196.160.95', '中国', '上海', '上海市', '2024-12-26 00:44:21');
INSERT INTO `history_info` VALUES (491, NULL, '220.196.160.96', '中国', '上海', '上海市', '2024-12-26 00:44:21');
INSERT INTO `history_info` VALUES (492, NULL, '220.196.160.65', '中国', '上海', '上海市', '2024-12-26 00:44:21');
INSERT INTO `history_info` VALUES (493, NULL, '220.196.160.151', '中国', '上海', '上海市', '2024-12-26 00:44:21');
INSERT INTO `history_info` VALUES (494, NULL, '45.82.15.54', '美国', '弗吉尼亚', '阿什本', '2024-12-26 08:52:05');
INSERT INTO `history_info` VALUES (495, NULL, '188.225.60.227', '俄罗斯', '列宁格勒', '圣彼得堡', '2024-12-26 09:31:19');
INSERT INTO `history_info` VALUES (496, NULL, '205.169.39.7', '美国', NULL, NULL, '2024-12-26 09:46:56');
INSERT INTO `history_info` VALUES (497, NULL, '205.169.39.11', '美国', NULL, NULL, '2024-12-26 09:49:55');
INSERT INTO `history_info` VALUES (498, NULL, '205.169.39.54', '美国', NULL, NULL, '2024-12-26 09:50:08');
INSERT INTO `history_info` VALUES (499, NULL, '205.169.39.47', '美国', NULL, NULL, '2024-12-26 09:52:42');
INSERT INTO `history_info` VALUES (500, NULL, '205.169.39.50', '美国', NULL, NULL, '2024-12-26 10:09:18');
INSERT INTO `history_info` VALUES (501, NULL, '205.169.39.13', '美国', NULL, NULL, '2024-12-26 10:18:39');
INSERT INTO `history_info` VALUES (502, NULL, '205.169.39.3', '美国', NULL, NULL, '2024-12-26 11:26:59');
INSERT INTO `history_info` VALUES (503, NULL, '205.169.39.28', '美国', NULL, NULL, '2024-12-26 11:52:39');
INSERT INTO `history_info` VALUES (504, NULL, '205.169.39.18', '美国', NULL, NULL, '2024-12-26 11:53:04');
INSERT INTO `history_info` VALUES (505, NULL, '205.169.39.20', '美国', NULL, NULL, '2024-12-26 12:21:15');
INSERT INTO `history_info` VALUES (506, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-12-26 13:12:08');
INSERT INTO `history_info` VALUES (507, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-12-26 13:12:17');
INSERT INTO `history_info` VALUES (508, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-12-26 13:12:17');
INSERT INTO `history_info` VALUES (509, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-12-26 13:12:17');
INSERT INTO `history_info` VALUES (510, NULL, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-26 17:09:45');
INSERT INTO `history_info` VALUES (511, NULL, '205.169.39.14', '美国', NULL, NULL, '2024-12-27 08:50:19');
INSERT INTO `history_info` VALUES (512, NULL, '205.169.39.38', '美国', NULL, NULL, '2024-12-27 11:05:06');
INSERT INTO `history_info` VALUES (513, NULL, '118.31.5.185', '中国', '浙江省', '杭州市', '2024-12-27 12:59:53');
INSERT INTO `history_info` VALUES (514, NULL, '205.169.39.26', '美国', NULL, NULL, '2024-12-27 13:04:58');
INSERT INTO `history_info` VALUES (515, NULL, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-27 16:22:50');
INSERT INTO `history_info` VALUES (516, 1, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-27 16:22:50');
INSERT INTO `history_info` VALUES (517, 2, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-27 16:30:22');
INSERT INTO `history_info` VALUES (518, NULL, '205.169.39.1', '美国', NULL, NULL, '2024-12-27 18:01:11');
INSERT INTO `history_info` VALUES (519, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-12-27 18:03:27');
INSERT INTO `history_info` VALUES (520, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-12-27 18:03:38');
INSERT INTO `history_info` VALUES (521, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-12-27 18:03:38');
INSERT INTO `history_info` VALUES (522, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2024-12-27 18:03:39');
INSERT INTO `history_info` VALUES (523, NULL, '106.92.125.109', '中国', '重庆', '重庆市', '2024-12-27 23:01:07');
INSERT INTO `history_info` VALUES (524, 1, '106.92.125.109', '中国', '重庆', '重庆市', '2024-12-27 23:01:07');
INSERT INTO `history_info` VALUES (525, NULL, '205.169.39.4', '美国', NULL, NULL, '2024-12-28 10:06:39');
INSERT INTO `history_info` VALUES (526, NULL, '205.169.39.20', '美国', NULL, NULL, '2024-12-28 10:19:18');
INSERT INTO `history_info` VALUES (527, NULL, '205.169.39.19', '美国', NULL, NULL, '2024-12-28 10:44:15');
INSERT INTO `history_info` VALUES (528, NULL, '120.46.61.94', '中国', '北京', '北京市', '2024-12-28 12:12:55');
INSERT INTO `history_info` VALUES (529, NULL, '205.169.39.47', '美国', NULL, NULL, '2024-12-28 12:24:19');
INSERT INTO `history_info` VALUES (530, NULL, '205.169.39.5', '美国', NULL, NULL, '2024-12-28 12:52:31');
INSERT INTO `history_info` VALUES (531, NULL, '205.169.39.12', '美国', NULL, NULL, '2024-12-28 12:55:07');
INSERT INTO `history_info` VALUES (532, NULL, '205.169.39.7', '美国', NULL, NULL, '2024-12-28 12:58:31');
INSERT INTO `history_info` VALUES (533, NULL, '27.115.124.38', '中国', '上海', '上海市', '2024-12-28 14:04:01');
INSERT INTO `history_info` VALUES (534, NULL, '106.92.125.109', '中国', '重庆', '重庆市', '2024-12-28 17:55:27');
INSERT INTO `history_info` VALUES (535, 1, '106.92.125.109', '中国', '重庆', '重庆市', '2024-12-28 17:55:27');
INSERT INTO `history_info` VALUES (536, NULL, '120.32.146.154', '中国', '福建省', '厦门市', '2024-12-28 18:48:50');
INSERT INTO `history_info` VALUES (537, NULL, '220.196.160.146', '中国', '上海', '上海市', '2024-12-29 00:50:10');
INSERT INTO `history_info` VALUES (538, NULL, '220.196.160.151', '中国', '上海', '上海市', '2024-12-29 00:50:10');
INSERT INTO `history_info` VALUES (539, NULL, '220.196.160.61', '中国', '上海', '上海市', '2024-12-29 00:50:10');
INSERT INTO `history_info` VALUES (540, NULL, '220.196.160.101', '中国', '上海', '上海市', '2024-12-29 00:50:13');
INSERT INTO `history_info` VALUES (541, NULL, '205.169.39.20', '美国', NULL, NULL, '2024-12-29 08:37:43');
INSERT INTO `history_info` VALUES (542, NULL, '205.169.39.16', '美国', NULL, NULL, '2024-12-29 09:07:49');
INSERT INTO `history_info` VALUES (543, NULL, '106.55.202.193', '中国', '广东省', '广州市', '2024-12-29 09:23:52');
INSERT INTO `history_info` VALUES (544, NULL, '205.169.39.21', '美国', NULL, NULL, '2024-12-29 10:26:42');
INSERT INTO `history_info` VALUES (545, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2024-12-29 10:48:11');
INSERT INTO `history_info` VALUES (546, NULL, '205.169.39.57', '美国', NULL, NULL, '2024-12-29 11:00:05');
INSERT INTO `history_info` VALUES (547, NULL, '205.169.39.22', '美国', NULL, NULL, '2024-12-29 16:17:07');
INSERT INTO `history_info` VALUES (548, NULL, '103.101.178.114', '日本', '东京都', '东京', '2024-12-29 20:26:53');
INSERT INTO `history_info` VALUES (549, NULL, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-29 21:39:05');
INSERT INTO `history_info` VALUES (550, 1, '106.92.120.92', '中国', '重庆', '重庆市', '2024-12-29 21:40:12');
INSERT INTO `history_info` VALUES (551, NULL, '205.169.39.16', '美国', NULL, NULL, '2024-12-30 09:33:43');
INSERT INTO `history_info` VALUES (552, NULL, '205.169.39.14', '美国', NULL, NULL, '2024-12-30 11:32:54');
INSERT INTO `history_info` VALUES (553, NULL, '205.169.39.1', '美国', NULL, NULL, '2024-12-30 11:48:24');
INSERT INTO `history_info` VALUES (554, NULL, '205.169.39.12', '美国', NULL, NULL, '2024-12-30 12:27:19');
INSERT INTO `history_info` VALUES (555, NULL, '205.169.39.47', '美国', NULL, NULL, '2024-12-30 13:11:16');
INSERT INTO `history_info` VALUES (556, NULL, '205.169.39.22', '美国', NULL, NULL, '2024-12-30 13:24:31');
INSERT INTO `history_info` VALUES (557, NULL, '205.169.39.23', '美国', NULL, NULL, '2024-12-30 13:50:51');
INSERT INTO `history_info` VALUES (558, NULL, '205.169.39.11', '美国', NULL, NULL, '2024-12-30 14:07:20');
INSERT INTO `history_info` VALUES (559, NULL, '205.169.39.26', '美国', NULL, NULL, '2024-12-30 14:46:29');
INSERT INTO `history_info` VALUES (560, NULL, '123.6.49.12', '中国', '河南省', '郑州市', '2024-12-30 23:49:52');
INSERT INTO `history_info` VALUES (561, NULL, '123.6.49.47', '中国', '河南省', '郑州市', '2024-12-30 23:49:52');
INSERT INTO `history_info` VALUES (562, NULL, '205.169.39.3', '美国', NULL, NULL, '2024-12-31 09:08:32');
INSERT INTO `history_info` VALUES (563, NULL, '205.169.39.20', '美国', NULL, NULL, '2024-12-31 09:16:13');
INSERT INTO `history_info` VALUES (564, NULL, '205.169.39.29', '美国', NULL, NULL, '2024-12-31 10:10:16');
INSERT INTO `history_info` VALUES (565, NULL, '205.169.39.2', '美国', NULL, NULL, '2024-12-31 11:45:25');
INSERT INTO `history_info` VALUES (566, NULL, '205.169.39.25', '美国', NULL, NULL, '2024-12-31 17:15:12');
INSERT INTO `history_info` VALUES (567, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2024-12-31 17:45:12');
INSERT INTO `history_info` VALUES (568, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2024-12-31 17:45:18');
INSERT INTO `history_info` VALUES (569, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2024-12-31 17:45:18');
INSERT INTO `history_info` VALUES (570, NULL, '205.169.39.8', '美国', NULL, NULL, '2024-12-31 18:17:49');
INSERT INTO `history_info` VALUES (571, NULL, '205.169.39.36', '美国', NULL, NULL, '2024-12-31 19:13:09');
INSERT INTO `history_info` VALUES (572, NULL, '205.169.39.16', '美国', NULL, NULL, '2024-12-31 19:31:19');
INSERT INTO `history_info` VALUES (573, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2024-12-31 23:34:35');
INSERT INTO `history_info` VALUES (574, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2024-12-31 23:34:35');
INSERT INTO `history_info` VALUES (575, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2024-12-31 23:34:35');
INSERT INTO `history_info` VALUES (576, NULL, '129.211.162.158', '中国', '江苏省', '南京市', '2024-12-31 23:34:38');
INSERT INTO `history_info` VALUES (577, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2024-12-31 23:34:39');
INSERT INTO `history_info` VALUES (578, NULL, '103.226.248.206', '越南', '河内', NULL, '2025-01-01 02:44:10');
INSERT INTO `history_info` VALUES (579, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-01-01 05:00:38');
INSERT INTO `history_info` VALUES (580, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-01 05:12:52');
INSERT INTO `history_info` VALUES (581, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-01-01 05:12:52');
INSERT INTO `history_info` VALUES (582, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-01-01 05:12:52');
INSERT INTO `history_info` VALUES (583, NULL, '205.169.39.53', '美国', NULL, NULL, '2025-01-01 09:24:04');
INSERT INTO `history_info` VALUES (584, NULL, '205.169.39.57', '美国', NULL, NULL, '2025-01-01 10:17:05');
INSERT INTO `history_info` VALUES (585, NULL, '205.169.39.20', '美国', NULL, NULL, '2025-01-01 12:11:43');
INSERT INTO `history_info` VALUES (586, NULL, '205.169.39.15', '美国', NULL, NULL, '2025-01-01 12:14:25');
INSERT INTO `history_info` VALUES (587, NULL, '205.169.39.46', '美国', NULL, NULL, '2025-01-01 13:40:42');
INSERT INTO `history_info` VALUES (588, NULL, '205.169.39.25', '美国', NULL, NULL, '2025-01-01 13:51:06');
INSERT INTO `history_info` VALUES (589, NULL, '205.169.39.2', '美国', NULL, NULL, '2025-01-01 14:26:02');
INSERT INTO `history_info` VALUES (590, NULL, '205.169.39.49', '美国', NULL, NULL, '2025-01-01 17:03:52');
INSERT INTO `history_info` VALUES (591, NULL, '117.72.37.68', '中国', '辽宁省', '大连市', '2025-01-01 21:15:07');
INSERT INTO `history_info` VALUES (592, NULL, '106.92.121.49', '中国', '重庆', '重庆市', '2025-01-01 22:33:43');
INSERT INTO `history_info` VALUES (593, 1, '106.92.121.49', '中国', '重庆', '重庆市', '2025-01-01 22:34:14');
INSERT INTO `history_info` VALUES (594, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-01-02 00:49:28');
INSERT INTO `history_info` VALUES (595, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-01-02 00:49:28');
INSERT INTO `history_info` VALUES (596, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-01-02 00:49:28');
INSERT INTO `history_info` VALUES (597, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-01-02 00:49:30');
INSERT INTO `history_info` VALUES (598, NULL, '205.169.39.5', '美国', NULL, NULL, '2025-01-02 08:48:35');
INSERT INTO `history_info` VALUES (599, NULL, '115.227.49.109', '中国', '浙江省', '杭州市', '2025-01-02 10:54:23');
INSERT INTO `history_info` VALUES (600, NULL, '205.169.39.46', '美国', NULL, NULL, '2025-01-02 13:40:24');
INSERT INTO `history_info` VALUES (601, NULL, '205.169.39.20', '美国', NULL, NULL, '2025-01-02 14:33:52');
INSERT INTO `history_info` VALUES (602, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-01-02 15:16:37');
INSERT INTO `history_info` VALUES (603, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-01-02 15:16:45');
INSERT INTO `history_info` VALUES (604, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-01-02 15:16:46');
INSERT INTO `history_info` VALUES (605, NULL, '205.169.39.2', '美国', NULL, NULL, '2025-01-02 15:47:01');
INSERT INTO `history_info` VALUES (606, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-01-03 04:30:02');
INSERT INTO `history_info` VALUES (607, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-01-03 04:30:20');
INSERT INTO `history_info` VALUES (608, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-01-03 04:30:21');
INSERT INTO `history_info` VALUES (609, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-01-03 04:30:22');
INSERT INTO `history_info` VALUES (610, NULL, '34.118.28.145', '美国', '德克萨斯', '休斯顿', '2025-01-03 04:32:25');
INSERT INTO `history_info` VALUES (611, NULL, '221.182.189.18', '中国', '海南省', '海口市', '2025-01-03 12:18:08');
INSERT INTO `history_info` VALUES (612, NULL, '205.169.39.8', '美国', NULL, NULL, '2025-01-03 13:15:25');
INSERT INTO `history_info` VALUES (613, NULL, '205.169.39.55', '美国', NULL, NULL, '2025-01-03 14:05:18');
INSERT INTO `history_info` VALUES (614, NULL, '205.169.39.28', '美国', NULL, NULL, '2025-01-03 14:19:47');
INSERT INTO `history_info` VALUES (615, NULL, '205.169.39.46', '美国', NULL, NULL, '2025-01-03 15:18:46');
INSERT INTO `history_info` VALUES (616, NULL, '205.169.39.21', '美国', NULL, NULL, '2025-01-03 19:04:36');
INSERT INTO `history_info` VALUES (617, NULL, '205.169.39.30', '美国', NULL, NULL, '2025-01-03 22:05:42');
INSERT INTO `history_info` VALUES (618, NULL, '205.169.39.5', '美国', NULL, NULL, '2025-01-03 22:08:15');
INSERT INTO `history_info` VALUES (619, NULL, '205.169.39.53', '美国', NULL, NULL, '2025-01-03 23:07:55');
INSERT INTO `history_info` VALUES (620, NULL, '205.169.39.30', '美国', NULL, NULL, '2025-01-04 14:42:39');
INSERT INTO `history_info` VALUES (621, NULL, '111.7.100.26', '中国', '河南省', '郑州市', '2025-01-04 22:46:48');
INSERT INTO `history_info` VALUES (622, NULL, '111.7.100.25', '中国', '河南省', '郑州市', '2025-01-04 22:46:49');
INSERT INTO `history_info` VALUES (623, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-01-05 01:10:15');
INSERT INTO `history_info` VALUES (624, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-05 01:10:15');
INSERT INTO `history_info` VALUES (625, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-01-05 01:10:15');
INSERT INTO `history_info` VALUES (626, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-01-05 01:10:17');
INSERT INTO `history_info` VALUES (627, NULL, '13.88.29.119', '美国', '加利福尼亚', '圣何塞', '2025-01-05 02:59:01');
INSERT INTO `history_info` VALUES (628, NULL, '205.169.39.3', '美国', NULL, NULL, '2025-01-05 05:52:51');
INSERT INTO `history_info` VALUES (629, NULL, '205.169.39.20', '美国', NULL, NULL, '2025-01-05 09:15:57');
INSERT INTO `history_info` VALUES (630, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-01-05 09:18:28');
INSERT INTO `history_info` VALUES (631, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-01-05 09:18:36');
INSERT INTO `history_info` VALUES (632, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-01-05 09:18:36');
INSERT INTO `history_info` VALUES (633, NULL, '106.55.200.246', '中国', '广东省', '广州市', '2025-01-05 10:02:05');
INSERT INTO `history_info` VALUES (634, NULL, '156.146.36.72', '美国', '纽约', '纽约', '2025-01-05 23:58:14');
INSERT INTO `history_info` VALUES (635, NULL, '205.169.39.24', '美国', NULL, NULL, '2025-01-06 05:05:36');
INSERT INTO `history_info` VALUES (636, NULL, '205.169.39.4', '美国', NULL, NULL, '2025-01-06 05:28:00');
INSERT INTO `history_info` VALUES (637, NULL, '205.169.39.17', '美国', NULL, NULL, '2025-01-06 07:35:13');
INSERT INTO `history_info` VALUES (638, NULL, '205.169.39.15', '美国', NULL, NULL, '2025-01-06 07:42:56');
INSERT INTO `history_info` VALUES (639, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-01-06 19:41:28');
INSERT INTO `history_info` VALUES (640, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-01-06 19:41:28');
INSERT INTO `history_info` VALUES (641, NULL, '91.205.105.147', '美国', '新泽西', NULL, '2025-01-07 03:11:34');
INSERT INTO `history_info` VALUES (642, NULL, '205.169.39.7', '美国', NULL, NULL, '2025-01-07 06:10:00');
INSERT INTO `history_info` VALUES (643, NULL, '5.101.0.66', '俄罗斯', '列宁格勒', '圣彼得堡', '2025-01-07 06:17:03');
INSERT INTO `history_info` VALUES (644, NULL, '116.142.242.168', '中国', '辽宁省', NULL, '2025-01-07 12:08:20');
INSERT INTO `history_info` VALUES (645, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-01-07 23:14:49');
INSERT INTO `history_info` VALUES (646, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-01-07 23:14:49');
INSERT INTO `history_info` VALUES (647, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-01-07 23:14:49');
INSERT INTO `history_info` VALUES (648, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-01-07 23:14:51');
INSERT INTO `history_info` VALUES (649, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-01-07 23:14:51');
INSERT INTO `history_info` VALUES (650, NULL, '147.182.238.90', '美国', '密苏里', NULL, '2025-01-08 00:25:08');
INSERT INTO `history_info` VALUES (651, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-01-08 00:51:17');
INSERT INTO `history_info` VALUES (652, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-01-08 00:51:17');
INSERT INTO `history_info` VALUES (653, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-08 00:51:17');
INSERT INTO `history_info` VALUES (654, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-01-08 00:51:18');
INSERT INTO `history_info` VALUES (655, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-01-08 00:51:19');
INSERT INTO `history_info` VALUES (656, NULL, '134.209.119.43', '美国', '纽约', '纽约', '2025-01-08 04:45:01');
INSERT INTO `history_info` VALUES (657, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-01-08 05:18:06');
INSERT INTO `history_info` VALUES (658, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-01-08 05:18:10');
INSERT INTO `history_info` VALUES (659, 1, '106.92.126.171', '中国', '重庆', '重庆市', '2025-01-09 10:26:55');
INSERT INTO `history_info` VALUES (660, NULL, '106.92.126.171', '中国', '重庆', '重庆市', '2025-01-09 10:26:56');
INSERT INTO `history_info` VALUES (661, NULL, '116.169.7.144', '中国', '四川省', '成都市', '2025-01-09 14:52:54');
INSERT INTO `history_info` VALUES (662, NULL, '112.44.166.83', '中国', '四川省', '德阳市', '2025-01-09 14:55:33');
INSERT INTO `history_info` VALUES (663, NULL, '212.102.33.46', '美国', '纽约', '纽约', '2025-01-09 20:37:42');
INSERT INTO `history_info` VALUES (664, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-01-10 03:37:50');
INSERT INTO `history_info` VALUES (665, NULL, '220.196.160.53', '中国', '上海', '上海市', '2025-01-10 03:37:50');
INSERT INTO `history_info` VALUES (666, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-01-10 03:37:50');
INSERT INTO `history_info` VALUES (667, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-01-10 03:37:52');
INSERT INTO `history_info` VALUES (668, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-01-10 08:06:47');
INSERT INTO `history_info` VALUES (669, NULL, '106.92.126.171', '中国', '重庆', '重庆市', '2025-01-10 12:53:16');
INSERT INTO `history_info` VALUES (670, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-01-11 01:13:47');
INSERT INTO `history_info` VALUES (671, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-01-11 01:13:47');
INSERT INTO `history_info` VALUES (672, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-01-11 01:13:47');
INSERT INTO `history_info` VALUES (673, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-01-11 01:13:49');
INSERT INTO `history_info` VALUES (674, NULL, '37.58.18.237', '土耳其', NULL, NULL, '2025-01-11 14:25:34');
INSERT INTO `history_info` VALUES (675, NULL, '1.92.145.190', '中国', '北京', '北京市', '2025-01-11 15:07:27');
INSERT INTO `history_info` VALUES (676, NULL, '159.75.198.125', '中国', '北京', '北京市', '2025-01-12 05:52:57');
INSERT INTO `history_info` VALUES (677, NULL, '43.144.106.82', '澳大利亚', NULL, NULL, '2025-01-12 05:53:00');
INSERT INTO `history_info` VALUES (678, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-01-12 11:25:12');
INSERT INTO `history_info` VALUES (679, NULL, '116.169.81.103', '中国', '辽宁省', NULL, '2025-01-13 14:51:35');
INSERT INTO `history_info` VALUES (680, NULL, '106.92.126.171', '中国', '重庆', '重庆市', '2025-01-14 00:04:05');
INSERT INTO `history_info` VALUES (681, 1, '106.92.126.171', '中国', '重庆', '重庆市', '2025-01-14 00:04:06');
INSERT INTO `history_info` VALUES (682, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-01-14 01:12:49');
INSERT INTO `history_info` VALUES (683, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-01-14 01:12:49');
INSERT INTO `history_info` VALUES (684, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-01-14 01:12:49');
INSERT INTO `history_info` VALUES (685, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-01-14 01:12:50');
INSERT INTO `history_info` VALUES (686, NULL, '220.196.160.75', '中国', '上海', '上海市', '2025-01-14 22:27:54');
INSERT INTO `history_info` VALUES (687, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-01-14 22:27:54');
INSERT INTO `history_info` VALUES (688, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-01-14 22:27:55');
INSERT INTO `history_info` VALUES (689, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-01-14 22:27:55');
INSERT INTO `history_info` VALUES (690, NULL, '62.84.100.218', '俄罗斯', '莫斯科', '莫斯科', '2025-01-15 07:09:05');
INSERT INTO `history_info` VALUES (691, NULL, '118.145.192.233', '中国', '北京', '北京市', '2025-01-15 14:10:02');
INSERT INTO `history_info` VALUES (692, NULL, '156.233.225.192', '中国', '香港', NULL, '2025-01-16 09:53:15');
INSERT INTO `history_info` VALUES (693, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-01-17 01:03:39');
INSERT INTO `history_info` VALUES (694, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-01-17 01:03:39');
INSERT INTO `history_info` VALUES (695, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-01-17 01:03:39');
INSERT INTO `history_info` VALUES (696, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-01-17 01:03:41');
INSERT INTO `history_info` VALUES (697, NULL, '66.249.66.44', '美国', '南卡罗来纳', NULL, '2025-01-17 01:55:07');
INSERT INTO `history_info` VALUES (698, NULL, '130.61.230.15', '德国', '法兰克福', '法兰克福', '2025-01-17 03:07:31');
INSERT INTO `history_info` VALUES (699, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-01-17 03:39:27');
INSERT INTO `history_info` VALUES (700, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2025-01-17 03:39:27');
INSERT INTO `history_info` VALUES (701, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-17 03:39:27');
INSERT INTO `history_info` VALUES (702, NULL, '159.75.198.113', '中国', '北京', '北京市', '2025-01-19 05:56:11');
INSERT INTO `history_info` VALUES (703, NULL, '106.52.79.248', '中国', '广东省', '广州市', '2025-01-19 05:56:11');
INSERT INTO `history_info` VALUES (704, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-01-20 00:59:21');
INSERT INTO `history_info` VALUES (705, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-20 01:12:17');
INSERT INTO `history_info` VALUES (706, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-01-20 01:12:17');
INSERT INTO `history_info` VALUES (707, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-01-20 01:12:17');
INSERT INTO `history_info` VALUES (708, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-01-20 01:12:18');
INSERT INTO `history_info` VALUES (709, NULL, '154.39.150.108', '美国', NULL, NULL, '2025-01-21 21:14:04');
INSERT INTO `history_info` VALUES (710, NULL, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-21 21:22:03');
INSERT INTO `history_info` VALUES (711, 1, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-21 21:22:43');
INSERT INTO `history_info` VALUES (712, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-01-21 21:57:55');
INSERT INTO `history_info` VALUES (713, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-01-21 21:57:55');
INSERT INTO `history_info` VALUES (714, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-01-21 21:57:55');
INSERT INTO `history_info` VALUES (715, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-01-21 21:57:57');
INSERT INTO `history_info` VALUES (716, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-01-21 21:57:57');
INSERT INTO `history_info` VALUES (717, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-01-21 21:57:57');
INSERT INTO `history_info` VALUES (718, NULL, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-22 00:39:42');
INSERT INTO `history_info` VALUES (719, NULL, '42.193.132.157', '中国', '上海', '上海市', '2025-01-22 05:21:05');
INSERT INTO `history_info` VALUES (720, NULL, '106.52.114.40', '中国', '广东省', '广州市', '2025-01-22 05:21:05');
INSERT INTO `history_info` VALUES (721, 1, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-22 09:08:17');
INSERT INTO `history_info` VALUES (722, NULL, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-23 00:00:09');
INSERT INTO `history_info` VALUES (723, 1, '106.92.120.95', '中国', '重庆', '重庆市', '2025-01-23 00:00:44');
INSERT INTO `history_info` VALUES (724, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-01-23 00:48:34');
INSERT INTO `history_info` VALUES (725, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-01-23 01:25:30');
INSERT INTO `history_info` VALUES (726, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-01-23 01:25:30');
INSERT INTO `history_info` VALUES (727, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-01-23 01:25:30');
INSERT INTO `history_info` VALUES (728, NULL, '180.101.244.15', '中国', '江苏省', '南京市', '2025-01-23 01:25:32');
INSERT INTO `history_info` VALUES (729, NULL, '45.156.129.128', '荷兰', NULL, NULL, '2025-01-23 05:50:16');
INSERT INTO `history_info` VALUES (730, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-01-24 00:56:42');
INSERT INTO `history_info` VALUES (731, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2025-01-24 00:56:42');
INSERT INTO `history_info` VALUES (732, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-01-24 00:56:42');
INSERT INTO `history_info` VALUES (733, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-01-24 00:56:45');
INSERT INTO `history_info` VALUES (734, NULL, '109.199.108.140', '美国', '伊利诺伊', '芝加哥', '2025-01-24 01:56:53');
INSERT INTO `history_info` VALUES (735, NULL, '165.154.226.220', '加拿大', '安大略', '奥克维尔', '2025-01-24 15:58:03');
INSERT INTO `history_info` VALUES (736, NULL, '106.85.152.6', '中国', '重庆', '重庆市', '2025-01-24 17:07:05');
INSERT INTO `history_info` VALUES (737, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-01-24 20:21:43');
INSERT INTO `history_info` VALUES (738, NULL, '45.159.231.124', '荷兰', NULL, NULL, '2025-01-25 00:58:58');
INSERT INTO `history_info` VALUES (739, NULL, '1.92.149.201', '中国', '北京', '北京市', '2025-01-25 16:05:57');
INSERT INTO `history_info` VALUES (740, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-01-26 01:36:15');
INSERT INTO `history_info` VALUES (741, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-01-26 01:36:15');
INSERT INTO `history_info` VALUES (742, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-01-26 01:36:15');
INSERT INTO `history_info` VALUES (743, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-01-26 01:36:19');
INSERT INTO `history_info` VALUES (744, NULL, '159.75.198.59', '中国', '北京', '北京市', '2025-01-26 05:47:32');
INSERT INTO `history_info` VALUES (745, NULL, '116.205.96.31', '中国', '广东省', '深圳市', '2025-01-26 12:34:44');
INSERT INTO `history_info` VALUES (746, NULL, '120.26.82.39', '中国', '浙江省', '杭州市', '2025-01-27 05:12:34');
INSERT INTO `history_info` VALUES (747, NULL, '45.156.130.45', '荷兰', NULL, NULL, '2025-01-28 16:27:11');
INSERT INTO `history_info` VALUES (748, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-01-29 01:37:39');
INSERT INTO `history_info` VALUES (749, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-01-29 01:37:40');
INSERT INTO `history_info` VALUES (750, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-01-29 02:58:08');
INSERT INTO `history_info` VALUES (751, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-01-29 05:28:56');
INSERT INTO `history_info` VALUES (752, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-01-29 05:28:56');
INSERT INTO `history_info` VALUES (753, NULL, '45.156.129.130', '荷兰', NULL, NULL, '2025-01-29 12:06:59');
INSERT INTO `history_info` VALUES (754, NULL, '123.249.126.59', '中国', '贵州省', '黔西南', '2025-01-30 07:12:49');
INSERT INTO `history_info` VALUES (755, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-01-31 01:35:19');
INSERT INTO `history_info` VALUES (756, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-01-31 01:35:19');
INSERT INTO `history_info` VALUES (757, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-01-31 01:35:19');
INSERT INTO `history_info` VALUES (758, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-01-31 01:35:19');
INSERT INTO `history_info` VALUES (759, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-01-31 01:35:19');
INSERT INTO `history_info` VALUES (760, NULL, '18.201.70.75', '爱尔兰', 'Dublin', NULL, '2025-01-31 08:57:35');
INSERT INTO `history_info` VALUES (761, NULL, '120.224.156.84', '中国', '山东省', '滨州市', '2025-01-31 09:34:26');
INSERT INTO `history_info` VALUES (762, NULL, '106.92.121.111', '中国', '重庆', '重庆市', '2025-01-31 20:07:11');
INSERT INTO `history_info` VALUES (763, NULL, '45.156.129.133', '荷兰', NULL, NULL, '2025-02-01 12:57:17');
INSERT INTO `history_info` VALUES (764, NULL, '106.84.157.134', '中国', '重庆', '重庆市', '2025-02-01 17:09:49');
INSERT INTO `history_info` VALUES (765, NULL, '183.229.57.129', '中国', '重庆', '重庆市', '2025-02-01 17:10:00');
INSERT INTO `history_info` VALUES (766, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-02-02 01:48:17');
INSERT INTO `history_info` VALUES (767, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-02-02 01:48:17');
INSERT INTO `history_info` VALUES (768, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-02-02 01:48:17');
INSERT INTO `history_info` VALUES (769, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-02-02 01:48:18');
INSERT INTO `history_info` VALUES (770, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-02-02 01:48:18');
INSERT INTO `history_info` VALUES (771, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-02-02 01:48:18');
INSERT INTO `history_info` VALUES (772, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-02-02 04:13:06');
INSERT INTO `history_info` VALUES (773, NULL, '124.70.63.89', '中国', '北京', '北京市', '2025-02-02 07:41:24');
INSERT INTO `history_info` VALUES (774, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-02-03 23:25:21');
INSERT INTO `history_info` VALUES (775, NULL, '170.39.218.109', '美国', NULL, NULL, '2025-02-04 01:02:56');
INSERT INTO `history_info` VALUES (776, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-02-04 21:16:46');
INSERT INTO `history_info` VALUES (777, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-02-04 21:16:46');
INSERT INTO `history_info` VALUES (778, NULL, '129.211.167.108', '中国', '江苏省', '南京市', '2025-02-04 21:16:46');
INSERT INTO `history_info` VALUES (779, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-02-04 21:16:47');
INSERT INTO `history_info` VALUES (780, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-02-04 21:16:49');
INSERT INTO `history_info` VALUES (781, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-02-04 21:16:50');
INSERT INTO `history_info` VALUES (782, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-02-05 01:54:09');
INSERT INTO `history_info` VALUES (783, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-02-05 01:54:09');
INSERT INTO `history_info` VALUES (784, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-02-05 01:54:09');
INSERT INTO `history_info` VALUES (785, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-02-05 01:54:11');
INSERT INTO `history_info` VALUES (786, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-02-05 01:54:11');
INSERT INTO `history_info` VALUES (787, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-02-05 05:12:43');
INSERT INTO `history_info` VALUES (788, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-02-05 05:12:43');
INSERT INTO `history_info` VALUES (789, NULL, '45.156.130.4', '荷兰', NULL, NULL, '2025-02-05 07:23:03');
INSERT INTO `history_info` VALUES (790, NULL, '167.172.217.153', '美国', '纽约', '纽约', '2025-02-05 10:38:40');
INSERT INTO `history_info` VALUES (791, NULL, '216.81.248.24', '美国', '艾奥瓦', NULL, '2025-02-06 02:33:59');
INSERT INTO `history_info` VALUES (792, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-02-06 02:59:07');
INSERT INTO `history_info` VALUES (793, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-02-06 23:33:43');
INSERT INTO `history_info` VALUES (794, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-02-06 23:33:43');
INSERT INTO `history_info` VALUES (795, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-02-06 23:33:43');
INSERT INTO `history_info` VALUES (796, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2025-02-08 02:17:10');
INSERT INTO `history_info` VALUES (797, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-02-08 02:17:10');
INSERT INTO `history_info` VALUES (798, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-02-08 02:17:10');
INSERT INTO `history_info` VALUES (799, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-02-08 17:16:47');
INSERT INTO `history_info` VALUES (800, NULL, '27.115.124.70', '中国', '上海', '上海市', '2025-02-08 18:04:48');
INSERT INTO `history_info` VALUES (801, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-02-08 18:04:48');
INSERT INTO `history_info` VALUES (802, NULL, '27.115.124.45', '中国', '上海', '上海市', '2025-02-08 18:04:50');
INSERT INTO `history_info` VALUES (803, NULL, '106.55.244.169', '中国', '广东省', '广州市', '2025-02-09 05:20:52');
INSERT INTO `history_info` VALUES (804, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-02-09 05:20:52');
INSERT INTO `history_info` VALUES (805, NULL, '123.249.103.170', '中国', '贵州省', '黔西南', '2025-02-09 13:09:24');
INSERT INTO `history_info` VALUES (806, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-02-09 23:00:04');
INSERT INTO `history_info` VALUES (807, NULL, '103.88.240.124', '印度', '恰蒂斯加尔', NULL, '2025-02-10 17:22:43');
INSERT INTO `history_info` VALUES (808, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-02-10 20:51:45');
INSERT INTO `history_info` VALUES (809, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-02-11 02:43:46');
INSERT INTO `history_info` VALUES (810, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-02-11 02:43:46');
INSERT INTO `history_info` VALUES (811, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-02-11 02:43:46');
INSERT INTO `history_info` VALUES (812, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-02-11 02:43:46');
INSERT INTO `history_info` VALUES (813, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-02-11 02:43:54');
INSERT INTO `history_info` VALUES (814, NULL, '129.211.167.70', '中国', '江苏省', '南京市', '2025-02-11 20:53:12');
INSERT INTO `history_info` VALUES (815, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-02-11 20:53:12');
INSERT INTO `history_info` VALUES (816, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-02-11 20:53:12');
INSERT INTO `history_info` VALUES (817, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-02-11 20:53:13');
INSERT INTO `history_info` VALUES (818, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-02-11 20:53:13');
INSERT INTO `history_info` VALUES (819, NULL, '20.195.11.105', '新加坡', NULL, NULL, '2025-02-12 08:48:45');
INSERT INTO `history_info` VALUES (820, NULL, '173.212.213.162', '德国', 'Bayern', NULL, '2025-02-12 09:11:12');
INSERT INTO `history_info` VALUES (821, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-02-12 23:07:58');
INSERT INTO `history_info` VALUES (822, NULL, '58.210.197.13', '中国', '江苏省', '苏州市', '2025-02-13 04:29:03');
INSERT INTO `history_info` VALUES (823, NULL, '1.92.151.215', '中国', '北京', '北京市', '2025-02-13 08:10:01');
INSERT INTO `history_info` VALUES (824, NULL, '51.159.100.253', '美国', NULL, NULL, '2025-02-13 09:07:08');
INSERT INTO `history_info` VALUES (825, NULL, '1.94.203.12', '中国', '北京', '北京市', '2025-02-13 10:11:02');
INSERT INTO `history_info` VALUES (826, NULL, '27.115.124.53', '中国', '上海', '上海市', '2025-02-13 11:04:05');
INSERT INTO `history_info` VALUES (827, NULL, '27.115.124.101', '中国', '上海', '上海市', '2025-02-13 11:04:05');
INSERT INTO `history_info` VALUES (828, NULL, '193.41.206.176', '罗马尼亚', NULL, NULL, '2025-02-13 17:40:19');
INSERT INTO `history_info` VALUES (829, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-02-13 23:16:34');
INSERT INTO `history_info` VALUES (830, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-02-13 23:16:35');
INSERT INTO `history_info` VALUES (831, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-02-13 23:16:36');
INSERT INTO `history_info` VALUES (832, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-02-13 23:16:36');
INSERT INTO `history_info` VALUES (833, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-02-14 02:23:22');
INSERT INTO `history_info` VALUES (834, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-02-14 02:23:22');
INSERT INTO `history_info` VALUES (835, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-02-14 02:23:22');
INSERT INTO `history_info` VALUES (836, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-02-14 02:23:22');
INSERT INTO `history_info` VALUES (837, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-02-14 02:23:23');
INSERT INTO `history_info` VALUES (838, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-02-14 02:23:23');
INSERT INTO `history_info` VALUES (839, NULL, '185.93.89.118', '英国', NULL, NULL, '2025-02-15 15:53:37');
INSERT INTO `history_info` VALUES (840, NULL, '45.13.214.40', '罗马尼亚', NULL, NULL, '2025-02-16 06:02:52');
INSERT INTO `history_info` VALUES (841, NULL, '106.52.114.40', '中国', '广东省', '广州市', '2025-02-16 11:13:42');
INSERT INTO `history_info` VALUES (842, NULL, '42.193.132.157', '中国', '上海', '上海市', '2025-02-16 11:13:42');
INSERT INTO `history_info` VALUES (843, NULL, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-16 12:24:32');
INSERT INTO `history_info` VALUES (844, 1, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-16 12:24:55');
INSERT INTO `history_info` VALUES (845, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-02-17 02:36:16');
INSERT INTO `history_info` VALUES (846, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-02-17 02:36:16');
INSERT INTO `history_info` VALUES (847, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-02-17 02:36:16');
INSERT INTO `history_info` VALUES (848, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-02-17 02:36:17');
INSERT INTO `history_info` VALUES (849, NULL, '185.93.89.118', '英国', NULL, NULL, '2025-02-17 04:10:07');
INSERT INTO `history_info` VALUES (850, NULL, '157.7.200.65', '日本', '东京都', '东京', '2025-02-17 06:39:52');
INSERT INTO `history_info` VALUES (851, NULL, '221.237.123.0', '中国', '四川省', '成都市', '2025-02-17 11:07:25');
INSERT INTO `history_info` VALUES (852, NULL, '221.237.123.2', '中国', '四川省', '成都市', '2025-02-18 15:03:37');
INSERT INTO `history_info` VALUES (853, NULL, '221.237.123.0', '中国', '四川省', '成都市', '2025-02-18 15:08:19');
INSERT INTO `history_info` VALUES (854, NULL, '113.248.21.99', '中国', '重庆', '重庆市', '2025-02-18 15:52:23');
INSERT INTO `history_info` VALUES (855, NULL, '106.12.144.156', '中国', '北京', '北京市', '2025-02-18 17:21:50');
INSERT INTO `history_info` VALUES (856, NULL, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-18 19:19:38');
INSERT INTO `history_info` VALUES (857, 1, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-18 19:59:55');
INSERT INTO `history_info` VALUES (858, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-02-18 20:22:36');
INSERT INTO `history_info` VALUES (859, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-02-18 20:22:36');
INSERT INTO `history_info` VALUES (860, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-02-18 20:22:36');
INSERT INTO `history_info` VALUES (861, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-02-18 20:22:37');
INSERT INTO `history_info` VALUES (862, NULL, '170.39.218.109', '美国', NULL, NULL, '2025-02-19 00:15:40');
INSERT INTO `history_info` VALUES (863, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-02-19 05:06:23');
INSERT INTO `history_info` VALUES (864, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-02-19 05:06:24');
INSERT INTO `history_info` VALUES (865, NULL, '27.115.124.101', '中国', '上海', '上海市', '2025-02-19 06:13:04');
INSERT INTO `history_info` VALUES (866, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-02-19 06:13:05');
INSERT INTO `history_info` VALUES (867, NULL, '27.115.124.70', '中国', '上海', '上海市', '2025-02-19 06:13:05');
INSERT INTO `history_info` VALUES (868, NULL, '171.244.40.20', '越南', '胡志明', '胡志明', '2025-02-19 08:48:48');
INSERT INTO `history_info` VALUES (869, NULL, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-19 20:16:31');
INSERT INTO `history_info` VALUES (870, 1, '106.92.124.183', '中国', '重庆', '重庆市', '2025-02-19 20:16:36');
INSERT INTO `history_info` VALUES (871, NULL, '158.160.162.122', '委内瑞拉', NULL, NULL, '2025-02-19 22:59:09');
INSERT INTO `history_info` VALUES (872, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-02-20 02:34:59');
INSERT INTO `history_info` VALUES (873, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-02-20 02:34:59');
INSERT INTO `history_info` VALUES (874, NULL, '220.196.160.53', '中国', '上海', '上海市', '2025-02-20 02:34:59');
INSERT INTO `history_info` VALUES (875, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-02-20 02:35:00');
INSERT INTO `history_info` VALUES (876, NULL, '40.77.188.176', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:14');
INSERT INTO `history_info` VALUES (877, NULL, '40.77.189.62', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:14');
INSERT INTO `history_info` VALUES (878, NULL, '40.77.188.83', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:15');
INSERT INTO `history_info` VALUES (879, NULL, '40.77.190.101', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:15');
INSERT INTO `history_info` VALUES (880, NULL, '40.77.189.46', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:16');
INSERT INTO `history_info` VALUES (881, NULL, '40.77.189.253', '美国', '伊利诺伊', '芝加哥', '2025-02-20 03:56:17');
INSERT INTO `history_info` VALUES (882, NULL, '146.190.174.167', '美国', '俄勒冈', NULL, '2025-02-20 18:43:37');
INSERT INTO `history_info` VALUES (883, 1, '106.92.127.141', '中国', '重庆', '重庆市', '2025-02-20 19:42:52');
INSERT INTO `history_info` VALUES (884, NULL, '106.92.127.141', '中国', '重庆', '重庆市', '2025-02-20 19:42:52');
INSERT INTO `history_info` VALUES (885, NULL, '36.139.105.112', '中国', NULL, NULL, '2025-02-21 19:57:17');
INSERT INTO `history_info` VALUES (886, NULL, '106.92.127.154', '中国', '重庆', '重庆市', '2025-02-21 21:22:26');
INSERT INTO `history_info` VALUES (887, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-02-22 14:30:42');
INSERT INTO `history_info` VALUES (888, NULL, '45.91.237.194', '荷兰', 'Drenthe', NULL, '2025-02-22 15:40:35');
INSERT INTO `history_info` VALUES (889, NULL, '158.160.162.122', '委内瑞拉', NULL, NULL, '2025-02-22 21:41:45');
INSERT INTO `history_info` VALUES (890, NULL, '51.250.44.58', '英国', NULL, NULL, '2025-02-22 21:48:53');
INSERT INTO `history_info` VALUES (891, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-02-23 02:41:33');
INSERT INTO `history_info` VALUES (892, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-02-23 02:41:33');
INSERT INTO `history_info` VALUES (893, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-02-23 02:41:33');
INSERT INTO `history_info` VALUES (894, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-02-23 05:35:55');
INSERT INTO `history_info` VALUES (895, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-02-23 05:35:55');
INSERT INTO `history_info` VALUES (896, NULL, '193.41.206.246', '罗马尼亚', NULL, NULL, '2025-02-23 07:14:33');
INSERT INTO `history_info` VALUES (897, NULL, '1.92.150.19', '中国', '北京', '北京市', '2025-02-23 14:14:37');
INSERT INTO `history_info` VALUES (898, NULL, '123.249.103.170', '中国', '贵州省', '黔西南', '2025-02-23 15:39:09');
INSERT INTO `history_info` VALUES (899, NULL, '116.205.96.31', '中国', '广东省', '深圳市', '2025-02-23 15:49:48');
INSERT INTO `history_info` VALUES (900, NULL, '110.249.202.204', '中国', '河北省', '石家庄市', '2025-02-24 01:06:33');
INSERT INTO `history_info` VALUES (901, NULL, '110.249.202.192', '中国', '河北省', '石家庄市', '2025-02-24 01:06:33');
INSERT INTO `history_info` VALUES (902, NULL, '110.249.202.208', '中国', '河北省', '石家庄市', '2025-02-24 01:06:33');
INSERT INTO `history_info` VALUES (903, NULL, '110.249.202.190', '中国', '河北省', '石家庄市', '2025-02-24 01:06:33');
INSERT INTO `history_info` VALUES (904, NULL, '110.249.202.209', '中国', '河北省', '石家庄市', '2025-02-24 01:06:33');
INSERT INTO `history_info` VALUES (905, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-02-24 04:10:04');
INSERT INTO `history_info` VALUES (906, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-02-24 07:03:35');
INSERT INTO `history_info` VALUES (907, NULL, '124.70.57.132', '中国', '北京', '北京市', '2025-02-24 08:03:39');
INSERT INTO `history_info` VALUES (908, NULL, '183.229.57.145', '中国', '重庆', '重庆市', '2025-02-24 15:23:37');
INSERT INTO `history_info` VALUES (909, 1, '183.229.57.145', '中国', '重庆', '重庆市', '2025-02-24 15:23:37');
INSERT INTO `history_info` VALUES (910, NULL, '45.119.84.81', '越南', '胡志明', '胡志明', '2025-02-24 22:57:47');
INSERT INTO `history_info` VALUES (911, NULL, '207.102.138.19', '加拿大', '不列颠哥伦比亚', '温哥华', '2025-02-25 18:54:27');
INSERT INTO `history_info` VALUES (912, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-02-25 20:01:37');
INSERT INTO `history_info` VALUES (913, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-02-25 20:01:37');
INSERT INTO `history_info` VALUES (914, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-02-25 20:01:37');
INSERT INTO `history_info` VALUES (915, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-02-26 02:50:40');
INSERT INTO `history_info` VALUES (916, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-02-26 02:50:42');
INSERT INTO `history_info` VALUES (917, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-02-26 08:07:40');
INSERT INTO `history_info` VALUES (918, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-02-26 08:07:40');
INSERT INTO `history_info` VALUES (919, NULL, '205.169.39.57', '美国', NULL, NULL, '2025-02-27 12:06:33');
INSERT INTO `history_info` VALUES (920, 1, '106.92.126.227', '中国', '重庆', '重庆市', '2025-02-27 14:23:11');
INSERT INTO `history_info` VALUES (921, NULL, '106.92.126.227', '中国', '重庆', '重庆市', '2025-02-27 14:23:11');
INSERT INTO `history_info` VALUES (922, NULL, '40.80.158.10', '美国', '加利福尼亚', '圣何塞', '2025-02-27 16:48:49');
INSERT INTO `history_info` VALUES (923, NULL, '175.166.5.214', '中国', '辽宁省', '本溪市', '2025-02-28 11:50:18');
INSERT INTO `history_info` VALUES (924, NULL, '95.245.153.168', '意大利', NULL, NULL, '2025-02-28 15:01:38');
INSERT INTO `history_info` VALUES (925, NULL, '205.169.39.8', '美国', NULL, NULL, '2025-02-28 17:58:04');
INSERT INTO `history_info` VALUES (926, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-03-01 02:55:07');
INSERT INTO `history_info` VALUES (927, NULL, '220.196.160.96', '中国', '上海', '上海市', '2025-03-01 02:55:07');
INSERT INTO `history_info` VALUES (928, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-03-01 02:55:07');
INSERT INTO `history_info` VALUES (929, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-03-01 02:55:08');
INSERT INTO `history_info` VALUES (930, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-03-01 02:55:09');
INSERT INTO `history_info` VALUES (931, NULL, '121.36.96.194', '中国', '北京', '北京市', '2025-03-01 03:08:48');
INSERT INTO `history_info` VALUES (932, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-03-01 11:56:14');
INSERT INTO `history_info` VALUES (933, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-03-01 11:59:14');
INSERT INTO `history_info` VALUES (934, NULL, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-01 13:33:58');
INSERT INTO `history_info` VALUES (935, 1, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-01 13:34:07');
INSERT INTO `history_info` VALUES (936, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-03-02 02:53:59');
INSERT INTO `history_info` VALUES (937, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-03-02 02:53:59');
INSERT INTO `history_info` VALUES (938, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-03-02 02:53:59');
INSERT INTO `history_info` VALUES (939, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-03-02 02:54:00');
INSERT INTO `history_info` VALUES (940, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-03-02 02:54:01');
INSERT INTO `history_info` VALUES (941, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-03-02 05:29:38');
INSERT INTO `history_info` VALUES (942, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-03-02 05:29:42');
INSERT INTO `history_info` VALUES (943, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-03-02 09:54:38');
INSERT INTO `history_info` VALUES (944, NULL, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-02 14:30:05');
INSERT INTO `history_info` VALUES (945, NULL, '1.94.107.209', '中国', '北京', '北京市', '2025-03-02 17:56:43');
INSERT INTO `history_info` VALUES (946, NULL, '172.191.52.232', '美国', NULL, NULL, '2025-03-02 23:52:21');
INSERT INTO `history_info` VALUES (947, NULL, '60.171.147.102', '中国', '安徽省', '安庆市', '2025-03-03 08:23:36');
INSERT INTO `history_info` VALUES (948, NULL, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-03 09:25:27');
INSERT INTO `history_info` VALUES (949, 1, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-03 11:12:44');
INSERT INTO `history_info` VALUES (950, NULL, '141.147.6.15', '瑞典', NULL, NULL, '2025-03-03 17:04:46');
INSERT INTO `history_info` VALUES (951, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-03-03 23:28:33');
INSERT INTO `history_info` VALUES (952, NULL, '106.92.126.227', '中国', '重庆', '重庆市', '2025-03-04 09:17:57');
INSERT INTO `history_info` VALUES (953, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-03-04 09:28:48');
INSERT INTO `history_info` VALUES (954, NULL, '43.156.111.154', '澳大利亚', NULL, NULL, '2025-03-04 16:05:57');
INSERT INTO `history_info` VALUES (955, NULL, '205.169.39.21', '美国', NULL, NULL, '2025-03-04 18:23:45');
INSERT INTO `history_info` VALUES (956, NULL, '205.169.39.3', '美国', NULL, NULL, '2025-03-04 18:26:12');
INSERT INTO `history_info` VALUES (957, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-03-04 19:51:37');
INSERT INTO `history_info` VALUES (958, NULL, '220.196.160.75', '中国', '上海', '上海市', '2025-03-04 19:51:37');
INSERT INTO `history_info` VALUES (959, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-03-04 19:51:37');
INSERT INTO `history_info` VALUES (960, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-03-04 19:51:37');
INSERT INTO `history_info` VALUES (961, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-03-04 19:51:38');
INSERT INTO `history_info` VALUES (962, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-03-04 23:12:42');
INSERT INTO `history_info` VALUES (963, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-03-04 23:12:51');
INSERT INTO `history_info` VALUES (964, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-04 23:12:51');
INSERT INTO `history_info` VALUES (965, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-03-04 23:12:53');
INSERT INTO `history_info` VALUES (966, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-03-05 03:10:24');
INSERT INTO `history_info` VALUES (967, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-03-05 03:10:24');
INSERT INTO `history_info` VALUES (968, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-03-05 03:10:24');
INSERT INTO `history_info` VALUES (969, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-03-05 03:10:25');
INSERT INTO `history_info` VALUES (970, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-03-05 03:10:25');
INSERT INTO `history_info` VALUES (971, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-03-05 03:10:26');
INSERT INTO `history_info` VALUES (972, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-03-05 05:11:59');
INSERT INTO `history_info` VALUES (973, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-03-05 05:12:00');
INSERT INTO `history_info` VALUES (974, NULL, '10.10.111.211', NULL, NULL, '内网IP', '2025-03-06 09:56:52');
INSERT INTO `history_info` VALUES (975, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-03-06 14:11:54');
INSERT INTO `history_info` VALUES (976, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-06 14:12:00');
INSERT INTO `history_info` VALUES (977, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-03-06 14:12:00');
INSERT INTO `history_info` VALUES (978, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-03-06 14:16:20');
INSERT INTO `history_info` VALUES (979, NULL, '34.118.12.176', '美国', '德克萨斯', '休斯顿', '2025-03-06 14:17:39');
INSERT INTO `history_info` VALUES (980, NULL, '205.169.39.35', '美国', NULL, NULL, '2025-03-07 00:46:27');
INSERT INTO `history_info` VALUES (981, NULL, '205.169.39.28', '美国', NULL, NULL, '2025-03-07 00:49:30');
INSERT INTO `history_info` VALUES (982, NULL, '195.154.210.52', '法国', '巴黎', NULL, '2025-03-07 06:00:15');
INSERT INTO `history_info` VALUES (983, NULL, '102.211.152.45', '非洲地区', NULL, NULL, '2025-03-07 23:36:27');
INSERT INTO `history_info` VALUES (984, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-03-08 03:26:23');
INSERT INTO `history_info` VALUES (985, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-03-08 03:26:23');
INSERT INTO `history_info` VALUES (986, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-03-08 03:26:24');
INSERT INTO `history_info` VALUES (987, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-03-08 03:26:26');
INSERT INTO `history_info` VALUES (988, NULL, '205.169.39.87', '美国', NULL, NULL, '2025-03-08 12:04:15');
INSERT INTO `history_info` VALUES (989, NULL, '185.60.136.90', '伊朗', NULL, NULL, '2025-03-08 12:43:52');
INSERT INTO `history_info` VALUES (990, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-03-08 13:24:08');
INSERT INTO `history_info` VALUES (991, NULL, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-08 20:33:54');
INSERT INTO `history_info` VALUES (992, 1, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-08 20:33:54');
INSERT INTO `history_info` VALUES (993, NULL, '205.169.39.15', '美国', NULL, NULL, '2025-03-08 22:03:48');
INSERT INTO `history_info` VALUES (994, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-03-09 03:17:12');
INSERT INTO `history_info` VALUES (995, NULL, '120.46.90.142', '中国', '北京', '北京市', '2025-03-09 03:41:51');
INSERT INTO `history_info` VALUES (996, NULL, '27.115.124.101', '中国', '上海', '上海市', '2025-03-09 04:03:34');
INSERT INTO `history_info` VALUES (997, NULL, '27.115.124.70', '中国', '上海', '上海市', '2025-03-09 04:03:34');
INSERT INTO `history_info` VALUES (998, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-03-09 04:03:34');
INSERT INTO `history_info` VALUES (999, NULL, '27.115.124.6', '中国', '上海', '上海市', '2025-03-09 04:03:35');
INSERT INTO `history_info` VALUES (1000, NULL, '27.115.124.53', '中国', '上海', '上海市', '2025-03-09 04:03:36');
INSERT INTO `history_info` VALUES (1001, NULL, '159.75.198.59', '中国', '北京', '北京市', '2025-03-09 05:35:37');
INSERT INTO `history_info` VALUES (1002, NULL, '106.52.109.61', '中国', '广东省', '广州市', '2025-03-09 05:35:37');
INSERT INTO `history_info` VALUES (1003, NULL, '1.92.131.51', '中国', '北京', '北京市', '2025-03-09 16:10:17');
INSERT INTO `history_info` VALUES (1004, NULL, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-09 19:02:36');
INSERT INTO `history_info` VALUES (1005, 1, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-09 19:02:36');
INSERT INTO `history_info` VALUES (1006, NULL, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-10 01:48:19');
INSERT INTO `history_info` VALUES (1007, 1, '106.92.124.8', '中国', '重庆', '重庆市', '2025-03-10 01:48:19');
INSERT INTO `history_info` VALUES (1008, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-03-10 05:13:51');
INSERT INTO `history_info` VALUES (1009, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2025-03-10 05:17:44');
INSERT INTO `history_info` VALUES (1010, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-03-10 05:21:45');
INSERT INTO `history_info` VALUES (1011, NULL, '123.249.19.46', '中国', '贵州省', '黔西南', '2025-03-10 05:24:51');
INSERT INTO `history_info` VALUES (1012, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-10 14:17:19');
INSERT INTO `history_info` VALUES (1013, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-03-10 14:17:28');
INSERT INTO `history_info` VALUES (1014, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-03-10 14:17:29');
INSERT INTO `history_info` VALUES (1015, NULL, '205.169.39.197', '美国', NULL, NULL, '2025-03-10 14:17:44');
INSERT INTO `history_info` VALUES (1016, NULL, '34.118.72.136', '美国', '德克萨斯', '休斯顿', '2025-03-10 14:18:48');
INSERT INTO `history_info` VALUES (1017, NULL, '205.169.39.45', '美国', NULL, NULL, '2025-03-10 15:32:09');
INSERT INTO `history_info` VALUES (1018, NULL, '117.72.48.23', '中国', '辽宁省', '大连市', '2025-03-11 03:21:10');
INSERT INTO `history_info` VALUES (1019, NULL, '180.101.244.15', '中国', '江苏省', '南京市', '2025-03-11 03:36:08');
INSERT INTO `history_info` VALUES (1020, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-03-11 03:36:08');
INSERT INTO `history_info` VALUES (1021, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-03-11 03:36:08');
INSERT INTO `history_info` VALUES (1022, NULL, '84.252.135.0', '俄罗斯', '莫斯科', '莫斯科', '2025-03-11 17:36:10');
INSERT INTO `history_info` VALUES (1023, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-03-11 19:35:35');
INSERT INTO `history_info` VALUES (1024, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-03-11 19:35:35');
INSERT INTO `history_info` VALUES (1025, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-03-11 19:35:35');
INSERT INTO `history_info` VALUES (1026, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-03-11 19:35:36');
INSERT INTO `history_info` VALUES (1027, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-03-11 19:35:36');
INSERT INTO `history_info` VALUES (1028, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-03-12 05:13:55');
INSERT INTO `history_info` VALUES (1029, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-03-12 05:13:55');
INSERT INTO `history_info` VALUES (1030, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-03-12 07:33:50');
INSERT INTO `history_info` VALUES (1031, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-03-12 13:51:08');
INSERT INTO `history_info` VALUES (1032, NULL, '205.169.39.58', '美国', NULL, NULL, '2025-03-12 20:31:59');
INSERT INTO `history_info` VALUES (1033, NULL, '216.10.250.218', '印度', '马哈拉施特拉', '孟买', '2025-03-13 09:11:10');
INSERT INTO `history_info` VALUES (1034, NULL, '220.196.160.96', '中国', '上海', '上海市', '2025-03-13 19:19:20');
INSERT INTO `history_info` VALUES (1035, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-03-13 19:19:20');
INSERT INTO `history_info` VALUES (1036, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-03-13 19:19:20');
INSERT INTO `history_info` VALUES (1037, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-03-13 19:19:22');
INSERT INTO `history_info` VALUES (1038, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-03-14 02:54:54');
INSERT INTO `history_info` VALUES (1039, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-03-14 02:54:54');
INSERT INTO `history_info` VALUES (1040, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-03-14 02:54:54');
INSERT INTO `history_info` VALUES (1041, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-03-14 02:54:55');
INSERT INTO `history_info` VALUES (1042, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-03-14 02:54:55');
INSERT INTO `history_info` VALUES (1043, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-03-14 02:54:56');
INSERT INTO `history_info` VALUES (1044, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-03-14 14:19:38');
INSERT INTO `history_info` VALUES (1045, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-14 14:19:47');
INSERT INTO `history_info` VALUES (1046, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-03-14 14:19:49');
INSERT INTO `history_info` VALUES (1047, NULL, '34.116.198.232', '美国', '德克萨斯', '休斯顿', '2025-03-14 14:20:31');
INSERT INTO `history_info` VALUES (1048, NULL, '205.169.39.14', '美国', NULL, NULL, '2025-03-15 08:40:24');
INSERT INTO `history_info` VALUES (1049, NULL, '193.41.206.189', '罗马尼亚', NULL, NULL, '2025-03-15 15:02:09');
INSERT INTO `history_info` VALUES (1050, NULL, '35.195.46.0', '美国', '南卡罗来纳', NULL, '2025-03-15 19:25:49');
INSERT INTO `history_info` VALUES (1051, NULL, '144.208.75.130', '美国', '弗吉尼亚', '阿什本', '2025-03-15 21:31:23');
INSERT INTO `history_info` VALUES (1052, NULL, '103.195.140.221', '孟加拉', NULL, NULL, '2025-03-15 22:10:50');
INSERT INTO `history_info` VALUES (1053, NULL, '106.92.125.235', '中国', '重庆', '重庆市', '2025-03-15 22:25:36');
INSERT INTO `history_info` VALUES (1054, NULL, '154.39.152.232', '美国', NULL, NULL, '2025-03-16 04:59:54');
INSERT INTO `history_info` VALUES (1055, NULL, '43.144.106.82', '澳大利亚', NULL, NULL, '2025-03-16 05:12:04');
INSERT INTO `history_info` VALUES (1056, NULL, '159.75.198.125', '中国', '北京', '北京市', '2025-03-16 05:12:04');
INSERT INTO `history_info` VALUES (1057, NULL, '116.205.96.31', '中国', '广东省', '深圳市', '2025-03-16 09:36:37');
INSERT INTO `history_info` VALUES (1058, NULL, '123.249.19.46', '中国', '贵州省', '黔西南', '2025-03-16 09:50:37');
INSERT INTO `history_info` VALUES (1059, NULL, '1.92.149.201', '中国', '北京', '北京市', '2025-03-16 09:55:13');
INSERT INTO `history_info` VALUES (1060, NULL, '152.32.171.112', '中国', '香港', NULL, '2025-03-16 16:41:27');
INSERT INTO `history_info` VALUES (1061, NULL, '144.126.146.166', '美国', '马里兰', NULL, '2025-03-16 17:05:17');
INSERT INTO `history_info` VALUES (1062, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-03-17 02:59:53');
INSERT INTO `history_info` VALUES (1063, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-03-17 02:59:53');
INSERT INTO `history_info` VALUES (1064, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-03-17 02:59:53');
INSERT INTO `history_info` VALUES (1065, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-03-17 02:59:54');
INSERT INTO `history_info` VALUES (1066, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-03-17 02:59:54');
INSERT INTO `history_info` VALUES (1067, NULL, '162.62.232.128', '俄罗斯', '莫斯科', '莫斯科', '2025-03-18 06:16:24');
INSERT INTO `history_info` VALUES (1068, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-18 14:19:59');
INSERT INTO `history_info` VALUES (1069, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-03-18 14:20:11');
INSERT INTO `history_info` VALUES (1070, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-03-18 14:20:11');
INSERT INTO `history_info` VALUES (1071, NULL, '34.118.92.219', '美国', '德克萨斯', '休斯顿', '2025-03-18 14:20:51');
INSERT INTO `history_info` VALUES (1072, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-03-18 16:17:38');
INSERT INTO `history_info` VALUES (1073, NULL, '205.169.39.47', '美国', NULL, NULL, '2025-03-18 16:54:29');
INSERT INTO `history_info` VALUES (1074, NULL, '205.169.39.45', '美国', NULL, NULL, '2025-03-18 16:57:03');
INSERT INTO `history_info` VALUES (1075, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-03-18 18:53:35');
INSERT INTO `history_info` VALUES (1076, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-03-18 18:53:35');
INSERT INTO `history_info` VALUES (1077, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-03-18 18:53:35');
INSERT INTO `history_info` VALUES (1078, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-03-18 18:53:36');
INSERT INTO `history_info` VALUES (1079, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-03-18 18:53:36');
INSERT INTO `history_info` VALUES (1080, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-03-18 18:53:36');
INSERT INTO `history_info` VALUES (1081, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-03-19 04:55:14');
INSERT INTO `history_info` VALUES (1082, NULL, '106.55.244.169', '中国', '广东省', '广州市', '2025-03-19 04:55:14');
INSERT INTO `history_info` VALUES (1083, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-03-19 09:46:11');
INSERT INTO `history_info` VALUES (1084, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-03-19 09:52:18');
INSERT INTO `history_info` VALUES (1085, NULL, '162.62.233.142', '俄罗斯', '莫斯科', '莫斯科', '2025-03-19 10:18:24');
INSERT INTO `history_info` VALUES (1086, NULL, '1.92.153.111', '中国', '北京', '北京市', '2025-03-19 14:21:38');
INSERT INTO `history_info` VALUES (1087, NULL, '111.23.122.227', '中国', '湖南省', '岳阳市', '2025-03-19 17:36:18');
INSERT INTO `history_info` VALUES (1088, NULL, '220.250.52.123', '中国', '福建省', '福州市', '2025-03-19 20:43:16');
INSERT INTO `history_info` VALUES (1089, NULL, '92.55.190.215', '哈萨克斯坦', NULL, NULL, '2025-03-20 02:44:51');
INSERT INTO `history_info` VALUES (1090, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-03-20 03:13:35');
INSERT INTO `history_info` VALUES (1091, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-03-20 03:13:35');
INSERT INTO `history_info` VALUES (1092, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-03-20 03:13:35');
INSERT INTO `history_info` VALUES (1093, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-03-20 03:13:37');
INSERT INTO `history_info` VALUES (1094, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-03-20 18:23:18');
INSERT INTO `history_info` VALUES (1095, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-03-20 18:23:18');
INSERT INTO `history_info` VALUES (1096, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-03-20 18:23:18');
INSERT INTO `history_info` VALUES (1097, NULL, '205.169.39.4', '美国', NULL, NULL, '2025-03-20 19:04:00');
INSERT INTO `history_info` VALUES (1098, NULL, '205.169.39.32', '美国', NULL, NULL, '2025-03-20 19:07:03');
INSERT INTO `history_info` VALUES (1099, NULL, '212.102.33.152', '美国', '纽约', '纽约', '2025-03-21 00:25:00');
INSERT INTO `history_info` VALUES (1100, NULL, '205.169.39.27', '美国', NULL, NULL, '2025-03-21 05:02:29');
INSERT INTO `history_info` VALUES (1101, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-03-21 08:05:31');
INSERT INTO `history_info` VALUES (1102, NULL, '120.46.91.225', '中国', '北京', '北京市', '2025-03-21 08:24:25');
INSERT INTO `history_info` VALUES (1103, NULL, '106.92.126.185', '中国', '重庆', '重庆市', '2025-03-21 10:05:10');
INSERT INTO `history_info` VALUES (1104, NULL, '198.58.124.251', '美国', '德克萨斯', '达拉斯', '2025-03-21 16:05:48');
INSERT INTO `history_info` VALUES (1105, NULL, '40.77.188.117', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:18');
INSERT INTO `history_info` VALUES (1106, NULL, '40.77.188.200', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:18');
INSERT INTO `history_info` VALUES (1107, NULL, '40.77.190.100', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:19');
INSERT INTO `history_info` VALUES (1108, NULL, '40.77.190.7', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:19');
INSERT INTO `history_info` VALUES (1109, NULL, '40.77.189.229', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:20');
INSERT INTO `history_info` VALUES (1110, NULL, '40.77.189.124', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:20');
INSERT INTO `history_info` VALUES (1111, NULL, '40.77.189.99', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:21');
INSERT INTO `history_info` VALUES (1112, NULL, '40.77.189.53', '美国', '伊利诺伊', '芝加哥', '2025-03-21 21:23:21');
INSERT INTO `history_info` VALUES (1113, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-03-22 14:27:03');
INSERT INTO `history_info` VALUES (1114, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-03-22 14:27:12');
INSERT INTO `history_info` VALUES (1115, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-03-22 14:27:12');
INSERT INTO `history_info` VALUES (1116, NULL, '34.118.10.215', '美国', '德克萨斯', '休斯顿', '2025-03-22 14:27:40');
INSERT INTO `history_info` VALUES (1117, NULL, '110.249.202.85', '中国', '河北省', '石家庄市', '2025-03-22 18:37:21');
INSERT INTO `history_info` VALUES (1118, NULL, '110.249.202.101', '中国', '河北省', '石家庄市', '2025-03-22 18:37:21');
INSERT INTO `history_info` VALUES (1119, NULL, '110.249.202.99', '中国', '河北省', '石家庄市', '2025-03-22 18:37:21');
INSERT INTO `history_info` VALUES (1120, NULL, '110.249.202.87', '中国', '河北省', '石家庄市', '2025-03-22 18:37:21');
INSERT INTO `history_info` VALUES (1121, NULL, '110.249.202.94', '中国', '河北省', '石家庄市', '2025-03-22 18:37:21');
INSERT INTO `history_info` VALUES (1122, NULL, '205.169.39.13', '美国', NULL, NULL, '2025-03-22 19:13:28');
INSERT INTO `history_info` VALUES (1123, NULL, '106.92.126.185', '中国', '重庆', '重庆市', '2025-03-22 21:54:58');
INSERT INTO `history_info` VALUES (1124, NULL, '220.196.160.51', '中国', '上海', '上海市', '2025-03-23 03:48:28');
INSERT INTO `history_info` VALUES (1125, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-03-23 03:48:28');
INSERT INTO `history_info` VALUES (1126, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-03-23 03:48:28');
INSERT INTO `history_info` VALUES (1127, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-03-23 03:48:29');
INSERT INTO `history_info` VALUES (1128, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-03-23 03:48:29');
INSERT INTO `history_info` VALUES (1129, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-03-23 05:30:37');
INSERT INTO `history_info` VALUES (1130, NULL, '116.205.116.126', '中国', '广东省', '深圳市', '2025-03-23 17:18:32');
INSERT INTO `history_info` VALUES (1131, NULL, '61.242.178.115', '中国', '湖北省', '武汉市', '2025-03-24 03:12:20');
INSERT INTO `history_info` VALUES (1132, NULL, '43.134.91.55', '澳大利亚', NULL, NULL, '2025-03-24 04:38:55');
INSERT INTO `history_info` VALUES (1133, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-03-24 09:12:40');
INSERT INTO `history_info` VALUES (1134, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-03-24 10:59:20');
INSERT INTO `history_info` VALUES (1135, NULL, '164.90.226.218', '德国', '法兰克福', '法兰克福', '2025-03-25 08:31:11');
INSERT INTO `history_info` VALUES (1136, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-03-25 18:21:31');
INSERT INTO `history_info` VALUES (1137, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-03-25 18:21:31');
INSERT INTO `history_info` VALUES (1138, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-03-25 18:21:31');
INSERT INTO `history_info` VALUES (1139, NULL, '220.196.160.117', '中国', '上海', '上海市', '2025-03-25 18:21:32');
INSERT INTO `history_info` VALUES (1140, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-03-25 18:21:32');
INSERT INTO `history_info` VALUES (1141, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-03-25 18:21:32');
INSERT INTO `history_info` VALUES (1142, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-03-26 03:45:20');
INSERT INTO `history_info` VALUES (1143, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-03-26 03:45:20');
INSERT INTO `history_info` VALUES (1144, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-03-26 03:45:20');
INSERT INTO `history_info` VALUES (1145, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-03-26 03:45:20');
INSERT INTO `history_info` VALUES (1146, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-03-26 03:45:21');
INSERT INTO `history_info` VALUES (1147, NULL, '37.58.18.237', '土耳其', NULL, NULL, '2025-03-26 05:00:57');
INSERT INTO `history_info` VALUES (1148, NULL, '106.52.109.61', '中国', '广东省', '广州市', '2025-03-26 05:05:23');
INSERT INTO `history_info` VALUES (1149, NULL, '159.75.198.59', '中国', '北京', '北京市', '2025-03-26 05:05:23');
INSERT INTO `history_info` VALUES (1150, NULL, '124.70.63.89', '中国', '北京', '北京市', '2025-03-26 07:16:32');
INSERT INTO `history_info` VALUES (1151, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-03-26 07:17:27');
INSERT INTO `history_info` VALUES (1152, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-03-26 17:57:12');
INSERT INTO `history_info` VALUES (1153, NULL, '154.31.114.51', '美国', '纽约', '纽约', '2025-03-27 13:03:27');
INSERT INTO `history_info` VALUES (1154, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-03-27 17:05:55');
INSERT INTO `history_info` VALUES (1155, NULL, '123.249.103.170', '中国', '贵州省', '黔西南', '2025-03-28 05:13:17');
INSERT INTO `history_info` VALUES (1156, NULL, '27.115.124.53', '中国', '上海', '上海市', '2025-03-28 06:04:00');
INSERT INTO `history_info` VALUES (1157, NULL, '27.115.124.6', '中国', '上海', '上海市', '2025-03-28 06:04:00');
INSERT INTO `history_info` VALUES (1158, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-03-28 06:04:00');
INSERT INTO `history_info` VALUES (1159, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-03-29 04:03:26');
INSERT INTO `history_info` VALUES (1160, NULL, '130.61.147.59', '德国', '法兰克福', '法兰克福', '2025-03-29 14:51:58');
INSERT INTO `history_info` VALUES (1161, NULL, '111.225.148.141', '中国', '河北省', '张家口市', '2025-03-29 18:26:14');
INSERT INTO `history_info` VALUES (1162, NULL, '111.225.148.134', '中国', '河北省', '张家口市', '2025-03-29 18:26:14');
INSERT INTO `history_info` VALUES (1163, NULL, '111.225.148.149', '中国', '河北省', '张家口市', '2025-03-29 18:26:14');
INSERT INTO `history_info` VALUES (1164, NULL, '111.225.148.137', '中国', '河北省', '张家口市', '2025-03-29 18:26:14');
INSERT INTO `history_info` VALUES (1165, NULL, '111.225.148.136', '中国', '河北省', '张家口市', '2025-03-29 18:26:16');
INSERT INTO `history_info` VALUES (1166, NULL, '159.75.198.125', '中国', '北京', '北京市', '2025-03-30 05:30:48');
INSERT INTO `history_info` VALUES (1167, NULL, '43.144.106.82', '澳大利亚', NULL, NULL, '2025-03-30 05:30:56');
INSERT INTO `history_info` VALUES (1168, NULL, '154.83.103.17', '中国', '香港', NULL, '2025-03-31 10:13:35');
INSERT INTO `history_info` VALUES (1169, NULL, '129.213.98.195', '美国', '弗吉尼亚', '阿什本', '2025-03-31 12:29:14');
INSERT INTO `history_info` VALUES (1170, NULL, '132.145.231.62', '德国', '法兰克福', '法兰克福', '2025-03-31 17:29:16');
INSERT INTO `history_info` VALUES (1171, NULL, '185.213.174.118', '荷兰', 'Flevoland', NULL, '2025-03-31 20:33:29');
INSERT INTO `history_info` VALUES (1172, NULL, '103.154.143.162', '印度', NULL, NULL, '2025-04-01 03:57:46');
INSERT INTO `history_info` VALUES (1173, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-04-01 17:50:40');
INSERT INTO `history_info` VALUES (1174, NULL, '51.159.14.65', '美国', NULL, NULL, '2025-04-01 21:25:23');
INSERT INTO `history_info` VALUES (1175, NULL, '51.68.46.249', '英国', NULL, NULL, '2025-04-02 03:17:02');
INSERT INTO `history_info` VALUES (1176, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-04-02 03:43:32');
INSERT INTO `history_info` VALUES (1177, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-04-02 05:32:32');
INSERT INTO `history_info` VALUES (1178, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-04-02 05:32:36');
INSERT INTO `history_info` VALUES (1179, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-04-02 21:35:26');
INSERT INTO `history_info` VALUES (1180, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-04-02 21:48:53');
INSERT INTO `history_info` VALUES (1181, NULL, '123.249.19.46', '中国', '贵州省', '黔西南', '2025-04-02 21:49:58');
INSERT INTO `history_info` VALUES (1182, NULL, '123.249.75.79', '中国', '贵州省', '黔西南', '2025-04-02 22:04:22');
INSERT INTO `history_info` VALUES (1183, NULL, '154.83.103.18', '中国', '香港', NULL, '2025-04-03 01:52:33');
INSERT INTO `history_info` VALUES (1184, NULL, '154.83.103.19', '中国', '香港', NULL, '2025-04-03 12:52:02');
INSERT INTO `history_info` VALUES (1185, NULL, '58.211.18.68', '中国', '江苏省', '苏州市', '2025-04-03 14:01:44');
INSERT INTO `history_info` VALUES (1186, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-04-03 17:09:22');
INSERT INTO `history_info` VALUES (1187, NULL, '121.141.64.135', '韩国', '首尔', NULL, '2025-04-04 00:09:58');
INSERT INTO `history_info` VALUES (1188, NULL, '205.169.39.58', '美国', NULL, NULL, '2025-04-05 01:17:58');
INSERT INTO `history_info` VALUES (1189, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-04-05 04:04:48');
INSERT INTO `history_info` VALUES (1190, NULL, '160.191.89.4', '日本', NULL, NULL, '2025-04-05 18:19:11');
INSERT INTO `history_info` VALUES (1191, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-04-05 22:42:41');
INSERT INTO `history_info` VALUES (1192, NULL, '115.190.14.221', '中国', '湖北省', '武汉市', '2025-04-06 03:49:09');
INSERT INTO `history_info` VALUES (1193, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-04-06 05:05:44');
INSERT INTO `history_info` VALUES (1194, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-04-06 05:05:45');
INSERT INTO `history_info` VALUES (1195, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-04-06 18:19:33');
INSERT INTO `history_info` VALUES (1196, NULL, '27.115.124.45', '中国', '上海', '上海市', '2025-04-06 19:04:05');
INSERT INTO `history_info` VALUES (1197, NULL, '27.115.124.6', '中国', '上海', '上海市', '2025-04-06 19:04:05');
INSERT INTO `history_info` VALUES (1198, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-04-06 19:04:05');
INSERT INTO `history_info` VALUES (1199, NULL, '27.115.124.38', '中国', '上海', '上海市', '2025-04-06 19:04:10');
INSERT INTO `history_info` VALUES (1200, NULL, '115.190.47.129', '中国', '湖北省', '武汉市', '2025-04-07 06:02:05');
INSERT INTO `history_info` VALUES (1201, NULL, '43.240.223.15', '中国', '北京', '北京市', '2025-04-07 11:01:17');
INSERT INTO `history_info` VALUES (1202, NULL, '1.92.134.182', '中国', '北京', '北京市', '2025-04-07 11:11:21');
INSERT INTO `history_info` VALUES (1203, NULL, '84.201.181.85', '俄罗斯', '莫斯科', '莫斯科', '2025-04-07 18:23:27');
INSERT INTO `history_info` VALUES (1204, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-04-07 22:29:58');
INSERT INTO `history_info` VALUES (1205, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-04-07 23:07:11');
INSERT INTO `history_info` VALUES (1206, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-04-08 03:43:51');
INSERT INTO `history_info` VALUES (1207, NULL, '128.1.84.190', '美国', '加利福尼亚', NULL, '2025-04-08 04:30:59');
INSERT INTO `history_info` VALUES (1208, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-04-08 13:36:54');
INSERT INTO `history_info` VALUES (1209, NULL, '185.226.197.64', '土耳其', 'Antalya', NULL, '2025-04-08 16:19:46');
INSERT INTO `history_info` VALUES (1210, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-04-08 17:26:00');
INSERT INTO `history_info` VALUES (1211, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-04-08 17:26:00');
INSERT INTO `history_info` VALUES (1212, NULL, '129.211.167.70', '中国', '江苏省', '南京市', '2025-04-08 17:26:00');
INSERT INTO `history_info` VALUES (1213, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-04-09 05:16:29');
INSERT INTO `history_info` VALUES (1214, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-04-09 05:16:29');
INSERT INTO `history_info` VALUES (1215, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-04-09 09:20:49');
INSERT INTO `history_info` VALUES (1216, NULL, '103.150.60.130', '印度尼西亚', '大雅加达', '雅加达', '2025-04-09 19:05:24');
INSERT INTO `history_info` VALUES (1217, NULL, '116.205.99.55', '中国', '广东省', '深圳市', '2025-04-10 04:43:20');
INSERT INTO `history_info` VALUES (1218, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-04-10 16:27:56');
INSERT INTO `history_info` VALUES (1219, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-04-11 02:57:57');
INSERT INTO `history_info` VALUES (1220, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-04-11 05:51:04');
INSERT INTO `history_info` VALUES (1221, NULL, '120.46.91.225', '中国', '北京', '北京市', '2025-04-11 05:51:29');
INSERT INTO `history_info` VALUES (1222, NULL, '1.92.149.201', '中国', '北京', '北京市', '2025-04-11 05:51:56');
INSERT INTO `history_info` VALUES (1223, NULL, '123.249.103.170', '中国', '贵州省', '黔西南', '2025-04-11 07:13:20');
INSERT INTO `history_info` VALUES (1224, NULL, '51.159.103.22', '美国', NULL, NULL, '2025-04-11 07:23:41');
INSERT INTO `history_info` VALUES (1225, NULL, '27.115.124.109', '中国', '上海', '上海市', '2025-04-11 08:03:41');
INSERT INTO `history_info` VALUES (1226, NULL, '27.115.124.53', '中国', '上海', '上海市', '2025-04-11 08:03:41');
INSERT INTO `history_info` VALUES (1227, NULL, '27.115.124.38', '中国', '上海', '上海市', '2025-04-11 08:03:41');
INSERT INTO `history_info` VALUES (1228, NULL, '59.173.29.224', '中国', '湖北省', '武汉市', '2025-04-11 22:45:06');
INSERT INTO `history_info` VALUES (1229, NULL, '157.245.230.224', '美国', '纽约', '纽约', '2025-04-12 03:44:47');
INSERT INTO `history_info` VALUES (1230, NULL, '120.46.16.109', '中国', '北京', '北京市', '2025-04-12 07:18:03');
INSERT INTO `history_info` VALUES (1231, NULL, '180.178.94.73', '印度尼西亚', '中爪哇', NULL, '2025-04-13 03:28:57');
INSERT INTO `history_info` VALUES (1232, NULL, '106.55.245.27', '中国', '广东省', '广州市', '2025-04-13 05:38:32');
INSERT INTO `history_info` VALUES (1233, NULL, '159.75.198.232', '中国', '北京', '北京市', '2025-04-13 05:38:32');
INSERT INTO `history_info` VALUES (1234, NULL, '43.157.198.156', '澳大利亚', NULL, NULL, '2025-04-13 17:12:57');
INSERT INTO `history_info` VALUES (1235, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-04-13 21:03:24');
INSERT INTO `history_info` VALUES (1236, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-04-14 03:19:14');
INSERT INTO `history_info` VALUES (1237, NULL, '193.149.176.227', '丹麦', '哥本哈根', NULL, '2025-04-14 06:48:58');
INSERT INTO `history_info` VALUES (1238, NULL, '111.225.148.47', '中国', '河北省', '张家口市', '2025-04-14 10:11:57');
INSERT INTO `history_info` VALUES (1239, NULL, '111.225.148.55', '中国', '河北省', '张家口市', '2025-04-14 10:11:57');
INSERT INTO `history_info` VALUES (1240, NULL, '111.225.148.51', '中国', '河北省', '张家口市', '2025-04-14 10:11:57');
INSERT INTO `history_info` VALUES (1241, NULL, '111.225.148.56', '中国', '河北省', '张家口市', '2025-04-14 10:11:58');
INSERT INTO `history_info` VALUES (1242, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-04-14 13:45:51');
INSERT INTO `history_info` VALUES (1243, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-04-14 21:36:52');
INSERT INTO `history_info` VALUES (1244, NULL, '112.6.214.244', '中国', '山东省', '烟台市', '2025-04-15 03:03:29');
INSERT INTO `history_info` VALUES (1245, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-04-15 07:18:08');
INSERT INTO `history_info` VALUES (1246, NULL, '220.196.160.53', '中国', '上海', '上海市', '2025-04-15 17:01:42');
INSERT INTO `history_info` VALUES (1247, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-04-17 03:16:09');
INSERT INTO `history_info` VALUES (1248, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-04-17 15:58:31');
INSERT INTO `history_info` VALUES (1249, NULL, '58.211.18.68', '中国', '江苏省', '苏州市', '2025-04-18 20:54:33');
INSERT INTO `history_info` VALUES (1250, NULL, '154.83.103.201', '中国', '香港', NULL, '2025-04-19 11:32:03');
INSERT INTO `history_info` VALUES (1251, NULL, '40.77.190.217', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:10');
INSERT INTO `history_info` VALUES (1252, NULL, '40.77.190.63', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:10');
INSERT INTO `history_info` VALUES (1253, NULL, '40.77.188.94', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:10');
INSERT INTO `history_info` VALUES (1254, NULL, '40.77.189.138', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:10');
INSERT INTO `history_info` VALUES (1255, NULL, '40.77.188.216', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:11');
INSERT INTO `history_info` VALUES (1256, NULL, '40.77.190.11', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:12');
INSERT INTO `history_info` VALUES (1257, NULL, '40.77.188.141', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:12');
INSERT INTO `history_info` VALUES (1258, NULL, '40.77.189.97', '美国', '伊利诺伊', '芝加哥', '2025-04-19 23:19:55');
INSERT INTO `history_info` VALUES (1259, NULL, '1.92.149.201', '中国', '北京', '北京市', '2025-04-20 03:18:19');
INSERT INTO `history_info` VALUES (1260, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-04-20 03:33:13');
INSERT INTO `history_info` VALUES (1261, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-04-20 05:49:35');
INSERT INTO `history_info` VALUES (1262, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-04-20 05:49:40');
INSERT INTO `history_info` VALUES (1263, NULL, '120.46.16.109', '中国', '北京', '北京市', '2025-04-20 19:06:11');
INSERT INTO `history_info` VALUES (1264, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-04-21 00:07:28');
INSERT INTO `history_info` VALUES (1265, NULL, '117.50.221.158', '中国', '北京', '北京市', '2025-04-21 08:05:58');
INSERT INTO `history_info` VALUES (1266, NULL, '111.225.148.182', '中国', '河北省', '张家口市', '2025-04-21 09:53:26');
INSERT INTO `history_info` VALUES (1267, NULL, '111.225.148.180', '中国', '河北省', '张家口市', '2025-04-21 09:53:26');
INSERT INTO `history_info` VALUES (1268, NULL, '111.225.148.179', '中国', '河北省', '张家口市', '2025-04-21 09:53:27');
INSERT INTO `history_info` VALUES (1269, NULL, '1.92.134.182', '中国', '北京', '北京市', '2025-04-21 12:14:01');
INSERT INTO `history_info` VALUES (1270, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-04-21 13:29:36');
INSERT INTO `history_info` VALUES (1271, NULL, '14.103.225.56', '中国', '广东省', '深圳市', '2025-04-21 18:28:43');
INSERT INTO `history_info` VALUES (1272, NULL, '129.211.167.70', '中国', '江苏省', '南京市', '2025-04-22 16:29:03');
INSERT INTO `history_info` VALUES (1273, NULL, '129.211.162.158', '中国', '江苏省', '南京市', '2025-04-22 16:29:03');
INSERT INTO `history_info` VALUES (1274, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-04-22 16:29:03');
INSERT INTO `history_info` VALUES (1275, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-04-23 03:23:02');
INSERT INTO `history_info` VALUES (1276, NULL, '121.37.248.179', '中国', '广东省', '广州市', '2025-04-23 05:03:07');
INSERT INTO `history_info` VALUES (1277, NULL, '159.75.198.232', '中国', '北京', '北京市', '2025-04-23 05:30:24');
INSERT INTO `history_info` VALUES (1278, NULL, '106.55.245.27', '中国', '广东省', '广州市', '2025-04-23 05:30:24');
INSERT INTO `history_info` VALUES (1279, NULL, '158.180.25.186', '英国', NULL, NULL, '2025-04-23 08:15:28');
INSERT INTO `history_info` VALUES (1280, NULL, '113.143.36.150', '中国', '陕西省', '铜川市', '2025-04-23 19:45:17');
INSERT INTO `history_info` VALUES (1281, NULL, '216.10.250.218', '印度', '马哈拉施特拉', '孟买', '2025-04-24 00:01:18');
INSERT INTO `history_info` VALUES (1282, NULL, '40.77.190.181', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:04');
INSERT INTO `history_info` VALUES (1283, NULL, '40.77.190.117', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:04');
INSERT INTO `history_info` VALUES (1284, NULL, '40.77.188.19', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:04');
INSERT INTO `history_info` VALUES (1285, NULL, '40.77.189.40', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:04');
INSERT INTO `history_info` VALUES (1286, NULL, '40.77.189.247', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:06');
INSERT INTO `history_info` VALUES (1287, NULL, '40.77.188.109', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:06');
INSERT INTO `history_info` VALUES (1288, NULL, '40.77.190.215', '美国', '伊利诺伊', '芝加哥', '2025-04-24 05:13:07');
INSERT INTO `history_info` VALUES (1289, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-04-24 07:24:15');
INSERT INTO `history_info` VALUES (1290, NULL, '218.250.231.191', '中国', '香港', NULL, '2025-04-24 08:13:54');
INSERT INTO `history_info` VALUES (1291, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-04-24 09:40:22');
INSERT INTO `history_info` VALUES (1292, NULL, '120.46.91.225', '中国', '北京', '北京市', '2025-04-24 09:44:02');
INSERT INTO `history_info` VALUES (1293, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-04-24 09:46:22');
INSERT INTO `history_info` VALUES (1294, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-04-24 15:44:52');
INSERT INTO `history_info` VALUES (1295, NULL, '205.169.39.4', '美国', NULL, NULL, '2025-04-26 02:58:35');
INSERT INTO `history_info` VALUES (1296, NULL, '205.169.39.13', '美国', NULL, NULL, '2025-04-26 03:00:49');
INSERT INTO `history_info` VALUES (1297, NULL, '220.196.160.124', '中国', '上海', '上海市', '2025-04-26 03:21:11');
INSERT INTO `history_info` VALUES (1298, NULL, '116.205.99.55', '中国', '广东省', '深圳市', '2025-04-26 05:40:23');
INSERT INTO `history_info` VALUES (1299, NULL, '120.46.91.225', '中国', '北京', '北京市', '2025-04-26 07:31:48');
INSERT INTO `history_info` VALUES (1300, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-04-26 07:38:28');
INSERT INTO `history_info` VALUES (1301, NULL, '64.44.159.34', '美国', '伊利诺伊', '芝加哥', '2025-04-26 22:04:10');
INSERT INTO `history_info` VALUES (1302, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-04-27 00:54:24');
INSERT INTO `history_info` VALUES (1303, NULL, '205.169.39.22', '美国', NULL, NULL, '2025-04-27 01:16:45');
INSERT INTO `history_info` VALUES (1304, NULL, '205.169.39.15', '美国', NULL, NULL, '2025-04-27 01:19:13');
INSERT INTO `history_info` VALUES (1305, NULL, '159.75.198.113', '中国', '北京', '北京市', '2025-04-27 05:28:18');
INSERT INTO `history_info` VALUES (1306, NULL, '106.52.79.248', '中国', '广东省', '广州市', '2025-04-27 05:28:18');
INSERT INTO `history_info` VALUES (1307, NULL, '103.154.143.162', '印度', NULL, NULL, '2025-04-27 14:16:55');
INSERT INTO `history_info` VALUES (1308, NULL, '205.169.39.42', '美国', NULL, NULL, '2025-04-27 15:29:13');
INSERT INTO `history_info` VALUES (1309, NULL, '110.249.201.104', '中国', '河北省', '石家庄市', '2025-04-28 09:53:02');
INSERT INTO `history_info` VALUES (1310, NULL, '110.249.201.109', '中国', '河北省', '石家庄市', '2025-04-28 09:53:02');
INSERT INTO `history_info` VALUES (1311, NULL, '110.249.201.105', '中国', '河北省', '石家庄市', '2025-04-28 09:53:02');
INSERT INTO `history_info` VALUES (1312, NULL, '110.249.201.111', '中国', '河北省', '石家庄市', '2025-04-28 09:53:03');
INSERT INTO `history_info` VALUES (1313, NULL, '205.169.39.12', '美国', NULL, NULL, '2025-04-28 12:24:56');
INSERT INTO `history_info` VALUES (1314, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-04-28 22:46:05');
INSERT INTO `history_info` VALUES (1315, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-04-29 03:42:32');
INSERT INTO `history_info` VALUES (1316, NULL, '8.209.214.165', '日本', '东京都', '东京', '2025-04-29 07:41:34');
INSERT INTO `history_info` VALUES (1317, NULL, '129.211.167.70', '中国', '江苏省', '南京市', '2025-04-29 15:28:42');
INSERT INTO `history_info` VALUES (1318, NULL, '129.211.162.158', '中国', '江苏省', '南京市', '2025-04-29 15:28:42');
INSERT INTO `history_info` VALUES (1319, NULL, '205.169.39.54', '美国', NULL, NULL, '2025-04-29 17:50:26');
INSERT INTO `history_info` VALUES (1320, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-04-30 05:30:57');
INSERT INTO `history_info` VALUES (1321, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-04-30 05:30:57');
INSERT INTO `history_info` VALUES (1322, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-04-30 12:16:19');
INSERT INTO `history_info` VALUES (1323, NULL, '210.113.70.126', '韩国', NULL, NULL, '2025-04-30 18:50:44');
INSERT INTO `history_info` VALUES (1324, NULL, '130.162.242.32', '荷兰', '阿姆斯特丹', '阿姆斯特丹', '2025-04-30 23:46:14');
INSERT INTO `history_info` VALUES (1325, NULL, '34.34.185.61', '美国', '德克萨斯', '休斯顿', '2025-05-01 03:10:18');
INSERT INTO `history_info` VALUES (1326, NULL, '219.132.37.52', '中国', '广东省', '湛江市', '2025-05-01 04:26:28');
INSERT INTO `history_info` VALUES (1327, NULL, '104.248.254.144', '德国', '法兰克福', '法兰克福', '2025-05-01 05:12:28');
INSERT INTO `history_info` VALUES (1328, NULL, '103.39.93.93', '越南', '河内', NULL, '2025-05-01 07:16:48');
INSERT INTO `history_info` VALUES (1329, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-05-01 13:31:11');
INSERT INTO `history_info` VALUES (1330, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-05-01 13:31:15');
INSERT INTO `history_info` VALUES (1331, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-05-01 13:31:16');
INSERT INTO `history_info` VALUES (1332, NULL, '34.118.75.217', '美国', '德克萨斯', '休斯顿', '2025-05-01 13:33:04');
INSERT INTO `history_info` VALUES (1333, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-05-01 14:31:15');
INSERT INTO `history_info` VALUES (1334, NULL, '123.249.126.59', '中国', '贵州省', '黔西南', '2025-05-02 00:06:24');
INSERT INTO `history_info` VALUES (1335, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-05-02 03:48:10');
INSERT INTO `history_info` VALUES (1336, NULL, '104.248.254.144', '德国', '法兰克福', '法兰克福', '2025-05-02 07:52:31');
INSERT INTO `history_info` VALUES (1337, NULL, '205.169.39.5', '美国', NULL, NULL, '2025-05-02 10:53:26');
INSERT INTO `history_info` VALUES (1338, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-05-02 13:37:38');
INSERT INTO `history_info` VALUES (1339, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-05-03 07:24:45');
INSERT INTO `history_info` VALUES (1340, NULL, '117.72.103.129', '中国', '北京', '北京市', '2025-05-03 11:26:39');
INSERT INTO `history_info` VALUES (1341, NULL, '195.178.110.161', '美国', '马里兰', NULL, '2025-05-03 23:29:03');
INSERT INTO `history_info` VALUES (1342, NULL, '111.12.81.147', '中国', '广西', '桂林市', '2025-05-04 02:57:13');
INSERT INTO `history_info` VALUES (1343, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-05-04 05:32:26');
INSERT INTO `history_info` VALUES (1344, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-05-04 05:32:26');
INSERT INTO `history_info` VALUES (1345, NULL, '195.154.210.52', '法国', '巴黎', NULL, '2025-05-04 07:41:23');
INSERT INTO `history_info` VALUES (1346, NULL, '106.55.244.169', '中国', '广东省', '广州市', '2025-05-04 11:06:28');
INSERT INTO `history_info` VALUES (1347, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-05-04 11:06:28');
INSERT INTO `history_info` VALUES (1348, NULL, '205.169.39.3', '美国', NULL, NULL, '2025-05-04 15:49:43');
INSERT INTO `history_info` VALUES (1349, NULL, '45.156.129.113', '荷兰', NULL, NULL, '2025-05-04 23:10:00');
INSERT INTO `history_info` VALUES (1350, NULL, '220.196.160.96', '中国', '上海', '上海市', '2025-05-05 03:50:30');
INSERT INTO `history_info` VALUES (1351, NULL, '124.70.57.132', '中国', '北京', '北京市', '2025-05-05 07:05:27');
INSERT INTO `history_info` VALUES (1352, NULL, '27.115.124.70', '中国', '上海', '上海市', '2025-05-05 08:03:26');
INSERT INTO `history_info` VALUES (1353, NULL, '27.115.124.38', '中国', '上海', '上海市', '2025-05-05 08:03:31');
INSERT INTO `history_info` VALUES (1354, NULL, '27.115.124.45', '中国', '上海', '上海市', '2025-05-05 08:03:31');
INSERT INTO `history_info` VALUES (1355, NULL, '111.225.148.102', '中国', '河北省', '张家口市', '2025-05-05 09:34:22');
INSERT INTO `history_info` VALUES (1356, NULL, '111.225.148.121', '中国', '河北省', '张家口市', '2025-05-05 09:34:22');
INSERT INTO `history_info` VALUES (1357, NULL, '111.225.148.106', '中国', '河北省', '张家口市', '2025-05-05 09:34:22');
INSERT INTO `history_info` VALUES (1358, NULL, '111.225.148.118', '中国', '河北省', '张家口市', '2025-05-05 09:34:22');
INSERT INTO `history_info` VALUES (1359, NULL, '219.132.37.52', '中国', '广东省', '湛江市', '2025-05-05 09:56:49');
INSERT INTO `history_info` VALUES (1360, NULL, '106.124.140.167', '中国', '新疆', '乌鲁木齐市', '2025-05-05 13:10:06');
INSERT INTO `history_info` VALUES (1361, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-05-05 13:34:22');
INSERT INTO `history_info` VALUES (1362, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-05-05 14:37:00');
INSERT INTO `history_info` VALUES (1363, NULL, '205.169.39.24', '美国', NULL, NULL, '2025-05-06 13:46:58');
INSERT INTO `history_info` VALUES (1364, NULL, '220.196.160.101', '中国', '上海', '上海市', '2025-05-06 14:36:09');
INSERT INTO `history_info` VALUES (1365, NULL, '159.75.198.59', '中国', '北京', '北京市', '2025-05-07 05:33:37');
INSERT INTO `history_info` VALUES (1366, NULL, '106.52.109.61', '中国', '广东省', '广州市', '2025-05-07 05:33:37');
INSERT INTO `history_info` VALUES (1367, NULL, '205.169.39.27', '美国', NULL, NULL, '2025-05-07 17:21:15');
INSERT INTO `history_info` VALUES (1368, NULL, '78.153.140.177', '俄罗斯', 'Tatarstan', NULL, '2025-05-07 19:14:01');
INSERT INTO `history_info` VALUES (1369, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-05-08 00:26:46');
INSERT INTO `history_info` VALUES (1370, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-05-08 00:26:53');
INSERT INTO `history_info` VALUES (1371, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-05-08 00:26:53');
INSERT INTO `history_info` VALUES (1372, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-05-08 00:26:55');
INSERT INTO `history_info` VALUES (1373, NULL, '34.116.138.120', '美国', '德克萨斯', '休斯顿', '2025-05-08 00:32:32');
INSERT INTO `history_info` VALUES (1374, NULL, '34.118.97.59', '美国', '德克萨斯', '休斯顿', '2025-05-08 00:35:34');
INSERT INTO `history_info` VALUES (1375, NULL, '205.169.39.30', '美国', NULL, NULL, '2025-05-08 02:36:06');
INSERT INTO `history_info` VALUES (1376, NULL, '117.146.54.144', '中国', '新疆', '喀什', '2025-05-08 02:57:44');
INSERT INTO `history_info` VALUES (1377, NULL, '220.196.160.151', '中国', '上海', '上海市', '2025-05-08 04:12:39');
INSERT INTO `history_info` VALUES (1378, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-05-08 06:24:21');
INSERT INTO `history_info` VALUES (1379, NULL, '1.92.153.111', '中国', '北京', '北京市', '2025-05-08 06:24:30');
INSERT INTO `history_info` VALUES (1380, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-05-08 06:24:33');
INSERT INTO `history_info` VALUES (1381, NULL, '116.205.116.126', '中国', '广东省', '深圳市', '2025-05-08 06:25:28');
INSERT INTO `history_info` VALUES (1382, NULL, '34.30.239.72', '美国', '德克萨斯', '休斯顿', '2025-05-08 13:13:14');
INSERT INTO `history_info` VALUES (1383, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2025-05-08 13:50:30');
INSERT INTO `history_info` VALUES (1384, NULL, '130.61.94.59', '德国', '法兰克福', '法兰克福', '2025-05-08 15:18:21');
INSERT INTO `history_info` VALUES (1385, NULL, '116.196.66.4', '中国', '北京', '北京市', '2025-05-08 18:08:55');
INSERT INTO `history_info` VALUES (1386, NULL, '14.103.124.108', '中国', '广东省', '深圳市', '2025-05-08 22:06:37');
INSERT INTO `history_info` VALUES (1387, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-05-09 06:07:14');
INSERT INTO `history_info` VALUES (1388, NULL, '195.211.191.170', '乌克兰', NULL, NULL, '2025-05-09 09:04:50');
INSERT INTO `history_info` VALUES (1389, NULL, '121.229.3.166', '中国', '江苏省', '苏州市', '2025-05-10 05:25:56');
INSERT INTO `history_info` VALUES (1390, NULL, '183.220.231.212', '中国', '四川省', '达州市', '2025-05-10 14:44:07');
INSERT INTO `history_info` VALUES (1391, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-05-11 04:25:08');
INSERT INTO `history_info` VALUES (1392, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-05-11 05:43:04');
INSERT INTO `history_info` VALUES (1393, NULL, '106.55.244.169', '中国', '广东省', '广州市', '2025-05-11 05:43:04');
INSERT INTO `history_info` VALUES (1394, NULL, '1.92.149.201', '中国', '北京', '北京市', '2025-05-11 09:41:28');
INSERT INTO `history_info` VALUES (1395, NULL, '109.195.164.160', '俄罗斯', 'Ryazanskaya', NULL, '2025-05-11 18:49:16');
INSERT INTO `history_info` VALUES (1396, NULL, '162.240.228.209', '美国', '犹他', NULL, '2025-05-12 05:33:21');
INSERT INTO `history_info` VALUES (1397, NULL, '110.249.202.237', '中国', '河北省', '石家庄市', '2025-05-12 10:11:24');
INSERT INTO `history_info` VALUES (1398, NULL, '110.249.202.245', '中国', '河北省', '石家庄市', '2025-05-12 10:11:24');
INSERT INTO `history_info` VALUES (1399, NULL, '110.249.202.248', '中国', '河北省', '石家庄市', '2025-05-12 10:11:25');
INSERT INTO `history_info` VALUES (1400, NULL, '110.249.202.235', '中国', '河北省', '石家庄市', '2025-05-12 10:11:25');
INSERT INTO `history_info` VALUES (1401, NULL, '110.249.202.232', '中国', '河北省', '石家庄市', '2025-05-12 10:11:25');
INSERT INTO `history_info` VALUES (1402, NULL, '185.68.22.235', '俄罗斯', '莫斯科', '莫斯科', '2025-05-12 12:01:10');
INSERT INTO `history_info` VALUES (1403, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-05-13 12:58:47');
INSERT INTO `history_info` VALUES (1404, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-05-13 13:15:43');
INSERT INTO `history_info` VALUES (1405, NULL, '220.196.160.144', '中国', '上海', '上海市', '2025-05-14 04:03:51');
INSERT INTO `history_info` VALUES (1406, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-05-14 05:25:34');
INSERT INTO `history_info` VALUES (1407, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-05-14 05:25:34');
INSERT INTO `history_info` VALUES (1408, NULL, '116.205.96.31', '中国', '广东省', '深圳市', '2025-05-14 08:13:04');
INSERT INTO `history_info` VALUES (1409, NULL, '120.46.91.225', '中国', '北京', '北京市', '2025-05-14 09:34:13');
INSERT INTO `history_info` VALUES (1410, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2025-05-14 09:42:38');
INSERT INTO `history_info` VALUES (1411, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-05-14 09:43:08');
INSERT INTO `history_info` VALUES (1412, NULL, '220.196.160.45', '中国', '上海', '上海市', '2025-05-15 13:04:25');
INSERT INTO `history_info` VALUES (1413, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-05-15 13:52:51');
INSERT INTO `history_info` VALUES (1414, NULL, '110.249.202.104', '中国', '河北省', '石家庄市', '2025-05-15 18:56:41');
INSERT INTO `history_info` VALUES (1415, NULL, '110.249.202.117', '中国', '河北省', '石家庄市', '2025-05-15 18:56:41');
INSERT INTO `history_info` VALUES (1416, NULL, '110.249.202.115', '中国', '河北省', '石家庄市', '2025-05-15 18:56:42');
INSERT INTO `history_info` VALUES (1417, NULL, '43.163.119.175', '澳大利亚', NULL, NULL, '2025-05-15 18:58:25');
INSERT INTO `history_info` VALUES (1418, NULL, '40.77.188.169', '美国', '伊利诺伊', '芝加哥', '2025-05-15 19:53:30');
INSERT INTO `history_info` VALUES (1419, NULL, '115.190.27.167', '中国', '湖北省', '武汉市', '2025-05-15 22:50:09');
INSERT INTO `history_info` VALUES (1420, NULL, '110.249.201.145', '中国', '河北省', '石家庄市', '2025-05-16 01:30:21');
INSERT INTO `history_info` VALUES (1421, NULL, '110.249.201.137', '中国', '河北省', '石家庄市', '2025-05-16 01:30:21');
INSERT INTO `history_info` VALUES (1422, NULL, '110.249.201.134', '中国', '河北省', '石家庄市', '2025-05-16 01:30:21');
INSERT INTO `history_info` VALUES (1423, NULL, '110.249.201.132', '中国', '河北省', '石家庄市', '2025-05-16 01:30:22');
INSERT INTO `history_info` VALUES (1424, NULL, '123.249.19.46', '中国', '贵州省', '黔西南', '2025-05-16 08:33:36');
INSERT INTO `history_info` VALUES (1425, NULL, '111.225.149.179', '中国', '河北省', '张家口市', '2025-05-16 10:42:49');
INSERT INTO `history_info` VALUES (1426, NULL, '111.225.149.178', '中国', '河北省', '张家口市', '2025-05-16 10:42:49');
INSERT INTO `history_info` VALUES (1427, NULL, '111.225.149.171', '中国', '河北省', '张家口市', '2025-05-16 10:42:49');
INSERT INTO `history_info` VALUES (1428, NULL, '111.225.149.180', '中国', '河北省', '张家口市', '2025-05-16 10:42:49');
INSERT INTO `history_info` VALUES (1429, NULL, '111.225.149.174', '中国', '河北省', '张家口市', '2025-05-16 10:42:49');
INSERT INTO `history_info` VALUES (1430, NULL, '45.144.212.126', '荷兰', NULL, NULL, '2025-05-16 19:13:44');
INSERT INTO `history_info` VALUES (1431, NULL, '111.208.31.22', '中国', '江苏省', '南京市', '2025-05-16 20:15:49');
INSERT INTO `history_info` VALUES (1432, NULL, '111.208.29.22', '中国', '江苏省', '南京市', '2025-05-16 20:15:49');
INSERT INTO `history_info` VALUES (1433, NULL, '92.55.190.215', '哈萨克斯坦', NULL, NULL, '2025-05-16 21:30:47');
INSERT INTO `history_info` VALUES (1434, NULL, '116.52.165.35', '中国', '云南省', '昆明市', '2025-05-17 01:02:34');
INSERT INTO `history_info` VALUES (1435, NULL, '220.196.160.73', '中国', '上海', '上海市', '2025-05-17 03:44:55');
INSERT INTO `history_info` VALUES (1436, NULL, '49.234.3.160', '中国', '上海', '上海市', '2025-05-17 07:23:50');
INSERT INTO `history_info` VALUES (1437, NULL, '123.249.126.59', '中国', '贵州省', '黔西南', '2025-05-17 15:11:48');
INSERT INTO `history_info` VALUES (1438, NULL, '1.92.145.190', '中国', '北京', '北京市', '2025-05-17 19:55:20');
INSERT INTO `history_info` VALUES (1439, NULL, '167.71.154.228', '美国', '加利福尼亚', '旧金山', '2025-05-18 00:14:26');
INSERT INTO `history_info` VALUES (1440, NULL, '116.205.99.55', '中国', '广东省', '深圳市', '2025-05-18 03:46:58');
INSERT INTO `history_info` VALUES (1441, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-05-18 03:49:14');
INSERT INTO `history_info` VALUES (1442, NULL, '159.75.198.6', '中国', '北京', '北京市', '2025-05-18 05:51:12');
INSERT INTO `history_info` VALUES (1443, NULL, '106.55.251.49', '中国', '广东省', '广州市', '2025-05-18 05:51:12');
INSERT INTO `history_info` VALUES (1444, NULL, '138.97.13.19', '巴西', NULL, NULL, '2025-05-19 04:59:32');
INSERT INTO `history_info` VALUES (1445, NULL, '123.249.75.79', '中国', '贵州省', '黔西南', '2025-05-19 08:08:15');
INSERT INTO `history_info` VALUES (1446, NULL, '110.249.202.53', '中国', '河北省', '石家庄市', '2025-05-19 09:44:11');
INSERT INTO `history_info` VALUES (1447, NULL, '110.249.202.54', '中国', '河北省', '石家庄市', '2025-05-19 09:44:11');
INSERT INTO `history_info` VALUES (1448, NULL, '110.249.202.47', '中国', '河北省', '石家庄市', '2025-05-19 09:44:11');
INSERT INTO `history_info` VALUES (1449, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-05-19 16:15:17');
INSERT INTO `history_info` VALUES (1450, NULL, '154.26.136.70', '美国', NULL, NULL, '2025-05-19 21:59:33');
INSERT INTO `history_info` VALUES (1451, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-05-20 03:53:43');
INSERT INTO `history_info` VALUES (1452, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-05-20 12:35:37');
INSERT INTO `history_info` VALUES (1453, NULL, '88.151.34.37', '荷兰', '北荷兰', NULL, '2025-05-20 19:50:53');
INSERT INTO `history_info` VALUES (1454, NULL, '106.52.79.248', '中国', '广东省', '广州市', '2025-05-21 05:40:28');
INSERT INTO `history_info` VALUES (1455, NULL, '159.75.198.113', '中国', '北京', '北京市', '2025-05-21 05:40:28');
INSERT INTO `history_info` VALUES (1456, NULL, '115.190.27.167', '中国', '湖北省', '武汉市', '2025-05-22 02:25:48');
INSERT INTO `history_info` VALUES (1457, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-05-22 11:35:12');
INSERT INTO `history_info` VALUES (1458, NULL, '106.127.187.18', '中国', '广西', '北海市', '2025-05-22 19:36:39');
INSERT INTO `history_info` VALUES (1459, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-05-22 20:59:37');
INSERT INTO `history_info` VALUES (1460, NULL, '220.196.160.75', '中国', '上海', '上海市', '2025-05-23 03:50:22');
INSERT INTO `history_info` VALUES (1461, NULL, '50.7.40.241', '瑞士', 'Zurich', NULL, '2025-05-24 04:31:38');
INSERT INTO `history_info` VALUES (1462, NULL, '175.4.55.185', '中国', '湖南省', '永州市', '2025-05-24 15:43:06');
INSERT INTO `history_info` VALUES (1463, NULL, '106.52.114.40', '中国', '广东省', '广州市', '2025-05-25 05:34:12');
INSERT INTO `history_info` VALUES (1464, NULL, '42.193.132.157', '中国', '上海', '上海市', '2025-05-25 05:34:17');
INSERT INTO `history_info` VALUES (1465, NULL, '39.105.42.225', '中国', '北京', '北京市', '2025-05-25 09:00:57');
INSERT INTO `history_info` VALUES (1466, NULL, '103.39.93.93', '越南', '河内', NULL, '2025-05-25 17:18:38');
INSERT INTO `history_info` VALUES (1467, NULL, '20.66.21.133', '美国', NULL, NULL, '2025-05-25 18:42:19');
INSERT INTO `history_info` VALUES (1468, NULL, '180.101.244.13', '中国', '江苏省', '南京市', '2025-05-26 04:25:56');
INSERT INTO `history_info` VALUES (1469, NULL, '110.249.202.152', '中国', '河北省', '石家庄市', '2025-05-26 09:53:22');
INSERT INTO `history_info` VALUES (1470, NULL, '110.249.202.169', '中国', '河北省', '石家庄市', '2025-05-26 09:53:22');
INSERT INTO `history_info` VALUES (1471, NULL, '110.249.202.154', '中国', '河北省', '石家庄市', '2025-05-26 09:53:22');
INSERT INTO `history_info` VALUES (1472, NULL, '110.249.202.155', '中国', '河北省', '石家庄市', '2025-05-26 09:53:22');
INSERT INTO `history_info` VALUES (1473, NULL, '110.249.202.162', '中国', '河北省', '石家庄市', '2025-05-26 09:53:22');
INSERT INTO `history_info` VALUES (1474, NULL, '51.159.102.237', '美国', NULL, NULL, '2025-05-26 22:10:43');
INSERT INTO `history_info` VALUES (1475, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-05-26 23:20:13');
INSERT INTO `history_info` VALUES (1476, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-05-27 00:07:55');
INSERT INTO `history_info` VALUES (1477, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-05-27 11:51:18');
INSERT INTO `history_info` VALUES (1478, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-05-28 05:49:37');
INSERT INTO `history_info` VALUES (1479, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-05-28 05:49:37');
INSERT INTO `history_info` VALUES (1480, NULL, '130.61.183.131', '德国', '法兰克福', '法兰克福', '2025-05-28 22:45:02');
INSERT INTO `history_info` VALUES (1481, NULL, '111.250.100.96', '中国', '台湾省', NULL, '2025-05-29 03:34:09');
INSERT INTO `history_info` VALUES (1482, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-05-29 03:53:52');
INSERT INTO `history_info` VALUES (1483, NULL, '113.45.163.156', '中国', '北京', '北京市', '2025-05-29 05:34:31');
INSERT INTO `history_info` VALUES (1484, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-05-29 06:59:46');
INSERT INTO `history_info` VALUES (1485, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-05-29 10:40:00');
INSERT INTO `history_info` VALUES (1486, NULL, '101.36.121.4', '中国', '香港', NULL, '2025-05-30 02:43:36');
INSERT INTO `history_info` VALUES (1487, NULL, '137.184.219.93', '美国', '俄亥俄', '辛辛那提', '2025-05-30 03:50:43');
INSERT INTO `history_info` VALUES (1488, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-05-30 06:05:06');
INSERT INTO `history_info` VALUES (1489, NULL, '175.4.55.185', '中国', '湖南省', '永州市', '2025-05-30 15:00:13');
INSERT INTO `history_info` VALUES (1490, NULL, '106.52.114.40', '中国', '广东省', '广州市', '2025-06-01 06:00:30');
INSERT INTO `history_info` VALUES (1491, NULL, '42.193.132.157', '中国', '上海', '上海市', '2025-06-01 06:00:30');
INSERT INTO `history_info` VALUES (1492, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-06-01 19:51:33');
INSERT INTO `history_info` VALUES (1493, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-06-01 23:52:31');
INSERT INTO `history_info` VALUES (1494, NULL, '220.196.160.75', '中国', '上海', '上海市', '2025-06-02 04:12:38');
INSERT INTO `history_info` VALUES (1495, NULL, '1.92.131.51', '中国', '北京', '北京市', '2025-06-02 10:04:08');
INSERT INTO `history_info` VALUES (1496, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-06-03 04:13:32');
INSERT INTO `history_info` VALUES (1497, NULL, '122.138.218.90', '中国', '吉林省', '白城市', '2025-06-03 04:56:15');
INSERT INTO `history_info` VALUES (1498, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-06-03 08:21:51');
INSERT INTO `history_info` VALUES (1499, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-06-03 08:22:31');
INSERT INTO `history_info` VALUES (1500, NULL, '1.92.153.111', '中国', '北京', '北京市', '2025-06-03 08:23:38');
INSERT INTO `history_info` VALUES (1501, NULL, '111.225.148.226', '中国', '河北省', '张家口市', '2025-06-03 09:43:36');
INSERT INTO `history_info` VALUES (1502, NULL, '111.225.148.222', '中国', '河北省', '张家口市', '2025-06-03 09:43:36');
INSERT INTO `history_info` VALUES (1503, NULL, '111.225.148.224', '中国', '河北省', '张家口市', '2025-06-03 09:43:36');
INSERT INTO `history_info` VALUES (1504, NULL, '111.225.148.210', '中国', '河北省', '张家口市', '2025-06-03 09:43:36');
INSERT INTO `history_info` VALUES (1505, NULL, '111.225.148.219', '中国', '河北省', '张家口市', '2025-06-03 09:43:36');
INSERT INTO `history_info` VALUES (1506, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-06-03 11:03:55');
INSERT INTO `history_info` VALUES (1507, NULL, '136.144.35.20', '美国', '纽约', '纽约', '2025-06-03 18:19:02');
INSERT INTO `history_info` VALUES (1508, NULL, '136.144.35.25', '美国', '纽约', '纽约', '2025-06-03 18:19:29');
INSERT INTO `history_info` VALUES (1509, NULL, '123.249.122.168', '中国', '贵州省', '黔西南', '2025-06-03 20:49:25');
INSERT INTO `history_info` VALUES (1510, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-06-04 05:27:34');
INSERT INTO `history_info` VALUES (1511, NULL, '106.91.221.239', '中国', '重庆', '重庆市', '2025-06-04 22:01:46');
INSERT INTO `history_info` VALUES (1512, NULL, '117.48.157.75', '中国', '江苏省', '苏州市', '2025-06-05 00:53:46');
INSERT INTO `history_info` VALUES (1513, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-06-05 04:12:05');
INSERT INTO `history_info` VALUES (1514, NULL, '220.196.160.65', '中国', '上海', '上海市', '2025-06-05 09:17:56');
INSERT INTO `history_info` VALUES (1515, NULL, '120.46.51.19', '中国', '北京', '北京市', '2025-06-06 13:08:44');
INSERT INTO `history_info` VALUES (1516, NULL, '27.115.124.104', '中国', '上海', '上海市', '2025-06-07 14:50:10');
INSERT INTO `history_info` VALUES (1517, NULL, '27.115.124.68', '中国', '上海', '上海市', '2025-06-07 14:50:10');
INSERT INTO `history_info` VALUES (1518, NULL, '45.254.247.210', '新加坡', NULL, NULL, '2025-06-07 14:54:18');
INSERT INTO `history_info` VALUES (1519, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-06-07 18:27:45');
INSERT INTO `history_info` VALUES (1520, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-06-08 04:08:57');
INSERT INTO `history_info` VALUES (1521, NULL, '106.52.109.61', '中国', '广东省', '广州市', '2025-06-08 05:49:16');
INSERT INTO `history_info` VALUES (1522, NULL, '159.75.198.59', '中国', '北京', '北京市', '2025-06-08 05:49:16');
INSERT INTO `history_info` VALUES (1523, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-06-08 07:39:22');
INSERT INTO `history_info` VALUES (1524, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-06-08 07:39:48');
INSERT INTO `history_info` VALUES (1525, NULL, '156.241.0.211', '中国', '香港', NULL, '2025-06-08 16:23:29');
INSERT INTO `history_info` VALUES (1526, NULL, '185.238.231.49', '西班牙', '马德里', '马德里', '2025-06-09 16:15:49');
INSERT INTO `history_info` VALUES (1527, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-06-10 05:18:36');
INSERT INTO `history_info` VALUES (1528, NULL, '111.225.149.56', '中国', '河北省', '张家口市', '2025-06-10 10:01:59');
INSERT INTO `history_info` VALUES (1529, NULL, '111.225.149.45', '中国', '河北省', '张家口市', '2025-06-10 10:01:59');
INSERT INTO `history_info` VALUES (1530, NULL, '111.225.149.43', '中国', '河北省', '张家口市', '2025-06-10 10:01:59');
INSERT INTO `history_info` VALUES (1531, NULL, '111.225.149.44', '中国', '河北省', '张家口市', '2025-06-10 10:02:00');
INSERT INTO `history_info` VALUES (1532, NULL, '111.225.149.46', '中国', '河北省', '张家口市', '2025-06-10 10:02:00');
INSERT INTO `history_info` VALUES (1533, NULL, '111.225.149.47', '中国', '河北省', '张家口市', '2025-06-10 10:02:00');
INSERT INTO `history_info` VALUES (1534, NULL, '59.83.208.108', '中国', '江苏省', '南京市', '2025-06-10 10:37:21');
INSERT INTO `history_info` VALUES (1535, NULL, '116.205.99.55', '中国', '广东省', '深圳市', '2025-06-10 13:34:26');
INSERT INTO `history_info` VALUES (1536, NULL, '18.204.10.136', '美国', '弗吉尼亚', '阿什本', '2025-06-10 17:22:11');
INSERT INTO `history_info` VALUES (1537, NULL, '44.200.81.15', '美国', '弗吉尼亚', '阿什本', '2025-06-10 22:11:34');
INSERT INTO `history_info` VALUES (1538, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-06-11 04:12:47');
INSERT INTO `history_info` VALUES (1539, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-06-11 04:12:47');
INSERT INTO `history_info` VALUES (1540, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-06-11 05:45:15');
INSERT INTO `history_info` VALUES (1541, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-06-11 05:45:15');
INSERT INTO `history_info` VALUES (1542, NULL, '42.236.10.122', '中国', '河南省', '郑州市', '2025-06-11 12:33:36');
INSERT INTO `history_info` VALUES (1543, NULL, '42.236.10.116', '中国', '河南省', '郑州市', '2025-06-11 12:33:36');
INSERT INTO `history_info` VALUES (1544, NULL, '42.236.10.110', '中国', '河南省', '郑州市', '2025-06-11 12:33:36');
INSERT INTO `history_info` VALUES (1545, NULL, '124.70.57.132', '中国', '北京', '北京市', '2025-06-11 13:39:13');
INSERT INTO `history_info` VALUES (1546, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-06-12 08:40:13');
INSERT INTO `history_info` VALUES (1547, NULL, '40.77.190.78', '美国', '伊利诺伊', '芝加哥', '2025-06-13 00:40:31');
INSERT INTO `history_info` VALUES (1548, NULL, '136.144.35.135', '美国', '纽约', '纽约', '2025-06-13 10:21:10');
INSERT INTO `history_info` VALUES (1549, NULL, '136.144.35.131', '美国', '纽约', '纽约', '2025-06-13 10:21:57');
INSERT INTO `history_info` VALUES (1550, NULL, '147.53.197.221', '美国', '印第安纳', NULL, '2025-06-13 23:51:38');
INSERT INTO `history_info` VALUES (1551, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-06-14 04:21:18');
INSERT INTO `history_info` VALUES (1552, NULL, '1.95.190.50', '中国', '北京', '北京市', '2025-06-14 06:37:48');
INSERT INTO `history_info` VALUES (1553, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-06-14 10:08:42');
INSERT INTO `history_info` VALUES (1554, NULL, '62.210.88.112', '法国', '巴黎', NULL, '2025-06-14 18:26:28');
INSERT INTO `history_info` VALUES (1555, NULL, '167.99.168.50', '美国', '加利福尼亚', '旧金山', '2025-06-15 00:45:04');
INSERT INTO `history_info` VALUES (1556, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-06-15 05:31:56');
INSERT INTO `history_info` VALUES (1557, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-06-15 05:48:45');
INSERT INTO `history_info` VALUES (1558, NULL, '156.241.0.211', '中国', '香港', NULL, '2025-06-16 01:01:57');
INSERT INTO `history_info` VALUES (1559, NULL, '124.70.57.132', '中国', '北京', '北京市', '2025-06-16 11:05:24');
INSERT INTO `history_info` VALUES (1560, NULL, '117.72.120.233', '中国', '北京', '北京市', '2025-06-16 23:16:21');
INSERT INTO `history_info` VALUES (1561, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-06-17 04:42:13');
INSERT INTO `history_info` VALUES (1562, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-06-17 06:15:43');
INSERT INTO `history_info` VALUES (1563, NULL, '111.225.149.247', '中国', '河北省', '张家口市', '2025-06-17 09:43:57');
INSERT INTO `history_info` VALUES (1564, NULL, '111.225.149.242', '中国', '河北省', '张家口市', '2025-06-17 09:43:58');
INSERT INTO `history_info` VALUES (1565, NULL, '111.225.149.244', '中国', '河北省', '张家口市', '2025-06-17 09:43:58');
INSERT INTO `history_info` VALUES (1566, NULL, '111.225.149.233', '中国', '河北省', '张家口市', '2025-06-17 09:43:58');
INSERT INTO `history_info` VALUES (1567, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-06-17 10:01:27');
INSERT INTO `history_info` VALUES (1568, NULL, '111.250.118.40', '中国', '台湾省', NULL, '2025-06-17 12:05:35');
INSERT INTO `history_info` VALUES (1569, NULL, '1.94.192.107', '中国', '北京', '北京市', '2025-06-17 12:36:46');
INSERT INTO `history_info` VALUES (1570, NULL, '172.191.108.92', '美国', NULL, NULL, '2025-06-17 18:39:27');
INSERT INTO `history_info` VALUES (1571, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-06-17 21:38:36');
INSERT INTO `history_info` VALUES (1572, NULL, '159.75.198.232', '中国', '北京', '北京市', '2025-06-18 05:26:56');
INSERT INTO `history_info` VALUES (1573, NULL, '106.55.245.27', '中国', '广东省', '广州市', '2025-06-18 05:26:57');
INSERT INTO `history_info` VALUES (1574, NULL, '114.217.26.245', '中国', '江苏省', '苏州市', '2025-06-18 09:45:14');
INSERT INTO `history_info` VALUES (1575, NULL, '106.91.216.0', '中国', '重庆', '重庆市', '2025-06-18 11:43:08');
INSERT INTO `history_info` VALUES (1576, 1, '106.91.216.0', '中国', '重庆', '重庆市', '2025-06-18 11:47:11');
INSERT INTO `history_info` VALUES (1577, NULL, '1.92.150.19', '中国', '北京', '北京市', '2025-06-18 14:27:53');
INSERT INTO `history_info` VALUES (1578, NULL, '66.249.66.7', '美国', '南卡罗来纳', NULL, '2025-06-19 06:12:40');
INSERT INTO `history_info` VALUES (1579, NULL, '66.249.66.70', '美国', '南卡罗来纳', NULL, '2025-06-19 06:12:41');
INSERT INTO `history_info` VALUES (1580, NULL, '66.249.66.166', '美国', '南卡罗来纳', NULL, '2025-06-19 06:12:41');
INSERT INTO `history_info` VALUES (1581, NULL, '66.249.66.44', '美国', '南卡罗来纳', NULL, '2025-06-19 06:12:42');
INSERT INTO `history_info` VALUES (1582, NULL, '66.249.66.167', '美国', '南卡罗来纳', NULL, '2025-06-19 06:12:44');
INSERT INTO `history_info` VALUES (1583, NULL, '220.196.160.154', '中国', '上海', '上海市', '2025-06-19 07:16:18');
INSERT INTO `history_info` VALUES (1584, NULL, '106.91.223.12', '中国', '重庆', '重庆市', '2025-06-19 16:03:20');
INSERT INTO `history_info` VALUES (1585, 1, '106.91.223.12', '中国', '重庆', '重庆市', '2025-06-19 16:03:50');
INSERT INTO `history_info` VALUES (1586, NULL, '111.122.192.77', '中国', '贵州省', '黔东南', '2025-06-19 19:28:11');
INSERT INTO `history_info` VALUES (1587, NULL, '223.130.11.165', '美国', '加利福尼亚', NULL, '2025-06-19 19:29:49');
INSERT INTO `history_info` VALUES (1588, NULL, '220.196.160.96', '中国', '上海', '上海市', '2025-06-20 04:19:31');
INSERT INTO `history_info` VALUES (1589, NULL, '193.32.162.157', '罗马尼亚', NULL, NULL, '2025-06-20 05:54:02');
INSERT INTO `history_info` VALUES (1590, NULL, '185.93.89.118', '英国', NULL, NULL, '2025-06-20 06:02:26');
INSERT INTO `history_info` VALUES (1591, NULL, '27.254.118.114', '泰国', '曼谷', '曼谷', '2025-06-20 10:48:41');
INSERT INTO `history_info` VALUES (1592, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-06-20 10:52:39');
INSERT INTO `history_info` VALUES (1593, NULL, '111.122.192.215', '中国', '贵州省', '黔东南', '2025-06-20 20:23:11');
INSERT INTO `history_info` VALUES (1594, NULL, '193.32.162.157', '罗马尼亚', NULL, NULL, '2025-06-21 02:22:46');
INSERT INTO `history_info` VALUES (1595, NULL, '185.93.89.118', '英国', NULL, NULL, '2025-06-21 02:26:49');
INSERT INTO `history_info` VALUES (1596, NULL, '45.138.16.128', '荷兰', NULL, NULL, '2025-06-21 06:43:50');
INSERT INTO `history_info` VALUES (1597, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-06-22 05:28:09');
INSERT INTO `history_info` VALUES (1598, NULL, '159.75.199.224', '中国', '北京', '北京市', '2025-06-22 05:34:18');
INSERT INTO `history_info` VALUES (1599, NULL, '42.194.128.111', '中国', '广东省', '广州市', '2025-06-22 05:34:22');
INSERT INTO `history_info` VALUES (1600, NULL, '66.249.68.68', '美国', '加利福尼亚', '山景', '2025-06-22 09:16:22');
INSERT INTO `history_info` VALUES (1601, NULL, '66.249.68.69', '美国', '加利福尼亚', '山景', '2025-06-22 09:16:27');
INSERT INTO `history_info` VALUES (1602, NULL, '220.196.160.61', '中国', '上海', '上海市', '2025-06-23 04:31:39');
INSERT INTO `history_info` VALUES (1603, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-06-23 07:26:07');
INSERT INTO `history_info` VALUES (1604, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-06-23 22:48:59');
INSERT INTO `history_info` VALUES (1605, NULL, '117.48.157.75', '中国', '江苏省', '苏州市', '2025-06-24 02:42:40');
INSERT INTO `history_info` VALUES (1606, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-06-24 03:58:36');
INSERT INTO `history_info` VALUES (1607, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-06-24 06:29:50');
INSERT INTO `history_info` VALUES (1608, NULL, '1.92.153.111', '中国', '北京', '北京市', '2025-06-24 06:30:56');
INSERT INTO `history_info` VALUES (1609, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-06-24 06:31:49');
INSERT INTO `history_info` VALUES (1610, NULL, '123.249.122.168', '中国', '贵州省', '黔西南', '2025-06-24 08:39:06');
INSERT INTO `history_info` VALUES (1611, NULL, '180.101.245.250', '中国', '江苏省', '南京市', '2025-06-24 09:40:04');
INSERT INTO `history_info` VALUES (1612, NULL, '111.225.148.34', '中国', '河北省', '张家口市', '2025-06-24 10:02:36');
INSERT INTO `history_info` VALUES (1613, NULL, '111.225.148.28', '中国', '河北省', '张家口市', '2025-06-24 10:02:36');
INSERT INTO `history_info` VALUES (1614, NULL, '111.225.148.26', '中国', '河北省', '张家口市', '2025-06-24 10:02:36');
INSERT INTO `history_info` VALUES (1615, NULL, '111.225.148.30', '中国', '河北省', '张家口市', '2025-06-24 10:02:36');
INSERT INTO `history_info` VALUES (1616, NULL, '205.169.39.23', '美国', NULL, NULL, '2025-06-24 14:52:40');
INSERT INTO `history_info` VALUES (1617, NULL, '42.193.132.157', '中国', '上海', '上海市', '2025-06-25 05:24:39');
INSERT INTO `history_info` VALUES (1618, NULL, '106.52.114.40', '中国', '广东省', '广州市', '2025-06-25 05:24:39');
INSERT INTO `history_info` VALUES (1619, NULL, '205.169.39.49', '美国', NULL, NULL, '2025-06-25 22:16:37');
INSERT INTO `history_info` VALUES (1620, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-06-26 03:51:45');
INSERT INTO `history_info` VALUES (1621, NULL, '220.196.160.53', '中国', '上海', '上海市', '2025-06-26 04:55:19');
INSERT INTO `history_info` VALUES (1622, NULL, '124.70.57.132', '中国', '北京', '北京市', '2025-06-26 05:13:03');
INSERT INTO `history_info` VALUES (1623, NULL, '110.249.201.143', '中国', '河北省', '石家庄市', '2025-06-27 05:24:04');
INSERT INTO `history_info` VALUES (1624, NULL, '110.249.201.141', '中国', '河北省', '石家庄市', '2025-06-27 05:24:04');
INSERT INTO `history_info` VALUES (1625, NULL, '110.249.201.134', '中国', '河北省', '石家庄市', '2025-06-27 05:24:04');
INSERT INTO `history_info` VALUES (1626, NULL, '185.93.89.97', '英国', NULL, NULL, '2025-06-27 08:10:52');
INSERT INTO `history_info` VALUES (1627, NULL, '62.210.88.116', '法国', '巴黎', NULL, '2025-06-27 08:19:21');
INSERT INTO `history_info` VALUES (1628, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-06-27 08:28:19');
INSERT INTO `history_info` VALUES (1629, NULL, '42.236.10.116', '中国', '河南省', '郑州市', '2025-06-27 09:37:40');
INSERT INTO `history_info` VALUES (1630, NULL, '42.236.10.105', '中国', '河南省', '郑州市', '2025-06-27 09:37:40');
INSERT INTO `history_info` VALUES (1631, NULL, '42.236.10.103', '中国', '河南省', '郑州市', '2025-06-27 09:37:40');
INSERT INTO `history_info` VALUES (1632, NULL, '42.236.10.122', '中国', '河南省', '郑州市', '2025-06-27 09:37:41');
INSERT INTO `history_info` VALUES (1633, NULL, '118.194.253.212', '中国', '北京', '北京市', '2025-06-27 18:46:19');
INSERT INTO `history_info` VALUES (1634, NULL, '182.32.229.253', '中国', '山东省', '济宁市', '2025-06-28 11:39:45');
INSERT INTO `history_info` VALUES (1635, NULL, '27.115.124.112', '中国', '上海', '上海市', '2025-06-28 14:42:07');
INSERT INTO `history_info` VALUES (1636, NULL, '27.115.124.97', '中国', '上海', '上海市', '2025-06-28 14:42:07');
INSERT INTO `history_info` VALUES (1637, NULL, '27.115.124.69', '中国', '上海', '上海市', '2025-06-28 14:42:07');
INSERT INTO `history_info` VALUES (1638, NULL, '27.115.124.104', '中国', '上海', '上海市', '2025-06-28 14:42:07');
INSERT INTO `history_info` VALUES (1639, NULL, '27.115.124.114', '中国', '上海', '上海市', '2025-06-28 14:42:08');
INSERT INTO `history_info` VALUES (1640, NULL, '205.169.39.4', '美国', NULL, NULL, '2025-06-28 16:18:12');
INSERT INTO `history_info` VALUES (1641, NULL, '205.169.39.29', '美国', NULL, NULL, '2025-06-28 16:20:42');
INSERT INTO `history_info` VALUES (1642, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-06-29 04:48:18');
INSERT INTO `history_info` VALUES (1643, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-06-29 04:59:06');
INSERT INTO `history_info` VALUES (1644, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-06-29 04:59:06');
INSERT INTO `history_info` VALUES (1645, NULL, '123.249.97.106', '中国', '贵州省', '黔西南', '2025-06-29 08:24:08');
INSERT INTO `history_info` VALUES (1646, NULL, '205.169.39.24', '美国', NULL, NULL, '2025-06-29 10:32:37');
INSERT INTO `history_info` VALUES (1647, NULL, '110.249.202.48', '中国', '河北省', '石家庄市', '2025-06-29 14:44:22');
INSERT INTO `history_info` VALUES (1648, NULL, '110.249.202.53', '中国', '河北省', '石家庄市', '2025-06-29 14:44:22');
INSERT INTO `history_info` VALUES (1649, NULL, '110.249.202.61', '中国', '河北省', '石家庄市', '2025-06-29 14:44:22');
INSERT INTO `history_info` VALUES (1650, NULL, '110.249.202.54', '中国', '河北省', '石家庄市', '2025-06-29 14:44:22');
INSERT INTO `history_info` VALUES (1651, NULL, '42.236.10.122', '中国', '河南省', '郑州市', '2025-06-30 04:38:38');
INSERT INTO `history_info` VALUES (1652, NULL, '42.236.10.103', '中国', '河南省', '郑州市', '2025-06-30 04:38:38');
INSERT INTO `history_info` VALUES (1653, NULL, '42.236.10.121', '中国', '河南省', '郑州市', '2025-06-30 04:38:38');
INSERT INTO `history_info` VALUES (1654, NULL, '42.236.10.105', '中国', '河南省', '郑州市', '2025-06-30 04:38:38');
INSERT INTO `history_info` VALUES (1655, NULL, '42.236.10.107', '中国', '河南省', '郑州市', '2025-06-30 04:38:38');
INSERT INTO `history_info` VALUES (1656, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-06-30 07:09:34');
INSERT INTO `history_info` VALUES (1657, NULL, '217.15.167.50', '丹麦', 'Hovedstaden', NULL, '2025-06-30 09:57:25');
INSERT INTO `history_info` VALUES (1658, NULL, '120.46.16.109', '中国', '北京', '北京市', '2025-06-30 12:08:53');
INSERT INTO `history_info` VALUES (1659, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-07-01 09:03:56');
INSERT INTO `history_info` VALUES (1660, NULL, '113.44.2.32', '中国', '北京', '北京市', '2025-07-01 09:09:41');
INSERT INTO `history_info` VALUES (1661, NULL, '110.249.201.117', '中国', '河北省', '石家庄市', '2025-07-01 09:44:21');
INSERT INTO `history_info` VALUES (1662, NULL, '110.249.201.113', '中国', '河北省', '石家庄市', '2025-07-01 09:44:21');
INSERT INTO `history_info` VALUES (1663, NULL, '110.249.201.103', '中国', '河北省', '石家庄市', '2025-07-01 09:44:22');
INSERT INTO `history_info` VALUES (1664, NULL, '110.249.201.108', '中国', '河北省', '石家庄市', '2025-07-01 09:44:22');
INSERT INTO `history_info` VALUES (1665, NULL, '110.249.201.120', '中国', '河北省', '石家庄市', '2025-07-01 09:44:22');
INSERT INTO `history_info` VALUES (1666, NULL, '205.169.39.57', '美国', NULL, NULL, '2025-07-01 13:07:44');
INSERT INTO `history_info` VALUES (1667, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-07-01 18:17:11');
INSERT INTO `history_info` VALUES (1668, NULL, '120.46.61.94', '中国', '北京', '北京市', '2025-07-01 22:10:04');
INSERT INTO `history_info` VALUES (1669, NULL, '64.227.186.91', '美国', '佐治亚', '亚特兰大', '2025-07-02 03:25:47');
INSERT INTO `history_info` VALUES (1670, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-07-02 05:05:50');
INSERT INTO `history_info` VALUES (1671, NULL, '106.52.65.240', '中国', '广东省', '广州市', '2025-07-02 05:09:37');
INSERT INTO `history_info` VALUES (1672, NULL, '43.144.106.92', '澳大利亚', NULL, NULL, '2025-07-02 05:09:37');
INSERT INTO `history_info` VALUES (1673, NULL, '205.169.39.49', '美国', NULL, NULL, '2025-07-02 15:05:30');
INSERT INTO `history_info` VALUES (1674, NULL, '1.192.195.11', '中国', '河南省', '郑州市', '2025-07-02 21:51:30');
INSERT INTO `history_info` VALUES (1675, NULL, '1.192.195.8', '中国', '河南省', '郑州市', '2025-07-02 21:51:30');
INSERT INTO `history_info` VALUES (1676, NULL, '1.192.195.5', '中国', '河南省', '郑州市', '2025-07-02 21:51:31');
INSERT INTO `history_info` VALUES (1677, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-07-03 02:48:39');
INSERT INTO `history_info` VALUES (1678, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-07-03 02:50:59');
INSERT INTO `history_info` VALUES (1679, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-07-03 02:51:04');
INSERT INTO `history_info` VALUES (1680, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-07-03 02:51:04');
INSERT INTO `history_info` VALUES (1681, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-07-03 02:51:55');
INSERT INTO `history_info` VALUES (1682, NULL, '34.118.122.191', '美国', '德克萨斯', '休斯顿', '2025-07-03 02:55:03');
INSERT INTO `history_info` VALUES (1683, NULL, '34.118.123.127', '美国', '德克萨斯', '休斯顿', '2025-07-03 02:56:05');
INSERT INTO `history_info` VALUES (1684, NULL, '205.169.39.53', '美国', NULL, NULL, '2025-07-03 05:14:13');
INSERT INTO `history_info` VALUES (1685, NULL, '205.169.39.23', '美国', NULL, NULL, '2025-07-03 05:20:45');
INSERT INTO `history_info` VALUES (1686, NULL, '205.169.39.3', '美国', NULL, NULL, '2025-07-03 05:25:14');
INSERT INTO `history_info` VALUES (1687, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-07-03 11:17:07');
INSERT INTO `history_info` VALUES (1688, NULL, '123.249.120.143', '中国', '贵州省', '黔西南', '2025-07-03 11:18:36');
INSERT INTO `history_info` VALUES (1689, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-07-03 11:21:12');
INSERT INTO `history_info` VALUES (1690, NULL, '116.205.116.126', '中国', '广东省', '深圳市', '2025-07-03 11:24:13');
INSERT INTO `history_info` VALUES (1691, NULL, '120.46.90.29', '中国', '北京', '北京市', '2025-07-03 12:47:06');
INSERT INTO `history_info` VALUES (1692, NULL, '185.177.72.205', '西班牙', NULL, NULL, '2025-07-04 05:13:11');
INSERT INTO `history_info` VALUES (1693, NULL, '66.249.70.5', '美国', '南卡罗来纳', NULL, '2025-07-04 09:03:08');
INSERT INTO `history_info` VALUES (1694, NULL, '27.115.124.41', '中国', '上海', '上海市', '2025-07-04 11:44:13');
INSERT INTO `history_info` VALUES (1695, NULL, '27.115.124.4', '中国', '上海', '上海市', '2025-07-04 11:44:13');
INSERT INTO `history_info` VALUES (1696, NULL, '27.115.124.34', '中国', '上海', '上海市', '2025-07-04 11:44:13');
INSERT INTO `history_info` VALUES (1697, NULL, '27.115.124.33', '中国', '上海', '上海市', '2025-07-04 11:44:13');
INSERT INTO `history_info` VALUES (1698, NULL, '129.211.167.128', '中国', '江苏省', '南京市', '2025-07-05 05:27:28');
INSERT INTO `history_info` VALUES (1699, NULL, '129.211.164.19', '中国', '江苏省', '南京市', '2025-07-05 05:27:28');
INSERT INTO `history_info` VALUES (1700, NULL, '129.211.167.108', '中国', '江苏省', '南京市', '2025-07-05 05:27:28');
INSERT INTO `history_info` VALUES (1701, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-07-05 09:19:37');
INSERT INTO `history_info` VALUES (1702, NULL, '110.249.201.98', '中国', '河北省', '石家庄市', '2025-07-05 22:39:11');
INSERT INTO `history_info` VALUES (1703, NULL, '110.249.201.92', '中国', '河北省', '石家庄市', '2025-07-05 22:39:11');
INSERT INTO `history_info` VALUES (1704, NULL, '110.249.201.89', '中国', '河北省', '石家庄市', '2025-07-05 22:39:11');
INSERT INTO `history_info` VALUES (1705, NULL, '110.249.201.93', '中国', '河北省', '石家庄市', '2025-07-05 22:39:11');
INSERT INTO `history_info` VALUES (1706, NULL, '110.249.201.91', '中国', '河北省', '石家庄市', '2025-07-05 22:39:11');
INSERT INTO `history_info` VALUES (1707, NULL, '159.75.198.232', '中国', '北京', '北京市', '2025-07-06 05:34:56');
INSERT INTO `history_info` VALUES (1708, NULL, '106.55.245.27', '中国', '广东省', '广州市', '2025-07-06 05:34:56');
INSERT INTO `history_info` VALUES (1709, NULL, '27.115.124.49', '中国', '上海', '上海市', '2025-07-06 14:53:27');
INSERT INTO `history_info` VALUES (1710, NULL, '27.115.124.33', '中国', '上海', '上海市', '2025-07-06 14:53:27');
INSERT INTO `history_info` VALUES (1711, NULL, '27.115.124.3', '中国', '上海', '上海市', '2025-07-06 14:53:27');
INSERT INTO `history_info` VALUES (1712, NULL, '27.115.124.41', '中国', '上海', '上海市', '2025-07-06 14:53:28');
INSERT INTO `history_info` VALUES (1713, NULL, '118.194.253.212', '中国', '北京', '北京市', '2025-07-07 17:56:48');
INSERT INTO `history_info` VALUES (1714, NULL, '198.58.109.12', '美国', '德克萨斯', '达拉斯', '2025-07-07 19:37:12');
INSERT INTO `history_info` VALUES (1715, NULL, '27.115.124.113', '中国', '上海', '上海市', '2025-07-08 00:44:46');
INSERT INTO `history_info` VALUES (1716, NULL, '27.115.124.104', '中国', '上海', '上海市', '2025-07-08 00:44:46');
INSERT INTO `history_info` VALUES (1717, NULL, '27.115.124.67', '中国', '上海', '上海市', '2025-07-08 00:44:46');
INSERT INTO `history_info` VALUES (1718, NULL, '27.115.124.97', '中国', '上海', '上海市', '2025-07-08 00:44:47');
INSERT INTO `history_info` VALUES (1719, NULL, '180.101.244.14', '中国', '江苏省', '南京市', '2025-07-08 05:28:41');
INSERT INTO `history_info` VALUES (1720, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-07-08 08:43:54');
INSERT INTO `history_info` VALUES (1721, NULL, '111.225.149.149', '中国', '河北省', '张家口市', '2025-07-08 10:12:47');
INSERT INTO `history_info` VALUES (1722, NULL, '111.225.149.137', '中国', '河北省', '张家口市', '2025-07-08 10:12:47');
INSERT INTO `history_info` VALUES (1723, NULL, '111.225.149.130', '中国', '河北省', '张家口市', '2025-07-08 10:12:47');
INSERT INTO `history_info` VALUES (1724, NULL, '120.46.90.142', '中国', '北京', '北京市', '2025-07-08 13:35:33');
INSERT INTO `history_info` VALUES (1725, NULL, '159.75.198.113', '中国', '北京', '北京市', '2025-07-09 04:58:00');
INSERT INTO `history_info` VALUES (1726, NULL, '106.52.79.248', '中国', '广东省', '广州市', '2025-07-09 04:58:00');
INSERT INTO `history_info` VALUES (1727, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-07-09 09:37:52');
INSERT INTO `history_info` VALUES (1728, NULL, '66.249.70.5', '美国', '南卡罗来纳', NULL, '2025-07-09 09:39:45');
INSERT INTO `history_info` VALUES (1729, NULL, '66.249.70.6', '美国', '南卡罗来纳', NULL, '2025-07-09 09:39:46');
INSERT INTO `history_info` VALUES (1730, NULL, '171.219.215.247', '中国', '四川省', '成都市', '2025-07-09 10:07:31');
INSERT INTO `history_info` VALUES (1731, NULL, '27.115.124.40', '中国', '上海', '上海市', '2025-07-09 15:11:03');
INSERT INTO `history_info` VALUES (1732, NULL, '27.115.124.34', '中国', '上海', '上海市', '2025-07-09 15:11:03');
INSERT INTO `history_info` VALUES (1733, NULL, '27.115.124.96', '中国', '上海', '上海市', '2025-07-09 15:11:03');
INSERT INTO `history_info` VALUES (1734, NULL, '27.115.124.4', '中国', '上海', '上海市', '2025-07-09 15:11:04');
INSERT INTO `history_info` VALUES (1735, NULL, '107.181.178.112', '美国', '加利福尼亚', NULL, '2025-07-09 17:40:23');
INSERT INTO `history_info` VALUES (1736, NULL, '182.149.123.207', '中国', '四川省', '成都市', '2025-07-09 21:35:55');
INSERT INTO `history_info` VALUES (1737, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-07-10 01:47:52');
INSERT INTO `history_info` VALUES (1738, NULL, '27.14.207.118', '中国', '重庆', '重庆市', '2025-07-10 02:17:13');
INSERT INTO `history_info` VALUES (1739, NULL, '51.159.14.74', '美国', NULL, NULL, '2025-07-10 07:08:13');
INSERT INTO `history_info` VALUES (1740, NULL, '194.50.16.252', '荷兰', '北荷兰', NULL, '2025-07-10 09:55:41');
INSERT INTO `history_info` VALUES (1741, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2025-07-10 13:07:33');
INSERT INTO `history_info` VALUES (1742, NULL, '5.189.172.252', '德国', 'Bayern', NULL, '2025-07-10 17:42:43');
INSERT INTO `history_info` VALUES (1743, NULL, '40.77.189.103', '美国', '伊利诺伊', '芝加哥', '2025-07-10 23:21:10');
INSERT INTO `history_info` VALUES (1744, NULL, '220.196.160.83', '中国', '上海', '上海市', '2025-07-11 04:55:41');
INSERT INTO `history_info` VALUES (1745, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-07-11 12:08:01');
INSERT INTO `history_info` VALUES (1746, NULL, '120.46.16.109', '中国', '北京', '北京市', '2025-07-11 15:01:18');
INSERT INTO `history_info` VALUES (1747, NULL, '31.7.58.202', '瑞士', 'Ticino', NULL, '2025-07-12 08:04:19');
INSERT INTO `history_info` VALUES (1748, NULL, '27.115.124.96', '中国', '上海', '上海市', '2025-07-12 15:48:23');
INSERT INTO `history_info` VALUES (1749, NULL, '27.115.124.97', '中国', '上海', '上海市', '2025-07-12 15:48:24');
INSERT INTO `history_info` VALUES (1750, NULL, '27.115.124.113', '中国', '上海', '上海市', '2025-07-12 15:48:24');
INSERT INTO `history_info` VALUES (1751, NULL, '27.115.124.69', '中国', '上海', '上海市', '2025-07-12 15:48:25');
INSERT INTO `history_info` VALUES (1752, NULL, '185.176.94.76', '英国', NULL, NULL, '2025-07-13 14:27:43');
INSERT INTO `history_info` VALUES (1753, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-07-14 04:14:48');
INSERT INTO `history_info` VALUES (1754, NULL, '180.101.245.253', '中国', '江苏省', '南京市', '2025-07-14 04:45:07');
INSERT INTO `history_info` VALUES (1755, NULL, '124.70.25.74', '中国', '北京', '北京市', '2025-07-14 13:22:27');
INSERT INTO `history_info` VALUES (1756, NULL, '182.151.121.10', '中国', '四川省', '成都市', '2025-07-14 22:37:27');
INSERT INTO `history_info` VALUES (1757, NULL, '182.143.130.158', '中国', '四川省', '成都市', '2025-07-14 22:51:30');
INSERT INTO `history_info` VALUES (1758, NULL, '59.83.208.103', '中国', '江苏省', '南京市', '2025-07-15 07:59:51');
INSERT INTO `history_info` VALUES (1759, NULL, '110.249.202.154', '中国', '河北省', '石家庄市', '2025-07-15 09:36:07');
INSERT INTO `history_info` VALUES (1760, NULL, '110.249.202.161', '中国', '河北省', '石家庄市', '2025-07-15 09:36:07');
INSERT INTO `history_info` VALUES (1761, NULL, '110.249.202.162', '中国', '河北省', '石家庄市', '2025-07-15 09:36:07');
INSERT INTO `history_info` VALUES (1762, NULL, '110.249.202.165', '中国', '河北省', '石家庄市', '2025-07-15 09:36:07');
INSERT INTO `history_info` VALUES (1763, NULL, '110.249.202.169', '中国', '河北省', '石家庄市', '2025-07-15 09:36:07');
INSERT INTO `history_info` VALUES (1764, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-07-15 18:24:46');
INSERT INTO `history_info` VALUES (1765, NULL, '123.249.9.84', '中国', '贵州省', '黔西南', '2025-07-15 22:23:07');
INSERT INTO `history_info` VALUES (1766, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-07-17 00:35:15');
INSERT INTO `history_info` VALUES (1767, NULL, '137.131.43.224', '美国', '加利福尼亚', NULL, '2025-07-17 02:12:12');
INSERT INTO `history_info` VALUES (1768, NULL, '220.196.160.96', '中国', '上海', '上海市', '2025-07-17 05:44:32');
INSERT INTO `history_info` VALUES (1769, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-07-17 18:35:00');
INSERT INTO `history_info` VALUES (1770, NULL, '141.98.11.152', '立陶宛', NULL, NULL, '2025-07-18 07:38:13');
INSERT INTO `history_info` VALUES (1771, NULL, '45.146.130.98', '荷兰', NULL, NULL, '2025-07-18 09:50:39');
INSERT INTO `history_info` VALUES (1772, NULL, '45.156.129.110', '荷兰', NULL, NULL, '2025-07-18 21:31:41');
INSERT INTO `history_info` VALUES (1773, NULL, '27.115.124.104', '中国', '上海', '上海市', '2025-07-19 05:09:19');
INSERT INTO `history_info` VALUES (1774, NULL, '27.115.124.67', '中国', '上海', '上海市', '2025-07-19 05:09:19');
INSERT INTO `history_info` VALUES (1775, NULL, '27.115.124.69', '中国', '上海', '上海市', '2025-07-19 05:09:19');
INSERT INTO `history_info` VALUES (1776, NULL, '27.115.124.112', '中国', '上海', '上海市', '2025-07-19 05:09:20');
INSERT INTO `history_info` VALUES (1777, NULL, '42.193.132.4', '中国', '上海', '上海市', '2025-07-20 05:44:26');
INSERT INTO `history_info` VALUES (1778, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-07-20 05:44:28');
INSERT INTO `history_info` VALUES (1779, NULL, '220.196.160.95', '中国', '上海', '上海市', '2025-07-20 06:06:50');
INSERT INTO `history_info` VALUES (1780, NULL, '27.115.124.96', '中国', '上海', '上海市', '2025-07-21 09:06:17');
INSERT INTO `history_info` VALUES (1781, NULL, '27.115.124.68', '中国', '上海', '上海市', '2025-07-21 09:06:17');
INSERT INTO `history_info` VALUES (1782, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-07-21 22:54:51');
INSERT INTO `history_info` VALUES (1783, NULL, '220.196.160.146', '中国', '上海', '上海市', '2025-07-22 07:35:55');
INSERT INTO `history_info` VALUES (1784, NULL, '110.249.201.150', '中国', '河北省', '石家庄市', '2025-07-22 10:10:22');
INSERT INTO `history_info` VALUES (1785, NULL, '110.249.201.161', '中国', '河北省', '石家庄市', '2025-07-22 10:10:22');
INSERT INTO `history_info` VALUES (1786, NULL, '110.249.201.156', '中国', '河北省', '石家庄市', '2025-07-22 10:10:22');
INSERT INTO `history_info` VALUES (1787, NULL, '110.249.201.159', '中国', '河北省', '石家庄市', '2025-07-22 10:10:23');
INSERT INTO `history_info` VALUES (1788, NULL, '110.249.201.169', '中国', '河北省', '石家庄市', '2025-07-22 10:10:23');
INSERT INTO `history_info` VALUES (1789, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-07-22 11:20:22');
INSERT INTO `history_info` VALUES (1790, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-07-22 11:20:31');
INSERT INTO `history_info` VALUES (1791, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-07-22 11:20:31');
INSERT INTO `history_info` VALUES (1792, NULL, '34.116.130.222', '美国', '德克萨斯', '休斯顿', '2025-07-22 11:21:03');
INSERT INTO `history_info` VALUES (1793, NULL, '205.169.39.6', '美国', NULL, NULL, '2025-07-22 11:27:10');
INSERT INTO `history_info` VALUES (1794, NULL, '185.177.72.111', '西班牙', NULL, NULL, '2025-07-22 11:46:37');
INSERT INTO `history_info` VALUES (1795, NULL, '159.75.198.97', '中国', '北京', '北京市', '2025-07-23 05:13:56');
INSERT INTO `history_info` VALUES (1796, NULL, '106.52.123.222', '中国', '广东省', '广州市', '2025-07-23 05:13:56');
INSERT INTO `history_info` VALUES (1797, NULL, '220.196.160.76', '中国', '上海', '上海市', '2025-07-23 05:37:40');
INSERT INTO `history_info` VALUES (1798, NULL, '45.156.128.108', '荷兰', NULL, NULL, '2025-07-23 19:00:06');
INSERT INTO `history_info` VALUES (1799, NULL, '220.196.160.125', '中国', '上海', '上海市', '2025-07-24 00:23:48');
INSERT INTO `history_info` VALUES (1800, NULL, '42.236.10.113', '中国', '河南省', '郑州市', '2025-07-24 06:37:51');
INSERT INTO `history_info` VALUES (1801, NULL, '42.236.10.110', '中国', '河南省', '郑州市', '2025-07-24 06:37:51');
INSERT INTO `history_info` VALUES (1802, NULL, '42.236.10.112', '中国', '河南省', '郑州市', '2025-07-24 06:37:51');
INSERT INTO `history_info` VALUES (1803, NULL, '42.236.10.123', '中国', '河南省', '郑州市', '2025-07-24 06:37:51');
INSERT INTO `history_info` VALUES (1804, NULL, '185.177.72.12', '西班牙', NULL, NULL, '2025-07-24 10:21:55');
INSERT INTO `history_info` VALUES (1805, NULL, '205.169.39.44', '美国', NULL, NULL, '2025-07-24 11:39:50');
INSERT INTO `history_info` VALUES (1806, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-07-24 20:08:55');
INSERT INTO `history_info` VALUES (1807, NULL, '139.9.176.173', '中国', '广东省', '广州市', '2025-07-24 20:58:04');
INSERT INTO `history_info` VALUES (1808, NULL, '1.92.150.19', '中国', '北京', '北京市', '2025-07-25 10:52:04');
INSERT INTO `history_info` VALUES (1809, NULL, '27.115.124.70', '中国', '上海', '上海市', '2025-07-25 12:04:04');
INSERT INTO `history_info` VALUES (1810, NULL, '111.250.108.80', '中国', '台湾省', NULL, '2025-07-26 00:33:39');
INSERT INTO `history_info` VALUES (1811, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2025-07-26 05:03:07');
INSERT INTO `history_info` VALUES (1812, NULL, '205.169.39.0', '美国', NULL, NULL, '2025-07-26 15:20:57');
INSERT INTO `history_info` VALUES (1813, NULL, '205.169.39.2', '美国', NULL, NULL, '2025-07-26 15:23:30');
INSERT INTO `history_info` VALUES (1814, NULL, '124.70.8.102', '中国', '北京', '北京市', '2025-07-27 02:53:02');
INSERT INTO `history_info` VALUES (1815, NULL, '185.93.89.97', '英国', NULL, NULL, '2025-07-27 07:18:10');
INSERT INTO `history_info` VALUES (1816, NULL, '205.169.39.22', '美国', NULL, NULL, '2025-07-27 18:50:40');
INSERT INTO `history_info` VALUES (1817, NULL, '205.169.39.28', '美国', NULL, NULL, '2025-07-27 18:53:17');
INSERT INTO `history_info` VALUES (1818, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-07-28 01:45:26');
INSERT INTO `history_info` VALUES (1819, NULL, '205.169.39.4', '美国', NULL, NULL, '2025-07-28 11:14:44');
INSERT INTO `history_info` VALUES (1820, NULL, '123.249.103.170', '中国', '贵州省', '黔西南', '2025-07-28 14:09:27');
INSERT INTO `history_info` VALUES (1821, NULL, '59.83.208.107', '中国', '江苏省', '南京市', '2025-07-29 05:26:04');
INSERT INTO `history_info` VALUES (1822, NULL, '180.101.245.251', '中国', '江苏省', '南京市', '2025-07-29 07:11:44');
INSERT INTO `history_info` VALUES (1823, NULL, '110.249.201.46', '中国', '河北省', '石家庄市', '2025-07-29 10:12:54');
INSERT INTO `history_info` VALUES (1824, NULL, '110.249.201.60', '中国', '河北省', '石家庄市', '2025-07-29 10:12:54');
INSERT INTO `history_info` VALUES (1825, NULL, '110.249.201.56', '中国', '河北省', '石家庄市', '2025-07-29 10:12:54');
INSERT INTO `history_info` VALUES (1826, NULL, '110.249.201.51', '中国', '河北省', '石家庄市', '2025-07-29 10:12:54');
INSERT INTO `history_info` VALUES (1827, NULL, '114.118.8.37', '中国', '北京', '北京市', '2025-07-29 15:16:18');
INSERT INTO `history_info` VALUES (1828, NULL, '205.169.39.57', '美国', NULL, NULL, '2025-07-30 11:14:52');
INSERT INTO `history_info` VALUES (1829, NULL, '1.92.151.215', '中国', '北京', '北京市', '2025-07-30 14:12:03');
INSERT INTO `history_info` VALUES (1830, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-07-30 23:25:19');
INSERT INTO `history_info` VALUES (1831, NULL, '65.55.210.26', '美国', '伊利诺伊', '芝加哥', '2025-07-31 03:25:19');
INSERT INTO `history_info` VALUES (1832, NULL, '65.55.210.176', '美国', '伊利诺伊', '芝加哥', '2025-07-31 03:25:20');
INSERT INTO `history_info` VALUES (1833, NULL, '40.77.178.246', '美国', '弗吉尼亚', NULL, '2025-07-31 03:25:20');
INSERT INTO `history_info` VALUES (1834, NULL, '65.55.210.205', '美国', '伊利诺伊', '芝加哥', '2025-07-31 03:25:20');
INSERT INTO `history_info` VALUES (1835, NULL, '65.55.210.5', '美国', '伊利诺伊', '芝加哥', '2025-07-31 03:25:20');
INSERT INTO `history_info` VALUES (1836, NULL, '40.77.178.58', '美国', '弗吉尼亚', NULL, '2025-07-31 03:25:20');
INSERT INTO `history_info` VALUES (1837, NULL, '40.77.177.145', '美国', '弗吉尼亚', NULL, '2025-07-31 03:25:21');
INSERT INTO `history_info` VALUES (1838, NULL, '40.77.178.60', '美国', '弗吉尼亚', NULL, '2025-07-31 03:25:21');
INSERT INTO `history_info` VALUES (1839, NULL, '159.223.178.244', '美国', '德克萨斯', NULL, '2025-07-31 07:28:04');
INSERT INTO `history_info` VALUES (1840, NULL, '205.169.39.17', '美国', NULL, NULL, '2025-07-31 19:27:16');
INSERT INTO `history_info` VALUES (1841, NULL, '185.177.72.202', '西班牙', NULL, NULL, '2025-08-01 02:16:17');
INSERT INTO `history_info` VALUES (1842, NULL, '103.44.249.234', '中国', '广东省', '深圳市', '2025-08-01 09:16:53');
INSERT INTO `history_info` VALUES (1843, NULL, '124.70.42.191', '中国', '北京', '北京市', '2025-08-01 16:52:58');
INSERT INTO `history_info` VALUES (1844, NULL, '205.169.39.57', '美国', NULL, NULL, '2025-08-01 18:08:58');
INSERT INTO `history_info` VALUES (1845, NULL, '38.211.193.130', '美国', NULL, NULL, '2025-08-02 02:37:05');
INSERT INTO `history_info` VALUES (1846, NULL, '220.196.160.84', '中国', '上海', '上海市', '2025-08-02 05:56:17');
INSERT INTO `history_info` VALUES (1847, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-08-02 07:57:56');
INSERT INTO `history_info` VALUES (1848, NULL, '34.122.147.229', '美国', '德克萨斯', '休斯顿', '2025-08-02 09:37:26');
INSERT INTO `history_info` VALUES (1849, NULL, '104.197.69.115', '美国', '艾奥瓦', NULL, '2025-08-02 09:37:38');
INSERT INTO `history_info` VALUES (1850, NULL, '34.123.170.104', '美国', '德克萨斯', '休斯顿', '2025-08-02 09:37:38');
INSERT INTO `history_info` VALUES (1851, NULL, '34.72.176.129', '美国', '德克萨斯', '休斯顿', '2025-08-02 09:37:39');
INSERT INTO `history_info` VALUES (1852, NULL, '34.118.103.103', '美国', '德克萨斯', '休斯顿', '2025-08-02 09:41:26');
INSERT INTO `history_info` VALUES (1853, NULL, '34.118.32.92', '美国', '德克萨斯', '休斯顿', '2025-08-02 09:43:01');
INSERT INTO `history_info` VALUES (1854, NULL, '42.236.10.120', '中国', '河南省', '郑州市', '2025-08-03 03:14:16');
INSERT INTO `history_info` VALUES (1855, NULL, '42.236.10.108', '中国', '河南省', '郑州市', '2025-08-03 03:14:16');
INSERT INTO `history_info` VALUES (1856, NULL, '42.236.10.107', '中国', '河南省', '郑州市', '2025-08-03 03:14:16');
INSERT INTO `history_info` VALUES (1857, NULL, '42.236.10.123', '中国', '河南省', '郑州市', '2025-08-04 15:55:45');
INSERT INTO `history_info` VALUES (1858, NULL, '42.236.10.100', '中国', '河南省', '郑州市', '2025-08-04 15:55:45');
INSERT INTO `history_info` VALUES (1859, NULL, '42.236.10.110', '中国', '河南省', '郑州市', '2025-08-04 15:55:45');
INSERT INTO `history_info` VALUES (1860, NULL, '42.236.10.116', '中国', '河南省', '郑州市', '2025-08-04 15:55:45');
INSERT INTO `history_info` VALUES (1861, NULL, '180.101.245.252', '中国', '江苏省', '南京市', '2025-08-05 05:30:32');
INSERT INTO `history_info` VALUES (1862, NULL, '45.131.108.170', '荷兰', NULL, NULL, '2025-08-05 06:24:21');
INSERT INTO `history_info` VALUES (1863, NULL, '180.101.244.12', '中国', '江苏省', '南京市', '2025-08-05 06:45:42');
INSERT INTO `history_info` VALUES (1864, NULL, '71.131.231.117', '中国', '北京', '北京市', '2025-08-05 15:36:24');
INSERT INTO `history_info` VALUES (1865, NULL, '110.249.202.80', '中国', '河北省', '石家庄市', '2025-08-06 10:04:08');
INSERT INTO `history_info` VALUES (1866, NULL, '110.249.202.76', '中国', '河北省', '石家庄市', '2025-08-06 10:04:08');
INSERT INTO `history_info` VALUES (1867, NULL, '110.249.202.74', '中国', '河北省', '石家庄市', '2025-08-06 10:04:08');
INSERT INTO `history_info` VALUES (1868, NULL, '110.249.202.68', '中国', '河北省', '石家庄市', '2025-08-06 10:04:08');
INSERT INTO `history_info` VALUES (1869, NULL, '59.83.208.105', '中国', '江苏省', '南京市', '2025-08-06 22:35:41');
INSERT INTO `history_info` VALUES (1870, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-08-06 22:45:29');
INSERT INTO `history_info` VALUES (1871, NULL, '180.101.245.247', '中国', '江苏省', '南京市', '2025-08-08 05:39:46');
INSERT INTO `history_info` VALUES (1872, NULL, '1.92.159.135', '中国', '北京', '北京市', '2025-08-08 13:05:11');
INSERT INTO `history_info` VALUES (1873, NULL, '123.249.105.139', '中国', '贵州省', '黔西南', '2025-08-08 14:50:15');
INSERT INTO `history_info` VALUES (1874, NULL, '43.153.32.173', '澳大利亚', NULL, NULL, '2025-08-08 20:53:08');
INSERT INTO `history_info` VALUES (1875, NULL, '110.249.201.181', '中国', '河北省', '石家庄市', '2025-08-08 23:39:22');
INSERT INTO `history_info` VALUES (1876, NULL, '110.249.201.185', '中国', '河北省', '石家庄市', '2025-08-08 23:39:22');
INSERT INTO `history_info` VALUES (1877, NULL, '110.249.201.184', '中国', '河北省', '石家庄市', '2025-08-08 23:39:22');
INSERT INTO `history_info` VALUES (1878, NULL, '110.249.201.179', '中国', '河北省', '石家庄市', '2025-08-08 23:39:22');
INSERT INTO `history_info` VALUES (1879, NULL, '116.205.96.31', '中国', '广东省', '深圳市', '2025-08-09 14:44:44');
INSERT INTO `history_info` VALUES (1880, NULL, '171.225.199.254', '越南', '广治省', NULL, '2025-08-09 15:36:42');
INSERT INTO `history_info` VALUES (1881, NULL, '34.148.212.160', '美国', '德克萨斯', '休斯顿', '2025-08-09 19:29:56');
INSERT INTO `history_info` VALUES (1882, NULL, '124.71.231.117', '中国', NULL, NULL, '2025-08-09 19:42:26');
INSERT INTO `history_info` VALUES (1883, NULL, '183.87.153.86', '印度', '马哈拉施特拉', '孟买', '2025-08-09 20:45:50');
INSERT INTO `history_info` VALUES (1884, NULL, '114.250.44.120', '中国', '北京', '北京市', '2025-08-10 00:29:19');
INSERT INTO `history_info` VALUES (1885, NULL, '42.236.10.121', '中国', '河南省', '郑州市', '2025-08-10 03:20:44');
INSERT INTO `history_info` VALUES (1886, NULL, '42.236.10.122', '中国', '河南省', '郑州市', '2025-08-10 03:20:44');
INSERT INTO `history_info` VALUES (1887, NULL, '42.236.10.108', '中国', '河南省', '郑州市', '2025-08-10 03:20:44');
INSERT INTO `history_info` VALUES (1888, NULL, '42.236.10.120', '中国', '河南省', '郑州市', '2025-08-10 03:20:44');
INSERT INTO `history_info` VALUES (1889, NULL, '1.92.155.161', '中国', '北京', '北京市', '2025-08-10 10:45:54');
INSERT INTO `history_info` VALUES (1890, NULL, '116.205.116.126', '中国', '广东省', '深圳市', '2025-08-10 11:07:58');
INSERT INTO `history_info` VALUES (1891, NULL, '1.94.195.230', '中国', '北京', '北京市', '2025-08-10 11:14:19');
INSERT INTO `history_info` VALUES (1892, NULL, '18.117.190.208', '美国', '马萨诸塞', NULL, '2025-08-10 22:55:38');
INSERT INTO `history_info` VALUES (1893, NULL, '51.75.249.247', '法国', NULL, NULL, '2025-08-11 03:11:04');
INSERT INTO `history_info` VALUES (1894, NULL, '128.14.23.34', '美国', '加利福尼亚', NULL, '2025-08-11 05:07:19');
INSERT INTO `history_info` VALUES (1895, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-08-11 06:12:30');
INSERT INTO `history_info` VALUES (1896, NULL, '38.211.193.130', '美国', NULL, NULL, '2025-08-11 06:24:50');
INSERT INTO `history_info` VALUES (1897, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-08-12 06:05:19');
INSERT INTO `history_info` VALUES (1898, NULL, '110.249.202.57', '中国', '河北省', '石家庄市', '2025-08-12 15:23:01');
INSERT INTO `history_info` VALUES (1899, NULL, '110.249.202.50', '中国', '河北省', '石家庄市', '2025-08-12 15:23:01');
INSERT INTO `history_info` VALUES (1900, NULL, '110.249.202.51', '中国', '河北省', '石家庄市', '2025-08-12 15:23:01');
INSERT INTO `history_info` VALUES (1901, NULL, '110.249.202.48', '中国', '河北省', '石家庄市', '2025-08-12 15:23:03');
INSERT INTO `history_info` VALUES (1902, NULL, '110.249.202.45', '中国', '河北省', '石家庄市', '2025-08-12 15:23:03');
INSERT INTO `history_info` VALUES (1903, NULL, '212.102.51.100', '日本', '东京都', '东京', '2025-08-12 18:43:23');
INSERT INTO `history_info` VALUES (1904, NULL, '1.94.203.12', '中国', '北京', '北京市', '2025-08-12 22:04:29');
INSERT INTO `history_info` VALUES (1905, NULL, '185.177.72.113', '西班牙', NULL, NULL, '2025-08-13 03:45:53');
INSERT INTO `history_info` VALUES (1906, NULL, '1.92.153.111', '中国', '北京', '北京市', '2025-08-13 08:37:52');
INSERT INTO `history_info` VALUES (1907, NULL, '110.249.201.116', '中国', '河北省', '石家庄市', '2025-08-13 10:12:26');
INSERT INTO `history_info` VALUES (1908, NULL, '110.249.201.118', '中国', '河北省', '石家庄市', '2025-08-13 10:12:26');
INSERT INTO `history_info` VALUES (1909, NULL, '110.249.201.108', '中国', '河北省', '石家庄市', '2025-08-13 10:12:26');
INSERT INTO `history_info` VALUES (1910, NULL, '110.249.201.112', '中国', '河北省', '石家庄市', '2025-08-13 10:12:26');
INSERT INTO `history_info` VALUES (1911, NULL, '185.177.72.56', '西班牙', NULL, NULL, '2025-08-13 14:29:29');
INSERT INTO `history_info` VALUES (1912, NULL, '185.177.72.7', '西班牙', NULL, NULL, '2025-08-13 15:30:28');
INSERT INTO `history_info` VALUES (1913, NULL, '117.72.161.196', '中国', '北京', '北京市', '2025-08-13 19:49:46');
INSERT INTO `history_info` VALUES (1914, NULL, '180.101.245.246', '中国', '江苏省', '南京市', '2025-08-13 21:58:13');
INSERT INTO `history_info` VALUES (1915, NULL, '116.205.99.55', '中国', '广东省', '深圳市', '2025-08-14 00:09:17');
INSERT INTO `history_info` VALUES (1916, NULL, '59.83.208.104', '中国', '江苏省', '南京市', '2025-08-14 06:15:20');
INSERT INTO `history_info` VALUES (1917, NULL, '167.99.148.69', '美国', '纽约', '纽约', '2025-08-14 11:06:46');
INSERT INTO `history_info` VALUES (1918, NULL, '38.45.125.234', '美国', NULL, NULL, '2025-08-14 13:04:51');
INSERT INTO `history_info` VALUES (1919, NULL, '197.220.93.115', '索马里', NULL, NULL, '2025-08-14 14:28:25');
INSERT INTO `history_info` VALUES (1920, NULL, '195.154.210.52', '法国', '巴黎', NULL, '2025-08-15 09:32:43');
INSERT INTO `history_info` VALUES (1921, NULL, '185.177.72.108', '西班牙', NULL, NULL, '2025-08-16 02:02:01');
INSERT INTO `history_info` VALUES (1922, NULL, '216.10.250.218', '印度', '马哈拉施特拉', '孟买', '2025-08-16 03:13:29');
INSERT INTO `history_info` VALUES (1923, NULL, '180.101.244.16', '中国', '江苏省', '南京市', '2025-08-17 06:09:35');
INSERT INTO `history_info` VALUES (1924, NULL, '111.119.234.186', '印度', '马哈拉施特拉', '孟买', '2025-08-17 10:32:26');
INSERT INTO `history_info` VALUES (1925, NULL, '137.131.43.224', '美国', '加利福尼亚', NULL, '2025-08-17 12:37:54');
INSERT INTO `history_info` VALUES (1926, NULL, '185.177.72.210', '西班牙', NULL, NULL, '2025-08-17 17:35:27');
INSERT INTO `history_info` VALUES (1927, NULL, '111.119.234.186', '印度', '马哈拉施特拉', '孟买', '2025-08-18 06:57:19');
INSERT INTO `history_info` VALUES (1928, NULL, '210.53.123.175', '中国', '北京', '北京市', '2025-08-18 19:17:19');
INSERT INTO `history_info` VALUES (1929, NULL, '197.220.93.100', '索马里', NULL, NULL, '2025-08-18 21:12:07');
INSERT INTO `history_info` VALUES (1930, NULL, '35.165.215.140', '美国', '俄勒冈', NULL, '2025-08-18 23:38:43');
INSERT INTO `history_info` VALUES (1931, NULL, '185.177.72.104', '西班牙', NULL, NULL, '2025-08-19 00:16:23');
INSERT INTO `history_info` VALUES (1932, NULL, '180.101.244.15', '中国', '江苏省', '南京市', '2025-08-19 05:50:22');
INSERT INTO `history_info` VALUES (1933, NULL, '104.244.77.50', '卢森堡', 'Luxembourg', NULL, '2025-08-19 07:15:38');
INSERT INTO `history_info` VALUES (1934, NULL, '59.83.208.106', '中国', '江苏省', '南京市', '2025-08-20 06:29:24');
INSERT INTO `history_info` VALUES (1935, NULL, '110.249.201.148', '中国', '河北省', '石家庄市', '2025-08-20 09:54:31');
INSERT INTO `history_info` VALUES (1936, NULL, '110.249.201.132', '中国', '河北省', '石家庄市', '2025-08-20 09:54:32');
INSERT INTO `history_info` VALUES (1937, NULL, '110.249.201.149', '中国', '河北省', '石家庄市', '2025-08-20 09:54:32');
INSERT INTO `history_info` VALUES (1938, NULL, '110.249.201.145', '中国', '河北省', '石家庄市', '2025-08-20 09:54:33');
INSERT INTO `history_info` VALUES (1939, NULL, '185.177.72.52', '西班牙', NULL, NULL, '2025-08-20 15:13:00');
INSERT INTO `history_info` VALUES (1940, NULL, '113.57.20.40', '中国', '湖北省', '武汉市', '2025-08-20 17:10:18');
INSERT INTO `history_info` VALUES (1941, NULL, '120.46.16.109', '中国', '北京', '北京市', '2025-08-20 21:21:17');
INSERT INTO `history_info` VALUES (1942, NULL, '180.101.245.248', '中国', '江苏省', '南京市', '2025-08-20 21:32:29');
INSERT INTO `history_info` VALUES (1943, NULL, '66.249.70.5', '美国', '南卡罗来纳', NULL, '2025-08-21 05:19:50');
INSERT INTO `history_info` VALUES (1944, NULL, '66.249.70.7', '美国', '南卡罗来纳', NULL, '2025-08-21 05:20:00');
INSERT INTO `history_info` VALUES (1945, NULL, '66.249.70.6', '美国', '南卡罗来纳', NULL, '2025-08-21 05:20:03');
INSERT INTO `history_info` VALUES (1946, NULL, '129.146.52.207', '美国', '加利福尼亚', NULL, '2025-08-21 05:48:19');
INSERT INTO `history_info` VALUES (1947, NULL, '219.243.233.3', '中国', '新疆', '乌鲁木齐市', '2025-08-21 20:25:22');
INSERT INTO `history_info` VALUES (1948, NULL, '106.51.109.9', '印度', '卡纳塔克', NULL, '2025-08-21 22:13:58');
INSERT INTO `history_info` VALUES (1949, NULL, '114.250.44.241', '中国', '北京', '北京市', '2025-08-22 12:33:43');
INSERT INTO `history_info` VALUES (1950, NULL, '116.205.116.126', '中国', '广东省', '深圳市', '2025-08-22 15:31:11');
INSERT INTO `history_info` VALUES (1951, NULL, '185.177.72.46', '西班牙', NULL, NULL, '2025-08-22 15:40:06');
INSERT INTO `history_info` VALUES (1952, NULL, '103.225.9.122', '中国', '香港', NULL, '2025-08-22 19:21:29');
INSERT INTO `history_info` VALUES (1953, NULL, '38.211.193.130', '美国', NULL, NULL, '2025-08-23 20:56:42');
INSERT INTO `history_info` VALUES (1954, NULL, '185.177.72.236', '西班牙', NULL, NULL, '2025-08-24 00:22:44');
INSERT INTO `history_info` VALUES (1955, NULL, '171.11.37.240', '中国', '河南省', '信阳市', '2025-08-24 02:06:19');
INSERT INTO `history_info` VALUES (1956, NULL, '121.57.30.12', '中国', '内蒙古', '呼和浩特市', '2025-08-24 02:06:26');
INSERT INTO `history_info` VALUES (1957, NULL, '39.151.148.186', '中国', '河南省', '郑州市', '2025-08-24 02:06:26');
INSERT INTO `history_info` VALUES (1958, NULL, '115.55.16.114', '中国', '河南省', '商丘市', '2025-08-24 02:06:26');
INSERT INTO `history_info` VALUES (1959, NULL, '1.194.63.167', '中国', '河南省', '开封市', '2025-08-24 02:06:27');
INSERT INTO `history_info` VALUES (1960, NULL, '106.91.217.114', '中国', '重庆', '重庆市', '2025-08-24 19:02:55');
INSERT INTO `history_info` VALUES (1961, 1, '106.91.217.114', '中国', '重庆', '重庆市', '2025-08-24 22:13:43');
INSERT INTO `history_info` VALUES (1962, NULL, '106.91.217.114', '中国', '重庆', '重庆市', '2025-08-25 00:48:19');
INSERT INTO `history_info` VALUES (1963, NULL, '205.169.39.5', '美国', NULL, NULL, '2025-08-25 01:25:05');
INSERT INTO `history_info` VALUES (1964, NULL, '185.177.72.144', '西班牙', NULL, NULL, '2025-08-25 04:38:44');
INSERT INTO `history_info` VALUES (1965, NULL, '1.94.192.224', '中国', '北京', '北京市', '2025-08-25 05:00:57');
INSERT INTO `history_info` VALUES (1966, NULL, '106.91.216.132', '中国', '重庆', '重庆市', '2025-08-25 15:22:31');
INSERT INTO `history_info` VALUES (1967, NULL, '114.43.131.41', '中国', '台湾省', NULL, '2025-08-25 18:32:46');

-- ----------------------------
-- Table structure for im_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group`;
CREATE TABLE `im_chat_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '群名称',
  `master_user_id` int(0) NOT NULL COMMENT '群主用户ID',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群头像',
  `introduction` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `notice` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告',
  `in_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '进入方式[0:无需验证，1:需要群主或管理员同意]',
  `group_type` tinyint(0) NOT NULL DEFAULT 1 COMMENT '类型[1:聊天群，2:话题]',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '聊天群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_group
-- ----------------------------
INSERT INTO `im_chat_group` VALUES (-1, '公共聊天室', 1, '/static/assets/11725790072272833.jpg', '公共聊天室', '欢迎光临！', 0, 1, '2024-09-03 21:44:02');

-- ----------------------------
-- Table structure for im_chat_group_user
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group_user`;
CREATE TABLE `im_chat_group_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(0) NOT NULL COMMENT '群ID',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `verify_user_id` int(0) NULL DEFAULT NULL COMMENT '审核用户ID',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `admin_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否管理员[0:否，1:是]',
  `user_status` tinyint(0) NOT NULL COMMENT '用户状态[0:未审核，1:审核通过，2:禁言]',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '聊天群成员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_group_user
-- ----------------------------
INSERT INTO `im_chat_group_user` VALUES (1, -1, 1, NULL, NULL, 1, 1, '2024-09-03 21:44:02');
INSERT INTO `im_chat_group_user` VALUES (2, -1, 2, 1, NULL, 0, 2, '2024-09-04 21:41:51');

-- ----------------------------
-- Table structure for im_chat_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_friend`;
CREATE TABLE `im_chat_user_friend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `friend_id` int(0) NOT NULL COMMENT '好友ID',
  `friend_status` tinyint(0) NOT NULL COMMENT '朋友状态[0:未审核，1:审核通过]',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '好友' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_user_friend
-- ----------------------------
INSERT INTO `im_chat_user_friend` VALUES (1, 2, 1, 1, '站长', '2024-09-04 21:41:51');
INSERT INTO `im_chat_user_friend` VALUES (2, 1, 2, 1, '王美玲', '2024-09-04 21:41:51');

-- ----------------------------
-- Table structure for im_chat_user_group_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_group_message`;
CREATE TABLE `im_chat_user_group_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(0) NOT NULL COMMENT '群ID',
  `from_id` int(0) NOT NULL COMMENT '发送ID',
  `to_id` int(0) NULL DEFAULT NULL COMMENT '接收ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群聊记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_user_group_message
-- ----------------------------
INSERT INTO `im_chat_user_group_message` VALUES (1, -1, 1, NULL, '你们好啊，各位', '2024-09-04 00:20:48');

-- ----------------------------
-- Table structure for im_chat_user_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_message`;
CREATE TABLE `im_chat_user_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `from_id` int(0) NOT NULL COMMENT '发送ID',
  `to_id` int(0) NOT NULL COMMENT '接收ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `message_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读[0:未读，1:已读]',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `union_index`(`to_id`, `message_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '单聊记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_user_message
-- ----------------------------
INSERT INTO `im_chat_user_message` VALUES (1, 1, 2, '做人不要太攀比，踏踏实实做自己！', 1, '2024-09-08 16:44:16');
INSERT INTO `im_chat_user_message` VALUES (2, 2, 1, '天狂必有雨，人恶必有货，做人做事别太过！', 1, '2024-09-11 08:32:19');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sort_id` int(0) NOT NULL COMMENT '分类ID',
  `label_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `label_description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, 1, '测试标签', '测试标签');
INSERT INTO `label` VALUES (2, 4, '唠唠', '说说生活里的烦心事吧');
INSERT INTO `label` VALUES (6, 5, 'Java', 'Java');
INSERT INTO `label` VALUES (7, 5, '服务器', '服务器');
INSERT INTO `label` VALUES (8, 5, 'Vue', 'Vue');
INSERT INTO `label` VALUES (9, 5, 'Windows技巧', 'Windows技巧');
INSERT INTO `label` VALUES (10, 5, 'Python', 'Python');
INSERT INTO `label` VALUES (11, 5, '网络', '网络');
INSERT INTO `label` VALUES (12, 5, '专升本-高数', '专升本-高数');
INSERT INTO `label` VALUES (13, 5, '域名', '域名');
INSERT INTO `label` VALUES (14, 5, 'PHP', 'PHP');
INSERT INTO `label` VALUES (15, 5, 'Nas', 'Nas');
INSERT INTO `label` VALUES (16, 5, 'Docker', 'Docker');
INSERT INTO `label` VALUES (17, 2, '那些小事儿', '那些小事儿');
INSERT INTO `label` VALUES (18, 5, 'HTML+CSS+JS', 'HTML+CSS+JS');
INSERT INTO `label` VALUES (19, 5, 'MySQL', 'MySQL');
INSERT INTO `label` VALUES (20, 3, '求职', '求职');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源类型',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源路径',
  `size` int(0) NULL DEFAULT NULL COMMENT '资源内容的大小，单位：字节',
  `original_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `mime_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资源的 MIME 类型',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
  `store_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储平台',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_path`(`path`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 407 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (4, 1, 'articleCover', '/static/articleCover/Sara11725372874889648.png', 2067932, '屏幕截图.png', 'image/png', 1, 'local', '2024-09-03 22:14:34');
INSERT INTO `resource` VALUES (8, 1, 'assets', '/static/assets/Sara11725373799695226.png', 5141456, 'Snipaste_2024-09-03_22-29-31.png', 'image/png', 1, 'local', '2024-09-03 22:29:59');
INSERT INTO `resource` VALUES (10, 1, 'webAvatar', '/static/webAvatar/11725374738337422.png', 375288, 'logo.png', 'image/png', 1, 'local', '2024-09-03 22:45:38');
INSERT INTO `resource` VALUES (11, 1, 'lovePhotoCover', '/static/lovePhotoCover/11725377204508857.jpg', 251115, '壁纸3.jpg', 'image/jpeg', 1, 'local', '2024-09-03 23:26:44');
INSERT INTO `resource` VALUES (12, 1, 'lovePhotoCover', '/static/lovePhotoCover/11725377204509640.jpg', 234832, '壁纸6.jpg', 'image/jpeg', 1, 'local', '2024-09-03 23:26:44');
INSERT INTO `resource` VALUES (17, 1, 'im/groupAvatar', '/static/im/groupAvatar/11725380472235501.jpg', 165036, '手机壁纸.jpg', 'image/jpeg', 1, 'local', '2024-09-04 00:21:12');
INSERT INTO `resource` VALUES (22, 1, 'commentPicture', '/static/commentPicture/11725514953137458.gif', 118732, '动图2.gif', 'image/gif', 1, 'local', '2024-09-05 13:42:40');
INSERT INTO `resource` VALUES (23, 1, 'assets', '/static/assets/11725790072272833.jpg', 31668, '头像 - 副本.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:07:52');
INSERT INTO `resource` VALUES (26, 1, 'love/bgCover', '/static/love/bgCover/11725790513474136.jpg', 174643, '壁纸7.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:15:13');
INSERT INTO `resource` VALUES (27, 1, 'love/manCover', '/static/love/manCover/11725790521635981.jpg', 31668, '头像 - 副本.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:15:21');
INSERT INTO `resource` VALUES (29, 1, 'lovePhotoCover', '/static/lovePhotoCover/11725791561446556.jpeg', 1378464, '壁纸4.jpeg', 'image/jpeg', 1, 'local', '2024-09-08 18:32:45');
INSERT INTO `resource` VALUES (30, 1, 'favoritesCover', '/static/favoritesCover/11725791663381459.jpg', 31668, '头像 - 副本.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:34:23');
INSERT INTO `resource` VALUES (31, 1, 'favoritesCover', '/static/favoritesCover/11725792123616859.png', 194366, '抖音好友码.png', 'image/png', 1, 'local', '2024-09-08 18:42:04');
INSERT INTO `resource` VALUES (32, 1, 'funnyUrl', '/static/funnyUrl/11725792392743455.mp3', 8553541, '不分手的恋爱 - 汪苏泷.mp3', 'audio/mpeg', 1, 'local', '2024-09-08 18:46:43');
INSERT INTO `resource` VALUES (34, 1, 'funnyCover', '/static/funnyCover/11725792535681950.jpg', 55847, '不分手的恋爱.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:48:56');
INSERT INTO `resource` VALUES (35, 1, 'lovePhotoCover', '/static/lovePhotoCover/11725793098838899.jpg', 31668, '头像 - 副本.jpg', 'image/jpeg', 1, 'local', '2024-09-08 18:58:19');
INSERT INTO `resource` VALUES (36, 1, 'userAvatar', '/static/userAvatar/11725793284182778.jpg', 31668, '头像 - 副本.jpg', 'image/jpeg', 1, 'local', '2024-09-08 19:01:24');
INSERT INTO `resource` VALUES (38, 1, 'lovePhotoCover', '/static/lovePhotoCover/11725797469925612.jpg', 108205, '头像白菜小黄鸭.jpg', 'image/jpeg', 1, 'local', '2024-09-08 20:11:10');
INSERT INTO `resource` VALUES (39, 1, 'love/womanCover', '/static/love/womanCover/11725797554478913.jpg', 108205, '头像白菜小黄鸭.jpg', 'image/jpeg', 1, 'local', '2024-09-08 20:12:34');
INSERT INTO `resource` VALUES (41, 1, 'articlePicture', '/static/articlePicture/11725861551367686.png', 194249, 'image.png', 'image/png', 1, 'local', '2024-09-09 13:59:23');
INSERT INTO `resource` VALUES (42, 1, 'articlePicture', '/static/articlePicture/11725862389500868.png', 49892, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:13:12');
INSERT INTO `resource` VALUES (43, 1, 'articlePicture', '/static/articlePicture/11725862415730969.png', 49923, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:13:37');
INSERT INTO `resource` VALUES (44, 1, 'articlePicture', '/static/articlePicture/11725862526867593.png', 42873, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:15:28');
INSERT INTO `resource` VALUES (45, 1, 'articlePicture', '/static/articlePicture/11725862917395780.png', 90046, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:22:01');
INSERT INTO `resource` VALUES (46, 1, 'articlePicture', '/static/articlePicture/11725862942961686.png', 80769, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:22:26');
INSERT INTO `resource` VALUES (47, 1, 'articlePicture', '/static/articlePicture/11725862984062931.png', 376136, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:23:18');
INSERT INTO `resource` VALUES (48, 1, 'articlePicture', '/static/articlePicture/1172586302745113.png', 107486, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:23:51');
INSERT INTO `resource` VALUES (49, 1, 'articlePicture', '/static/articlePicture/11725863455928468.png', 127610, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:31:02');
INSERT INTO `resource` VALUES (50, 1, 'articlePicture', '/static/articlePicture/11725863551847104.png', 58951, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:32:35');
INSERT INTO `resource` VALUES (51, 1, 'articlePicture', '/static/articlePicture/11725863566415301.png', 255584, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:32:58');
INSERT INTO `resource` VALUES (52, 1, 'articlePicture', '/static/articlePicture/11725863814762400.png', 268093, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:37:06');
INSERT INTO `resource` VALUES (53, 1, 'articlePicture', '/static/articlePicture/11725863834614766.png', 209215, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:37:25');
INSERT INTO `resource` VALUES (54, 1, 'articlePicture', '/static/articlePicture/11725863848574105.png', 107312, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:37:34');
INSERT INTO `resource` VALUES (55, 1, 'articlePicture', '/static/articlePicture/1172586389038756.png', 59594, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:38:12');
INSERT INTO `resource` VALUES (56, 1, 'articlePicture', '/static/articlePicture/11725863906661140.png', 82870, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:38:29');
INSERT INTO `resource` VALUES (57, 1, 'articlePicture', '/static/articlePicture/11725863934692421.png', 442887, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:39:07');
INSERT INTO `resource` VALUES (58, 1, 'articlePicture', '/static/articlePicture/11725864397137287.png', 292966, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:46:49');
INSERT INTO `resource` VALUES (59, 1, 'articlePicture', '/static/articlePicture/11725864435313825.png', 65990, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:47:18');
INSERT INTO `resource` VALUES (60, 1, 'articlePicture', '/static/articlePicture/11725864437878656.png', 65990, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:47:20');
INSERT INTO `resource` VALUES (61, 1, 'articlePicture', '/static/articlePicture/1172586445657285.png', 245526, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:47:47');
INSERT INTO `resource` VALUES (62, 1, 'articlePicture', '/static/articlePicture/11725864539610611.png', 58402, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:49:01');
INSERT INTO `resource` VALUES (63, 1, 'articlePicture', '/static/articlePicture/11725864594935543.png', 14768, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:49:55');
INSERT INTO `resource` VALUES (64, 1, 'articlePicture', '/static/articlePicture/11725864625287140.png', 70763, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:50:26');
INSERT INTO `resource` VALUES (65, 1, 'articlePicture', '/static/articlePicture/11725864631100735.png', 70763, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:50:31');
INSERT INTO `resource` VALUES (66, 1, 'articlePicture', '/static/articlePicture/11725864647210902.png', 99213, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:50:47');
INSERT INTO `resource` VALUES (67, 1, 'articlePicture', '/static/articlePicture/11725864675508372.png', 98041, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:51:17');
INSERT INTO `resource` VALUES (68, 1, 'articlePicture', '/static/articlePicture/11725864691714857.png', 123361, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:51:32');
INSERT INTO `resource` VALUES (69, 1, 'articlePicture', '/static/articlePicture/11725864739117869.png', 240895, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:52:21');
INSERT INTO `resource` VALUES (70, 1, 'articlePicture', '/static/articlePicture/11725864762573976.png', 351997, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:52:45');
INSERT INTO `resource` VALUES (71, 1, 'articlePicture', '/static/articlePicture/11725864777329596.png', 405143, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:52:58');
INSERT INTO `resource` VALUES (72, 1, 'articlePicture', '/static/articlePicture/11725864890926961.png', 196799, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:54:52');
INSERT INTO `resource` VALUES (73, 1, 'articlePicture', '/static/articlePicture/11725865001690259.png', 29504, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:56:43');
INSERT INTO `resource` VALUES (74, 1, 'articlePicture', '/static/articlePicture/11725865051002513.png', 28670, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:57:31');
INSERT INTO `resource` VALUES (75, 1, 'articlePicture', '/static/articlePicture/11725865154151483.png', 138013, 'image.png', 'image/png', 1, 'local', '2024-09-09 14:59:16');
INSERT INTO `resource` VALUES (76, 1, 'articlePicture', '/static/articlePicture/11725865255274913.png', 123057, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:01:00');
INSERT INTO `resource` VALUES (77, 1, 'articlePicture', '/static/articlePicture/11725865269783965.png', 129381, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:01:14');
INSERT INTO `resource` VALUES (78, 1, 'articlePicture', '/static/articlePicture/11725865310640498.png', 352481, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:02:05');
INSERT INTO `resource` VALUES (79, 1, 'articlePicture', '/static/articlePicture/1172586533622043.png', 167456, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:02:20');
INSERT INTO `resource` VALUES (80, 1, 'articlePicture', '/static/articlePicture/11725865360067492.png', 90757, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:02:41');
INSERT INTO `resource` VALUES (81, 1, 'articlePicture', '/static/articlePicture/11725865424529120.png', 593228, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:03:48');
INSERT INTO `resource` VALUES (82, 1, 'articlePicture', '/static/articlePicture/11725865439030445.png', 457111, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:04:13');
INSERT INTO `resource` VALUES (83, 1, 'articlePicture', '/static/articlePicture/11725865453072795.png', 604761, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:04:43');
INSERT INTO `resource` VALUES (84, 1, 'articlePicture', '/static/articlePicture/11725865473215357.png', 447591, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:05:05');
INSERT INTO `resource` VALUES (85, 1, 'articlePicture', '/static/articlePicture/11725865465508383.png', 786504, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:05:08');
INSERT INTO `resource` VALUES (86, 1, 'articlePicture', '/static/articlePicture/11725865486671430.png', 536078, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:05:16');
INSERT INTO `resource` VALUES (87, 1, 'articlePicture', '/static/articlePicture/11725865504437492.png', 830118, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:05:22');
INSERT INTO `resource` VALUES (88, 1, 'articlePicture', '/static/articlePicture/11725865895570471.png', 344440, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:11:39');
INSERT INTO `resource` VALUES (89, 1, 'articlePicture', '/static/articlePicture/1172586594911142.png', 204104, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:12:30');
INSERT INTO `resource` VALUES (90, 1, 'articlePicture', '/static/articlePicture/11725866378513924.png', 59297, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:19:39');
INSERT INTO `resource` VALUES (91, 1, 'articlePicture', '/static/articlePicture/11725866636211138.png', 34099, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:23:57');
INSERT INTO `resource` VALUES (92, 1, 'articlePicture', '/static/articlePicture/1172586667964010.png', 166565, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:24:48');
INSERT INTO `resource` VALUES (93, 1, 'articlePicture', '/static/articlePicture/11725866789961279.png', 131331, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:26:31');
INSERT INTO `resource` VALUES (94, 1, 'articlePicture', '/static/articlePicture/11725867980121391.png', 609537, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:46:29');
INSERT INTO `resource` VALUES (95, 1, 'articlePicture', '/static/articlePicture/11725868042473586.png', 609537, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:47:59');
INSERT INTO `resource` VALUES (96, 1, 'articlePicture', '/static/articlePicture/11725868050290688.png', 690071, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:48:27');
INSERT INTO `resource` VALUES (97, 1, 'articlePicture', '/static/articlePicture/11725868053238215.png', 648276, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:48:28');
INSERT INTO `resource` VALUES (98, 1, 'articlePicture', '/static/articlePicture/11725868122586234.png', 651458, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:49:12');
INSERT INTO `resource` VALUES (99, 1, 'articlePicture', '/static/articlePicture/11725868135108858.png', 704785, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:49:35');
INSERT INTO `resource` VALUES (100, 1, 'articlePicture', '/static/articlePicture/11725868150961339.png', 421392, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:49:38');
INSERT INTO `resource` VALUES (101, 1, 'articlePicture', '/static/articlePicture/1172586817081313.png', 421392, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:49:50');
INSERT INTO `resource` VALUES (102, 1, 'articlePicture', '/static/articlePicture/11725868174579365.png', 598918, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:49:52');
INSERT INTO `resource` VALUES (103, 1, 'articlePicture', '/static/articlePicture/11725868201198760.png', 418536, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:50:07');
INSERT INTO `resource` VALUES (104, 1, 'articlePicture', '/static/articlePicture/11725868214247969.png', 822197, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:50:24');
INSERT INTO `resource` VALUES (105, 1, 'articlePicture', '/static/articlePicture/11725868227871842.png', 1009396, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:50:35');
INSERT INTO `resource` VALUES (106, 1, 'articlePicture', '/static/articlePicture/11725868238482645.png', 990186, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:50:50');
INSERT INTO `resource` VALUES (107, 1, 'articlePicture', '/static/articlePicture/11725868248637119.png', 831989, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:50:55');
INSERT INTO `resource` VALUES (108, 1, 'articlePicture', '/static/articlePicture/11725868259184349.png', 1052060, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:51:13');
INSERT INTO `resource` VALUES (109, 1, 'articlePicture', '/static/articlePicture/11725868281668613.png', 601689, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:51:24');
INSERT INTO `resource` VALUES (110, 1, 'articlePicture', '/static/articlePicture/11725868302932508.png', 558508, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:51:49');
INSERT INTO `resource` VALUES (111, 1, 'articlePicture', '/static/articlePicture/11725868318395508.png', 413142, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:52:05');
INSERT INTO `resource` VALUES (112, 1, 'articlePicture', '/static/articlePicture/11725868329688584.png', 345159, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:52:11');
INSERT INTO `resource` VALUES (113, 1, 'articlePicture', '/static/articlePicture/11725868339120580.png', 164422, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:52:21');
INSERT INTO `resource` VALUES (114, 1, 'articlePicture', '/static/articlePicture/11725868347531946.png', 45370, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:52:28');
INSERT INTO `resource` VALUES (115, 1, 'articlePicture', '/static/articlePicture/11725868361263791.png', 762130, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:53:32');
INSERT INTO `resource` VALUES (116, 1, 'articlePicture', '/static/articlePicture/11725868384602199.png', 413244, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:53:39');
INSERT INTO `resource` VALUES (117, 1, 'articlePicture', '/static/articlePicture/11725868418090839.png', 520392, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:53:59');
INSERT INTO `resource` VALUES (118, 1, 'articlePicture', '/static/articlePicture/11725868397011992.png', 649441, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:54:01');
INSERT INTO `resource` VALUES (119, 1, 'articlePicture', '/static/articlePicture/11725868504289267.png', 697120, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:55:25');
INSERT INTO `resource` VALUES (120, 1, 'articlePicture', '/static/articlePicture/11725868516741702.png', 584188, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:55:32');
INSERT INTO `resource` VALUES (121, 1, 'articlePicture', '/static/articlePicture/11725868530823813.png', 436086, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:55:36');
INSERT INTO `resource` VALUES (122, 1, 'articlePicture', '/static/articlePicture/11725868540880548.png', 329003, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:55:43');
INSERT INTO `resource` VALUES (123, 1, 'articlePicture', '/static/articlePicture/11725868550027847.png', 706951, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:55:54');
INSERT INTO `resource` VALUES (124, 1, 'articlePicture', '/static/articlePicture/11725868557714798.png', 605531, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:56:02');
INSERT INTO `resource` VALUES (125, 1, 'articlePicture', '/static/articlePicture/11725868566322719.png', 728739, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:56:10');
INSERT INTO `resource` VALUES (126, 1, 'articlePicture', '/static/articlePicture/11725868576549886.png', 312373, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:56:18');
INSERT INTO `resource` VALUES (127, 1, 'articlePicture', '/static/articlePicture/11725868585292885.png', 711718, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:06');
INSERT INTO `resource` VALUES (128, 1, 'articlePicture', '/static/articlePicture/11725868595164396.png', 769910, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:08');
INSERT INTO `resource` VALUES (129, 1, 'articlePicture', '/static/articlePicture/11725868607491821.png', 653391, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:10');
INSERT INTO `resource` VALUES (130, 1, 'articlePicture', '/static/articlePicture/11725868617286793.png', 663012, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:11');
INSERT INTO `resource` VALUES (131, 1, 'articlePicture', '/static/articlePicture/11725868628093375.png', 1803719, 'Snipaste_2024-09-09_15-57-06.png', 'image/png', 1, 'local', '2024-09-09 15:57:14');
INSERT INTO `resource` VALUES (132, 1, 'articlePicture', '/static/articlePicture/11725868650160360.png', 113709, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:30');
INSERT INTO `resource` VALUES (133, 1, 'articlePicture', '/static/articlePicture/11725868657934590.png', 636702, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:41');
INSERT INTO `resource` VALUES (134, 1, 'articlePicture', '/static/articlePicture/1172586866558093.png', 347395, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:47');
INSERT INTO `resource` VALUES (135, 1, 'articlePicture', '/static/articlePicture/1172586867551292.png', 208550, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:57:57');
INSERT INTO `resource` VALUES (136, 1, 'articlePicture', '/static/articlePicture/11725868684501689.png', 477325, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:58:06');
INSERT INTO `resource` VALUES (137, 1, 'articlePicture', '/static/articlePicture/11725868703154222.png', 755071, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:58:29');
INSERT INTO `resource` VALUES (138, 1, 'articlePicture', '/static/articlePicture/11725868717968396.png', 799972, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:58:42');
INSERT INTO `resource` VALUES (139, 1, 'articlePicture', '/static/articlePicture/11725868727862398.png', 165649, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:58:48');
INSERT INTO `resource` VALUES (140, 1, 'articlePicture', '/static/articlePicture/117258687366315.png', 815176, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:58:58');
INSERT INTO `resource` VALUES (141, 1, 'articlePicture', '/static/articlePicture/11725868745210246.png', 750826, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:59:07');
INSERT INTO `resource` VALUES (142, 1, 'articlePicture', '/static/articlePicture/11725868754791839.png', 761383, 'image.png', 'image/png', 1, 'local', '2024-09-09 15:59:17');
INSERT INTO `resource` VALUES (143, 1, 'articlePicture', '/static/articlePicture/11725868872691523.png', 284400, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:01:15');
INSERT INTO `resource` VALUES (144, 1, 'articlePicture', '/static/articlePicture/1172586888878483.png', 480476, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:01:42');
INSERT INTO `resource` VALUES (145, 1, 'articlePicture', '/static/articlePicture/11725868978707562.png', 501630, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:03:01');
INSERT INTO `resource` VALUES (146, 1, 'articlePicture', '/static/articlePicture/11725868991198525.png', 550829, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:03:15');
INSERT INTO `resource` VALUES (147, 1, 'articlePicture', '/static/articlePicture/11725869004486167.png', 580197, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:03:31');
INSERT INTO `resource` VALUES (148, 1, 'articlePicture', '/static/articlePicture/11725869015566683.png', 489009, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:03:38');
INSERT INTO `resource` VALUES (149, 1, 'articlePicture', '/static/articlePicture/11725869043914195.png', 603306, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:04:05');
INSERT INTO `resource` VALUES (150, 1, 'articlePicture', '/static/articlePicture/11725869062275566.png', 160095, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:04:23');
INSERT INTO `resource` VALUES (151, 1, 'articlePicture', '/static/articlePicture/11725869076431818.png', 495652, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:04:37');
INSERT INTO `resource` VALUES (152, 1, 'articlePicture', '/static/articlePicture/11725869084937343.png', 92500, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:04:45');
INSERT INTO `resource` VALUES (153, 1, 'articlePicture', '/static/articlePicture/11725869093507236.png', 118216, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:04:53');
INSERT INTO `resource` VALUES (154, 1, 'articlePicture', '/static/articlePicture/11725869108526691.png', 544937, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:05:09');
INSERT INTO `resource` VALUES (155, 1, 'articlePicture', '/static/articlePicture/11725869117361696.png', 337274, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:05:18');
INSERT INTO `resource` VALUES (156, 1, 'articlePicture', '/static/articlePicture/1172586912630816.png', 687965, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:05:27');
INSERT INTO `resource` VALUES (157, 1, 'articlePicture', '/static/articlePicture/11725869209904230.png', 859110, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:06:52');
INSERT INTO `resource` VALUES (158, 1, 'articlePicture', '/static/articlePicture/11725869444230416.gif', 7538963, '注释.gif', 'image/gif', 1, 'local', '2024-09-09 16:10:55');
INSERT INTO `resource` VALUES (159, 1, 'articlePicture', '/static/articlePicture/1172586950786556.gif', 2028460, '注释1.gif', 'image/gif', 1, 'local', '2024-09-09 16:11:58');
INSERT INTO `resource` VALUES (160, 1, 'articlePicture', '/static/articlePicture/11725869547006567.gif', 2159862, '注释2.gif', 'image/gif', 1, 'local', '2024-09-09 16:12:31');
INSERT INTO `resource` VALUES (161, 1, 'articlePicture', '/static/articlePicture/11725869574317668.gif', 2213430, '注释3.gif', 'image/gif', 1, 'local', '2024-09-09 16:13:02');
INSERT INTO `resource` VALUES (162, 1, 'articlePicture', '/static/articlePicture/11725869800347500.png', 610818, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:16:44');
INSERT INTO `resource` VALUES (163, 1, 'articlePicture', '/static/articlePicture/11725869831180786.png', 98715, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:17:11');
INSERT INTO `resource` VALUES (164, 1, 'articlePicture', '/static/articlePicture/11725869857097740.png', 71856, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:17:37');
INSERT INTO `resource` VALUES (165, 1, 'articlePicture', '/static/articlePicture/11725869887518664.png', 71353, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:18:08');
INSERT INTO `resource` VALUES (166, 1, 'articlePicture', '/static/articlePicture/11725869908809152.png', 101693, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:18:30');
INSERT INTO `resource` VALUES (167, 1, 'articlePicture', '/static/articlePicture/11725869966014891.png', 53927, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:19:26');
INSERT INTO `resource` VALUES (168, 1, 'articlePicture', '/static/articlePicture/11725869998335254.png', 35982, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:19:58');
INSERT INTO `resource` VALUES (169, 1, 'articlePicture', '/static/articlePicture/11725870015839840.png', 74508, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:20:16');
INSERT INTO `resource` VALUES (170, 1, 'articlePicture', '/static/articlePicture/11725870052632664.png', 111234, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:20:53');
INSERT INTO `resource` VALUES (171, 1, 'articlePicture', '/static/articlePicture/1172587006745630.png', 459225, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:21:09');
INSERT INTO `resource` VALUES (172, 1, 'articlePicture', '/static/articlePicture/1172587009781194.png', 368554, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:21:38');
INSERT INTO `resource` VALUES (173, 1, 'articlePicture', '/static/articlePicture/11725871215840564.png', 561770, 'image.png', 'image/png', 1, 'local', '2024-09-09 16:40:29');
INSERT INTO `resource` VALUES (174, 1, 'articlePicture', '/static/articlePicture/11725872673861683.png', 706578, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:05:02');
INSERT INTO `resource` VALUES (175, 1, 'articlePicture', '/static/articlePicture/11725872710334776.png', 394995, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:05:25');
INSERT INTO `resource` VALUES (176, 1, 'articlePicture', '/static/articlePicture/11725872721851800.png', 561451, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:05:49');
INSERT INTO `resource` VALUES (177, 1, 'articlePicture', '/static/articlePicture/11725872760950264.png', 490156, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:06:30');
INSERT INTO `resource` VALUES (178, 1, 'articlePicture', '/static/articlePicture/11725872775796486.png', 502597, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:07:04');
INSERT INTO `resource` VALUES (179, 1, 'articlePicture', '/static/articlePicture/11725873136577375.png', 589814, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:12:22');
INSERT INTO `resource` VALUES (180, 1, 'articlePicture', '/static/articlePicture/11725873146174385.png', 378386, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:12:30');
INSERT INTO `resource` VALUES (181, 1, 'articlePicture', '/static/articlePicture/11725873156363690.png', 782016, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:12:45');
INSERT INTO `resource` VALUES (182, 1, 'articlePicture', '/static/articlePicture/1172587316520056.png', 509465, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:12:54');
INSERT INTO `resource` VALUES (183, 1, 'articlePicture', '/static/articlePicture/11725873178447870.png', 625684, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:13:10');
INSERT INTO `resource` VALUES (184, 1, 'articlePicture', '/static/articlePicture/1172587320359122.png', 585371, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:13:32');
INSERT INTO `resource` VALUES (185, 1, 'articlePicture', '/static/articlePicture/11725873215545878.png', 570774, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:13:45');
INSERT INTO `resource` VALUES (186, 1, 'articlePicture', '/static/articlePicture/11725873236449557.png', 443222, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:14:18');
INSERT INTO `resource` VALUES (187, 1, 'articlePicture', '/static/articlePicture/11725873247137825.png', 618250, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:14:29');
INSERT INTO `resource` VALUES (188, 1, 'articlePicture', '/static/articlePicture/11725873254987325.png', 604907, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:14:38');
INSERT INTO `resource` VALUES (189, 1, 'articlePicture', '/static/articlePicture/11725873265239124.png', 590087, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:14:44');
INSERT INTO `resource` VALUES (190, 1, 'articlePicture', '/static/articlePicture/11725873277609178.png', 762821, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:14:49');
INSERT INTO `resource` VALUES (191, 1, 'articlePicture', '/static/articlePicture/11725873288618272.png', 700889, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:15:03');
INSERT INTO `resource` VALUES (192, 1, 'articlePicture', '/static/articlePicture/11725873429401591.png', 691267, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:17:16');
INSERT INTO `resource` VALUES (193, 1, 'articlePicture', '/static/articlePicture/11725873439158616.png', 718904, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:17:27');
INSERT INTO `resource` VALUES (194, 1, 'articlePicture', '/static/articlePicture/11725873446562899.png', 93709, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:17:29');
INSERT INTO `resource` VALUES (195, 1, 'articlePicture', '/static/articlePicture/1172587346559211.png', 1689058, 'Snipaste_2024-09-09_17-17-41.png', 'image/png', 1, 'local', '2024-09-09 17:18:06');
INSERT INTO `resource` VALUES (196, 1, 'articlePicture', '/static/articlePicture/11725873487947343.png', 622127, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:18:26');
INSERT INTO `resource` VALUES (197, 1, 'articlePicture', '/static/articlePicture/11725873496630527.png', 696557, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:18:52');
INSERT INTO `resource` VALUES (198, 1, 'articlePicture', '/static/articlePicture/11725873515459873.png', 263966, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:18:53');
INSERT INTO `resource` VALUES (199, 1, 'articlePicture', '/static/articlePicture/11725873477182798.png', 1694136, 'Snipaste_2024-09-09_17-17-56.png', 'image/png', 1, 'local', '2024-09-09 17:18:53');
INSERT INTO `resource` VALUES (200, 1, 'articlePicture', '/static/articlePicture/11725873505789937.png', 673548, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:18:57');
INSERT INTO `resource` VALUES (201, 1, 'articlePicture', '/static/articlePicture/11725873575591753.png', 170018, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:19:36');
INSERT INTO `resource` VALUES (202, 1, 'articlePicture', '/static/articlePicture/11725873583820861.png', 499383, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:19:48');
INSERT INTO `resource` VALUES (203, 1, 'articlePicture', '/static/articlePicture/11725873593801546.png', 661023, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:19:59');
INSERT INTO `resource` VALUES (204, 1, 'articlePicture', '/static/articlePicture/11725873602699497.png', 727772, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:20:10');
INSERT INTO `resource` VALUES (205, 1, 'articlePicture', '/static/articlePicture/11725873625751588.png', 820712, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:20:41');
INSERT INTO `resource` VALUES (206, 1, 'articlePicture', '/static/articlePicture/11725873615021298.png', 1805871, 'Snipaste_2024-09-09_17-20-10.png', 'image/png', 1, 'local', '2024-09-09 17:20:42');
INSERT INTO `resource` VALUES (207, 1, 'articlePicture', '/static/articlePicture/11725873644567128.png', 279564, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:20:51');
INSERT INTO `resource` VALUES (208, 1, 'articlePicture', '/static/articlePicture/11725873652096183.png', 454642, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:21:11');
INSERT INTO `resource` VALUES (209, 1, 'articlePicture', '/static/articlePicture/11725873659852456.png', 342837, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:21:20');
INSERT INTO `resource` VALUES (210, 1, 'articlePicture', '/static/articlePicture/11725873636715917.png', 1811100, 'Snipaste_2024-09-09_17-20-35.png', 'image/png', 1, 'local', '2024-09-09 17:21:35');
INSERT INTO `resource` VALUES (211, 1, 'articlePicture', '/static/articlePicture/11725873670357787.png', 408511, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:21:36');
INSERT INTO `resource` VALUES (212, 1, 'articlePicture', '/static/articlePicture/11725873683599216.png', 343373, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:21:43');
INSERT INTO `resource` VALUES (213, 1, 'articlePicture', '/static/articlePicture/11725873707432826.png', 641509, 'image.png', 'image/png', 1, 'local', '2024-09-09 17:22:19');
INSERT INTO `resource` VALUES (214, 1, 'articlePicture', '/static/articlePicture/11725873692495832.png', 1814224, 'Snipaste_2024-09-09_17-21-30.png', 'image/png', 1, 'local', '2024-09-09 17:22:28');
INSERT INTO `resource` VALUES (215, 1, 'articlePicture', '/static/articlePicture/11725954925220795.png', 544314, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:55:26');
INSERT INTO `resource` VALUES (216, 1, 'articlePicture', '/static/articlePicture/11725954940027482.png', 571919, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:55:40');
INSERT INTO `resource` VALUES (217, 1, 'articlePicture', '/static/articlePicture/11725954954113723.png', 543743, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:55:54');
INSERT INTO `resource` VALUES (218, 1, 'articlePicture', '/static/articlePicture/11725954967983376.png', 755119, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:56:08');
INSERT INTO `resource` VALUES (219, 1, 'articlePicture', '/static/articlePicture/11725954982432241.png', 666159, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:56:23');
INSERT INTO `resource` VALUES (220, 1, 'articlePicture', '/static/articlePicture/11725954994294691.png', 132974, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:56:34');
INSERT INTO `resource` VALUES (221, 1, 'articlePicture', '/static/articlePicture/11725955006650541.png', 429016, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:56:47');
INSERT INTO `resource` VALUES (222, 1, 'articlePicture', '/static/articlePicture/11725955057457354.png', 361119, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:57:37');
INSERT INTO `resource` VALUES (223, 1, 'articlePicture', '/static/articlePicture/11725955068922971.png', 373883, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:57:49');
INSERT INTO `resource` VALUES (224, 1, 'articlePicture', '/static/articlePicture/11725955082104522.png', 472077, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:58:02');
INSERT INTO `resource` VALUES (225, 1, 'articlePicture', '/static/articlePicture/11725955135222814.png', 559250, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:58:55');
INSERT INTO `resource` VALUES (226, 1, 'articlePicture', '/static/articlePicture/11725955152948737.png', 831549, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:59:13');
INSERT INTO `resource` VALUES (227, 1, 'articlePicture', '/static/articlePicture/11725955162986421.png', 507184, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:59:23');
INSERT INTO `resource` VALUES (228, 1, 'articlePicture', '/static/articlePicture/11725955173663276.png', 619348, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:59:34');
INSERT INTO `resource` VALUES (229, 1, 'articlePicture', '/static/articlePicture/11725955191958997.png', 634346, 'image.png', 'image/png', 1, 'local', '2024-09-10 15:59:52');
INSERT INTO `resource` VALUES (230, 1, 'articlePicture', '/static/articlePicture/11725955205274995.png', 424629, 'image.png', 'image/png', 1, 'local', '2024-09-10 16:00:05');
INSERT INTO `resource` VALUES (231, 1, 'articlePicture', '/static/articlePicture/11726117618657892.png', 49666, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:06:59');
INSERT INTO `resource` VALUES (232, 1, 'articlePicture', '/static/articlePicture/11726118134357498.png', 33389, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:15:34');
INSERT INTO `resource` VALUES (233, 1, 'articlePicture', '/static/articlePicture/11726118755301318.png', 40983, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:25:56');
INSERT INTO `resource` VALUES (234, 1, 'articlePicture', '/static/articlePicture/11726119144156866.png', 143109, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:32:24');
INSERT INTO `resource` VALUES (235, 1, 'articlePicture', '/static/articlePicture/11726119441048703.png', 127987, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:37:21');
INSERT INTO `resource` VALUES (236, 1, 'articlePicture', '/static/articlePicture/11726119504742103.png', 170396, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:38:25');
INSERT INTO `resource` VALUES (237, 1, 'articlePicture', '/static/articlePicture/11726119683836745.png', 144796, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:41:24');
INSERT INTO `resource` VALUES (238, 1, 'articlePicture', '/static/articlePicture/11726119686825748.png', 150161, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:41:27');
INSERT INTO `resource` VALUES (239, 1, 'articlePicture', '/static/articlePicture/11726119776986437.png', 187817, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:42:57');
INSERT INTO `resource` VALUES (240, 1, 'articlePicture', '/static/articlePicture/11726119810290585.png', 122289, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:43:30');
INSERT INTO `resource` VALUES (241, 1, 'articlePicture', '/static/articlePicture/11726119947867881.png', 139979, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:45:48');
INSERT INTO `resource` VALUES (242, 1, 'articlePicture', '/static/articlePicture/11726120034043120.png', 181546, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:47:14');
INSERT INTO `resource` VALUES (243, 1, 'articlePicture', '/static/articlePicture/11726120124786280.png', 125531, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:48:45');
INSERT INTO `resource` VALUES (244, 1, 'articlePicture', '/static/articlePicture/11726120392074832.png', 6304, 'image.png', 'image/png', 1, 'local', '2024-09-12 13:53:12');
INSERT INTO `resource` VALUES (245, 1, 'assets', '/static/assets/11726292153468250.jpg', 174643, '壁纸7.jpg', 'image/jpeg', 1, 'local', '2024-09-14 13:35:54');
INSERT INTO `resource` VALUES (246, 1, 'articlePicture', '/static/articlePicture/11726295289262883.png', 21065, 'image.png', 'image/png', 1, 'local', '2024-09-14 14:28:17');
INSERT INTO `resource` VALUES (247, 1, 'articlePicture', '/static/articlePicture/11726295324385844.png', 4912, 'image.png', 'image/png', 1, 'local', '2024-09-14 14:28:45');
INSERT INTO `resource` VALUES (248, 1, 'articlePicture', '/static/articlePicture/onew11726626224218457.png', 7319, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:23:46');
INSERT INTO `resource` VALUES (249, 1, 'articlePicture', '/static/articlePicture/onew11726626411690923.png', 11658, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:27:00');
INSERT INTO `resource` VALUES (250, 1, 'articlePicture', '/static/articlePicture/onew11726626529300747.png', 11903, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:28:50');
INSERT INTO `resource` VALUES (251, 1, 'articlePicture', '/static/articlePicture/onew11726626618083877.png', 12564, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:30:19');
INSERT INTO `resource` VALUES (252, 1, 'articlePicture', '/static/articlePicture/onew11726626678330116.png', 20924, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:31:19');
INSERT INTO `resource` VALUES (253, 1, 'articlePicture', '/static/articlePicture/onew1172662672149388.png', 20535, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:32:02');
INSERT INTO `resource` VALUES (254, 1, 'articlePicture', '/static/articlePicture/onew11726626763832676.png', 12647, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:32:45');
INSERT INTO `resource` VALUES (255, 1, 'articlePicture', '/static/articlePicture/onew11726626898164859.png', 27644, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:34:59');
INSERT INTO `resource` VALUES (256, 1, 'articlePicture', '/static/articlePicture/onew11726626918194150.png', 27644, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:35:18');
INSERT INTO `resource` VALUES (257, 1, 'articlePicture', '/static/articlePicture/onew11726627105531497.png', 28402, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:38:26');
INSERT INTO `resource` VALUES (258, 1, 'articlePicture', '/static/articlePicture/onew11726627158344489.png', 1657931, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:39:23');
INSERT INTO `resource` VALUES (259, 1, 'articlePicture', '/static/articlePicture/onew11726627388735382.png', 171652, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:43:11');
INSERT INTO `resource` VALUES (260, 1, 'articlePicture', '/static/articlePicture/onew11726627522568654.png', 20156, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:45:23');
INSERT INTO `resource` VALUES (261, 1, 'articlePicture', '/static/articlePicture/onew11726627812617825.png', 6148, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:50:14');
INSERT INTO `resource` VALUES (262, 1, 'articlePicture', '/static/articlePicture/onew11726627970010853.png', 14993, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:52:51');
INSERT INTO `resource` VALUES (263, 1, 'articlePicture', '/static/articlePicture/onew11726628008993337.png', 27770, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:53:30');
INSERT INTO `resource` VALUES (264, 1, 'articlePicture', '/static/articlePicture/onew11726628026988980.png', 11722, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:53:47');
INSERT INTO `resource` VALUES (265, 1, 'articlePicture', '/static/articlePicture/onew11726628210089146.png', 1716496, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:56:56');
INSERT INTO `resource` VALUES (266, 1, 'articlePicture', '/static/articlePicture/onew11726628276292118.png', 20127, 'image.png', 'image/png', 1, 'local', '2024-09-18 10:57:57');
INSERT INTO `resource` VALUES (267, 1, 'articlePicture', '/static/articlePicture/onew11726703798884247.jpg', 77487, '双网口Nas连线图.jpg', 'image/jpeg', 1, 'local', '2024-09-19 07:56:40');
INSERT INTO `resource` VALUES (275, 1, 'articleCover', '/static/articleCover/onew11726799017300284.jpg', 82079, 'docker-logo-blue.jpg', 'image/jpeg', 1, 'local', '2024-09-20 10:23:38');
INSERT INTO `resource` VALUES (277, 1, 'articleCover', '/static/articleCover/onew11726800156562963.jpg', 68120, 'Snipaste_2024-09-20_10-40-40.jpg', 'image/jpeg', 1, 'local', '2024-09-20 10:42:37');
INSERT INTO `resource` VALUES (278, 1, 'articleCover', '/static/articleCover/onew11726800449241770.jpg', 79395, '文章封面.jpg', 'image/jpeg', 1, 'local', '2024-09-20 10:47:31');
INSERT INTO `resource` VALUES (279, 1, 'articlePicture', '/static/articlePicture/onew11727398346163390.png', 114669, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:52:26');
INSERT INTO `resource` VALUES (280, 1, 'articlePicture', '/static/articlePicture/onew11727398385289433.png', 116965, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:53:05');
INSERT INTO `resource` VALUES (281, 1, 'articlePicture', '/static/articlePicture/onew11727398481561458.png', 44188, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:54:41');
INSERT INTO `resource` VALUES (282, 1, 'articlePicture', '/static/articlePicture/onew11727398612210350.png', 45233, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:56:52');
INSERT INTO `resource` VALUES (283, 1, 'articlePicture', '/static/articlePicture/onew11727398674527314.png', 116166, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:57:54');
INSERT INTO `resource` VALUES (284, 1, 'articlePicture', '/static/articlePicture/onew11727398694296164.png', 117689, 'image.png', 'image/png', 1, 'local', '2024-09-27 08:58:14');
INSERT INTO `resource` VALUES (285, 1, 'articleCover', '/static/articleCover/onew11727399315950783.jpg', 76989, 'PMTU黑洞.jpg', 'image/jpeg', 1, 'local', '2024-09-27 09:08:36');
INSERT INTO `resource` VALUES (286, 1, 'articlePicture', '/static/articlePicture/onew11727488557770457.png', 75483, 'image.png', 'image/png', 1, 'local', '2024-09-28 09:56:00');
INSERT INTO `resource` VALUES (287, 1, 'articlePicture', 'https://onewa.fun/static/articlePicture/onew11730203304146582.png', 155998, 'image.png', 'image/png', 1, 'local', '2024-10-29 20:01:45');
INSERT INTO `resource` VALUES (288, 1, 'articlePicture', 'https://onewa.fun/static/articlePicture/onew11730203494614223.png', 29456, 'image.png', 'image/png', 1, 'local', '2024-10-29 20:04:53');
INSERT INTO `resource` VALUES (290, 1, 'commentPicture', '/static/commentPicture/onew11730551216185847.jpg', 96416, '微信图片_20241102203949.jpg', 'image/jpeg', 1, 'local', '2024-11-02 20:40:18');
INSERT INTO `resource` VALUES (291, 1, 'commentPicture', '/static/commentPicture/onew11730551282798797.jpg', 186183, '微信图片_20241102204056.jpg', 'image/jpeg', 1, 'local', '2024-11-02 20:41:25');
INSERT INTO `resource` VALUES (292, 1, 'commentPicture', '/static/commentPicture/onew11730551294970115.jpg', 182827, '微信图片_20241102204101.jpg', 'image/jpeg', 1, 'local', '2024-11-02 20:41:36');
INSERT INTO `resource` VALUES (293, 1, 'commentPicture', '/static/commentPicture/onew11730551304148524.jpg', 165560, '微信图片_20241102204105.jpg', 'image/jpeg', 1, 'local', '2024-11-02 20:41:46');
INSERT INTO `resource` VALUES (294, 1, 'articleCover', '/static/articleCover/onew11731735019582245.jpg', 157900, 'Snipaste_2024-11-16_13-29-39.jpg', 'image/jpeg', 1, 'local', '2024-11-16 13:30:16');
INSERT INTO `resource` VALUES (295, 1, 'articlePicture', '/static/articlePicture/onew11731735063631643.jpg', 139895, 'Snipaste_2024-11-16_13-21-34.jpg', 'image/jpeg', 1, 'local', '2024-11-16 13:30:59');
INSERT INTO `resource` VALUES (296, 1, 'articlePicture', '/static/articlePicture/onew11731735075496547.jpg', 166496, 'Snipaste_2024-11-16_13-23-52.jpg', 'image/jpeg', 1, 'local', '2024-11-16 13:31:11');
INSERT INTO `resource` VALUES (297, 1, 'articlePicture', '/static/articlePicture/onew11731742346065662.jpg', 185195, 'Snipaste_2024-11-16_15-32-11.jpg', 'image/jpeg', 1, 'local', '2024-11-16 15:32:23');
INSERT INTO `resource` VALUES (298, 1, 'articlePicture', '/static/articlePicture/onew11733326878548228.png', 2974134, 'onew11733321533349133.png', 'image/png', 1, 'local', '2024-12-04 23:41:19');
INSERT INTO `resource` VALUES (299, 1, 'articlePicture', '/static/articlePicture/onew11733326918576964.png', 2974134, 'download.png', 'image/png', 1, 'local', '2024-12-04 23:41:59');
INSERT INTO `resource` VALUES (300, 1, 'articlePicture', '/static/articlePicture/onew11733326931350551.webp', 258042, 'image_2.webp', 'image/webp', 1, 'local', '2024-12-04 23:42:11');
INSERT INTO `resource` VALUES (301, 1, 'articlePicture', '/static/articlePicture/onew11733326939263228.webp', 278344, 'image_3.webp', 'image/webp', 1, 'local', '2024-12-04 23:42:19');
INSERT INTO `resource` VALUES (302, 1, 'articlePicture', '/static/articlePicture/onew11733326943609785.webp', 174220, 'image_4.webp', 'image/webp', 1, 'local', '2024-12-04 23:42:23');
INSERT INTO `resource` VALUES (303, 1, 'articlePicture', '/static/articlePicture/onew11733326948766183.webp', 137858, 'image_5.webp', 'image/webp', 1, 'local', '2024-12-04 23:42:29');
INSERT INTO `resource` VALUES (304, 1, 'articlePicture', '/static/articlePicture/onew1173332695946816.webp', 17656, 'image_6.webp', 'image/webp', 1, 'local', '2024-12-04 23:42:39');
INSERT INTO `resource` VALUES (305, 1, 'articlePicture', '/static/articlePicture/onew1173332705374099.webp', 57758, 'image_7.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:14');
INSERT INTO `resource` VALUES (306, 1, 'articlePicture', '/static/articlePicture/onew11733327064340520.webp', 59832, 'image_8.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:24');
INSERT INTO `resource` VALUES (307, 1, 'articlePicture', '/static/articlePicture/onew1173332707330443.webp', 165158, 'image_9.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:33');
INSERT INTO `resource` VALUES (308, 1, 'articlePicture', '/static/articlePicture/onew11733327078597855.webp', 144336, 'image_10.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:38');
INSERT INTO `resource` VALUES (309, 1, 'articlePicture', '/static/articlePicture/onew11733327083110850.webp', 140744, 'image_11.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:43');
INSERT INTO `resource` VALUES (310, 1, 'articlePicture', '/static/articlePicture/onew11733327087663421.webp', 169000, 'image_12.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:47');
INSERT INTO `resource` VALUES (311, 1, 'articlePicture', '/static/articlePicture/onew11733327094235602.webp', 64958, 'image_13.webp', 'image/webp', 1, 'local', '2024-12-04 23:44:54');
INSERT INTO `resource` VALUES (312, 1, 'articlePicture', '/static/articlePicture/onew11733327109662246.webp', 60042, 'image_14.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:09');
INSERT INTO `resource` VALUES (313, 1, 'articlePicture', '/static/articlePicture/onew11733327116174379.webp', 56114, 'image_15.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:16');
INSERT INTO `resource` VALUES (314, 1, 'articlePicture', '/static/articlePicture/onew11733327123588386.webp', 31082, 'image_16.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:23');
INSERT INTO `resource` VALUES (315, 1, 'articlePicture', '/static/articlePicture/onew11733327128285863.webp', 76250, 'image_17.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:28');
INSERT INTO `resource` VALUES (316, 1, 'articlePicture', '/static/articlePicture/onew11733327133817852.webp', 62692, 'image_18.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:34');
INSERT INTO `resource` VALUES (317, 1, 'articlePicture', '/static/articlePicture/onew11733327137793168.webp', 131652, 'image_19.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:38');
INSERT INTO `resource` VALUES (318, 1, 'articlePicture', '/static/articlePicture/onew11733327141576904.webp', 347232, 'image_20.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:41');
INSERT INTO `resource` VALUES (319, 1, 'articlePicture', '/static/articlePicture/onew11733327156248354.webp', 35260, 'image_21.webp', 'image/webp', 1, 'local', '2024-12-04 23:45:56');
INSERT INTO `resource` VALUES (320, 1, 'articlePicture', '/static/articlePicture/onew11733327160367402.webp', 60900, 'image_22.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:00');
INSERT INTO `resource` VALUES (321, 1, 'articlePicture', '/static/articlePicture/onew11733327167199771.webp', 58624, 'image_23.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:07');
INSERT INTO `resource` VALUES (322, 1, 'articlePicture', '/static/articlePicture/onew11733327172832382.webp', 27792, 'image_24.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:13');
INSERT INTO `resource` VALUES (323, 1, 'articlePicture', '/static/articlePicture/onew1173332717637923.webp', 50768, 'image_25.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:16');
INSERT INTO `resource` VALUES (324, 1, 'articlePicture', '/static/articlePicture/onew11733327180555694.webp', 78366, 'image_26.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:20');
INSERT INTO `resource` VALUES (325, 1, 'articlePicture', '/static/articlePicture/onew11733327184690802.webp', 34064, 'image_27.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:24');
INSERT INTO `resource` VALUES (326, 1, 'articlePicture', '/static/articlePicture/onew1173332718914287.webp', 52694, 'image_28.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:29');
INSERT INTO `resource` VALUES (327, 1, 'articlePicture', '/static/articlePicture/onew11733327194956678.webp', 67524, 'image_29.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:35');
INSERT INTO `resource` VALUES (328, 1, 'articlePicture', '/static/articlePicture/onew11733327203258654.webp', 115806, 'image_30.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:43');
INSERT INTO `resource` VALUES (329, 1, 'articlePicture', '/static/articlePicture/onew11733327207465690.webp', 13302, 'image_31.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:47');
INSERT INTO `resource` VALUES (330, 1, 'articlePicture', '/static/articlePicture/onew11733327212763588.webp', 48930, 'image_32.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:53');
INSERT INTO `resource` VALUES (331, 1, 'articlePicture', '/static/articlePicture/onew11733327216240767.webp', 52228, 'image_33.webp', 'image/webp', 1, 'local', '2024-12-04 23:46:56');
INSERT INTO `resource` VALUES (332, 1, 'articlePicture', '/static/articlePicture/onew11733327220456679.webp', 50884, 'image_34.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:00');
INSERT INTO `resource` VALUES (333, 1, 'articlePicture', '/static/articlePicture/onew11733327224239378.webp', 26896, 'image_35.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:04');
INSERT INTO `resource` VALUES (334, 1, 'articlePicture', '/static/articlePicture/onew11733327230531878.webp', 84338, 'image_36.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:10');
INSERT INTO `resource` VALUES (335, 1, 'articlePicture', '/static/articlePicture/onew11733327234945577.webp', 51228, 'image_37.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:15');
INSERT INTO `resource` VALUES (336, 1, 'articlePicture', '/static/articlePicture/onew11733327241153441.webp', 55542, 'image_38.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:21');
INSERT INTO `resource` VALUES (337, 1, 'articlePicture', '/static/articlePicture/onew11733327245242413.webp', 79764, 'image_39.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:25');
INSERT INTO `resource` VALUES (338, 1, 'articlePicture', '/static/articlePicture/onew11733327252242511.webp', 102840, 'image_40.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:32');
INSERT INTO `resource` VALUES (339, 1, 'articlePicture', '/static/articlePicture/onew11733327256105167.webp', 96156, 'image_41.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:36');
INSERT INTO `resource` VALUES (340, 1, 'articlePicture', '/static/articlePicture/onew11733327271873571.webp', 74242, 'image_1.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:52');
INSERT INTO `resource` VALUES (341, 1, 'articlePicture', '/static/articlePicture/onew11733327276152121.webp', 57050, 'image_2.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:56');
INSERT INTO `resource` VALUES (342, 1, 'articlePicture', '/static/articlePicture/onew11733327279671710.webp', 55344, 'image_3.webp', 'image/webp', 1, 'local', '2024-12-04 23:47:59');
INSERT INTO `resource` VALUES (343, 1, 'articlePicture', '/static/articlePicture/onew11733327283223343.webp', 55516, 'image_4.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:03');
INSERT INTO `resource` VALUES (344, 1, 'articlePicture', '/static/articlePicture/onew11733327287105216.webp', 60874, 'image_5.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:07');
INSERT INTO `resource` VALUES (345, 1, 'articlePicture', '/static/articlePicture/onew11733327291825543.webp', 51590, 'image_6.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:12');
INSERT INTO `resource` VALUES (346, 1, 'articlePicture', '/static/articlePicture/onew11733327296118195.webp', 75350, 'image_7.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:16');
INSERT INTO `resource` VALUES (347, 1, 'articlePicture', '/static/articlePicture/onew11733327301105635.webp', 39042, 'image_8.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:21');
INSERT INTO `resource` VALUES (348, 1, 'articlePicture', '/static/articlePicture/onew11733327324238378.webp', 54954, 'image_10.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:44');
INSERT INTO `resource` VALUES (349, 1, 'articlePicture', '/static/articlePicture/onew11733327334102551.webp', 87898, 'image_9.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:54');
INSERT INTO `resource` VALUES (350, 1, 'articlePicture', '/static/articlePicture/onew11733327339709990.webp', 50700, 'image_11.webp', 'image/webp', 1, 'local', '2024-12-04 23:48:59');
INSERT INTO `resource` VALUES (351, 1, 'articlePicture', '/static/articlePicture/onew11733327343808416.webp', 125944, 'image_12.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:04');
INSERT INTO `resource` VALUES (352, 1, 'articlePicture', '/static/articlePicture/onew11733327349326832.webp', 43130, 'image_13.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:09');
INSERT INTO `resource` VALUES (353, 1, 'articlePicture', '/static/articlePicture/onew11733327356416617.webp', 37726, 'image_14.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:16');
INSERT INTO `resource` VALUES (354, 1, 'articlePicture', '/static/articlePicture/onew11733327360739872.webp', 55542, 'image_15.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:21');
INSERT INTO `resource` VALUES (355, 1, 'articlePicture', '/static/articlePicture/onew11733327364490490.webp', 82196, 'image_16.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:24');
INSERT INTO `resource` VALUES (356, 1, 'articlePicture', '/static/articlePicture/onew11733327368872470.webp', 42388, 'image_17.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:29');
INSERT INTO `resource` VALUES (357, 1, 'articlePicture', '/static/articlePicture/onew11733327372988128.webp', 72622, 'image_18.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:33');
INSERT INTO `resource` VALUES (358, 1, 'articlePicture', '/static/articlePicture/onew1173332737830688.webp', 27354, 'image_19.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:38');
INSERT INTO `resource` VALUES (359, 1, 'articlePicture', '/static/articlePicture/onew11733327382636746.webp', 13968, 'image_20.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:42');
INSERT INTO `resource` VALUES (360, 1, 'articlePicture', '/static/articlePicture/onew11733327387989139.webp', 35330, 'image_21.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:48');
INSERT INTO `resource` VALUES (361, 1, 'articlePicture', '/static/articlePicture/onew11733327392115188.webp', 63986, 'image_22.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:52');
INSERT INTO `resource` VALUES (362, 1, 'articlePicture', '/static/articlePicture/onew11733327397648858.webp', 43844, 'image_23.webp', 'image/webp', 1, 'local', '2024-12-04 23:49:57');
INSERT INTO `resource` VALUES (363, 1, 'articlePicture', '/static/articlePicture/onew11733327402928349.webp', 36282, 'image_24.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:03');
INSERT INTO `resource` VALUES (364, 1, 'articlePicture', '/static/articlePicture/onew1173332741393956.webp', 57914, 'image_25.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:14');
INSERT INTO `resource` VALUES (365, 1, 'articlePicture', '/static/articlePicture/onew11733327418229106.webp', 138140, 'image_26.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:18');
INSERT INTO `resource` VALUES (366, 1, 'articlePicture', '/static/articlePicture/onew11733327423475561.webp', 182222, 'image_27.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:23');
INSERT INTO `resource` VALUES (367, 1, 'articlePicture', '/static/articlePicture/onew11733327428598317.webp', 74838, 'image_28.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:28');
INSERT INTO `resource` VALUES (368, 1, 'articlePicture', '/static/articlePicture/onew11733327438392593.webp', 70540, 'image_29.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:38');
INSERT INTO `resource` VALUES (369, 1, 'articlePicture', '/static/articlePicture/onew11733327444281981.webp', 295448, 'image_31.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:44');
INSERT INTO `resource` VALUES (370, 1, 'articlePicture', '/static/articlePicture/onew11733327449604383.webp', 272382, 'image_32.webp', 'image/webp', 1, 'local', '2024-12-04 23:50:49');
INSERT INTO `resource` VALUES (371, 1, 'articlePicture', '/static/articlePicture/onew11733327534048793.png', 3037426, 'download.png', 'image/png', 1, 'local', '2024-12-04 23:52:15');
INSERT INTO `resource` VALUES (372, 1, 'articlePicture', '/static/articlePicture/onew11733327674616601.webp', 441054, 'image_1.webp', 'image/webp', 1, 'local', '2024-12-04 23:54:35');
INSERT INTO `resource` VALUES (373, 1, 'articlePicture', '/static/articlePicture/onew117333276793641.webp', 427620, 'image_2.webp', 'image/webp', 1, 'local', '2024-12-04 23:54:39');
INSERT INTO `resource` VALUES (374, 1, 'articlePicture', '/static/articlePicture/onew11733327683530310.webp', 253748, 'image_3.webp', 'image/webp', 1, 'local', '2024-12-04 23:54:43');
INSERT INTO `resource` VALUES (375, 1, 'articlePicture', '/static/articlePicture/onew1173332768686978.webp', 13614, 'image_4.webp', 'image/webp', 1, 'local', '2024-12-04 23:54:47');
INSERT INTO `resource` VALUES (376, 1, 'articlePicture', '/static/articlePicture/onew11733327705780530.png', 159576, 'image.png', 'image/png', 1, 'local', '2024-12-04 23:55:06');
INSERT INTO `resource` VALUES (377, 1, 'articleCover', '/static/articleCover/onew1173332798077863.jpg', 82847, 'Snipaste_2024-12-04_22-04-28.jpg', 'image/jpeg', 1, 'local', '2024-12-04 23:59:41');
INSERT INTO `resource` VALUES (378, 1, 'articlePicture', '/static/articlePicture/onew11733328032136841.png', 112332, 'onew11733320984924734.png', 'image/png', 1, 'local', '2024-12-05 00:00:32');
INSERT INTO `resource` VALUES (379, 1, 'articlePicture', '/static/articlePicture/onew11733328040703473.png', 460536, 'onew11733321012025315.png', 'image/png', 1, 'local', '2024-12-05 00:00:41');
INSERT INTO `resource` VALUES (380, 1, 'articleCover', '/static/articleCover/onew11733367052166248.jpg', 23933, '最佳小丑奖.jpg', 'image/jpeg', 1, 'local', '2024-12-05 10:50:51');
INSERT INTO `resource` VALUES (381, 1, 'articleCover', '/static/articleCover/onew1173347444423337.webp', 39436, 'Vue项目中实现鼠标悬浮显示微信和QQ二维码.webp', 'image/webp', 1, 'local', '2024-12-06 16:40:50');
INSERT INTO `resource` VALUES (382, 1, 'articlePicture', '/static/articlePicture/onew11734193166355845.gif', 3704421, 'Video_20241215001352_compressed.gif', 'image/gif', 1, 'local', '2024-12-15 00:19:27');
INSERT INTO `resource` VALUES (383, 1, 'articlePicture', '/static/articlePicture/onew11734193280325567.gif', 1396007, 'Video_20241215001650_compressed.gif', 'image/gif', 1, 'local', '2024-12-15 00:21:19');
INSERT INTO `resource` VALUES (384, 1, 'articlePicture', '/static/articlePicture/onew11734193386599746.webp', 28374, 'Snipaste_2024-12-15_00-22-43.webp', 'image/webp', 1, 'local', '2024-12-15 00:23:05');
INSERT INTO `resource` VALUES (385, 1, 'articlePicture', '/static/articlePicture/onew11734193571391168.webp', 26264, 'Snipaste_2024-12-15_00-25-49.webp', 'image/webp', 1, 'local', '2024-12-15 00:26:10');
INSERT INTO `resource` VALUES (386, 1, 'articlePicture', '/static/articlePicture/onew11734193759703286.gif', 2819941, 'Video_20241215002728_compressed.gif', 'image/gif', 1, 'local', '2024-12-15 00:29:18');
INSERT INTO `resource` VALUES (387, 1, 'articlePicture', '/static/articlePicture/onew11734193895982279.gif', 1154723, 'Video_20241215003021_compressed.gif', 'image/gif', 1, 'local', '2024-12-15 00:31:34');
INSERT INTO `resource` VALUES (388, 1, 'articleCover', '/static/articleCover/onew11735480820082722.webp', 27252, 'Snipaste_2024-12-29_21-59-49.webp', 'image/webp', 1, 'local', '2024-12-29 22:00:13');
INSERT INTO `resource` VALUES (389, 1, 'articlePicture', '/static/articlePicture/onew11736400717422830.png', 19805, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:31:58');
INSERT INTO `resource` VALUES (390, 1, 'articlePicture', '/static/articlePicture/onew11736401103802572.png', 26865, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:38:24');
INSERT INTO `resource` VALUES (391, 1, 'articlePicture', '/static/articlePicture/onew11736401296324885.png', 18549, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:41:37');
INSERT INTO `resource` VALUES (392, 1, 'articlePicture', '/static/articlePicture/onew1173640150129170.png', 23823, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:45:02');
INSERT INTO `resource` VALUES (393, 1, 'articlePicture', '/static/articlePicture/onew11736401650896826.png', 5246, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:47:31');
INSERT INTO `resource` VALUES (394, 1, 'articlePicture', '/static/articlePicture/onew11736401789977719.png', 14463, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:49:50');
INSERT INTO `resource` VALUES (395, 1, 'articlePicture', '/static/articlePicture/onew11736401839950712.png', 111335, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:50:40');
INSERT INTO `resource` VALUES (396, 1, 'articlePicture', '/static/articlePicture/onew11736402013545532.png', 26705, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:53:34');
INSERT INTO `resource` VALUES (397, 1, 'articlePicture', '/static/articlePicture/onew11736402116826171.png', 35869, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:55:17');
INSERT INTO `resource` VALUES (398, 1, 'articlePicture', '/static/articlePicture/onew11736402347069920.png', 133916, 'image.png', 'image/png', 1, 'local', '2025-01-09 13:59:08');
INSERT INTO `resource` VALUES (399, 1, 'articlePicture', '/static/articlePicture/onew11736402965361213.png', 83032, 'image.png', 'image/png', 1, 'local', '2025-01-09 14:09:26');
INSERT INTO `resource` VALUES (400, 1, 'articlePicture', '/static/articlePicture/onew11736403038504221.png', 7308, 'image.png', 'image/png', 1, 'local', '2025-01-09 14:10:39');
INSERT INTO `resource` VALUES (401, 1, 'articlePicture', '/static/articlePicture/onew11736403060904481.png', 8147, 'image.png', 'image/png', 1, 'local', '2025-01-09 14:11:01');
INSERT INTO `resource` VALUES (402, 1, 'articleCover', '/static/articleCover/onew117364046699359.webp', 25852, 'Snipaste_2025-01-09_14-36-50.webp', 'image/webp', 1, 'local', '2025-01-09 14:37:50');
INSERT INTO `resource` VALUES (404, 1, 'commentPicture', '/static/commentPicture/onew11737466810772328.webp', 47766, '白雪乃爱.webp', 'image/webp', 1, 'local', '2025-01-21 21:40:11');
INSERT INTO `resource` VALUES (405, 1, 'favoritesCover', '/static/favoritesCover/onew11737509610442747.ico', 4286, '鼠标轮询率检查器.ico', 'image/x-icon', 1, 'local', '2025-01-22 09:33:31');
INSERT INTO `resource` VALUES (406, 1, 'favoritesCover', '/static/favoritesCover/onew1173751013516381.ico', 15406, 'videezy.ico', 'image/x-icon', 1, 'local', '2025-01-22 09:42:16');
INSERT INTO `resource` VALUES (407, 1, 'articleCover', '/static/articleCover/onew11740052926151872.webp', 38210, 'qiuzhi01.webp', 'image/webp', 1, 'local', '2025-02-20 20:02:07');

-- ----------------------------
-- Table structure for resource_path
-- ----------------------------
DROP TABLE IF EXISTS `resource_path`;
CREATE TABLE `resource_path`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `classify` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类',
  `cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源类型',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源聚合' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_path
-- ----------------------------
INSERT INTO `resource_path` VALUES (2, '全球IP地址查询', '实用小工具', ' https://csstools.chinaz.com/favicon.ico', 'https://mip.chinaz.com/', '通过该工具可以查询指定IP的物理地址或域名服务器的IP和物理地址，及所在国家或城市，甚至精确到某个网吧 机房或学校等;查出的结果仅供参考! 数字地址:即IP地址的数字化形式，复制在浏览器中访问就和访问IP一样', 'favorites', 1, '', '2024-09-08 18:35:05');
INSERT INTO `resource_path` VALUES (3, '吾爱破解', '实用小工具', 'https://www.52pojie.cn/favicon.ico', 'https://www.52pojie.cn/', '包含Windows原创工具，也有Android、iOS和Mac OS程序相应的原创程序！', 'favorites', 1, '', '2024-09-08 18:42:05');
INSERT INTO `resource_path` VALUES (4, '不分手的恋爱', '甜甜的歌曲', '/static/funnyCover/11725792535681950.jpg', '/static/funnyUrl/11725792392743455.mp3', '', 'funny', 1, '', '2024-09-08 18:47:34');
INSERT INTO `resource_path` VALUES (5, '最爱的小黄鸭', '头像', '/static/lovePhotoCover/11725793098838899.jpg', '', '', 'lovePhoto', 1, '1', '2024-09-08 18:58:32');
INSERT INTO `resource_path` VALUES (6, '未来的小黄鸭', '头像', '/static/lovePhotoCover/11725797469925612.jpg', '', '', 'lovePhoto', 1, '1', '2024-09-08 19:53:14');
INSERT INTO `resource_path` VALUES (7, 'AE后期特效', '实用小工具', ' https://www.lookae.com/favicon.ico', 'https://www.lookae.com/', '大众脸影视后期特效', 'favorites', 1, '', '2025-01-22 09:23:19');
INSERT INTO `resource_path` VALUES (8, 'PDF转换器', '实用小工具', 'https://smallpdf.com/favicon.png', 'https://smallpdf.com/cn', '提高生产力、巧妙处理文档，您所需的一切工具尽在于此。', 'favorites', 1, '', '2025-01-22 09:25:20');
INSERT INTO `resource_path` VALUES (9, '白描网页版', '实用小工具', ' https://xlimage.uzero.cn/shinescan/res/favicon.ico', 'https://web.baimiaoapp.com/', '图片在线转文字', 'favorites', 1, '', '2025-01-22 09:26:49');
INSERT INTO `resource_path` VALUES (10, '易飞文字识别', '实用小工具', 'https://catocr.com/img/icons/favicon-32x32.png', 'https://catocr.com/#/', '免费在线图片转文字', 'favorites', 1, '', '2025-01-22 09:28:17');
INSERT INTO `resource_path` VALUES (11, 'MSDN', '实用小工具', ' https://msdn.itellyou.cn/favicon.ico', 'https://msdn.itellyou.cn/', '我告诉你 - 做一个安静的工具站', 'favorites', 1, '', '2025-01-22 09:29:13');
INSERT INTO `resource_path` VALUES (12, '奇迹秀', '实用小工具', 'https://ts4.cn.mm.bing.net/th?id=ODLS.cdfa956b-198e-4d1f-81c9-c4911477b6f2&w=32&h=32&qlt=90&pcl=fffffa&o=6&pid=1.2', 'https://www.qijishow.com/', '因设计而美丽', 'favorites', 1, '', '2025-01-22 09:30:27');
INSERT INTO `resource_path` VALUES (13, '鼠标轮询率检查器', '实用小工具', '/static/favoritesCover/onew11737509610442747.ico', 'https://cps-check.com/cn/polling-rate-check', '这个简单的工具使您可以在线检查鼠标的轮询速率。', 'favorites', 1, '', '2025-01-22 09:31:52');
INSERT INTO `resource_path` VALUES (14, '新CG儿', '实用小工具', 'https://www.newcger.com/favicon.ico', 'https://www.newcger.com/', '数字视觉分享平台 | AE模板_视频素材_免费下载', 'favorites', 1, '', '2025-01-22 09:39:22');
INSERT INTO `resource_path` VALUES (15, 'Videezy', '实用小工具', '/static/favoritesCover/onew1173751013516381.ico', 'https://www.videezy.com/', 'Free HD Stock Footage & 4K Videos!', 'favorites', 1, '', '2025-01-22 09:41:27');
INSERT INTO `resource_path` VALUES (16, 'Greasy Fork', '实用小工具', ' https://greasyfork.org/vite/assets/blacklogo16-DftkYuVe.png', 'https://greasyfork.org/zh-CN/', '安全、实用的用户脚本大全', 'favorites', 1, '', '2025-01-22 09:43:39');
INSERT INTO `resource_path` VALUES (17, 'HighlightCode', '实用小工具', 'https://highlightcode.com/assets/images/favicon.ico', 'https://highlightcode.com/', '代码在线高亮工具 | 将高亮美化的代码一键粘贴到 Word 或 OneNote 中', 'favorites', 1, '', '2025-01-22 09:43:39');
INSERT INTO `resource_path` VALUES (18, 'UomgAPI', '实用小工具', ' https://api.uomg.com/assets/favicon.ico', 'https://api.uomg.com/', '稳定、快速、免费的 API 接口服务', 'favorites', 1, '', '2025-01-22 09:45:46');
INSERT INTO `resource_path` VALUES (19, '致美化', '实用小工具', ' https://zhutix.com/favicon.ico', 'https://zhutix.com/', '最专业的桌面美化交流平台', 'favorites', 1, '', '2025-01-22 09:47:06');
INSERT INTO `resource_path` VALUES (20, '站长素材', '实用小工具', ' https://sc.chinaz.com/favicon.ico', 'https://sc.chinaz.com/', '分享综合设计素材的平台', 'favorites', 1, '', '2025-01-22 09:48:11');
INSERT INTO `resource_path` VALUES (21, '临时邮箱', '实用小工具', ' https://static.linshi-email.com/favicon.ico', 'https://www.linshi-email.com/', '不用再担心垃圾邮件，广告邮件，黑客和机器人攻击。让您真实的邮箱保持干净和安全。临时email提供临时、安全、匿名、免费的一次性电子邮件地址。', 'favorites', 1, '', '2025-01-22 09:49:06');
INSERT INTO `resource_path` VALUES (22, 'boardmix博思白板', '实用小工具', ' https://cms.boardmix.cn/images/board.ico', 'https://boardmix.cn/', '一个激发创意和点燃团队协作的空间，集思维表达，灵感梳理，流程整理，任务管理，素材收集，笔记文档多种创意表达能力于一体，将创造和团队效率提升到新的层次。', 'favorites', 1, '', '2025-01-22 09:50:07');
INSERT INTO `resource_path` VALUES (23, 'iconfont', '实用小工具', ' https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg', 'https://www.iconfont.cn/', '阿里巴巴矢量图标库', 'favorites', 1, '', '2025-01-22 09:52:33');
INSERT INTO `resource_path` VALUES (24, '临时邮箱', '实用小工具', ' https://mail.cx/favicon.png', 'https://mail.cx/zh/', '虚拟邮件或临时邮件是一种允许在临时地址接收电子邮件的服务，该地址在经过一定时间后自行销毁。', 'favorites', 1, '', '2025-01-22 09:55:30');
INSERT INTO `resource_path` VALUES (25, '在线工具大全', '实用小工具', ' https://www.lddgo.net/img/icon.png', 'https://www.lddgo.net/', '373个在线工具软件', 'favorites', 1, '', '2025-01-22 09:56:58');
INSERT INTO `resource_path` VALUES (26, 'immich', '实用小工具', 'https://immich.app/img/favicon.png', 'https://immich.app/', 'Self-hosted photo and video management solution', 'favorites', 1, '', '2025-01-22 09:59:12');
INSERT INTO `resource_path` VALUES (27, 'Kalvin在线工具', '实用小工具', ' https://tools.kalvinbg.cn/static/favicon.ico', 'https://tools.kalvinbg.cn/', '一个有趣使用的工具箱', 'favorites', 1, '', '2025-01-22 10:00:32');
INSERT INTO `resource_path` VALUES (28, 'Cloudreve', '实用小工具', 'https://cloudreve.org/favicon.ico', 'https://cloudreve.org/', 'Cloudreve 可助你即刻构建出兼备自用或公用的网盘服务，通过多种存储策略的支持、虚拟文件系统等特性实现灵活的文件管理体验。', 'favorites', 1, '', '2025-01-22 10:02:15');
INSERT INTO `resource_path` VALUES (29, 'World Imagery Wayback', '实用小工具', ' https://livingatlas.arcgis.com/wayback/favicon.ico', 'https://livingatlas.arcgis.com/wayback/', 'Wayback is a digital archive, providing users with access to the different versions of World Imagery created over time. ', 'favorites', 1, '', '2025-01-22 10:03:51');
INSERT INTO `resource_path` VALUES (30, '豆包', '实用小工具', ' https://lf-flow-web-cdn.doubao.com/obj/flow-doubao/samantha/logo-icon-white-bg.png', 'https://www.doubao.com/', '字节跳动旗下 AI 智能助手', 'favorites', 1, '', '2025-01-22 10:05:44');
INSERT INTO `resource_path` VALUES (31, 'GitHub Proxy', '实用小工具', ' https://www.ghproxy.cn/favicon.ico', 'https://www.ghproxy.cn/', 'Github国内加速下载服务', 'favorites', 1, '', '2025-01-22 10:06:46');
INSERT INTO `resource_path` VALUES (32, 'GitHub Proxy', '实用小工具', 'https://github.akams.cn/logo.png', 'https://github.akams.cn/', 'Github国内加速下载服务', 'favorites', 1, '', '2025-01-22 10:07:26');
INSERT INTO `resource_path` VALUES (33, 'DeepSeek', '实用小工具', ' https://platform.deepseek.com/favicon.svg', 'https://platform.deepseek.com/', 'DeepSeek, unravel the mystery of AGI with curiosity. ', 'favorites', 1, '', '2025-01-22 10:11:41');
INSERT INTO `resource_path` VALUES (34, '百度翻译开放平台', '实用小工具', 'https://api.fanyi.baidu.com/static/api/img/favicon_new_d87cd2a.ico', 'https://api.fanyi.baidu.com/api/trans/product/desktop', '百度翻译开放平台支持200+语种、覆盖4万多个语言方向的文本、文档、图片、语音翻译，提供定制化、私有化服务，满足各类开发者的翻译需求。', 'favorites', 1, '', '2025-01-22 10:13:08');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sort_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `sort_description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类描述',
  `sort_type` tinyint(0) NOT NULL DEFAULT 1 COMMENT '分类类型[0:导航栏分类，1:普通分类]',
  `priority` int(0) NULL DEFAULT NULL COMMENT '分类优先级：数字小的在前面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES (2, '小作文', 'Small composition', 0, 1);
INSERT INTO `sort` VALUES (3, '工作', 'Work', 0, 2);
INSERT INTO `sort` VALUES (4, '生活', 'Life', 0, 3);
INSERT INTO `sort` VALUES (5, '学习', 'Study', 0, 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `config_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '键名',
  `config_value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 私用 2 公开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'QQ邮箱号', 'spring.mail.username', '2054814799@qq.com', '1');
INSERT INTO `sys_config` VALUES (2, 'QQ邮箱授权码', 'spring.mail.password', 'vcsohrlyrbxlcaac', '1');
INSERT INTO `sys_config` VALUES (3, '邮箱验证码模板', 'user.code.format', '【小刘的Blog】%s为本次验证的验证码，请在5分钟内完成验证。为保证账号安全，请勿泄漏此验证码。', '1');
INSERT INTO `sys_config` VALUES (4, '邮箱订阅模板', 'user.subscribe.format', '【小刘的Blog】您订阅的专栏【%s】新增一篇文章：%s。', '1');
INSERT INTO `sys_config` VALUES (5, '默认存储平台', 'store.type', 'local', '2');
INSERT INTO `sys_config` VALUES (6, '本地存储启用状态', 'local.enable', 'true', '2');
INSERT INTO `sys_config` VALUES (7, '七牛云存储启用状态', 'qiniu.enable', 'false', '2');
INSERT INTO `sys_config` VALUES (8, '本地存储上传文件根目录', 'local.uploadUrl', '/home/poetize/file/', '1');
INSERT INTO `sys_config` VALUES (9, '本地存储下载前缀', 'local.downloadUrl', '/static/', '2');
INSERT INTO `sys_config` VALUES (10, '七牛云-accessKey', 'qiniu.accessKey', '', '1');
INSERT INTO `sys_config` VALUES (11, '七牛云-secretKey', 'qiniu.secretKey', '', '1');
INSERT INTO `sys_config` VALUES (12, '七牛云-bucket', 'qiniu.bucket', '', '1');
INSERT INTO `sys_config` VALUES (13, '七牛云-域名', 'qiniu.downloadUrl', '仿照：【https://file.poetize.cn/】，将域名换成自己的七牛云ip或域名', '2');
INSERT INTO `sys_config` VALUES (15, 'IM-聊天室启用状态', 'im.enable', 'false', '1');
INSERT INTO `sys_config` VALUES (16, '七牛云上传地址', 'qiniuUrl', 'https://upload.qiniup.com', '2');
INSERT INTO `sys_config` VALUES (17, '备案号', 'beian', '渝ICP备2024042160号', '2');
INSERT INTO `sys_config` VALUES (18, '前端静态资源路径前缀', 'webStaticResourcePrefix', '/static/', '2');
INSERT INTO `sys_config` VALUES (19, '导航栏菜单显示', 'bar.menu.show', '首页,记录,家,随笔,时光相册,百宝箱,留言,聊会儿天呗,', '2');
INSERT INTO `sys_config` VALUES (20, '邮箱通知启用状态', 'mail.enable', 'true', '1');
INSERT INTO `sys_config` VALUES (21, '友链-网站名称', 'friendWebName', 'Onew\'s Blog', '2');
INSERT INTO `sys_config` VALUES (22, '友链-网址', 'friendUrl', 'http://onewa.fun/', '2');
INSERT INTO `sys_config` VALUES (23, '友链-头像', 'friendAvatar', 'http://onewa.fun/static/lovePhotoCover/11725793098838899.jpg', '2');
INSERT INTO `sys_config` VALUES (24, '友链-描述', 'friendIntroduction', '学习是进步的阶梯', '2');
INSERT INTO `sys_config` VALUES (25, '友链-网站封面', 'friendCover', 'http://onewa.fun/static/assets/11726292153468250.jpg', '2');

-- ----------------------------
-- Table structure for tree_hole
-- ----------------------------
DROP TABLE IF EXISTS `tree_hole`;
CREATE TABLE `tree_hole`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `message` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '树洞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tree_hole
-- ----------------------------
INSERT INTO `tree_hole` VALUES (3, NULL, 'Hi，大家好，这是树洞，欢迎大家前来留言呀！', '2024-12-21 00:45:11');
INSERT INTO `tree_hole` VALUES (4, NULL, '你还爱着她吗', '2024-12-21 01:04:43');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `phone_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
  `gender` tinyint(0) NULL DEFAULT NULL COMMENT '性别[1:男，2:女，0:保密]',
  `open_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'openId',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `admire` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赞赏',
  `subscribe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '订阅',
  `introduction` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `user_type` tinyint(0) NOT NULL DEFAULT 2 COMMENT '用户类型[0:admin，1:管理员，2:普通用户]',
  `user_lv` tinyint(0) NOT NULL DEFAULT 1 COMMENT '用户等级',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最终修改时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最终修改人',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用[0:未删除，1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'onew', 'e14f3728a995335151fdb83aa636e2fe', '', '2054814799@qq.com', 1, 0, '', '/static/userAvatar/11725793284182778.jpg', '1', '', '噜啦噜啦嘞！！！', 0, 6, '2001-10-18 00:00:00', '2024-12-20 13:07:44', NULL, 0);
INSERT INTO `user` VALUES (2, '空中泡泡', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2267484581@qq.com', 1, 0, NULL, 'https://www.loliapi.com/acg/pp/', '0', NULL, NULL, 2, 1, '2024-09-04 21:41:51', '2024-12-29 22:04:36', NULL, 0);

-- ----------------------------
-- Table structure for web_info
-- ----------------------------
DROP TABLE IF EXISTS `web_info`;
CREATE TABLE `web_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `web_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `web_title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站信息',
  `notices` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告',
  `footer` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页脚',
  `background_image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '背景',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `random_avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '随机头像',
  `random_name` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '随机名称',
  `random_cover` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '随机封面',
  `waifu_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '看板娘消息',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用[0:否，1:是]',
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `push_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `push_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '网站信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_info
-- ----------------------------
INSERT INTO `web_info` VALUES (1, '探索日记', 'Onew\'s Blog', '[\"本站于2024年9月3日22:37:20正式搭建成功\"]', '忽有故人心上过，回首山河已是秋。\n他日若能同淋雪，此生也算共白头。', '/static/assets/11726292153468250.jpg', '/static/lovePhotoCover/11725793098838899.jpg', '[\"https://www.loliapi.com/acg/pp/\",\"https://imgapi.xl0408.top/index.php\"]', '[]', '[\"https://t.mwm.moe/fj \"]', '第一次打开博客有点慢，多等会儿就好咯', 1, '用代码书写未来：一名技术新人的求职宣言', '/static/articleCover/onew11740052926151872.webp', '/article/40');

-- ----------------------------
-- Table structure for wei_yan
-- ----------------------------
DROP TABLE IF EXISTS `wei_yan`;
CREATE TABLE `wei_yan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(0) NOT NULL COMMENT '用户ID',
  `like_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型',
  `source` int(0) NULL DEFAULT NULL COMMENT '来源标识',
  `is_public` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否公开[0:仅自己可见，1:所有人可见]',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '微言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wei_yan
-- ----------------------------
INSERT INTO `wei_yan` VALUES (1, 2, 0, '到此一游', 'friend', NULL, 1, '2024-09-04 21:41:51');
INSERT INTO `wei_yan` VALUES (2, 1, 0, '这是一个测试，用于测试随笔功能[可怜][一个达不刘,/static/commentPicture/11725514953137458.gif]', 'friend', NULL, 1, '2024-09-05 13:43:45');
INSERT INTO `wei_yan` VALUES (3, 1, 0, '如果公务员考试招两万个人，报考的有一百二十万人，备考的就只有五十万人，学过系统课的人只有三十万人，当天考试上午考完行测，下午考申论的也就只有二十五万人左右，真正有竞争力的人也就只有那二十五万人，也就是1:15的比例，所以再坚持坚持，万一有希望呢', 'friend', NULL, 1, '2024-09-11 08:17:46');
INSERT INTO `wei_yan` VALUES (4, 1, 0, '好累啊，好想睡觉啊，真的是又累又困[困]', 'friend', NULL, 1, '2024-09-11 16:26:50');
INSERT INTO `wei_yan` VALUES (6, 1, 0, '我是一个只有你向我表达聊天欲望，我才会向你表达聊天欲望的人', 'friend', NULL, 1, '2024-09-13 15:43:19');
INSERT INTO `wei_yan` VALUES (7, 1, 0, '最近的学习状态略显疲惫', 'friend', NULL, 1, '2024-09-28 11:00:55');
INSERT INTO `wei_yan` VALUES (8, 1, 0, '今天下雨了，而且还降温了十几度，当我骑着小电驴去图书馆和回家的时候，很冷，在那一刻，我便知道了有一辆属于自己的车的重要性', 'friend', NULL, 1, '2024-09-30 21:49:50');
INSERT INTO `wei_yan` VALUES (9, 1, 0, '昨天晚上参加了国家励志奖学金答辩，第一次参加奖学金答辩，很紧张，我的普通话也不标准，感觉可能会落选，但是也很感谢兰姐能给我这次机会，为我们忙前忙后的', 'friend', NULL, 1, '2024-10-22 09:48:18');
INSERT INTO `wei_yan` VALUES (10, 1, 0, '今天在图书馆有个女生找我抓蜘蛛！！！我抓了。', 'friend', NULL, 1, '2024-10-25 20:55:55');
INSERT INTO `wei_yan` VALUES (11, 1, 0, '早上七点多在图书馆的时候，坐我旁边素不相识的一个女生问我吃不吃面包并准备把手中的面包递给我，虽然我婉拒了，但仍感动于世界的温柔', 'friend', NULL, 1, '2024-10-27 10:07:35');
INSERT INTO `wei_yan` VALUES (12, 1, 0, '苏联，诞生于人类最崇高的理想，毁灭于人类最低劣的欲望', 'friend', NULL, 1, '2024-10-27 10:25:26');
INSERT INTO `wei_yan` VALUES (13, 1, 0, '快餐式的爱情终究是黄粱一梦', 'friend', NULL, 1, '2024-10-28 07:12:00');
INSERT INTO `wei_yan` VALUES (14, 1, 0, '今天早上大概五点多的时候做梦梦见我直接穿越到了2049年，那个时代很好，但是总感觉少了点什么，很难过，但还好只是做梦', 'friend', NULL, 1, '2024-10-28 07:15:47');
INSERT INTO `wei_yan` VALUES (15, 1, 0, '今天中午给妈妈买的羽绒服到了，只是尺码有点大，颜色也不合适，退回去换货了，但是妈妈很高兴，就像我2022年打寒假工给她换新手机一样，逢人就说这是我儿子给我买的，只是这次是用奖学金买的，妈妈高兴我当然也高兴啦', 'friend', NULL, 1, '2024-10-28 15:16:48');
INSERT INTO `wei_yan` VALUES (16, 1, 0, '连爱都是能演出来的，又有什么是真的呢', 'friend', NULL, 1, '2024-10-31 21:30:36');
INSERT INTO `wei_yan` VALUES (17, 1, 0, '男生出门在外也得保护好自己，刚才一女的就在门外一直用卡刷门，要不是有另外的门栓，刚好我又不在宾馆的话估计东西全没了[onew,/static/commentPicture/onew11730551216185847.jpg]', 'friend', NULL, 1, '2024-11-01 18:54:27');
INSERT INTO `wei_yan` VALUES (18, 1, 0, '在重庆读书的朋友嘴真严，以为只有城区才经常爬坡呢，结果一进门就开始爬，还有就是今天收了一堆“小礼物”[onew,/static/commentPicture/onew11730551282798797.jpg][onew,/static/commentPicture/onew11730551294970115.jpg][onew,/static/commentPicture/onew11730551304148524.jpg]', 'friend', NULL, 1, '2024-11-01 20:14:48');
INSERT INTO `wei_yan` VALUES (21, 1, 0, '确实，我很想得到别人的关心，但是我并不希望这样的关心是基于伤害别人的基础之上的', 'friend', NULL, 1, '2024-11-26 21:09:17');
INSERT INTO `wei_yan` VALUES (23, 1, 0, 'docker镜像地址：https://one-w.us.kg', 'news', 29, 1, '2024-12-05 15:21:00');
INSERT INTO `wei_yan` VALUES (24, 1, 0, '我真的好想好想谈恋爱啊，以前高中就想着高中谈恋爱会影响学习，等毕业了去大学谈恋爱。考了个专科，到了河北读大学，又想着到时候专升本完再考虑谈恋爱吧。后来专升本考到了黑龙江哈尔滨，但是又考虑现在谈恋爱到时候肯定得异地，异地恋肯定得分手，于是现在快毕业了也没能在读书阶段好好的谈一次恋爱，也许我不是谈恋爱的那块料吧', 'friend', NULL, 1, '2025-01-01 22:38:18');
INSERT INTO `wei_yan` VALUES (25, 1, 0, '白雪乃爱真的好可爱啊，完全满足我心中对恋爱的幻想，可是我知道那终究只是游戏而已[onew,/static/commentPicture/onew11737466810772328.webp]', 'friend', NULL, 1, '2025-01-21 21:25:13');

SET FOREIGN_KEY_CHECKS = 1;
