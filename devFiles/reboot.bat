call buildPushDocker.bat
TIMEOUT /T 5 /NOBREAK
cd devFiles
call recreateConcourseJob.bat
