FROM python:3.11

WORKDIR /src

COPY ./requirements.txt /src/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /src/requirements.txt

COPY ./jobs /src/jobs

COPY ./models /src/models

CMD ["uvicorn", "jobs.main:app", "--host", "0.0.0.0", "--port", "80"]
