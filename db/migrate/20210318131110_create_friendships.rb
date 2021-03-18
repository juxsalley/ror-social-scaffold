class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :sender, foreign_key: { to_table: :users}
      t.references :receiver, foreign_key:  { to_table: :users}
      t.boolean :confirmed, :default => false
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
