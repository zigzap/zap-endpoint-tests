import os

from flask import (
    Flask,
    jsonify,
    abort,
    make_response,
    render_template_string,
    Request,
    request,
)
from flask_restful import Api, Resource, reqparse, fields, marshal, inputs

app = Flask(__name__)
api = Api(app)

users = {
        1: {'first_name': 'renerocksai', 'last_name': ''},
        2: {'first_name': 'renerocksai', 'last_name': 'your mom'},
        }


class UserApi(Resource):

    def __init__(self):
        self.count = len(users)

    def get(self, userid):
        if userid in users:
            return make_response(jsonify(users[userid]))

    def post(self):
        body = request.json
        first_name = body.get("first_name", None)
        last_name = body.get("last_name", None)

        if first_name is not None and last_name is not None:
            self.count += 1
            users[self.count] = {
                'id': self.count,
                'first_name': first_name,
                'last_name': last_name,
                }
            return make_response(jsonify({'status': 'OK', 'id': self.count}))

    def put(self, userid):
        if userid in users:
            body = request.json
            first_name = body.get("first_name", None)
            last_name = body.get("last_name", None)

            if first_name is not None and last_name is not None:
                users[userid]['first_name'] = first_name
                users[userid]['last_name'] = last_name
                return make_response(jsonify({'status': 'OK', 'id': userid}))

    def delete(self, userid):
        if userid in users:
            del users[userid]
            return make_response(jsonify({'status': 'OK', 'id': userid}))


class UserListApi(Resource):
    def get(self):
        userlist = []
        for k, v in users.items():
            userlist.append({'id': k, 'first_name': v['first_name'],
                            'last_name': v['last_name']})
        return make_response(jsonify(userlist))


api.add_resource(UserApi, "/user/<int:userid>", endpoint="User")
api.add_resource(UserApi, "/user", endpoint="Userx")
api.add_resource(UserListApi, "/list", endpoint="Users")


@app.route("/")
def get():
    return make_response(app.send_static_file("index.html"))


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=3000)
