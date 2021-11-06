FROM ubuntu

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
RUN apt update
RUN apt install -y python3 python3-pip
RUN pip install -r /requirements.txt

RUN mkdir /django_test
COPY ./django_test /django_test
WORKDIR /django_test
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser --disabled-password user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
RUN chown -R user:user /my_django_project

CMD ["entrypoint.sh"]