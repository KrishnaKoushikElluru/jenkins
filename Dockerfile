FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir-requirements.txt

COPY . .

CMD ["python","app.py"]