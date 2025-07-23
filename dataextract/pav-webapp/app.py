# pav-webapp/app.py
from flask import Flask
import sqlite3

app = Flask(__name__)

@app.route('/')
def home():
    conn = sqlite3.connect('data/entreprises_grenoble.db')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM entreprises LIMIT 5")
    entreprises = cursor.fetchall()
    conn.close()
    return '<br>'.join([str(e) for e in entreprises])

if __name__ == '__main__':
    app.run(host='0.0.0.0')
