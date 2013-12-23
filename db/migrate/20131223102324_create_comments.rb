class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.string :author_ip
      t.references :post, index: true

      t.timestamps
    end
  end
end
