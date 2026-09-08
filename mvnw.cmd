@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on
@REM an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM ----------------------------------------------------------------------------

@IF "%__MVNW_ARG0%"=="" (
  SET "__MVNW_ARG0=%~f0"
)

@IF NOT "%__MVNW_CMD_ECHO%"=="" (
  @echo %__MVNW_CMD_ECHO%
)

@IF "%OS%"=="Windows_NT" @setlocal

@IF NOT "%MAVEN_SKIP_RC%"=="" goto skipRcPre
@IF EXIST "%USERPROFILE%\mavenrc_pre.bat" call "%USERPROFILE%\mavenrc_pre.bat"
@IF EXIST "%USERPROFILE%\mavenrc_pre.cmd" call "%USERPROFILE%\mavenrc_pre.cmd"
:skipRcPre

@SET ERROR_CODE=0

@SET MAVEN_PROJECTBASEDIR=%~dp0
@IF NOT "%MAVEN_PROJECTBASEDIR%"=="" set "MAVEN_PROJECTBASEDIR=%MAVEN_PROJECTBASEDIR:~0,-1%"

@IF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto valBase
@SET "MAVEN_PROJECTBASEDIR=%CD%"
:valBase

@SET "WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
@SET "WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties"

@IF EXIST "%WRAPPER_JAR%" goto run

@SET "WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain"

@REM Download wrapper jar if missing
@powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webClient = New-Object System.Net.WebClient; if (Test-Path '%WRAPPER_PROPERTIES%') { $val = (Get-Content '%WRAPPER_PROPERTIES%' | Where-Object { $_ -match '^wrapperUrl=' }) -replace '^wrapperUrl=', ''; if ($val) { $webClient.DownloadFile($val, '%WRAPPER_JAR%') } }"

:run
@IF NOT EXIST "%WRAPPER_JAR%" (
  echo Error: Could not find or download %WRAPPER_JAR%
  exit /b 1
)

@IF "%JAVA_HOME%"=="" (
  set "JAVACMD=java"
) ELSE (
  set "JAVACMD=%JAVA_HOME%\bin\java.exe"
)

"%JAVACMD%" -classpath "%WRAPPER_JAR%" "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" org.apache.maven.wrapper.MavenWrapperMain %*
@IF ERRORLEVEL 1 set ERROR_CODE=1

@IF NOT "%MAVEN_SKIP_RC%"=="" goto skipRcPost
@IF EXIST "%USERPROFILE%\mavenrc_post.bat" call "%USERPROFILE%\mavenrc_post.bat"
@IF EXIST "%USERPROFILE%\mavenrc_post.cmd" call "%USERPROFILE%\mavenrc_post.cmd"
:skipRcPost

@IF "%OS%"=="Windows_NT" @endlocal & set ERROR_CODE=%ERROR_CODE%

@exit /b %ERROR_CODE%
