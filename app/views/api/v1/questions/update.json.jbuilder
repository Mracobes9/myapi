if response.status == 200
    json.question @question
else
    json.array! @question.errors unless @question.nil? 
end