class ChangeContentFromStringToText < ActiveRecord::Migration[7.0]
  def change
    change_column :post, :content, :text
    change_column :post, :content, :text
  end
end
