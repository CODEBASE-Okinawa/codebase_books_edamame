10.times do |n| 
  Book.create(title: "TestBook#{n}", image_name: "noImage.png#{n}")
end