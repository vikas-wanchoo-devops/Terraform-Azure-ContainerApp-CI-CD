# Use official Python slim image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY src/ ./src
COPY tests/ ./tests

# Expose port
EXPOSE 5000

# Run the app with Gunicorn (production-ready)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "src.app:app"]
