# 🛹 Skateshop - Sistema de Gerenciamento de Loja

Sistema simples em Ruby para gerenciamento de uma loja de skates, com funcionalidades de cadastro de clientes, produtos, controle de estoque, adição de crédito e histórico de compras.

---

### 🚀 Funcionalidades

- 📇 Cadastro de clientes (com CPF/CNPJ e telefone formatados)
- 🛒 Cadastro de produtos (nome, preço e quantidade em estoque)
- 💰 Adição de saldo para clientes
- 🛍️ Realização de compras descontando saldo e estoque
- 📜 Histórico de compras
- 🔎 Listagem de clientes e produtos
- 📦 Controle de estoque automático

---

### 📂 Estrutura do Projeto
```
skateshop/
├── app.rb # Arquivo principal (executa o sistema)
├── customer.rb # Classe Customer (clientes)
├── product.rb # Classe Product (produtos)
├── market.rb # Classe Market (compras e histórico)
├── bundler/ # Gerenciamento de dependências
│ ├── Gemfile # Declaração das gems utilizadas
│ └── Gemfile.lock # Controle de versões das gems
└── README.md # Documentação do projeto
```
---

### 🔧 Tecnologias Utilizadas

- Ruby (>= 2.5)
- Gem `cpf_cnpj` → validação e formatação de CPF e CNPJ

---

### 📥 Instalação

1. Clone o repositório:
```
git clone https://github.com/AleexDevel0per/Market_Dynamics.git
cd Market_Dynamics
```
2. Instale a gem necessária:
```
gem install cpf_cnpj
```
3. Execute o sistema:
```
ruby app.rb
```

---

### 🗒️ Funcionalidades Detalhadas

#### 👥 Clientes
- Cadastro de cliente com:
  - Nome
  - Documento (CPF ou CNPJ) com validação e formatação
  - Telefone (formatado)
- Adição de saldo
- Listagem de clientes

#### 📦 Produtos
- Cadastro de produtos:
  - Nome
  - Preço (validado: não pode ser zero ou negativo)
  - Quantidade em estoque (validado: não pode ser zero ou negativo)
- Listagem dos produtos

#### 🛍️ Compras
- Seleção do cliente e do produto
- Verificações:
  - Saldo do cliente suficiente
  - Estoque do produto disponível
- Compra:
  - Desconta o valor do saldo do cliente
  - Reduz a quantidade do estoque
  - Salva no histórico

#### 📜 Histórico de Compras
- Exibe:
  - Nome do cliente
  - Produto comprado
  - Valor pago
  - Quantidade
  - (Possível implementação de data/hora)

---

### ✅ Validações

- CPF e CNPJ válidos (`cpf_cnpj`)
- Preço > 0
- Quantidade > 0
- Verifica saldo antes de comprar
- Verifica estoque antes de comprar

---

### 🔮 Melhorias Futuras

- 💾 Persistência de dados (JSON, SQLite ou PostgreSQL)
- 🌐 Interface web (Rails ou Sinatra)
- 📊 Dashboard com:
  - Vendas
  - Produtos mais vendidos
  - Clientes mais ativos
- 🔍 Filtros avançados:
  - Por cliente
  - Por produto
  - Por período
- 📅 Registro de data e hora nas compras
- 🔑 Login de administradores
- 🎨 Interface gráfica (Shoes ou Tk)

---

### 🧠 Aprendizados

- Programação Orientada a Objetos (POO)
- Criação de classes, métodos e objetos no Ruby
- Manipulação de listas e dados
- Validação de CPF/CNPJ com gem
- Organização de código
- Menus no terminal

---

### 🤝 Contribuições

Contribuições são bem-vindas! Abra uma issue ou envie um pull request.

---

### 🧑‍💻 Desenvolvedor

Feito com ❤️ por Alexandre Schopf (https://github.com/AleexDevel0per)

---

### 📄 Licença

Projeto de uso livre para fins de estudo.