FROM yyyhc404/xinxuewang:ultra
LABEL maintainer="YyyHc404"
WORKDIR /app
COPY target/v2-0.0.1-SNAPSHOT.war /app/admin.war
ENTRYPOINT [ "java","-jar","admin.war"]
CMD ["-Djava.awt.headless=true","-Dawt.useSystemAAFontSettings=on","-Dfile.encoding=UTF8","-Dsun.jnu.encoding=UTF8] 