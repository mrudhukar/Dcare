class User < ActiveRecord::Base
  acts_as_authentic
  
  GENDER = ["Male", "Female", "Other"]

  has_one :phone, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_many :diagnoses, :dependent => :destroy, :order => "diagnoses.id DESC"

  accepts_nested_attributes_for :phone, :address
  
  attr_accessible :name, :date_of_birth, :gender, :email, :password, :password_confirmation, :phone_attributes, :address_attributes

  validates :name, :date_of_birth, :gender, :presence => true
  validates :gender, :inclusion => {:in => GENDER}
  validates_associated :phone, :address
  
  def to_s
    name
  end

  def can_read_forem_category?(category)
  	true
  end

  def can_read_forem_forums?
  	true
  end

  def can_read_forem_forum?(forum)
  	true
  end

  def can_create_forem_topics?(forum)
  	true
  end

  def can_read_forem_topic?(forum)
  	true
  end

  def can_reply_to_forem_topic?(topic)
  	true
  end

  def can_edit_forem_posts?(forum)
  	true
  end
end