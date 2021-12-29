class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
