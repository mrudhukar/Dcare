class Diagnosis < ActiveRecord::Base
  belongs_to :user

  has_one :blood,         :dependent => :destroy, :class_name => "Diagnosis::Blood"
  has_one :anthropometry, :dependent => :destroy, :class_name => "Diagnosis::Anthropometry"
  has_one :urine,         :dependent => :destroy, :class_name => "Diagnosis::Urine"
  has_one :other,         :dependent => :destroy, :class_name => "Diagnosis::Other"

  attr_protected :user_id, :user

  validates :name, :diagnosis_date, :presence => true

  def self.accessible_by(ability, action=nil)
  	
  end

  def display_date
    diagnosis_date.strftime("%B %d, %Y") if diagnosis_date.present?
  end
end
