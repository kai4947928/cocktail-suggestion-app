class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  has_many :favorites
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def self.ransackable_attributes(auth_object = nil)
    ["name", "alcohol_strength", "difficulty_id", "base_liquor_id", "parent_recipe_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["base_liquor", "child_recipes", "difficulty", "favorites", "ingredients", "parent_recipe", "recipe_ingredients", "user"]
  end

  # 親レシピとの関連（自己参照）
  has_many :child_recipes, class_name: "Recipe", foreign_key: "parent_recipe_id"
  belongs_to :parent_recipe, class_name: 'Recipe', optional: true

  ransacker :parent_recipe_id_null do
    Arel.sql( "parent_recipe_id IS NULL")
  end

  enum alcohol_strength: { weak: "弱め", normal: "普通", strong: "強め" }

  attr_accessor :is_original

  validate :parent_recipe_presence_for_arrange

  def is_original?
    parent_recipe_id.nil?
  end

  def parent_recipe_presence_for_arrange
    if !is_original? && parent_recipe_id.nil?
      errors.add(:parent_recipe_id, "アレンジの場合は親カクテルを選択してください")
    end
  end

  validates :name, presence: true
  validates :alcohol_strength, presence: true
  validates :user_id, presence: true
  validates :base_liquor_id, presence: true
  validates :difficulty_id, presence: true
end
