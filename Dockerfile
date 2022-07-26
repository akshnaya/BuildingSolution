####################################################################
#
# Dockerfile to build exapmple-app
#####################################################################

# 
# This is the existing baseimage for the docker which has 
# required python3 packages on oraclelinux
FROM phx.ocir.io/oraclegbudevcorp/cnedev-shared/baseimages/baseimages-python3_rest:latest

RUN pip install connexion[swagger-ui]

COPY app /app
COPY etc /etc

WORKDIR /app

CMD ./example-app.py
