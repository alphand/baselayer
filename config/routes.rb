require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  namespace :api, default:{format: :json},
    constraints:{subdomain: 'api'},
    path:'/' do
        scope module: :v1 do

        end
    end
end
