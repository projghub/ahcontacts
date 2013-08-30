module ApplicationHelper
  def full_title(page_title)
    page_title.empty? ? APPLICATION_NAME : page_title
  end
end

def tag_cloud(tags, classes)
  max = 0
  tags.each do |t|
    if t.count.to_i > max
      max = t.count.to_i
    end
  end
  tags.each do |tag|
    index = tag.count.to_f / max * (classes.size - 1)
    yield(tag, classes[index.round])
  end
end
