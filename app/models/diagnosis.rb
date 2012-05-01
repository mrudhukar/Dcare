class Diagnosis < ActiveRecord::Base
  belongs_to :user

  attr_protected :user_id, :user

  has_one :blood, :dependent => :destroy, :class_name => "Diagnosis::Blood"
  has_one :anthropometry, :dependent => :destroy, :class_name => "Diagnosis::Anthropometry"
  has_one :urine, :dependent => :destroy, :class_name => "Diagnosis::Urine"
  has_one :other, :dependent => :destroy, :class_name => "Diagnosis::Other"

  validates :name, :diagnosis_date, :presence => true
end
