import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/features/nutrition/domain/entities/nutrition_models.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class NutritionController extends GetxController {
  // ─── 12 · Daily Macro Dashboard ───
  static const int targetKcal = 1485;
  static const int targetProtein = 125;
  static const int targetCarbs = 145;
  static const int targetFats = 45;

  /// Translation keys — resolve with `.tr` in the UI.
  final List<String> dateLabels = const [
    'nutrition.dashboard.date_yesterday',
    'nutrition.dashboard.date_today',
    'nutrition.dashboard.date_tomorrow',
  ];
  final RxInt dateIndex = 1.obs;

  final RxInt burnedKcal = 0.obs;
  final RxInt extraLoggedKcal = 0.obs;
  final RxInt extraLoggedProtein = 0.obs;
  final RxInt extraLoggedCarbs = 0.obs;
  final RxInt extraLoggedFats = 0.obs;

  final RxList<NutritionMeal> todayMeals = <NutritionMeal>[
    const NutritionMeal(
      id: 'breakfast',
      slotLabel: 'nutrition.mock.slot_breakfast',
      timeLabel: 'nutrition.mock.time_breakfast',
      title: 'nutrition.mock.dish_soy_yogurt_bowl',
      imagePath: ImagePath.nutYogurtBowl,
      kcal: 380,
      proteinG: 26,
      carbsG: 46,
      fatsG: 10,
      prepMin: 5,
      costEur: 1.90,
      dietTags: 'nutrition.mock.tags_vegan_lactose_free',
    ),
    const NutritionMeal(
      id: 'lunch',
      slotLabel: 'nutrition.mock.slot_lunch',
      timeLabel: 'nutrition.mock.time_lunch',
      title: 'nutrition.mock.dish_tofu_egg_salad',
      imagePath: ImagePath.nutTofuSalad,
      kcal: 423,
      proteinG: 32,
      carbsG: 28,
      fatsG: 19,
      prepMin: 10,
      cookMin: 5,
      costEur: 2.40,
      dietTags: 'nutrition.mock.tags_vegetarian_lactose_free',
    ),
    const NutritionMeal(
      id: 'snack',
      slotLabel: 'nutrition.mock.slot_snack',
      timeLabel: 'nutrition.mock.time_snack',
      title: 'nutrition.mock.dish_apple_almond_butter',
      imagePath: ImagePath.nutAppleAlmond,
      kcal: 190,
      proteinG: 8,
      carbsG: 22,
      fatsG: 9,
      prepMin: 2,
      costEur: 1.10,
      dietTags: 'nutrition.mock.tags_vegan_gluten_free',
    ),
    const NutritionMeal(
      id: 'dinner',
      slotLabel: 'nutrition.mock.slot_dinner',
      timeLabel: 'nutrition.mock.time_dinner',
      title: 'nutrition.mock.dish_chicken_quinoa_stir_fry',
      imagePath: ImagePath.nutChickenQuinoa,
      kcal: 492,
      proteinG: 49,
      carbsG: 49,
      fatsG: 11,
      prepMin: 10,
      cookMin: 15,
      costEur: 3.10,
      dietTags: 'nutrition.mock.tags_high_protein_lactose_free',
    ),
  ].obs;

  int get eatenKcal =>
      todayMeals.where((m) => m.eaten).fold(0, (s, m) => s + m.kcal) +
      extraLoggedKcal.value;

  int get remainingKcal => (targetKcal - eatenKcal + burnedKcal.value).clamp(0, 9999);

  int get eatenProtein =>
      todayMeals.where((m) => m.eaten).fold(0, (s, m) => s + m.proteinG) +
      extraLoggedProtein.value;

  int get eatenCarbs =>
      todayMeals.where((m) => m.eaten).fold(0, (s, m) => s + m.carbsG) +
      extraLoggedCarbs.value;

  int get eatenFats =>
      todayMeals.where((m) => m.eaten).fold(0, (s, m) => s + m.fatsG) +
      extraLoggedFats.value;

  // ─── 13 · Meal Planner & Recipe Swap ───
  /// Translation keys — resolve with `.tr` in the UI.
  static const List<String> mealSlotTabs = [
    'nutrition.meal_slot.breakfast',
    'nutrition.meal_slot.lunch',
    'nutrition.meal_slot.snack',
    'nutrition.meal_slot.dinner',
  ];
  final RxInt selectedSlotTab = 1.obs; // Lunch
  final RxBool recipeSaved = true.obs;

  final List<RecipeAlternative> alternatives = const [
    RecipeAlternative(
      title: 'nutrition.mock.dish_chickpea_quinoa_bowl',
      imagePath: ImagePath.nutChickpeaBowl,
      prepMin: 10,
      costEur: 2.00,
      kcal: 410,
      proteinG: 21,
      carbsG: 48,
      fatsG: 14,
    ),
    RecipeAlternative(
      title: 'nutrition.mock.dish_turkey_hummus_wrap',
      imagePath: ImagePath.nutAppleAlmond,
      prepMin: 8,
      costEur: 2.60,
      kcal: 430,
      proteinG: 34,
      carbsG: 40,
      fatsG: 14,
    ),
    RecipeAlternative(
      title: 'nutrition.mock.dish_lentil_avocado_salad',
      imagePath: ImagePath.nutTofuSalad,
      prepMin: 12,
      costEur: 1.80,
      kcal: 398,
      proteinG: 24,
      carbsG: 36,
      fatsG: 16,
    ),
    RecipeAlternative(
      title: 'nutrition.mock.dish_salmon_rice_bowl',
      imagePath: ImagePath.nutChickenQuinoa,
      prepMin: 15,
      costEur: 3.40,
      kcal: 452,
      proteinG: 31,
      carbsG: 44,
      fatsG: 16,
    ),
  ];

  NutritionMeal get featuredMeal => todayMeals[selectedSlotTab.value];

  // ─── 13b · Recipe Detail ───
  final RxDouble portionMultiplier = 1.25.obs;

  final RxList<RecipeIngredient> ingredients = <RecipeIngredient>[
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_firm_tofu',
      quantity: '125 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_eggs_hard_boiled',
      quantity: '2',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_baby_spinach',
      quantity: '60 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_cherry_tomatoes',
      quantity: '100 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_cucumber',
      quantity: '½',
      inGroceryList: false,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_olive_oil',
      quantity: 'nutrition.mock.qty_1_tbsp',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'nutrition.mock.ingredient_lemon_juice',
      quantity: 'nutrition.mock.qty_1_tbsp',
      inGroceryList: false,
    ),
  ].obs;

  /// Translation keys — resolve with `.tr` in the UI.
  final List<String> recipeSteps = const [
    'nutrition.mock.step_1',
    'nutrition.mock.step_2',
    'nutrition.mock.step_3',
    'nutrition.mock.step_4',
    'nutrition.mock.step_5',
  ];

  // ─── 14 · Add a Meal Modal ───
  final RxInt addMealSlotIndex = 1.obs; // Lunch
  final describeMealController = TextEditingController();

  // ─── 14b · Photo Scan Result ───
  final RxList<ScannedFoodItem> scannedItems = <ScannedFoodItem>[
    const ScannedFoodItem(
      name: 'nutrition.mock.scan_chicken',
      grams: 120,
      kcal: 198,
      macroSummary: 'nutrition.mock.scan_chicken_summary',
      proteinG: 37,
      carbsG: 0,
      fatsG: 5,
    ),
    const ScannedFoodItem(
      name: 'nutrition.mock.scan_quinoa',
      grams: 150,
      kcal: 180,
      macroSummary: 'nutrition.mock.scan_quinoa_summary',
      proteinG: 4,
      carbsG: 32,
      fatsG: 3,
    ),
    const ScannedFoodItem(
      name: 'nutrition.mock.scan_broccoli',
      grams: 80,
      kcal: 28,
      macroSummary: 'nutrition.mock.scan_broccoli_summary',
      proteinG: 1,
      carbsG: 4,
      fatsG: 0,
    ),
  ].obs;

  int get scannedTotalKcal =>
      scannedItems.where((e) => e.selected).fold(0, (s, e) => s + e.kcal);
  int get scannedTotalProtein =>
      scannedItems.where((e) => e.selected).fold(0, (s, e) => s + e.proteinG);
  int get scannedTotalCarbs =>
      scannedItems.where((e) => e.selected).fold(0, (s, e) => s + e.carbsG);
  int get scannedTotalFats =>
      scannedItems.where((e) => e.selected).fold(0, (s, e) => s + e.fatsG);

  // ─── 15 · Automated Grocery List ───
  final RxList<GroceryItem> groceryItems = <GroceryItem>[
    // Produce
    const GroceryItem(
      category: 'Produce',
      name: 'nutrition.mock.grocery_baby_spinach',
      detail: 'nutrition.mock.grocery_baby_spinach_detail',
      priceEur: 2.49,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'nutrition.mock.grocery_cherry_tomatoes',
      detail: 'nutrition.mock.grocery_cherry_tomatoes_detail',
      priceEur: 2.99,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'nutrition.mock.grocery_avocado',
      detail: 'nutrition.mock.grocery_avocado_detail',
      priceEur: 2.40,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'nutrition.mock.grocery_bananas',
      detail: 'nutrition.mock.grocery_bananas_detail',
      priceEur: 1.50,
    ),
    // Protein
    const GroceryItem(
      category: 'Protein',
      name: 'nutrition.mock.grocery_firm_tofu',
      detail: 'nutrition.mock.grocery_firm_tofu_detail',
      priceEur: 2.79,
    ),
    const GroceryItem(
      category: 'Protein',
      name: 'nutrition.mock.grocery_chicken_breast',
      detail: 'nutrition.mock.grocery_chicken_breast_detail',
      priceEur: 6.90,
    ),
    const GroceryItem(
      category: 'Protein',
      name: 'nutrition.mock.grocery_eggs',
      detail: 'nutrition.mock.grocery_eggs_detail',
      priceEur: 3.99,
    ),
    // Pantry & Dairy
    const GroceryItem(
      category: 'Pantry & Dairy',
      name: 'nutrition.mock.grocery_quinoa',
      detail: 'nutrition.mock.grocery_quinoa_detail',
      priceEur: 3.49,
    ),
    const GroceryItem(
      category: 'Pantry & Dairy',
      name: 'nutrition.mock.grocery_soy_yogurt',
      detail: 'nutrition.mock.grocery_soy_yogurt_detail',
      priceEur: 4.29,
    ),
  ].obs;

  int get checkedGroceryCount => groceryItems.where((g) => g.checked).length;

  double get checkedGroceryEur => groceryItems
      .where((g) => g.checked)
      .fold(0.0, (sum, g) => sum + g.priceEur);

  // ─── Display helpers (translate at call time) ───
  /// "Prep 5 min" / "Prep 10 · Cook 15 min".
  String prepText(NutritionMeal meal) => meal.cookMin == null
      ? 'nutrition.common.prep'.trParams({'prep': '${meal.prepMin}'})
      : 'nutrition.common.prep_cook'.trParams({
          'prep': '${meal.prepMin}',
          'cook': '${meal.cookMin}',
        });

  /// Amount with the locale's decimal separator, e.g. "2.40" / "2,40".
  String amount(double value) => value
      .toStringAsFixed(2)
      .replaceAll('.', 'nutrition.common.decimal_separator'.tr);

  /// "€2.40" / "2,40 €".
  String price(double value) =>
      'nutrition.common.price'.trParams({'amount': amount(value)});

  /// "≈ €2.40" / "≈ 2,40 €".
  String approxPrice(double value) =>
      'nutrition.common.price_approx'.trParams({'amount': amount(value)});

  /// "26g" / "26 g".
  String grams(num value) => '$value${'nutrition.common.unit_g'.tr}';

  // ─── Actions ───
  void prevDate() {
    if (dateIndex.value > 0) dateIndex.value--;
  }

  void nextDate() {
    if (dateIndex.value < dateLabels.length - 1) dateIndex.value++;
  }

  void logFeaturedMealAsEaten() {
    final idx = selectedSlotTab.value;
    todayMeals[idx] = todayMeals[idx].copyWith(eaten: true);
    AppHelperFunctions.showSnackBar(
      'nutrition.meal_plan.snack_logged'.trParams({
        'meal': todayMeals[idx].title.tr,
      }),
    );
  }

  void swapWithAlternative(RecipeAlternative alt) {
    final idx = selectedSlotTab.value;
    todayMeals[idx] = todayMeals[idx].copyWith(
      title: alt.title,
      imagePath: alt.imagePath,
      kcal: alt.kcal,
      proteinG: alt.proteinG,
      carbsG: alt.carbsG,
      fatsG: alt.fatsG,
      prepMin: alt.prepMin,
      cookMin: () => null,
      costEur: alt.costEur,
    );
    AppHelperFunctions.showSnackBar(
      'nutrition.meal_plan.snack_swapped'.trParams({'meal': alt.title.tr}),
    );
  }

  void adjustPortion(double delta) {
    portionMultiplier.value = (portionMultiplier.value + delta).clamp(0.5, 3.0);
  }

  void toggleIngredientInCart(int index) {
    final item = ingredients[index];
    ingredients[index] = item.copyWith(inGroceryList: !item.inGroceryList);
  }

  void toggleScannedItem(int index) {
    final item = scannedItems[index];
    scannedItems[index] = item.copyWith(selected: !item.selected);
  }

  void logPhotoScanToMeal() {
    extraLoggedKcal.value += scannedTotalKcal;
    extraLoggedProtein.value += scannedTotalProtein;
    extraLoggedCarbs.value += scannedTotalCarbs;
    extraLoggedFats.value += scannedTotalFats;
    Get.back();
    AppHelperFunctions.showSnackBar(
      'nutrition.photo_scan.snack_logged'.trParams({
        'kcal': '$scannedTotalKcal',
        'slot': mealSlotTabs[addMealSlotIndex.value].tr,
      }),
    );
  }

  void toggleGroceryItem(int index) {
    final item = groceryItems[index];
    groceryItems[index] = item.copyWith(checked: !item.checked);
  }

  void openMealPlanner({int slotIndex = 1}) {
    selectedSlotTab.value = slotIndex;
    Get.toNamed(AppRoute.nutritionMealPlannerScreen);
  }

  void openRecipeDetail() => Get.toNamed(AppRoute.nutritionRecipeDetailScreen);
  void openPhotoScanResult() => Get.toNamed(AppRoute.nutritionPhotoScanScreen);
  void openGroceryList() => Get.toNamed(AppRoute.nutritionGroceryListScreen);

  @override
  void onClose() {
    describeMealController.dispose();
    super.onClose();
  }
}
