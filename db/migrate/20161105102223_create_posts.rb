class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references  :user, default: 0, unsigned: true, null: false, index: true
      t.string :body, limit: 255

      t.timestamps
    end
  end
end
