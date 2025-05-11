FROM python:3.11-alpine

RUN adduser -S app -h /home/app
USER app

ENV PATH="${PATH}:/home/app/.local/bin"

WORKDIR /home/app/src

EXPOSE 8080

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
