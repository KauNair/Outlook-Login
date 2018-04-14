class ApiController < ApplicationController
    def home
      client = OAuth2::Client.new(Rails.application.secrets.client_id, Rails.application.secrets.client_password)
        login_url = client.auth_code.authorize_url(:redirect_uri => 'https://www.reddit.com', :scope => 'openid')
        render json: {url: login_url}
    end

    def index
        render json: {url: params[:code]}
    end
end
