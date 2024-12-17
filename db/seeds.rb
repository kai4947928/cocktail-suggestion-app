# サンプルユーザーを作成
user = User.create!(email: 'user@example.com', password: 'password')

# サンプルの難易度
difficulty_easy = Difficulty.create!(name: 'Easy')
difficulty_medium = Difficulty.create!(name: 'Medium')

# サンプルのベース
base_rum = BaseLiquor.create!(name: 'Rum')
base_gin = BaseLiquor.create!(name: 'Gin')

# サンプルの材料
ingredient_mint = Ingredient.create!(name: 'Mint')
ingredient_lime = Ingredient.create!(name: 'Lime')
ingredient_sugar = Ingredient.create!(name: 'Sugar')
ingredient_soda = Ingredient.create!(name: 'Soda')

# サンプルカクテル 1: Mojito
mojito = Recipe.create!(
  name: 'Mojito',
  alcohol_strength: 'Strong',  # 適切な値を追加
  difficulty: difficulty_easy,
  base_liquor: base_rum,
  user: user  # ユーザーを関連付け
)

# レシピの材料を関連付ける
mojito.ingredients << [ingredient_mint, ingredient_lime, ingredient_sugar, ingredient_soda]
mojito.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# サンプルカクテル 2: Martini
martini = Recipe.create!(
  name: 'Martini',
  alcohol_strength: 'Medium',  # 適切な値を追加
  difficulty: difficulty_medium,
  base_liquor: base_gin,
  user: user  # ユーザーを関連付け
)
martini.ingredients << ingredient_lime
martini.recipe_ingredients.each { |ri| ri.update(quantity: 1) }