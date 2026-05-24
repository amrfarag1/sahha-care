# Dockerfile - Sahha Care AI Agent (محسن)
FROM python:3.11-slim

# إنشاء مستخدم غير root للأمان
RUN useradd -m -u 1000 appuser

WORKDIR /app

# نسخ الملفات
COPY . .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# تغيير ملكية الملفات للمستخدم الجديد
RUN chown -R appuser:appuser /app

# التبديل إلى المستخدم غير الـ root
USER appuser

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
