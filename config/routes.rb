Rails.application.routes.draw do

  get 'blog', to: 'posts#index', as: 'blog'
  get 'blog/:id', to: 'posts#show', as: 'post'

  resources :photos

  get 'account', to: 'account#index', as: 'account'
  devise_for :users, :path_names => {:sign_in => 'signin', :sign_up => 'register', :sign_out => 'logout'},
             :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :credit_cards, path: '/payments'
  get 'pricing', to: 'home#pricing', as: 'pricing'
  get 'plans/pro', to: 'plans#pro', as: 'pro_plan'
  get 'plans/pro-lifetime', to: 'plans#lifetime_pro', as: 'lifetime_pro'

  get 'admin', to: 'admin#index', as: 'admin'
  get 'privacy', to: 'home#privacy', as: 'privacy'
  get 'terms', to: 'home#terms', as: 'terms'
  get 'home/index'
  root to: 'home#index'

  scope module: 'admin', path: '/admin' do
    resources :posts, as: 'admin_posts'
  end

end
