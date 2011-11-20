class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :badges

  acts_as_authentic
  
  mount_uploader :avatar, AvatarUploader 
  
  def display_name
    self.name || self.email
  end

  
end