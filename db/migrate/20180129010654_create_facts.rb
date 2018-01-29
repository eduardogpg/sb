class CreateFacts < ActiveRecord::Migration[5.1]
  def change
    create_table :facts do |t|
      t.string :title, limit: 50
      t.string :description, limit: 250
      t.boolean :real, defautl:true
      t.string :color
      t.string :code
      t.string :resource

      t.timestamps
    end
  end
end
