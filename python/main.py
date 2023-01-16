from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return {"message": "Hello, Nix!"}

def run():
    app.run(host="0.0.0.0", port=5000)


if __name__ == "__main__":
    run()
