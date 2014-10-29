class AddStepsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :steps, :integer
  end
end
