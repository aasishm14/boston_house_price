FROM python:3.8-slim

WORKDIR /app

# Install required packages
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Install Jupyter and nbconvert
RUN pip install jupyter nbconvert

# Copy notebook files into the image
COPY exploratory_data_analysis.ipynb .
COPY feature_engineering.ipynb .
COPY feature_selection.ipynb .

# Command to convert notebooks to HTML or run them
CMD jupyter nbconvert --execute --inplace exploratory_data_analysis.ipynb
CMD jupyter nbconvert --execute --inplace feature_engineering.ipynb
CMD jupyter nbconvert --execute --inplace feature_selection.ipynb


