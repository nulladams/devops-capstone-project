FROM python:3.7.3-stretch

WORKDIR /app

COPY requirements.txt /app

RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

RUN curl -LO https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 && chmod +x hadolint-Linux-x86_64
RUN mv hadolint-Linux-x86_64 /usr/local/bin/hadolint

COPY ./src /app

EXPOSE 80

CMD ["python", "app.py"]



