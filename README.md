# Jobs

Jobs is a simple API where you request a prediction
whether a job description is fraudulent or not.

## Running the API in a nutshell

### 1 - Clone the repository
```commandline
$ git clone https://github.com/caiomts/jobs_case.git
```
You can run in a Docker or from source
### 2 - From Dockerfile

In the root folder, run the following commands:
```commandline
$ make build
```
or

```commandline
$ docker build --tag jobs .
```
then:
```commandline
$ make run
```
or

```commandline
$ docker run -d --name jobs -p 80:80 jobs
```
Your docker is running in detached mode. In the browser go to:

```commandline
https://localhost/docs
```

### 3 - From source
In the root folder, run the following commands:

```commandline
$ make setup
```
to set up the python environment, upgrade `pip` and install `flit`.

```commandline
$ make install
```
to install all dependencies and the project as an editable module.
```commandline
$ uvicorn jobs.main:app
```
Thanks to [FastAPI](https://fastapi.tiangolo.com/) you can 
quickly iterate through the API directly from the documentation.

## Reproducibility

This project is fully reproducible from source. After cloning
the repo and saving the raw data into `./data/raw`. you
can use the `Makefile` to build all the models from scratch
(please, don't do that because it'll cost you a lot of time).

If you want anyway. first follow the [3 - From Source](https://github.com/caiomts/jobs_case#3---from-source).
Then:

```commandline
$ make
```

## Cool features

### Makefile

It Makes easy the execution of different commands and the reproducibility.

### Tests

It ensures that modifications will not break the program or change expected
behaviour. It is an important maintenance feature.

### Scripts for automation and git hooks

Each commit automatically formats the code and tests it, so you do not have to
remember all the things and your project will always be sanitised.  
It is an important maintenance feature.

### github action

Same idea of scripts and hooks, but ensures the good behaviour upstreams.

## What is missing?

We always miss something... Below are some points that I highlight as important
missing parts.

### Model development

The model presented is an adaptation of a model I've already used before. The idea
was to automate all the pre-processing with the model tuning, like an auto-ml
which you feed in data and train and update it on the fly. But it
is missing a lot of iteration. This is due to the focus of the case, My chose was
to focus more on the CI and maintenance.

### Data Drift?

Ideally we should compare the data comes in with the data used to train the model.
Data changes in the wild cause the model to lose its quality. We should be aware
when the changes in coming data are that important.

### Docs

Good projects start with good documentation. As this is a small one, I hope
this README would be enough, but documenting projects with `Mkdocs` and generating 
API references automatically with `Mkdocstrings` is something that I'm used to.
