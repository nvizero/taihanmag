Rails.application.routes.draw do
  post '/tinymce_assets' => 'tinymce_assets#create'
  resources :bills
  resources :codata
  resources :basedatas
  resources :saves
  resources :announces
  resources :events
  resources :activities
  # 活動報名，多的欄位
  post "store_TableRef" , :to =>"activities#store_TableRef"
  # 活動報名，
  get '/activities_detial(/:id)' , :to => "activities#activities_detial"
  get '/activities_detial' , :to => "activities#activities_detial"
  # 活動報名，excel
  #活動報名

  get 'del_activities' , :to => "activities#del_activities"
  get '/activities_success' , :to => "activities#activities_success"
  get '/activities_fail' , :to => "activities#activities_fail"
  #活動報名
  # get 'excel', :to => "activities#excel"
  get '/excel', :to => "activities#excel"
  get '/cate_about', :to => "cates#cate_about"


  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'

  get 'resumes/destroy'

  get 'attachments/:id'  => 'resumes#download'


  # get '*anything' => 'errors#routing_error'

  resources :footers
  mount Ckeditor::Engine => '/ckeditor'
  resources :cates
  resources :msgs
  # devise_for :users
  get '/user_list' , :to => "member#index"
  get '/user_create' , :to => "member#user_create"
  post "/member_create", :to => "member#member_create"
  get '/edit_service' , :to => "footers#edit_service"
  get '/edit_slug' , :to => "footers#edit_slug"
  get '/edit_aboutus' , :to => "footers#edit_aboutus"
  get "/edit_company/:id" => 'footers#edit_company'
  get "/about_company/:id" => 'home#about_company'
  get 'glossary' =>"home#glossary"
  get 'get_lng', :to => "home#get_lng"

  #home
  get '/' , :to => "home#index"
  get '/index' , :to => "home#index"
  get '/index2' , :to => "home#index2"

  get '/download' , :to => "home#download"
  get '/signup(/:id)' , :to => "home#signup"
  get '/news(/:cate_id)' , :to => "home#news"
  get '/news2(/:id)' , :to => "home#news2"
  get '/class_list', :to => "home#class_list"
  get '/service' , :to => "home#service"
  get '/contact' , :to => "home#contact"
  get '/about' , :to => "home#about"
  get '/event' , :to => "home#event"


  #json
  # get 'index_pm_json' ,:to => "home#index_pm_json"
  # get 'buttom_left_json' ,:to => "home#buttom_left_json"
  # get 'buttom_right_json' ,:to => "home#buttom_right_json"


  get 'safety_advice', :to => "home#safety_advice"
  #news
  get '/annos'     , :to => "home#annos"
  get '/anno'      , :to => "home#anno"

  #Application
  get '/application_main'     , :to => "home#application_main"
  get '/application_sub'     , :to => "home#application_sub"
  get '/application(/:id)'    , :to => "home#application"

  #產業
  get '/solutions_main'    , :to => "home#solutions_main"
  get '/solutions'    , :to => "home#solutions"
  #Company
  get '/company'    , :to => "home#company"
  get '/magnetism'    , :to => "home#magnetism"
  get '/magnetism2'    , :to => "home#magnetism2"

  #ajax
  post "ajax_msgs" , :to => "msgs#ajax_msgs"

  post "search" , :to => "home#search"
  post "/submit_signup" , :to => "home#submit_signup"
  post "/contact_submit" ,:to => "home#contact_submit"



  post "del_something" , :to =>"ajx#del_something"
  resources :products


  devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root "home#index"


  # CarrierWaveExample::Application.routes.draw do
  resources :bills
  resources :codata
  resources :bases
  resources :saves
  resources :announces
  resources :events
  # test
  get '/parse_xml' , :to => "home#parse_xml"
  get '/parse_xml2' , :to => "home#parse_xml2"
  # test
  resources :resumes, only: [:index, :new, :create, :destroy]
  #    root "resumes#index"
  # end

  # unless Rails.application.config.consider_all_requests_local
  #   # having created corresponding controller and action
  #   get '*not_found', to: 'errors#error_404'
  # end

  get 'aphp' ,:to => "home#aphp"

  namespace :api do
    namespace :v1 do
     resources :fruits, only: [:index, :create, :destroy, :update]
    end
  end


end
