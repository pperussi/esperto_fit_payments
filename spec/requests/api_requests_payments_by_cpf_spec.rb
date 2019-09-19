require 'rails_helper'

describe 'Api requests all payments details for one client' do
  it 'successfully' do
    registration = create(:registration, cpf: '222')
    registration.generate_anual_payments

    get '/api/v1/registrations/payments', params: { cpf: '222' }

    expect(response.status).to eq 200
    expect(response.body).to include 'registration_id'
    expect(response.body).to include 'status'
    expect(response.body).to include 'value'
  end

  it 'search by invalid cpf' do
    get '/api/v1/registrations/payments/', params: { cpf: '100' }

    expect(response.status).to eq 404
  end
end