# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Set the entrypoint to uvicorn
ENTRYPOINT ["uvicorn", "main:app"]

# Default command arguments
CMD ["--host", "0.0.0.0", "--port", "8000"]
