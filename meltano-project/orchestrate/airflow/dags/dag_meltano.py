from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

MELTANO_PROJECT_DIR = "/home/lorenzocoracini/eng-dados-indicium/code-challenge/meltano-project"

with DAG(
    dag_id="meltano_el_dag",
    schedule_interval="@daily",  
    start_date=datetime(2025, 2, 5),
    catchup=False,
    tags=["meltano", "el"],
) as dag:

    # passo 1
    el_postgres_to_localsystem = BashOperator(
        task_id="extract_and_load_postgres_to_csv",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-postgres target-csv",
    )
    
    el_csv_to_localsystem = BashOperator(
        task_id="extract_and_load_csv_to_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-order-details-data target-csv-order-details"
    )

    # passo 2
    
    # order details
    el_order_details_localsystem_to_postgres = BashOperator(
        task_id="extract_and_load_order_details_localsystem_to_postgres",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-order-details-localsystem target-postgres"
    )

    # categories
    el_csv_categories_localsystem = BashOperator(
        task_id="extract_and_load_csv_categories_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-categories-localsystem target-postgres-categories"
    )

    # customers
    el_csv_customers_localsystem = BashOperator(
        task_id="extract_and_load_csv_customers_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-customers-localsystem target-postgres-customers"
    )

    # employee_territories 
    el_csv_employee_territories_localsystem = BashOperator(
        task_id="extract_and_load_csv_employee_territories_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-employee_territories-localsystem target-postgres-employee_territories"
    )

    # orders
    el_csv_orders_localsystem = BashOperator(
        task_id="extract_and_load_csv_orders_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-orders-localsystem target-postgres-orders"
    )

    # products
    el_csv_products_localsystem = BashOperator(
        task_id="extract_and_load_csv_products_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-products-localsystem target-postgres-products"
    )

    # shippers
    el_csv_shippers_localsystem = BashOperator(
        task_id="extract_and_load_csv_shippers_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-shippers-localsystem target-postgres-shippers"
    )

    # suppliers
    el_csv_suppliers_localsystem = BashOperator(
        task_id="extract_and_load_csv_suppliers_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-suppliers-localsystem target-postgres-suppliers"
    )

    # territories
    el_csv_territories_localsystem = BashOperator(
        task_id="extract_and_load_csv_territories_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-territories-localsystem target-postgres-territories"
    )

    # region
    el_csv_region_localsystem = BashOperator(
        task_id="extract_and_load_csv_region_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-regions-localsystem target-postgres-regions"
    )

    # us_states
    el_csv_us_states_localsystem = BashOperator(
        task_id="extract_and_load_csv_us_states_localsystem",
        bash_command=f"cd {MELTANO_PROJECT_DIR} && meltano el tap-csv-us-states-localsystem target-postgres-us-states"
    )

    el_postgres_to_localsystem>>el_csv_to_localsystem>> [
        el_order_details_localsystem_to_postgres, el_csv_categories_localsystem,
        el_csv_customers_localsystem, el_csv_employee_territories_localsystem,
        el_csv_orders_localsystem, el_csv_products_localsystem,
        el_csv_shippers_localsystem, el_csv_suppliers_localsystem,
        el_csv_territories_localsystem, el_csv_region_localsystem,
        el_csv_us_states_localsystem
    ]