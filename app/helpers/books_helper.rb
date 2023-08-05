module BooksHelper
  def lending_status(book, current_user)
    lending = Lending.where('start_date <= ?', Date.today)
    .where('end_date >= ?', Date.today).find_by(book: book)
    
    if lending && current_user
      return '現在借りています'
    elsif lending
      return '貸し出し中'
    else return '貸出可能'
    end
  end
end