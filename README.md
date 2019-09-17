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