from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'inoth',
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

with DAG(
    dag_id='etl_script_dag',
    default_args=default_args,
    description='Exécute le script ETL dans Docker',
    schedule_interval='@daily',  # ou None si déclenché manuellement
    start_date=datetime(2024, 1, 1),
    catchup=False,
    tags=['etl'],
) as dag:

    run_etl = BashOperator(
        task_id='run_etl',
        bash_command='docker exec dataextract_etl-app_1 python /app/app.py',
    )

    run_etl
