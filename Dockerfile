FROM python:3.12-slim

WORKDIR /app

COPY test_health.sh .

RUN apt-get update && apt-get install -y curl

RUN chmod +x test_health.sh

COPY requirements.txt . 

RUN pip install -r requirements.txt

COPY app_fastapi.py .

EXPOSE 8000

CMD ["uvicorn", "app_fastapi:app", "--host", "0.0.0.0", "--port", "8000"]
