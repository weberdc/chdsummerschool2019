@echo off

set GBIN="%USERPROFILE%\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin"

python %GBIN%\dev_appserver.py app.yaml
