if response.status == 201
    json.answer @answer
else
    byebug
    json.array! @answer.errors unless @answer.nil?
end