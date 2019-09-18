# README

# EspertoFit

## Sistema de Cobranças e Pagamentos

### Ruby version
2.6.4

### API
-Disponibiliza os metodos de pagamentos disponiveis:
```JSON
  {"id":1,
  "name":"Cartão de Crédito",
  "created_at":"2019-09-15T23:41:51.236Z",
  "updated_at":"2019-09-15T23:41:51.236Z",
  "tax":5,
  "limit_days":4
  },
   {"id":2,
   "name":"Boleto",
   "created_at":"2019-09-15T23:43:52.226Z",
   "updated_at":"2019-09-15T23:43:52.226Z",
   "tax":0,
   "limit_days":15
   }
```
- Disponibiliza o histórico de mensalidades:

```
get "/api/v1/payments/**cpf**"
```
# Consultar todos os pagamentos para um determinado cpf:


### *Exemplo de resultado:*

```json

{
   "cpf": "123456",
   "payments":[
      {
         "value"    :40.0,
         "dt_venc"    :"2019-09-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2019-10-15",
         "status"    :"pending"
      },

      ...

   ]
}
  ```

# Listar todos os planos:
```
get "/api/v1/plans"
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/plans
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "Paulista",
        "value": null
    }

    ...

]
```

# Listar todas as unidades:
```
get "/api/v1/unity"
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/plans
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "Paulista",
        "value": null
    }

    ...

]
```

# Listar todas os metodos de pagamento:
```
get "/api/v1/pay_methods"
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/pay_methods
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "boleto"
    },

    ...


```

# Consultar metodo de pagamento pelo nome:
```
 get 'http://localhost:3000/api/v1/pay_methods', params: { name: 'Boleto'}
```
### **Exemplo:**

```
{
http://localhost:3000/api/v1/pay_methods?name=boleto
}
```

### Resultado:

```
[
    {
        "id": 1,
        "name": "boleto"
    }

```
- Lançar aulas avulsa 
  post '/api/v1/single_class'
  
  Exemplo
  ```
   post '/api/v1/single_class', params: {single_class: 
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '123456'
       } }
  ```

- Banir usuario transformando cancelando suas faturas pendentes em canceladas

get "/api/v1/payments/**cpf**/ban"
```json
   {"msg": "CPF 123456 com todas as suas faturas canceladas"}
```
