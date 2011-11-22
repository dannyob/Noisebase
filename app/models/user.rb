class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :badges

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true  
  
  mount_uploader :avatar, AvatarUploader 
  
  def display_name
    self.name || self.email
  end
  
  def self.recent
    all(:limit => 10, :order => "created_at DESC")
  end

  def questions_count
    self.questions.count
  end

  def answers_count
    self.answers.count
  end
  
end
