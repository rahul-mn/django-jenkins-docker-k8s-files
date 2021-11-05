FROM ubuntu

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
RUN apt install python3
RUN python3 -m pip install --upgrade pip
RUN pip install -r /requirements.txt

RUN mkdir /my_django_project
COPY ./my_django_project /my_django_project
WORKDIR /my_django_project
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]