from flask import Flask, Response, request
from bumblebee import *

application = Flask(__name__)

@application.route('/transform', methods=['POST'])
def transform():
    return Response(pipeline_to_cdr(request.data), mimetype="application/json")

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=8080)
