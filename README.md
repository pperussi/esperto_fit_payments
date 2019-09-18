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

get "/api/v1/payments/**cpf**"

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
      {
         "value"    :40.0,
         "dt_venc"    :"2019-11-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2019-12-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-01-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-02-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-03-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-04-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-05-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-06-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-07-15",
         "status"    :"pending"
      },
      {
         "value"    :40.0,
         "dt_venc"    :"2020-08-15",
         "status"    :"pending"
      }
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
