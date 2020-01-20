FROM python:2.7

WORKDIR /app
ADD requirements.txt /app
RUN pip --no-cache-dir install -r requirements.txt

EXPOSE 5000
ENV ENDORSEGG_ENV=PROD

ADD . .

# CMD python app.py
CMD gunicorn -w 2 -b 0.0.0.0:5000 app:app