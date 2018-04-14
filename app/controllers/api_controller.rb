class ApiController < ApplicationController
  def home
     client = OAuth2::Client.new('6040cdaf-7071-4959-851d-e6862834f886',
                                'sjgUCUEZOY8763@fmlg2+|%',
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')
     login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => 'openid')
    render json: {url: login_url}
  end

  def index
    render json: {url: params[:code]}
  end
end
