# Use a imagem base do Python
FROM python:3.8

# Defina o diretório de trabalho
WORKDIR /

# Copie o arquivo de requisitos primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Atualize pip
RUN pip install --upgrade pip

# Instale as dependências
RUN pip install -r requirements.txt

# Copie o restante dos arquivos do projeto para o contêiner
COPY . .

# Expõe a porta usada pela aplicação
EXPOSE 5000

# Comando para rodar o app
CMD ["python", "app.py"]
