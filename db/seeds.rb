question = Question.create(subject: 'How awesome is this?', body: 'Answer this please.')
answer1 = Answer.create(body: 'This is pretty darn awesome!', question: question, upvotes: 10)
answer2 = Answer.create(body: 'This is out of this world.', question: question, upvotes: 20)
answer3 = Answer.create(body: 'We will know soon.', question: question, upvotes: 1)