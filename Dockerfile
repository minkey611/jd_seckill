FROM python:latest

MAINTAINER minkey "minkey@163.com"
ENV TZ Asia/Shanghai

RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

RUN apt-get update -y  

COPY ./requirements.txt /requirements.txt

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/ 

COPY . /

ENTRYPOINT [ "python3" ]

CMD [ "/app/main.py" ]
