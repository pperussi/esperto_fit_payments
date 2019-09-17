# EspertoFit

## Sistema de Cobranças e Pagamentos

### Ruby version
2.6.4

### API

Acessa métodos de pagamento:
- **GET** /api/v1/pay_methods

  returns:
  ```JSON
  [{"id":1,"name":"Cartão de Crédito","created_at":"2019-09-15T23:41:51.236Z","updated_at":"2019-09-15T23:41:51.236Z","tax":5,"limit_days":4},
   {"id":2,"name":"Boleto","created_at":"2019-09-15T23:43:52.226Z","updated_at":"2019-09-15T23:43:52.226Z","tax":0,"limit_days":15}]
  ```
