class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
    #add_indexはrailsのメソッドである
    #本来は add_index(:users, :email, {:unique=>true})

  end
end
