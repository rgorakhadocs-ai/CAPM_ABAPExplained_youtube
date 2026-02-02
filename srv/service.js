const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class BookstoreService extends cds.ApplicationService {
  init() {

    const { Books, Authors, Genre, BookStatus, Chapters } = cds.entities('BookstoreService')

    this.on('addStock','Books', async (req)=>{
        const bookId = req.params[0].ID;
        await UPDATE(Books).set({stock : {'+=' : 1}}).where({ID:bookId});

    })

     this.on('changePublishDate','Books', async (req)=>{
        const bookId = req.params[0].ID;
        const newDate = req.data.newDate;
        await UPDATE(Books).set({publishedAt : newDate}).where({ID:bookId});

    })

    this.on('changeStatus','Books', async (req)=>{
        const bookId = req.params[0].ID;
        const newStatus = req.data.newStatus;
        await UPDATE(Books).set({status_code : newStatus}).where({ID:bookId});

    })

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
