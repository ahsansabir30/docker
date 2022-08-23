from application import app
from flask import Response
import random

@app.route('/get/animal', methods=['GET'])
def get_animal():
    animal = ['Dog', 'Cow', 'Cat']
    randomnum = random.randint(0,2)
    return Response(animal[randomnum], mimetype='text/plain')
