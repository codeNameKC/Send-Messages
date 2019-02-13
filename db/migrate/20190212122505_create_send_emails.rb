class CreateSendEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :send_emails do |t|
      t.string :Email
      t.string :Message

      t.timestamps
    end
  end
end
