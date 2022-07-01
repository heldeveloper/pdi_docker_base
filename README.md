# Instruções Build Imagem


1. Realizar build da imagem execução é demorada devido tamanho do pdi quase 2G imagem padrão dentro do diretório pdi_base (Verificar Melhorias).
    * `docker build -t <nome_imagem:0.1> .`
2. Executar container acessar a pasta pdi_docker_base.
    * docker run `nome_imagem` `nome do caminho git` `nome da pasta no git` `nome do job ou transformação` arquivo pentaho com extensões .kjb ou .ktr

Exemplo.
```
docker run <nome_imagem> https://github.com/heldeveloper/pdi_test_transformacao teste_pdi job_teste.kjb
```

## Melhorias para implementação.

Com esse modelo de baixar os arquivos do git em tempo de execução precisamos ainda implementar a questão de segurança do git dentro do container para acesso a repositório privado.
Dentro do que pesquisei até o momento existe algumas estratégias.
[git_in_docker](https://www.baeldung.com/ops/dockerfile-git-strategies)
[git_in_docker_option2_metodo_nao_seguro](https://pt.stackoverflow.com/questions/113663/clonar-reposit%C3%B3rio-privado-passando-senha-como-par%C3%A2metro)
[git_in_docker_option3_metodo_seguro_com_ssh_key](https://stackoverflow.com/questions/18136389/using-ssh-keys-inside-docker-container)


## Estas imagens são genéricas as chamadas para os container através do pentaho devem ocorrer pelo airflow como uma dag no exemplo abaixo.


```
pentaho = DockerOperator(
    task_id='pentaho',
    image='pdi_docker:latest',
    api_version='auto',
    auto_remove=True,
    environment={
    'GIT_URL': "https://github.com/biwed/pdi_trick.git",
    'PROJECT': "clone_row_on_pdi",
    'OBJECT' : "clone_row_on_pdi.ktr"
    },
    mem_limit="4g",
    docker_url="unix://var/run/docker.sock",
    network_mode="bridge",
    )
```


    