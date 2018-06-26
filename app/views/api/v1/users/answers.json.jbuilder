json.array! @answers do |answer|
    json.id answer.id
    json.text answer.text
    json.best answer.best
    json.question_id answer.question_id
end