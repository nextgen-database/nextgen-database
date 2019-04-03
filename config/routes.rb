Rails.application.routes.draw do
  


    scope "(:locale)", locale: /en|de/ do
        root 'static_pages#home'
    end

    
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # Use the following resource to sort out routes
    # https://dhampik.com/blog/rails-routes-tricks-with-locales
    # 



end
