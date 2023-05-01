FROM python:3.8

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5000 5001

# run the client app in a separate process
CMD ["python", "client.py"]
