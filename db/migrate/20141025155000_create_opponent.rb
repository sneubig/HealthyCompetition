class CreateOpponent < ActiveRecord::Migration
  def change
    create_table :opponents do |t|
    	t.string :name
    	t.integer :rank
    	t.integer :score
    	t.string :photo_url
    	t.references :league
    end
  end
end
