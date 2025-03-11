FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Copy the requirements file and install dependencies
COPY requirements.txt /app/backend/

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/backend

# Expose the application port
EXPOSE 8000

# Run migrations (uncomment if needed)
# RUN python manage.py makemigrations
# RUN python manage.py migrate

# Start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
