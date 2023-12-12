# Configuração de Hooks Git

## Introdução

Este documento fornece instruções sobre como configurar automaticamente os hooks Git para um repositório local usando o script `setup-hooks.sh`.

## Pré-requisitos

- Git instalado na máquina local.
- Acesso ao repositório Git para o qual você deseja configurar os hooks.

## Passos de Configuração

### 1. Clone o Repositório

Clone o repositório desejado para a sua máquina local usando o seguinte comando:

```bash
git clone <URL_DO_REPOSITORIO>
```

Substitua `<URL_DO_REPOSITORIO>` pela URL do seu repositório.

### 2. Navegue até o Diretório do Repositório

```bash
cd <NOME_DO_REPOSITORIO>
```

Substitua `<NOME_DO_REPOSITORIO>` pelo nome do diretório do seu repositório.

### 3. Dê Permissão de Execução ao Script

Dê permissão de execução ao script `setup-hooks.sh` usando o seguinte comando:

```bash
chmod +x setup-hooks.sh
```

### 4. Execute o Script `setup-hooks.sh`

Execute o script `setup-hooks.sh` para copiar os hooks para o diretório `.git/hooks/`:

```bash
./setup-hooks.sh
```

### 5. Verificação

Para verificar se a configuração foi bem-sucedida, abra a pasta `.git/hooks/` e certifique-se de que os hooks relevantes estão presentes.

## Observações

- Certifique-se de que a pasta `.githooks/` está presente no diretório do seu repositório com os hooks desejados.
- Se os hooks precisarem ser modificados ou atualizados, faça as alterações na pasta `.githooks/` e execute novamente o script `setup-hooks.sh`.