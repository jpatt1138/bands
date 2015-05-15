class InitialTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:venues) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
  end
end
