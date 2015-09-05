class AddKeywordsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :keywords, :text
  end
end
