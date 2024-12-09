# Ingredients（副材料）
lime_juice = Ingredient.create!(name: "ライムジュース")
mint = Ingredient.create!(name: "ミント")
sugar = Ingredient.create!(name: "砂糖")
soda_water = Ingredient.create!(name: "炭酸水")
rum = Ingredient.create!(name: "ラム")

# Cocktail1（モヒート）
mojito = Cocktail.create!(
  name: "モヒート",
  base_alcohol: "ラム",
  difficulty: "中級"
)
mojito.ingredients << lime_juice
mojito.ingredients << mint
mojito.ingredients << sugar
mojito.ingredients << soda_water

# Cocktail2（ダイキリ）
daiquiri = Cocktail.create!(
  name: "ダイキリ",
  base_alcohol: "ラム",
  difficulty: "初級"
)
daiquiri.ingredients << lime_juice
daiquiri.ingredients << sugar
daiquiri.ingredients << rum