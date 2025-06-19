
---

```markdown
# Dockerfile

<!-- Containerização da aplicação Python com demo de soma -->

```dockerfile
# Dockerfile

# 1. Imagem base Python leve
FROM python:3.11-alpine

# 2. Define diretório de trabalho
WORKDIR /app

# 3. Copia arquivos necessários
COPY requirements.txt .
COPY app/ ./app

# 4. Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# 5. Comando padrão: executa demo rápida da função soma
CMD ["python", "-c", "from app.calculos import soma; print('2+3 =', soma(2,3))"]
