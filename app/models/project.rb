class Project < ActiveRecord::Base
  attr_accessible :description, :name, :users_attributes
  has_many :users

  accepts_nested_attributes_for :users, :allow_destroy => true
end
