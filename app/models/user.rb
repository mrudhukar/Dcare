class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :name, :date_of_birth, :gender, :email, :password, :password_confirmation, :phone, :address

  GENDER = ["Male", "Female", "Other"]

  validates :name, :date_of_birth, :gender, :presence => true
  validates :gender, :inclusion => {:in => GENDER}
  
  has_one :phone, :dependent => :destroy
  has_one :address, :dependent => :destroy
  
end