from application import app
from flask import render_template
import requests

@app.route('/', methods=['GET'])
@app.route('/animal/noise', methods=['GET'])
def get_noise():
    animal = requests.get('http://animal:9001/get/animal')
    animal_text = animal.text
    if animal_text == 'Dog':
        noise = 'Woof'
    elif animal_text == 'Cat':
        noise = 'Meow'
    else:
        noise = 'I am a cow'
    return render_template('index.html', animal=animal_text, noise=noise)
