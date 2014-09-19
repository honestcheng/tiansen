Tiansen::Application.routes.draw do
  devise_for :users, :path => "account" , :controllers => {:sessions => "sessions"}
  
  namespace :admin do
    root :to => 'home#index'
    
    get 'company/edit' => 'companies#edit'
    put 'company/edit' => 'companies#update'
    
    resources :news
    resources :products
    resources :feedbacks
    resources :pages
  end
  
  #ugly routes
  get "admin/categories/t/:category_type" => 'admin/categories#index', :as => "admin_categories"
  get "admin/categories/t/:category_type/new" => 'admin/categories#new', :as => "new_admin_category"
  post "admin/categories/t/:category_type/" => 'admin/categories#create'
  get "admin/categories/t/:category_type/:id/edit" => 'admin/categories#edit', :as => "edit_admin_category"
  put "admin/categories/t/:category_type/:id" => 'admin/categories#update'
  delete "admin/categories/t/:category_type/:id" => 'admin/categories#destroy'
  get "admin/categories/t/:category_type/:id" => 'admin/categories#show', :as => "show_admin_category"
  
  get "/p/:permalink" => "pages#show", :as => "show_company_page"
  
  get "products" => "products#index"
  get "categories/:category_id/products" => "products#index", :as => "category_products"
  get "products/:id" => "products#show"
  get "news" => "news#index"
  get "news/:id" => "news#show"
  root :to => 'home#index'
end
