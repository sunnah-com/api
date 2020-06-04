FROM python:3.6

WORKDIR /home/app/api

COPY requirements.txt $WORKDIR

RUN pip install -r requirements.txt

COPY . $WORKDIR

ENV PYTHONUNBUFFERED 1

EXPOSE 5000
CMD python main.py
