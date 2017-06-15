class Group < ApplicationRecord
  has_many :group_joins, :dependent => :delete_all
  has_many :grouped_users, through: :group_joins, source: :user
end
