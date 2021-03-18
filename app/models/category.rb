class Category < ApplicationRecord
  has_many :tasks
  has_ancestry
end
