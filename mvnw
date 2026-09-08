#!/bin/sh
# ----------------------------------------------------------------------------
# Maven Start Up Batch script
# ----------------------------------------------------------------------------

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
BASE_DIR=`cd "$PRGDIR" >/dev/null; pwd`

WRAPPER_JAR="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_PROPERTIES="$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"

if [ ! -f "$WRAPPER_JAR" ]; then
  if command -v curl >/dev/null 2>&1; then
    WRAPPER_URL=$(grep '^wrapperUrl=' "$WRAPPER_PROPERTIES" | cut -d'=' -f2)
    curl -sS -f -L -o "$WRAPPER_JAR" "$WRAPPER_URL"
  elif command -v wget >/dev/null 2>&1; then
    WRAPPER_URL=$(grep '^wrapperUrl=' "$WRAPPER_PROPERTIES" | cut -d'=' -f2)
    wget -q -O "$WRAPPER_JAR" "$WRAPPER_URL"
  fi
fi

if [ -n "$JAVA_HOME" ]; then
  JAVACMD="$JAVA_HOME/bin/java"
else
  JAVACMD="java"
fi

exec "$JAVACMD" -classpath "$WRAPPER_JAR" "-Dmaven.multiModuleProjectDirectory=$BASE_DIR" org.apache.maven.wrapper.MavenWrapperMain "$@"
