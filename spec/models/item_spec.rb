require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  
  # describe '#truncate_price' do
  #   it 'should truncate price to 2 decimal places' do
  #     item = create(:item, price: 1.2345)
  #     expect(item.price).to eq(1.23)
  #   end
  # end
  
end
