FROM ubuntu

# Set the working directory
WORKDIR /app

# Copy the requirements.txt and devops directory to the /app directory
COPY requirements.txt /app
COPY devops /app/devops

# Install required packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Create a virtual environment and install dependencies
RUN python3 -m venv /app/venv && \
    /app/venv/bin/pip install -r /app/requirements.txt

# Set the working directory to /app/devops
WORKDIR /app/devops

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Define the entry point and command for the container
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

