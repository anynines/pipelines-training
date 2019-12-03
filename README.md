# pipelines-training


## Start Concourse

`docker-compose up -d`

## Login to Concourse

Username: test
Password: test

## Set Pipeline

```bash
cp pipelines/vars.example.yml pipelines/vars.yml
fly -t tutorial set-pipeline -p postgres -c pipelines/postgres.yml -l pipelines/vars.yml
```
