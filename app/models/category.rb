class Category < ApplicationRecord
    has_many :items
    has_many :rooms, :through => :items
end
