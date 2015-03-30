class AddFinalToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :final, :boolean, default: false
  end
end