FROM python:3.6
COPY . .
RUN pip3 install -r requirements.txt
EXPOSE 9001
ENTRYPOINT [ "python3", "app.py" ]