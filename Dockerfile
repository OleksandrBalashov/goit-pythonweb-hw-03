FROM python:3.12-alpine

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . .

RUN pip install poetry

RUN poetry config virtualenvs.create false && poetry install --only main

RUN mkdir -p $APP_HOME/storage

VOLUME ["/app/storage"]

EXPOSE 3000

CMD ["poetry", "run", "python3", "main.py"]