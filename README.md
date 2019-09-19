# EspertoFit

## Sistema de Cobranças e Pagamentos

### Ruby version
2.6.4

### API
-Disponibiliza os metodos de pagamentos disponiveis:
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

### API Consultar todos os pagamentos para um determinado cpf

get "/api/v1/registrations/payments"

Exemplo:

http://localhost:3000/api/v1/registrations/payments?cpf=123456

get "/api/v1/registrations/payments", params: { registration: {cpf: '222'}}

Exemplo de resultado:
```json
[
   {
       "id": 1,
       "created_at": "2019-09-13T18:03:03.378Z",
       "updated_at": "2019-09-14T20:52:30.170Z",
       "value": 40.0,
       "dt_venc": "2019-09-13",
       "registration_id": 1,
       "pay_method_id": 1,
       "status": "unpaid"
   },
   {
       "id": 2,
       "created_at": "2019-09-13T18:03:03.428Z",
       "updated_at": "2019-09-14T20:53:59.633Z",
       "value": 40.0,
       "dt_venc": "2019-10-13",
       "registration_id": 1,
       "pay_method_id": 1,
       "status": "unpaid"
   },
….
]
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

# Lista um plano:

### **Exemplo:**
```

get "/api/v1/plans"

http://localhost:3000/api/v1/plans/ID


```
### Resultado:
```
{
    "id": 5,
    "name": "teste2",
    "value": 50.0
}
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
]


```

# Informar matrícula para gerar os pagamentos da matrícula:
```
 post 'http://localhost:3000/api/v1/registrations', params: { name: 'Godofredo', cpf: '123456', unity_id: unity.id, plan_id: plan.id, pay_method_id: pay_method.id}
```
### Resultado:

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
]

```

- Lançar aulas avulsa 

### **Exemplo:**
```
    post '/api/v1/single_class'

    http://localhost:3000/api/v1/single_class

```

### Resultado:

```
   post '/api/v1/single_class', params: {single_class: 
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '123456'
    }
 ```


# Criar novo cliente, com todos os pagamentos:

### **Exemplo:**

```
post 'http://localhost:3000/api/v1/registrations', params: { registration:{ plan_id: plan.id, unity_id: unity.id, name:'diogo', cpf: '1323', pay_method_id: pay_method.id}}

http://localhost:3000/api/v1/registrations?registration[name]=diiii&registration[cpf]=9876667&registration[unity_id]=1&registration[pay_method_id]=1&registration[plan_id]=1

```

### Resultado:

```
{
    "usuario": {
        "id": 5,
        "created_at": "2019-09-18T23:18:19.909Z",
        "updated_at": "2019-09-18T23:18:19.909Z",
        "name": "diiii",
        "cpf": "8",
        "unity_id": 1,
        "plan_id": 1,
        "pay_method_id": 1
    },
    "pagamentos": [
        {
            "id": 38,
            "created_at": "2019-09-18T23:18:19.959Z",
            "updated_at": "2019-09-18T23:18:19.959Z",
            "value": 40.0,
            "dt_venc": "2019-10-18",
            "registration_id": 5,
            "pay_method_id": 1,
            "status": "pending"
        },
        {
            "id": 39,
            "created_at": "2019-09-18T23:18:19.985Z",
            "updated_at": "2019-09-18T23:18:19.985Z",
            "value": 40.0,
            "dt_venc": "2019-11-18",
            "registration_id": 5,
            "pay_method_id": 1,
            "status": "pending"
        },

        ...
    ]
}
```


# Criar novo plano:



### **Exemplo:**

```
post 'http://localhost:3000/api/v1/plans', params: { plan:{ name: 'Executivo', value: 40}}

http://localhost:3000/api/v1/plans?plan[name]=teste2&plan[value]=50

curl -d "plan[name]=teste3&plan[value]=20" -X POST http://localhost:3000/api/v1/plans

```

### Resultado:

```
{
    "id": 5,
    "name": "teste2",
    "value": 50.0
}
```

# Criar nova unidade:


### **Exemplo:**

```
post 'http://localhost:3000/api/v1/unity', params: { unity: { name: 'Paulista' }}


http://localhost:3000/api/v1/unity?unity[name]=Augusta

```

### Resultado:

```

{
    "id": 2,
    "name": "Augusta",
    "created_at": "2019-09-19T00:17:24.513Z",
    "updated_at": "2019-09-19T00:17:24.513Z"
}

```


# Criar novo metodo de pagamento:


### **Exemplo:**

```json
post 'http://localhost:3000/api/v1/pay_methods', params: { pay_method: { name: 'Boleto', tax: 1, limit_days: 15}}

http://localhost:3000/api/v1/pay_methods?pay_method[name]=Bit&pay_method[tax]=1&pay_method[limit_days]=1

```

### Resultado:

```json

{
    "id": 2,
    "name": "Bit",
    "created_at": "2019-09-19T00:20:52.073Z",
    "updated_at": "2019-09-19T00:20:52.073Z",
    "tax": 1.0,
    "limit_days": 1
}

```

- Banir usuario transformando suas faturas pendentes em canceladas

```json
post "/api/v1/payments/ban" params: { cpf: '123456' }
```

```json
   {"msg": "CPF 123456 com todas as suas faturas canceladas"}
```
