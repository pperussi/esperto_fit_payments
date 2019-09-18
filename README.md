# README

## API

# Consultar todos os pagamentos para um determinado cpf:

```
get "/api/v1/payments/**cpf**"
```

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