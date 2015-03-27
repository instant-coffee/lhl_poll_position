class CreateDb < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :author
      t.string :title
      t.string :description
      t.integer :votes
    end

    create_table :students do |t|
      t.string :name
      t.integer :idea_id
    end

    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end
end