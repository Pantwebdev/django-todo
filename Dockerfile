# Django 2.2 supports Python 3.8; use that runtime for compatibility.
FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install --no-cache-dir "Django==2.2.7"

COPY . .

EXPOSE 8000

# Apply existing migrations before starting the development server.
CMD ["sh", "-c", "python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:8000"]
