FROM python:3.6
WORKDIR /home/app/api
ADD . $WORKDIR
RUN pip install -r requirements.txt
EXPOSE 5000
CMD python3 -u main.py
