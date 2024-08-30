# Projeto Postgre & dbt Core

Projeto realizado em banco `Postgre` com modelagem de dados via ferramenta `dbt core`

O projeto foi desenvolvido na versão do `python 3.12.5` - vide arquivo `.python-version`. Para replicar este projeto será necessário: 

1. Instalar algumas bibliotecas e configurar o ambiente virtual para execução e desenvolvimentos - utilizando algum terminal, como o CMD ou Git Bash: 

```
Instalando Bibliotecas


# pyenv - dependendo do sistema operacional (Mac/Linux/Windows) o processo será diferente. O modo a seguir serve para instalação no Windows via PowerShell:

Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"


# pipx
pip install pipx


# poetry
pipx install poetry
```

```
Configurando ambiente virtual

pipx ensure path
poetry config virtualenvs.in-project true
poetry new coleta-preco-acoes
pyenv local 3.12.5
poetry env use 3.12.5
poetry shell
```

2. Clonar o repositório na máquina de destino pelo comando: 
```
# Clonando via SSH

git clone git@github.com:renanmarxx/postgre-dbt-core.git
```