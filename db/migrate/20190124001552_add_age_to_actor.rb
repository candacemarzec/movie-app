class AddAgeToActor < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :age, :integer
  end
end
