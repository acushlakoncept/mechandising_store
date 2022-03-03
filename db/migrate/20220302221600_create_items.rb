class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :uuid do |t|
      t.string :code
      t.string :name
      t.float  :price, scale: 2
      t.string :currency, default: '€'

      t.timestamps
    end
  end
end
