class Question < ActiveRecord::Base
  has_many :answers

  before_create :generate_keywords

  def as_json(options={})
    #Initialize with default values
    number_of_answers = 0
    number_of_upvotes_for_top_answer = 'No Answers Yet'

    if self.answers.count > 0
      #If our question has answers, set variables accordingly
      number_of_answers = self.answers.count
      number_of_upvotes_for_top_answer = self.answers.order('upvotes DESC').limit(1).first.upvotes
    end

    super.merge('number_of_answers': number_of_answers,
                'number_of_upvotes_for_top_answer': number_of_upvotes_for_top_answer,
                'created_at': self.created_at.strftime("%d %b %Y %I:%M %p"))
  end

  private

    def generate_keywords
      text = Highscore::Content.new("#{self.subject} #{self.body}")

      text.configure do
        set :bonus_multiplier, 2
        set :consonants, 5
        set :ignore_case, true
        set :word_pattern, /[\w]+[^\s0-9]/
      end

      keywords = ''

      text.keywords.top(50).each do |keyword|
        keywords += keyword.text + ' '
      end

      self.keywords = keywords.strip
    end

end
