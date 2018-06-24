if response.status == 201
    json.answer @answer
else
    json.array! @answer.errors unless @answer.nil?
end