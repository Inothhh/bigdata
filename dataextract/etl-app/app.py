# etl-app/app.py
import sqlite3
import csv
import os

DB_PATH = 'data/entreprises_grenoble.db'

def load_csv_to_db(csv_file):
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS entreprises (
        siren TEXT, nom TEXT, adresse TEXT
    )""")

    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            c.execute('INSERT INTO entreprises VALUES (?, ?, ?)', (
                row['siren'], row['nom'], row['adresse']
            ))

    conn.commit()
    conn.close()

if __name__ == '__main__':
    load_csv_to_db('data/entreprises.csv')
