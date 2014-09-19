class CreateTiansenWebsite < ActiveRecord::Migration
  def up
    create_table :categories, :force => true do |t|
      t.string :name
      t.references :company
      t.references :user
      t.string :categoryable_type
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :categories, :user_id
    add_index :categories, :company_id
    add_index :categories, :categoryable_type
    
    create_table :news, :force => true do |t|
      t.references :company
      t.references :user
      t.references :category
      t.string :title
      t.string :sub_title
      t.datetime :published_at
      t.text :content
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :news, :user_id
    add_index :news, :company_id
    
    create_table :products, :force =>true do |t|
      t.string :name
      t.references :company
      t.references :user
      t.references :category
      t.string :model
      t.string :price
      t.string :description
      t.string :pic_path
      t.text :content
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :products, :user_id
    add_index :products, :company_id
    
    create_table :feedbacks, :force => true do |t|
      t.references :company
      t.string :name
      t.string :tel
      t.string :qq
      t.string :title
      t.string :content
      t.string :ip
      t.string :ua
      t.integer :flag, :default => 0
      t.timestamps
    end
    add_index :feedbacks, :company_id
    
    create_table :pages, :force => true do |t|
      t.references :company
      t.references :user
      t.string :title
      t.string :permalink
      t.text :content
      t.timestamps
    end
    add_index :pages, :company_id
    add_index :pages, :user_id
    
  end

  def down
    drop_table :categories
    drop_table :news
    drop_table :products
    drop_table :feedbacks
    drop_table :pages
  end
end
