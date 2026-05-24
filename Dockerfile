# Dockerfile - Sahha Care AI Agent
FROM python:3.11-slim

WORKDIR /app

# نسخ كل الملفات من الـ root
COPY . .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# فتح المنفذ
EXPOSE 8000

# تشغيل التطبيق
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
