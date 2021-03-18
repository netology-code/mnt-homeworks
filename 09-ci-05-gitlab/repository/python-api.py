from flask import Flask, request
from flask_restful import Resource, Api
from json import dumps
from flask_jsonpify import jsonify

app = Flask(__name__)
api = Api(app)

class Info(Resource):
    def get(self):
        return {'version': 3, 'method': 'GET', 'message': 'Already started'} # Fetches first column that is Employee ID

api.add_resource(Info, '/get_info') # Route_1

if __name__ == '__main__':
     app.run(host='0.0.0.0', port='5290')