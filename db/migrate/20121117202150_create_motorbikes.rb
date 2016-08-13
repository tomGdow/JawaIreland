class CreateMotorbikes < ActiveRecord::Migration
  def change
    create_table :motorbikes do |t|
      t.string :make
      t.string :model
      t.string :category
      t.integer :year
      t.integer :mileage
      t.text :description
      t.integer :engineSize
      t.string :image
      t.float :price

      t.timestamps
    end
  end
end
