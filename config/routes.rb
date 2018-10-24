Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    scope :v1 do
      get '/' ,to: 'api#home'
      get '/edit', to:'api#edit'
      get '/add', to:'api#add'
    end
  end

  get '/authorize', to: 'api#index', as: 'authorize'
end
