# Docker 이미지의 기본 이미지를 설정합니다. 여기서는 OpenJDK를 사용합니다.
FROM openjdk:17

# 작업 디렉토리를 설정합니다.
WORKDIR /app

# Gradle을 통해 빌드된 JAR 파일을 복사합니다.
COPY step06_citest-0.0.1-SNAPSHOT.jar app.jar

# 컨테이너가 시작될 때 실행할 명령을 지정합니다.
CMD ["java", "-jar", "app.jar"]
