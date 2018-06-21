class ApplicationController < ActionController::API

    def current_user
        Token.find_by(token: params[:authorization_token]).user
    end

    def authentificate
        token = Token.find_by(token: params[:authorization_token])
        render status: :unauthorized if token.nil?
    end
end
