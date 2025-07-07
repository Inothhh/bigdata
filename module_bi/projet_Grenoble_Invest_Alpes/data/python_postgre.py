import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://binome8:6FE[CBis}KnsjLiMH8%g@51.159.205.157:15030/BI_group8")

# Exemple : base entreprises
df = pd.read_csv("base_entreprises_clean.csv")
df.to_sql("base_entreprises", engine, index=False, if_exists="replace")
