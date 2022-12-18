FROM amazoncorretto:11.0.17

ADD ./ /demo/

WORKDIR /demo/

RUN pwd && ls -l && .gradlew clean build

CMD [ "gradlew", "bootRun" ]

