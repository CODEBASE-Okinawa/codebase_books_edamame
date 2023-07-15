10.times do |n| 
  Book.create(title: "TestBook#{n}", image_path: "testtest#{n}")
end