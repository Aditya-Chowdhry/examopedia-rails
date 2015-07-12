Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :exams 
  root 'exams#index'
  resources :notifications
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # ----------------------------------  API ROUTES ----------------------------------------------- #
  # http://collectiveidea.com/blog/archives/2013/06/13/building-awesome-rails-apis-part-1/
  # Now our URls look like: http://api.example.com/v1/people or just http://api.example.com/people 
  # if you don’t use the version, it doesn’t interfere with your regular people routes, and it looks great.
  namespace :api, :path => "", :constraints => {:subdomain => "api"}, defaults: {format: 'json'} do
    namespace :v1 do
      resources :exams do
        resources :notifications
      end
    end
  end
  
  # ---------------------------------------------------------------------------------------------- #
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
