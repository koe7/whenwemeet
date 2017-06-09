class User < ApplicationRecord
  has_many :timetables, :dependent => :delete_all
  has_many :group_joins, :dependent => :delete_all
  has_many :groups, :through => :joins
end
