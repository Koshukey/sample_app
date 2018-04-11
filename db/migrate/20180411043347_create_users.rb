class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
      #これによりcreate_atとupdated_atカラム が作られる
    end
  end
end
