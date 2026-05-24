# Dockerfile
FROM python:3.11-slim

WORKDIR /app

# نسخ ملفات الـ backend
COPY backend/ ./

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# فتح المنفذ
EXPOSE 8000

# تشغيل الـ API
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
