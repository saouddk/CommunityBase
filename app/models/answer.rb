class Answer < ActiveRecord::Base
  belongs_to :question

  def as_json(options={})
    super.merge('created_at': self.created_at.strftime("%d %b %Y %I:%M %p"))
  end

end
