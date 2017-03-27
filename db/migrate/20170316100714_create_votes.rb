class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.integer :user_id, :null => false
      #instead of voting being boolean, I'll make integer instead
     # t.boolean :up_down
      t.integer :up_down, :null => false
      t.references :voteable, polymorphic: true, index: true
    end
  end
end
