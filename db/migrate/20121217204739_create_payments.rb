class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :country
      t.string :email_address
      t.string :confirm_email
      t.string :card_type
      t.integer :card_number
      t.string :expire_date
      t.integer :cvc_number

      t.timestamps
    end
  end
end
