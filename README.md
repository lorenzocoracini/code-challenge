# Como Rodar a Pipeline

Pré-requisitos:
- Python e Docker-compose Instalado
- Ambiente Linux

Passo a Passo
  
1. Entrar no diretório da venv e ativar:
```
cd code-challenge
source desafio_venv/bin/activate
```

2. Instalar dependências:
```
pip install -r requirements.txt
```

3. Subir os bancos do arquivo docker-compose.yml:
```
docker-compose up -d
```
   
4. Entrar no Projeto meltano e rodar os comandos:
```
cd meltano-project
meltano lock --update --all
meltano install
```

5. Inicializar airflow, criar user e inicializar webserver:
```
meltano invoke airflow:initialize
meltano invoke airflow users create -u user -p 123 --role Admin -e email@gmail.com -f admin -l admin
meltano invoke airflow webserver
```

6. Em outro terminal rodar o scheduler:
```
meltano invoke airflow webserver
```

7. Abrir UI do airflow em:
```
http://localhost:8081/
```

8. Acionar a dag: meltano_el_dag

9. Rodar arquivo python:
```
cd ..
python3 final_query.py
```

10. Arquivo json gerado em:  query_output/order.json
