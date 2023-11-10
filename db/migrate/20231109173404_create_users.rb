class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps
    end

    if User.where(:name => 'admin').blank?
      user = User.new(:name => 'admin', :password => 'admin', :password_confirmation => 'admin')
      user.save
    end
  end
end
