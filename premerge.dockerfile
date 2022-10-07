FROM ultralytics/yolov5:latest-cpu

# EXPOSE 8000

COPY . /usr/src/yv5

WORKDIR /usr/src/yv5

RUN pip install -r requirements.txt

ENTRYPOINT ["./entrypoint.sh"]

# CMD ["uvicorn", "web_app.main:app", "--host", "0.0.0.0", "--port", "8080"]
