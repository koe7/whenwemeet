class Group < ApplicationRecord
  has_many :group_joins, :dependent => :delete_all
  has_many :users, :through => :joins
end
