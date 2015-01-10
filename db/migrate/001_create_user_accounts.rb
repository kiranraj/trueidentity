class CreateUserAccounts < ActiveRecord::Migration
  def self.up
    create_table :user_accounts do |t|
      t.string :name, :null => false
      t.string :adhar_uuid, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :user_accounts
  end
end
