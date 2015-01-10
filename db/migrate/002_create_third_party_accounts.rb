class CreateThirdPartyAccounts < ActiveRecord::Migration

  def self.up
    create_table :third_party_accounts do |t|
      t.integer :user_id
      t.string  :service
      t.string  :token
      t.timestamps
    end
  end

  def self.down
    drop_table :third_party_accounts
  end

end
