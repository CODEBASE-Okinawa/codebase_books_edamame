start_date_range = Date.new(2023, 6, 1)..Date.new(2023, 8, 15)
3.times{|n| User.create!(name: "test#{n}")}
3.times{|n| Book.create!(title: "book#{n}", image_name: "noImage.jpg")}

start_date = start_date_range.to_a.sample
end_date = start_date + 7

User.all.each do |user|
  Book.all.each do |book|
    user.lendings.create!(book: book, start_date: start_date, end_date: end_date)
  end
end
