FROM ubuntu

RUN apt-get -y update; apt-get clean
RUN apt-get -y install python3-pip python3; apt-get clean

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install -r /app/requirements.txt
COPY . /app

ENTRYPOINT ["python"]
EXPOSE 80
CMD [ "app.py" ]