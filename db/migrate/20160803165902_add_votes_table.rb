class AddVotesTable < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.string  :vote_type
      t.integer :vote_id

      t.timestamps
    end
  end
end
