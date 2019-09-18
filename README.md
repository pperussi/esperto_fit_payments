# README

# EspertoFit

## Sistema de Cobranças e Pagamentos

### Ruby version
2.6.4

### API
-Disponibiliza todos os metodos de pagamentos disponiveis:

### Exemplo de pesquisa: 

```
get /api/v1/pay_methods

http://localhost:3000/api/v1/pay_methods
```

### *Exemplo de resultado:*

```JSON
[
  {
      "id":1,
  "name":"Cartão de Crédito",
  "tax":5,
  "limit_days":4
  },
    { 
    "id":2,
    "name":"Boleto",
    "tax":0,
    "limit_days":15
    }

   ...

]
```


- Disponibiliza as mensalidades por CPF:

### Exemplo de pesquisa: 

```
get "/api/v1/payments/**cpf**"

http://localhost:3000/api/v1/payments/123456
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


### Exemplo de pesquisa: 

```
{
get /api/v1/plans

http://localhost:3000/api/v1/plans
}
```

### *Exemplo de resultado:*

```json 
[
    {
        "id": 1,
        "name": "Paulista",
        "value": 40
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

```json
[
    {
        "id": 1,
        "name": "Paulista",
        "value": 40
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

```json
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

```json
[
    {
        "id": 1,
        "name": "boleto"
    }

```
- Lançar aulas avulsa 

```
    post '/api/v1/single_class'

    http://localhost:3000/api/v1/single_class

``` 
  Exemplo
  ```
   post '/api/v1/single_class', params: {single_class: 
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '123456'
    }
    }
  ```

### Resultado: