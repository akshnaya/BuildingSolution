####################################################################
#
# Dockerfile to build exapmple-app
#####################################################################
FROM phx.ocir.io/oraclegbudevcorp/cnedev-shared/baseimages/baseimages-python3_rest:latest

RUN pip install connexion[swagger-ui]

COPY app /app
COPY etc /etc

WORKDIR /app

CMD ./example-app.py
