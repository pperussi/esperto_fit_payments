# EspertoFit

## Sistema de Cobranças e Pagamentos

## Ruby version
2.6.4

## API
### Disponibiliza os metodos de pagamentos disponiveis:

get '/api/v1/pay_methods'

```
{
    http://localhost:3000/api/v1/pay_methods
}
```

```JSON
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
```


### Consultar todos os pagamentos para um determinado cpf:

get "/api/v1/payments/**cpf**"

```
{
    http://localhost:3000/api/v1/payments/123456
}
```

```JSON

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
### API recebe como notificação dados de uma nova matricula e gera mensalidades

 **POST** /api/v1/notifications/

 - Parametros para gerar os pagamentos
    ```json
    {
      "client": {
        "name": "Matilda chata",
        "cpf": "666666",
        "plan_id": 1,
        "unity_id": 1,
        "pay_method_id": 1
      }
    }
    ```

- Resultado
  ```json
  {
    "name": "Matilda chata",
    "cpf": "666666",
    "payments": [
      {
        "value": 167.38,
        "dt_venc": "2019-09-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-10-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-11-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2019-12-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-01-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-02-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-03-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-04-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-05-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-06-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-07-18",
        "status": "pending"
      },
      {
        "value": 167.38,
        "dt_venc": "2020-08-18",
        "status": "pending"
      }
    ]
  }
  ```

- Lançar aulas avulsa
# Listar todos os planos:
```
get "/api/v1/plans"

```
{
    http://localhost:3000/api/v1/plans
}
```

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

### Listar todas as unidades:

get "/api/v1/unity"

```
{
http://localhost:3000/api/v1/plans
}
```

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

### Informar matrícula para gerar os pagamentos da matrícula:

```
 post 'http://localhost:3000/api/v1/registrations', params: { name: 'Godofredo', 
 cpf: '123456', 
 unity_id: unity.id, 
 plan_id: plan.id, 
 pay_method_id: pay_method.id
 }
```

```
[
    {
        "id": 1,
        "name": "Godofredo",
        "cpf": "123456",
        "unity": "Paulista",
        "plan": "Executivo",
        pagamentos: [
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-10-19"
            }
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-11-19"
            }
            {
                "cpf": "123456",
                "status": "pending",
                "value": 40.0
                "dt_venc": "2019-12-19"
            }
            ...
        ]
    }
]
```




### Consultar metodo de pagamento pelo nome:

```
 get 'http://localhost:3000/api/v1/pay_methods', params: { name: 'Boleto'}
```

```
{
http://localhost:3000/api/v1/pay_methods?name=boleto
}
```

```
[
    {
        "id": 1,
        "name": "boleto"
    }
]

```

### Lançar aula avulsa 
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

### Banir usuario transformando suas faturas pendentes em canceladas

post "/api/v1/payments/ban" params: { cpf: '123456' }

```json
   {"msg": "CPF 123456 com todas as suas faturas canceladas"}
```