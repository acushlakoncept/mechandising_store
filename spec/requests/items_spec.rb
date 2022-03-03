# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :request do
  # initialize test data
  let!(:item1) { Item.create!(code: 'MUG', name: 'Reedsy Mug', price: 6.00) }
  let!(:item2) { Item.create!(code: 'TSHIRT', name: 'Reedsy T-shirt', price: 15.00) }
  let!(:item3) { Item.create!(code: 'HOODIE', name: 'Reedsy Hoodie', price: 20.00) }

  # Test suite for GET /items
  describe 'GET /items' do
    before { get '/api/v1/items' }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for PUT item price update /items/:id
  describe 'PUT /items/:id' do
    let(:valid_attributes) { { price: 9.99 } }

    context 'when the record exists' do
      before { put "/api/v1/items/#{item1.id}", params: valid_attributes }

      it 'updates the price' do
        expect(response.body).to include('Item price updated')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /check_price
  describe 'POST /check_price' do
    let(:valid_attributes) { { items_code: 'MUG, TSHIRT, MUG' } }
    let(:valid_attributes2) { { items_code: 'MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE' } }

    context 'total price for MUG, TSHIRT, MUG' do
      before { post '/api/v1/items/check_price', params: valid_attributes }

      it 'returns the total price of items' do
        expect(json).not_to be_empty
        expect(response.body).to include('27.00€')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'total price for MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE' do
      before { post '/api/v1/items/check_price', params: valid_attributes2 }

      it 'returns the total price of items' do
        expect(json).not_to be_empty
        expect(response.body).to include('92.00€')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /apply_discount
  describe 'POST /apply_discount' do
    let(:valid_attributes) { { items_code: 'MUG, TSHIRT, MUG, MUG, MUG' } }
    let(:valid_attributes2) { { items_code: 'MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE' } }

    context 'total price for MUG, TSHIRT, MUG, MUG, MUG' do
      before { post '/api/v1/items/apply_discount', params: valid_attributes }

      it 'returns the total price of items' do
        expect(json).not_to be_empty
        expect(response.body).to include('33.00€')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'total price for MUG, TSHIRT, TSHIRT, TSHIRT, TSHIRT, MUG, HOODIE' do
      before { post '/api/v1/items/apply_discount', params: valid_attributes2 }

      it 'returns the total price of items' do
        expect(json).not_to be_empty
        expect(response.body).to include('68.00€')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
