# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
Book.destroy_all

bukowski = Author.create(name: 'Charles Bukowski', rating: 8, alive: false)
bukowski.books.create(name: 'Ham on Rye', pages: 256, fiction: false)
bukowski.books.create(name: 'Love is a Dog from Hell', pages: 157, fiction: true)
bukowski.books.create(name: 'Post Office', pages: 201, fiction: false)
bukowski.books.create(name: 'Pulp', pages: 304, fiction: true)

nabokov = Author.create(name: 'Vladmir Nabokov', rating: 10, alive: false)
nabokov.books.create(name: 'Pale Fire', pages: 344, fiction: true)
nabokov.books.create(name: 'Lolita', pages: 566, fiction: true)
nabokov.books.create(name: 'Lectures on Russian Literature', pages: 432, fiction: false)
nabokov.books.create(name: 'Pnin', pages: 478, fiction: true)

twain = Author.create(name: 'Mark Twain', rating: 9, alive: false)
twain.books.create(name: 'The Adventures of Tom Sawyer', pages: 286, fiction: true)
twain.books.create(name: 'Adventures of Huckleberry Finn', pages: 307, fiction: true)
twain.books.create(name: 'Mark Twains own Auto-Biography', pages: 567, fiction: false)
twain.books.create(name: 'Roughing It', pages: 425, fiction: true)

plato = Author.create(name: 'Plato', rating: 8, alive: false)
plato.books.create(name: 'Republic', pages: 524, fiction: false)
plato.books.create(name: 'The Symposium', pages: 203, fiction: false)
plato.books.create(name: 'Apology', pages: 87, fiction: false)


dostoyevsky = Author.create(name: 'Fyoder Dostoyevsky', rating: 10, alive: false)
dostoyevsky.books.create(name: 'The Brothers Karamozov', pages: 654, fiction: true)
dostoyevsky.books.create(name: 'Crime and Punishment', pages: 758, fiction: true)
dostoyevsky.books.create(name: 'The Idiot', pages: 608, fiction: true)
dostoyevsky.books.create(name: 'Notes from the Underground', pages: 213, fiction: true)
    