class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :private_message_recipients do |t|
    	t.belongs_to :private_message, index: true
    	t.references :recipient, index: true
      t.timestamps
    end
  end
end
