class AddChannelToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :channel, index: true, foreign_key: true
  end
end
