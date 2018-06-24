if response.status == 200
    json.authorization_token @user.tokens.find_by(user_agent: request.user_agent).token
else
    json.errors @user.errors
end