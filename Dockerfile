# 1. Download and Install Python 3
FROM python:3.13.2-slim-bullseyes

# 2. Create a virtual environment
RUN python -m venv /opt/venv

# 3. Set the virtual environment as the current location
ENV PATH="/opt/venv/bin:$PATH"

#  4. Upgrate pip
RUN pip install --upgrade pip

# 5.  Set Python-related environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 6. Install or dependencies for our mini vm
RUN apt-get update && apt-get install -y \
    #for postgres
    libpq-dev \
    # for Pillow
    libjpeg-dev \
    # for CairSVG
    libcairo2 \
    # other
    gcc \
    && rm -rf /var/lib/apt/lists/*


# 7. Create the mini vm's code directory
RUN mkdir -p /code

# 8. Set the working directory to that same code directory
WORKDIR /code


# 9. copy the requirements.tx file into the container
COPY requirements.txt /tmp/requirements.txt

# 10. copy the project code into the container
COPY ./src /code

# 11. Install the Python project requirements
RUN pip install -r /tmp/requirements.txt

