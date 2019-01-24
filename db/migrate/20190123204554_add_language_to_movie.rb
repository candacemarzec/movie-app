class AddLanguageToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :english, :boolean, default: true
  end
end
