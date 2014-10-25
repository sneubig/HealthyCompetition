class AddOpponentToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :opponent, :string
  end
end
