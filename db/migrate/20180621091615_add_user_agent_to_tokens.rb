class AddUserAgentToTokens < ActiveRecord::Migration[5.2]
  def change
    add_column :tokens, :user_agent, :string
  end
end
