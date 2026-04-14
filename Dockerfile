FROM python:3.12-slim

WORKDIR /app

COPY requiremnts.txt .
RUN pip install --no-chache-dir -r requirements.txt

COPY . .

CMD ["python","app.py"]