from flask import Flask, jsonify
from check_backups import find_latest_backup

app = Flask(__name__)

@app.route("/status")
def status():
    result = find_latest_backup()
    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
