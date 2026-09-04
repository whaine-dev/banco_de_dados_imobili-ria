# Sistema de Imobiliária (Exercício de Modelagem de Banco de Dados)

Exercício de modelagem relacional em MySQL, com foco em relacionamentos 1:N e 1:1, e especialização de entidades (herança).

## Tabelas

* **edificio** — dados dos prédios administrados
* **cliente_cpf_cnpj** — tabela base dos clientes
* **cliente_cpf** — especialização de cliente Pessoa Física (1:1 com `cliente_cpf_cnpj`)
* **cliente_cnpj** — especialização de cliente Pessoa Jurídica (1:1 com `cliente_cpf_cnpj`)
* **compra** — compras feitas pelos clientes (1:N com `cliente_cpf_cnpj`)
* **apartamento** — unidade vendida, gerada por uma compra (1:1 com `compra`)
* **edificio_apartamento** — tabela associativa que liga cada apartamento ao seu edifício (1:N)

## Relacionamentos

* Um cliente pode ser Pessoa Física ou Pessoa Jurídica, nunca os dois — resolvido pela especialização em `cliente_cpf` e `cliente_cnpj`
* Um cliente pode realizar vários pedidos de compra (1:N)
* Cada compra gera exatamente um apartamento (1:1)
* Um edifício pode ter vários apartamentos, através da tabela `edificio_apartamento` (1:N)

## Observação
Os dados de CPF, CNPJ e valores inseridos são fictícios, gerados apenas para fins de teste.

# Visão da tabela
<img width="700" height="600" alt="imobibliaria" src="https://github.com/user-attachments/assets/21dca5e0-01fd-43bd-8fc7-52183976b138" />
