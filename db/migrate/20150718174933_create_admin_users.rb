class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :email ,null:false

      t.timestamps null: false
    end
  end
end
