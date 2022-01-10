#FROM ubuntu
#Slim removes tools, this one such as GIT
#We do not need to do apt-get or install anymore due to ubuntu
#FROM python:3.9-slim-buster
FROM python:3.9-alpine

#RUN apt-get -y update && \
#    apt-get -y install --no-install-recommends python3-pip python3 && \
#    rm -rf /var/lib/apt/lists/* && \
#    apt-get clean

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

#Do not need to install pip anymore due to the image
#RUN pip3 install --no-cache-dir --upgrade pip && \
RUN    pip3 install --no-cache-dir -r /app/requirements.txt

COPY . /app

ENTRYPOINT ["python"]
EXPOSE 80
CMD [ "app.py" ]