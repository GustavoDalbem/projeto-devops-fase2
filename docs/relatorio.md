# Relatório Final

## 1. Descrição das etapas implementadas

- **Fase 1 (CI):**  
  - Pipeline em `.github/workflows/ci.yml` com checkout, instalação de dependências e execução de testes via `pytest`.

- **Fase 2 (CD, Containerização e Orquestração):**  
  1. Pipeline de CD (`.github/workflows/cd.yml`):  
     - Checkout → testes → empacotamento (`zip`) → aprovação manual → deploy simulado em staging.  
  2. **Dockerfile:**  
     - Imagem baseada em `python:3.11-alpine`, copia código, instala dependências e executa demo de soma.  
  3. **Docker Compose:**  
     - Serviço `app` usando a imagem acima;  
     - Serviço `monitor` que roda `curl` para verificar se o `app` está no ar;  
     - Rede customizada `devops-net`.

## 2. Fluxograma do pipeline completo (CI + CD)

```mermaid
flowchart TD
  A[Push em main] --> B[CI Build]
  B --> C{Testes OK?}
  C -- Não --> Z[Pipeline Falha]
  C -- Sim --> D[Gerar artefato ZIP]
  D --> E[Aprovação manual]
  E --> F[Deploy Staging]
