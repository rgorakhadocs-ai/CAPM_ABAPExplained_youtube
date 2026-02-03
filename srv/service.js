const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class BookstoreService extends cds.ApplicationService {
  init() {

    const { Books, Authors, Genre, BookStatus, Chapters } = cds.entities('BookstoreService')

    this.on('addStock', 'Books', async (req) => {
      const bookId = req.params[0].ID;
      await UPDATE(Books).set({ stock: { '+=': 1 } }).where({ ID: bookId });

    })

    this.on('changePublishDate', 'Books', async (req) => {
      const bookId = req.params[0].ID;
      const newDate = req.data.newDate;
      await UPDATE(Books).set({ publishedAt: newDate }).where({ ID: bookId });

    })

    this.on('changeStatus', 'Books', async (req) => {
      const bookId = req.params[0].ID;
      const newStatus = req.data.newStatus;
      await UPDATE(Books).set({ status_code: newStatus }).where({ ID: bookId });

    })

    this.on('addDiscount', async (req) => {

      await UPDATE(Books).set({
        price: {
          func: 'ROUND',
          args: [{
            xpr: [{ ref: ['price'] }, '*',
            { val: 0.9 }]
          },
          { val: 2 }]
        }
      })

    })

    this.after('READ', Books, async (books, req) => {
      // console.log('Before CREATE/UPDATE Books', books)
      for (const book of books) {
        if (book.genre_code === 'Art') {
          book.price = book.price * 0.9;
          book.title = 'Discount added'
        }
      }
    })

    this.after('READ', Authors, async (authors, req) => {
      const ids = authors.map(author => author.ID)
      const bookCounts = await SELECT.from(Books)
        .columns('author_ID', { func: 'count' })
        .where({ author_ID: { in: ids } })
        .groupBy('author_ID');
      for (const author of authors) {
        const bookCount = bookCounts.find(bookCount => bookCount.author_ID = author.ID)
        author.bookCount = bookCount.count
      }
    })


    return super.init()
  }
}
