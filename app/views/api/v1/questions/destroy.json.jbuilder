if response.status == 200
    
else
    json.array! @question.errors unless @question.nil?
end