if response.status == 200
    json.answer @answer
else
    json.array! @answer.errors unless @answer.nil?
end