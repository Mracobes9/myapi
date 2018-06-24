if response.status == 201
    json.email @user.email
    json.token = @user.tokens.first.token
else
    json.array! @user.errors
end