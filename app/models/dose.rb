class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, length: { maximum: 50 }
  validates :cocktail, uniqueness: { scope: :ingredient }

  # validates_uniqueness_of :cocktail, scope: :ingredient
end
