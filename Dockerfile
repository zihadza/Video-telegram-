FROM python:3.12-slim

WORKDIR /app

# ডাটাবেস ফাইলের জন্য ফোল্ডার তৈরি এবং পারমিশন দেওয়া
RUN mkdir -p /app/data && chmod 777 /app/data

# ভার্চুয়াল এনভায়রনমেন্ট তৈরি
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# প্যাকেজ ইনস্টল করা
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# বাকি কোড কপি করা
COPY . .

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
