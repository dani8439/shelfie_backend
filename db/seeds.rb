# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


book1 = Book.create(title: "Stardust", author: "Neil Gaiman", summary: "Boy travels beyond wall, meets captive princess, twenty-odd years later, their son tries to make his way back to her, and ends up knocking a star from the sky, named Ygrainne. Pirates, murderous princes, and hijinks ensue.")
book2 = Book.create(title: "Outlander", author: "Diana Gabaldon", summary: "WWII nurse travels back through stones to eighteenth-century Scotland, falls in love with outlaw Highlander, James Fraser.")
book3 = Book.create(title: "The Perfect Gentleman", author: "M.C. Beaton", summary: "Lord Andrew falls in love with his mothers protogee, Penelope, who is as blind as a bat. Many misunderstandings, and the Duchess is insane, and tries to kidnap Penelope when she refuses to bend to her will.")
book4 = Book.create(title: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams", summary: "Arthur Dent explores the universe after the world is destroyed to make room for a super highway." )
book5 = Book.create(title: "The Sunne in Splendour", author: "Sharon Kay Penman", summary: "The life of Richard III and the last of the Plantagenets until the battle of Bosworth Field.")


quote1 = Quote.create(quote: "A philosopher once asked, 'Are we human because we gaze at the stars, or do we gaze at them because we are human?' Pointless, really...'Do the stars gaze back?' Now, that's a question.", book_id: book1.id)
quote2 = Quote.create(quote: "'Where did you learn to kiss like that?' I said, a little breathless. He grinned and pulled me close again. 'I said I was a virgin, not a monk,' he said, kissing me again. 'If I find I need guidance, I’ll ask.'", book_id: book2.id)
quote3 = Quote.create(quote: "Miss Mortimer’s one remaining servant introduced the duchess, who sailed in like a galleon. The duchess was almost as tall as Lord Andrew, but a liking for food had given her a massive figure, which she tried to reduce by wearing sturdy whalebone corsets. She had a small head and small hands and feet. Her massive figure did not seem to belong to her. It was as if she had poked her head through the cardboard cutout of a fat lady at the fairground.", book_id: book3.id)
quote4 = Quote.create(quote: "For a moment, nothing happened. Then, after a second or so, nothing continued to happen.", book_id: book4.id)
quote5 = Quote.create(quote: "There's not a man alive who doesn't know fear, Dickon. The brave man is the one who has learned to hide it, that's all.", book_id: book5.id)
