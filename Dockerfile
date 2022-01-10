FROM ubuntu

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends python3-pip python3 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r /app/requirements.txt

COPY . /app

ENTRYPOINT ["python"]
EXPOSE 80
CMD [ "app.py" ]