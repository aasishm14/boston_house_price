from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the trained model
model = joblib.load('model.joblib')

@app.route('/')
def home():
    return "Welcome to the Boston House Pricing Prediction API!"

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    data_df = pd.DataFrame([data])
    
    prediction = model.predict(data_df)
    output = prediction[0]
    
    return jsonify({'prediction': output})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

