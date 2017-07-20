@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  pttg-fs-service startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and PTTG_FS_SERVICE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\pttg-fs-service-0.1.0.jar;%APP_HOME%\lib\groovy-all-2.4.3.jar;%APP_HOME%\lib\json-20160212.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\jackson-annotations-2.7.4.jar;%APP_HOME%\lib\jackson-databind-2.7.4.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.7.4.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.7.4.jar;%APP_HOME%\lib\jersey-client-1.19.jar;%APP_HOME%\lib\jersey-media-json-jackson-2.22.2.jar;%APP_HOME%\lib\spring-boot-1.4.1.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-web-1.4.1.RELEASE.jar;%APP_HOME%\lib\spring-retry-1.1.4.RELEASE.jar;%APP_HOME%\lib\aspectjrt-1.8.9.jar;%APP_HOME%\lib\aspectjweaver-1.8.9.jar;%APP_HOME%\lib\spring-boot-starter-actuator-1.4.1.RELEASE.jar;%APP_HOME%\lib\jackson-module-scala_2.11-2.7.4.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\scala-library-2.11.8.jar;%APP_HOME%\lib\spring-boot-starter-data-mongodb-1.4.1.RELEASE.jar;%APP_HOME%\lib\cats_2.11-0.9.0.jar;%APP_HOME%\lib\slf4j-api-1.7.21.jar;%APP_HOME%\lib\jackson-core-2.8.3.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.8.3.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.8.3.jar;%APP_HOME%\lib\jersey-core-1.19.jar;%APP_HOME%\lib\jersey-common-2.22.2.jar;%APP_HOME%\lib\jersey-entity-filtering-2.22.2.jar;%APP_HOME%\lib\spring-core-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-context-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-1.4.1.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-1.4.1.RELEASE.jar;%APP_HOME%\lib\hibernate-validator-5.2.4.Final.jar;%APP_HOME%\lib\spring-web-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-actuator-1.4.1.RELEASE.jar;%APP_HOME%\lib\scala-reflect-2.11.8.jar;%APP_HOME%\lib\jackson-module-paranamer-2.7.4.jar;%APP_HOME%\lib\httpcore-4.4.5.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\mongodb-driver-3.2.2.jar;%APP_HOME%\lib\spring-data-mongodb-1.9.3.RELEASE.jar;%APP_HOME%\lib\cats-macros_2.11-0.9.0.jar;%APP_HOME%\lib\cats-kernel_2.11-0.9.0.jar;%APP_HOME%\lib\cats-kernel-laws_2.11-0.9.0.jar;%APP_HOME%\lib\cats-core_2.11-0.9.0.jar;%APP_HOME%\lib\cats-laws_2.11-0.9.0.jar;%APP_HOME%\lib\cats-free_2.11-0.9.0.jar;%APP_HOME%\lib\cats-jvm_2.11-0.9.0.jar;%APP_HOME%\lib\simulacrum_2.11-0.10.0.jar;%APP_HOME%\lib\machinist_2.11-0.6.1.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\jersey-guava-2.22.2.jar;%APP_HOME%\lib\hk2-api-2.4.0-b34.jar;%APP_HOME%\lib\javax.inject-2.4.0-b34.jar;%APP_HOME%\lib\hk2-locator-2.4.0-b34.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\spring-aop-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-beans-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-1.4.1.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-1.4.1.RELEASE.jar;%APP_HOME%\lib\snakeyaml-1.17.jar;%APP_HOME%\lib\tomcat-embed-core-8.5.5.jar;%APP_HOME%\lib\tomcat-embed-el-8.5.5.jar;%APP_HOME%\lib\tomcat-embed-websocket-8.5.5.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.3.0.Final.jar;%APP_HOME%\lib\classmate-1.3.1.jar;%APP_HOME%\lib\paranamer-2.8.jar;%APP_HOME%\lib\mongodb-driver-core-3.2.2.jar;%APP_HOME%\lib\bson-3.2.2.jar;%APP_HOME%\lib\spring-tx-4.3.3.RELEASE.jar;%APP_HOME%\lib\spring-data-commons-1.12.3.RELEASE.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.21.jar;%APP_HOME%\lib\scalacheck_2.11-1.13.4.jar;%APP_HOME%\lib\discipline_2.11-0.7.2.jar;%APP_HOME%\lib\catalysts-platform_2.11-0.0.5.jar;%APP_HOME%\lib\macro-compat_2.11-1.1.1.jar;%APP_HOME%\lib\hk2-utils-2.4.0-b34.jar;%APP_HOME%\lib\aopalliance-repackaged-2.4.0-b34.jar;%APP_HOME%\lib\javassist-3.20.0-GA.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.21.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.21.jar;%APP_HOME%\lib\test-interface-1.0.jar;%APP_HOME%\lib\catalysts-macros_2.11-0.0.5.jar

@rem Execute pttg-fs-service
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PTTG_FS_SERVICE_OPTS%  -classpath "%CLASSPATH%" uk.gov.digital.ho.proving.financialstatus.api.ServiceRunner %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable PTTG_FS_SERVICE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%PTTG_FS_SERVICE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
