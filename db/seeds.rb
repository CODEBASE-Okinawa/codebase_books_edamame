3.times{|n| User.create!(mail: "test#{n}",name: "test#{n}",password: "test#{n}")}
3.times{|n| Book.create!(title: "book#{n}", image_name: "noImage.jpg")}
Book.create!(title: "ルビー入門", image_name: "rubybook.jpg")

Lending.create!(user_id: "1",book_id: "1",start_date: "Mon, 17 Jul 2023",end_date:"Tue, 25 Jul 2023")
Lending.create!(user_id: "2",book_id: "2",start_date: "Mon, 17 Jul 2023",end_date:"Tue, 25 Jul 2023")
Lending.create!(user_id: "1",book_id: "4",start_date: "Mon, 17 Jul 2023",end_date:"Tue, 25 Jul 2023")


