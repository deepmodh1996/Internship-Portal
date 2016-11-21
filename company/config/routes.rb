Rails.application.routes.draw do
  resources :company_informations	do
  	resources :iafs
  end
  # resources :iafs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
