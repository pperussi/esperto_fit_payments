# README

## API

# Consultar todos os pagamentos para um determinado cpf:

# get "/api/v1/registrations/payments"

### **Exemplo:**

```
{
http://localhost:3000/api/v1/registrations/payments?cpf=123456
}
```

### **Exemplo de parâmetros:**
```
{
get "/api/v1/registrations/payments", params: { registration: {cpf: '222'}}
}
```

### *Exemplo de resultado:*

```
{
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
}
```