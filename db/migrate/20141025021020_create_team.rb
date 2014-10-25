class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :rank
    	t.integer :score
    	t.string :photo_url
    	t.references :league
    end
  end
end
