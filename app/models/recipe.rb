class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  has_many :favorites
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # 親レシピとの関連（自己参照）
  belongs_to :parent_recipe, class_name: 'Recipe', optional: true

  validates :name, presence: true
  validates :alcohol_strength, presence: true
  validates :user_id, presence: true
  validates :base_liquor_id, presence: true
  validates :difficulty_id, presence: true
end
