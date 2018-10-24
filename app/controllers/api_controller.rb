class ApiController < ApplicationController
    def home

      client = OAuth2::Client.new(Rails.application.secrets.client_id, Rails.application.secrets.client_password, site: 'https://login.microsoftonline.com',:authorize_url => '/common/oauth2/v2.0/authorize',:token_url => '/common/oauth2/v2.0/token')

        login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => 'openid offline_access')
        render json: {url: login_url}
    end

    def edit
        if token.expired?
            new_token = token.refresh!
            access_token = new_token.token
        else
            access_token = token.token
        end

    end

    def get_token_from_code(auth_code)
        client = OAuth2::Client.new(CLIENT_ID,
                CLIENT_SECRET,
                :site => 'https://login.microsoftonline.com',
                :authorize_url => '/common/oauth2/v2.0/authorize',
                :token_url => '/common/oauth2/v2.0/token')

        token = client.auth_code.get_token(auth_code,
                :redirect_uri => authorize_url,
                :scope => SCOPES.join(' '))
    end

    def index
        render json: {url: params[:code]}
    end

    def gettoken
        token = get_token_from_code params[:code]
        render text: "TOKEN: #{token.token}"
    end

    def refresh_token
        if token.expired?
            new_token = token.refresh!
            access_token = new_token.token
        else
            access_token = token.token
        end
    end
    def add
        client = OAuth2::Client.new(CLIENT_ID,
                CLIENT_SECRET,
                :site => 'https://login.microsoftonline.com',
                :authorize_url => '/common/oauth2/v2.0/authorize',
    end
    
end
