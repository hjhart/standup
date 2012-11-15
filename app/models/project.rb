class Project < ActiveRecord::Base
  attr_accessible :description, :name, :users_attributes
  has_many :users

  validates_presence_of :name
  accepts_nested_attributes_for :users, :allow_destroy => true
end
