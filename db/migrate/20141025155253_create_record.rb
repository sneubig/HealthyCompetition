class CreateRecord < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.integer :win
    	t.integer :loss
    	t.integer :tie
    end
  end
end
