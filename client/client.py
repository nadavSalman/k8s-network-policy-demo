from flask import Flask, jsonify
import requests

app = Flask(__name__)

@app.route('/get_message', methods=['GET'])
def get_message():
    response = requests.get('http://flask-server:5000/hello')
    return response.json() 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)