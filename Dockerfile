FROM python:3.13-slim

ENV PORT="8085" \
    USER="app" \
    USER_HOME="/app" \
    PYTHONDONTWRITEBYTECODE="1" \
    PYTHONUNBUFFERED="1" \
    PIPENV_VENV_IN_PROJECT="1"

# system
RUN pip install --upgrade pip pipenv --no-cache-dir \
    && mkdir -p ${USER_HOME} \
    && useradd --system --home-dir $USER_HOME --shell /usr/sbin/nologin ${USER} \
    && chown ${USER}:${USER} ${USER_HOME}

# user
WORKDIR ${USER_HOME}
USER ${USER}
## pipenv deps
COPY --chown=${USER} --chmod=0444 Pipfile Pipfile.lock ./
RUN pipenv install --deploy --ignore-pipfile
## application files
COPY --chown=${USER} --chmod=0444 main.py ./

EXPOSE ${PORT}

CMD ["pipenv", "run", "serve"]
