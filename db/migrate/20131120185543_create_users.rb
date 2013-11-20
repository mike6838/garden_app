class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :email
    	t.string :name_first
    	t.string :name_last


    	t.integer :zipcode

      t.timestamps
    end
  end
end
