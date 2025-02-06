# Como Rodar a Pipeline

Pré-requisitos:
- Python e Docker-compose Instalado
- Ambiente Linux

Passo a Passo
  
1. Entrar no diretório
```
cd code-challenge
```

2. Instalar dependências:
```
python3 -m venv venv
source venv/bin/activate 
pip install -r requirements.txt 
```
3. Subir os bancos do arquivo docker-compose.yml:
```
docker-compose up -d
```

4. Subir dump do banco postgres final que receberá todos dados.
```
psql -h localhost -p 5434 -U northwind_user -d northwind_full -f northwind_full_sem_dado_dump.sql
```
   
5. Entrar no Projeto meltano e rodar os comandos:
```
cd meltano-project
meltano lock --update --all
meltano install
```

6. Inicializar airflow, criar user 
```
meltano invoke airflow:initialize
meltano invoke airflow users create -u user -p 123 --role Admin -e email@gmail.com -f admin -l admin
```
8. Ajustar caminho da pasta das dags:
```
Ir no arquivo airflow.cfg localizado em: meltano-project/orchestrate/airflow,
e editar variável 'dags_folder', colocando o caminho que está a pasta mmeltano-project/orchestrate/airflow/dags
```
9. inicializar webserver:
```
meltano invoke airflow webserver
```
10. Em outro terminal rodar o scheduler:
```
meltano invoke airflow webserver
```

11. Abrir UI do airflow em:
```
http://localhost:8081/
e realizar login com user:user, senha:123
```

12. Acionar a dag: meltano_el_dag

13. Rodar arquivo python:
```
cd ..
python3 final_query.py
```

14. Arquivo json gerado em:  query_output/order.json
