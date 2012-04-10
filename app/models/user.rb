class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :name, :date_of_birth, :gender, :email

  GENDER = ["Male", "Female", "Other"]

  validates :name, :date_of_birth, :gender, :presence => true
  validates :gender, :inclusion => {:in => GENDER}
end