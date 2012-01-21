class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    create_table :things do |t|
      t.string :name

      t.timestamps
    end

    create_table :user_following_thing_relationships do |t|
      t.integer :user_id
      t.integer :thing_id

      t.timestamps
    end

  end
end
