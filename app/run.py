from bottle import post, request, response, run
from bumblebee import *

@post('/transform')
def transform():
    response.content_type = 'application/json'
    return pipeline_to_cdr(request.body.read())    

run(host='0.0.0.0', port=8080, debug=True)

