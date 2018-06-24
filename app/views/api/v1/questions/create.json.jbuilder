if response.status == 201
    json.question @question
else
    json.array! @question.errors unless @question.nil?
end