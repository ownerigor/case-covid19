
# Case COVID-19

O projeto "Case COVID-19" permite consultar dados sobre a pandemia de COVID-19, que teve início em dezembro de 2019 na China. Este repositório inclui uma API e um cliente para facilitar o acesso a informações sobre casos de COVID-19 em diferentes países.

## Instruções para o Uso

### Pré-requisitos

Certifique-se de que você tem o [Boss](https://github.com/HashLoad/boss) instalado, que é um gerenciador de dependências para Delphi.

### Instalação das Dependências

Para instalar as dependências do projeto, execute o seguinte comando no terminal:

```sh
boss install
```

### Executando o Projeto

Após a instalação das dependências, você pode executar a API e o Client. Se preferir, é possível executar apenas a API para realizar as requisições.

## Documentação da API

### Endpoint: Retorna Todos os Itens

#### Método HTTP

```http
GET /countries
```

#### Parâmetros

| Parâmetro         | Tipo     | Descrição                                                       |
|-------------------|----------|----------------------------------------------------------------- |
| `country`         | `string` | **Opcional**. Nome do país ou parte do nome do país.          |
| `deaths_min`      | `int`    | **Opcional**. Número mínimo de mortos.                         |
| `deaths_max`      | `int`    | **Opcional**. Número máximo de mortos.                         |
| `confirmed_min`   | `int`    | **Opcional**. Número mínimo de casos confirmados.             |
| `confirmed_max`   | `int`    | **Opcional**. Número máximo de casos confirmados.             |
| `sort`            | `string` | **Opcional**. Campo pelo qual deseja ordenar os resultados (ex: confirmed, deaths, recovered). |

### Exemplo de Requisição

Para realizar uma requisição para obter dados sobre todos os países com mais de 1000 casos confirmados, você pode usar o seguinte exemplo:

```http
GET /countries?confirmed_min=1000
```
