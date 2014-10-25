class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.integer :steps
    end
  end
end
