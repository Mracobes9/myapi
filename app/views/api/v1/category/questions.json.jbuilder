json.array! @questions do |question|
    json.id question.id
    json.title question.title
    json.desc question.desc
    json.isopen question.isopen
end
