class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers 

  validates :title, :presence => true, :length => {:minimum => 10}
  validates :content, :presence => true, :length => {:minimum => 10}

  acts_as_taggable
  acts_as_taggable_on :tags
  acts_as_commentable
  LIMIT = 10 
 def self.hot(limit = LIMIT)
    all(:limit => limit, :order => "votes_count DESC, answers_count DESC, views_count DESC, created_at DESC")
  end
  
  def self.answered(page = 1, limit = LIMIT)
    raise "Wrong page" if page.to_i < 1
    all(:best_answer_id.ne => nil, :limit => limit, :offset => (page.to_i-1)*limit, :order => "created_at DESC")
  end

  
  def self.search(keyword, page = 1, limit = LIMIT)
    rails "Wrong page" if page.to_i < 1
    all(:title => /#{keyword}/, :limit => limit, :offset => (page.to_i-1)*limit, :order => "created_at DESC")
  end
  
  def self.answered_questions_count
    # count - count(:best_answer_id => nil)
  end      
  
  def has_best_answer?
    if self.best_answer_id
      true
    end
    
    false
  end

  def best_answer
    Answer.find(best_answer_id)
  end
end
