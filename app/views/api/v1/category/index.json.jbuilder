if response.status == 200
    json.array! @categories do |category|
        json.id category.id
        json.title category.title
    end
else
    json.array! @answer.errors
end