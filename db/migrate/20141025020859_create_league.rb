class CreateLeague < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
    	t.string :name
    	t.references :team
    	t.references :user
    end
  end
end
