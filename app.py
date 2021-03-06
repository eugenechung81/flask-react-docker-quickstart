import os

from flask import Flask, send_from_directory

app = Flask(__name__, static_folder='build')



# STATIC_FOLDER = 'build'

@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path == "":
        return send_from_directory(app.static_folder, 'index.html')
    else:
        if os.path.exists(app.static_folder + "/" + path):
            return send_from_directory(app.static_folder, path)
        else:
            return send_from_directory(app.static_folder, 'index.html')


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, threaded=True)
