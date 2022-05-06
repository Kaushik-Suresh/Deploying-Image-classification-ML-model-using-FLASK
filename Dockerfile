FROM python:3.9-slim
ENV YOUR_ENV=${YOUR_ENV} POETRY_VERSION=1.1.11
RUN pip install "poetry==${POETRY_VERSION}"
WORKDIR /deploy
COPY poetry.lock pyproject.toml /deploy/
RUN poetry config virtualenvs.create false
RUN poetry install
COPY . /deploy
EXPOSE 8080
ENTRYPOINT ["python", "app.py"]