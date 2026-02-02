const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService {
  init() {

    const { Books, Authors, Genre, BookStatus, Chapters } = cds.entities('BookstoreService')

    this.after('READ', Books, async (books, req) => {
      // console.log('Before CREATE/UPDATE Books', books)
      for(const book of books){
        if(book.genre_code === 'Art'){
          book.price = book.price * 0.9;
          book.title = 'Discount added'
        }
      }
    })


    return super.init()
  }
}
