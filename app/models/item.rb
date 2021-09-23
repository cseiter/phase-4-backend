class Item < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :condition, optional: true
    belongs_to :room, optional: true
end
