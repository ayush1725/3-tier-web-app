FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Copy the requirements file
COPY requirements.txt /app/backend/

# Install system dependencies and Python packages
RUN apt-get update \
    && apt-get install -y \
        gcc \
        default-libmysqlclient-dev \
        python3-dev \
        build-essential \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/backend

# Expose the application port
EXPOSE 8000

# Start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
