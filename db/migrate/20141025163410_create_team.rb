class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :rank
    end
  end
end
