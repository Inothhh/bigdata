import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://binome8:mot_de_passe@51.159.205.157:15030/db_binome8")

# Exemple : base entreprises
df = pd.read_csv("base_entreprises_clean.csv")
df.to_sql("base_entreprises", engine, schema="raw", index=False, if_exists="replace")
