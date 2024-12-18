document.addEventListener("DOMContentLoaded", () => {
  const originalRadio = document.getElementById("original_radio");
  const arrangeRadio = document.getElementById("arrange_radio");
  const parentRecipeSelection = document.getElementById("parent_recipe_selection");

  // イベントリスナーを設定
  originalRadio.addEventListener("change", () => {
    parentRecipeSelection.style.display = "none"; // 非表示
  });

  arrangeRadio.addEventListener("change", () => {
    parentRecipeSelection.style.display = "block"; // 表示
  });
});