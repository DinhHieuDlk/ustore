class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :phone_number
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :ship_to_address
      t.string :ship_to_city
      t.string :ship_to_postal_code
      t.string :ship_to_country
      t.string :customer_ip
      t.string :status
      t.string :card_type
      t.string :card_number
      t.datetime :card_expiration
      t.string :card_verification_value
      t.timestamps null: false
    end
  end
end