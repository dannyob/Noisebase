class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  acts_as_commentable
end
