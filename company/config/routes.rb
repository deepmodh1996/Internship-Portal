Rails.application.routes.draw do
	
  # match ':controller(/:action(/:id))', :via => :get

  get "sessions/new"
  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "students#new", :as => "sign_up"
  root :to => "sessions#new"
  # You can have the root of your site routed with "root"
   resources :students do
      resources :verifications
      resources :reviews
      member do
      get 'verify', :action => 'verify'
      get 'upload', :action => 'upload'
      end
    end

  get "students/:id/show_student_iaf" => "students#show_student_iaf", :as => "student_iafs"
  get "students/:id/show_iafs" => "students#show_iafs", :as => "student_all_iafs"
  get "students/:id/sign_iaf" => "students#sign_iaf", :as => "sign_iaf"
  get "students/:id/unsign_iaf" => "students#unsign_iaf", :as => "unsign_iaf"
  get "company_informations/:company_information_id/iafs/:id/shortlist" => "iafs#shortlist", :as => "shortlist"
  get "company_informations/:company_information_id/iafs/:id/select_student" => "iafs#select_student", :as => "select_student"
  get "company_informations/:company_information_id/iafs/:id/unselect_student" => "iafs#unselect_student", :as => "unselect_student"
  get "students/:id/verify_confirm" => "students#verify_confirm", :as => "confirm_student"
  get "company_informations/:company_information_id/iafs/:id/freeze_shortlist" => "iafs#freeze_shortlist", :as => "freeze_shortlist"
 
resources :sessions
  resources :company_informations	do
  	resources :iafs
  end
  # resources :iafs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
