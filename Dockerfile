# Docker 이미지의 기본 이미지를 설정합니다. 여기서는 OpenJDK를 사용합니다.
FROM openjdk:17

# Gradle 버전을 설정합니다.
ENV GRADLE_VERSION=7.0

# Gradle을 설치합니다.
RUN wget -q --show-progress --https-only --timestamping "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    && unzip -q "gradle-${GRADLE_VERSION}-bin.zip" \
    && rm "gradle-${GRADLE_VERSION}-bin.zip" \
    && mv "gradle-${GRADLE_VERSION}" /opt/gradle \
    && ln -s /opt/gradle/bin/gradle /usr/bin/gradle

# 작업 디렉토리를 설정합니다.
WORKDIR /usr/src/myapp

# 애플리케이션의 소스 코드를 컨테이너 내부로 복사합니다.
COPY . /usr/src/myapp

# Gradle을 사용하여 애플리케이션을 빌드합니다.
RUN gradle build

# 컨테이너가 시작될 때 실행할 명령을 지정합니다.
CMD ["java", "-jar", "build/libs/Step06CitestApplication.jar"]
