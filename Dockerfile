FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y \ 
build-essential \
libpq-dev \
libpq5 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt
 
COPY . .

EXPOSE 8000

CMD [ "gunicorn","-w","4","-b","0.0.0.0:8000","app:app" ]

