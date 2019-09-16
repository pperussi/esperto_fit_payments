# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### API mostra o historico de mensalidades

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