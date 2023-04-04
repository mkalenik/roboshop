class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :zip_code
      t.string :street
      t.string :email
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
