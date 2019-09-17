require 'rails_helper'

describe 'receive single class' do
  it 'succesfully' do
    registration = create(:registration, name: 'Henrique')
    registration.generate_anual_payments

    post '/api/v1/single_class', params: {single_class: 
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '123456'
       } }

    expect(response).to have_http_status(:created)
    expect(registration.payments.find_by(status: 'pending').value).to eq 140
  end
  
  it 'not found' do
    post '/api/v1/single_class', params: {single_class: 
    { name: 'Boxe',
      unit: 'Paulista',
      date: '2019-09-17',
      price: 100,
      cpf: '0987654'
       } }

    expect(response).to have_http_status(:not_found)
  end
end