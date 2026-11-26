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

  final List<String> dateLabels = const [
    'Yesterday, Tue Nov 17',
    'Today, Wed Nov 18',
    'Tomorrow, Thu Nov 19',
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
      slotLabel: 'BREAKFAST · YOUR CHOICE',
      timeLabel: 'BREAKFAST · 8:00 AM',
      title: 'Soy Yogurt Power Bowl',
      imagePath: ImagePath.nutYogurtBowl,
      kcal: 380,
      proteinG: 26,
      carbsG: 46,
      fatsG: 10,
      prepLabel: 'Prep 5 min',
      costEur: 1.90,
      dietTags: 'Vegan · Lactose-Free',
    ),
    const NutritionMeal(
      id: 'lunch',
      slotLabel: 'LUNCH · PLANNED',
      timeLabel: 'LUNCH · 12:30 PM',
      title: 'Grilled Tofu & Hard-Boiled Egg Salad',
      imagePath: ImagePath.nutTofuSalad,
      kcal: 423,
      proteinG: 32,
      carbsG: 28,
      fatsG: 19,
      prepLabel: 'Prep 10 · Cook 5 min',
      costEur: 2.40,
      dietTags: 'Vegetarian · Lactose-Free',
    ),
    const NutritionMeal(
      id: 'snack',
      slotLabel: 'SNACK · YOUR CHOICE',
      timeLabel: 'SNACK · 4:00 PM',
      title: 'Apple & Almond Butter',
      imagePath: ImagePath.nutAppleAlmond,
      kcal: 190,
      proteinG: 8,
      carbsG: 22,
      fatsG: 9,
      prepLabel: 'Prep 2 min',
      costEur: 1.10,
      dietTags: 'Vegan · Gluten-Free',
    ),
    const NutritionMeal(
      id: 'dinner',
      slotLabel: 'DINNER · PLANNED',
      timeLabel: 'DINNER · 7:30 PM',
      title: 'Chicken Quinoa Stir-fry',
      imagePath: ImagePath.nutChickenQuinoa,
      kcal: 492,
      proteinG: 49,
      carbsG: 49,
      fatsG: 11,
      prepLabel: 'Prep 10 · Cook 15 min',
      costEur: 3.10,
      dietTags: 'High-Protein · Lactose-Free',
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
  static const List<String> mealSlotTabs = [
    'Breakfast',
    'Lunch',
    'Snack',
    'Dinner',
  ];
  final RxInt selectedSlotTab = 1.obs; // Lunch
  final RxBool recipeSaved = true.obs;

  final List<RecipeAlternative> alternatives = const [
    RecipeAlternative(
      title: 'Chickpea Quinoa Bowl',
      imagePath: ImagePath.nutChickpeaBowl,
      prepMin: '10 min',
      costEur: 2.00,
      kcal: 410,
      proteinG: 21,
      carbsG: 48,
      fatsG: 14,
    ),
    RecipeAlternative(
      title: 'Turkey Hummus Wrap',
      imagePath: ImagePath.nutAppleAlmond,
      prepMin: '8 min',
      costEur: 2.60,
      kcal: 430,
      proteinG: 34,
      carbsG: 40,
      fatsG: 14,
    ),
    RecipeAlternative(
      title: 'Lentil & Avocado Salad',
      imagePath: ImagePath.nutTofuSalad,
      prepMin: '12 min',
      costEur: 1.80,
      kcal: 398,
      proteinG: 24,
      carbsG: 36,
      fatsG: 16,
    ),
    RecipeAlternative(
      title: 'Salmon Rice Bowl',
      imagePath: ImagePath.nutChickenQuinoa,
      prepMin: '15 min',
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
      name: 'Firm tofu',
      quantity: '125 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'Eggs, hard-boiled',
      quantity: '2',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'Baby spinach',
      quantity: '60 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'Cherry tomatoes',
      quantity: '100 g',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'Cucumber',
      quantity: '½',
      inGroceryList: false,
    ),
    const RecipeIngredient(
      name: 'Olive oil',
      quantity: '1 tbsp',
      inGroceryList: true,
    ),
    const RecipeIngredient(
      name: 'Lemon juice',
      quantity: '1 tbsp',
      inGroceryList: false,
    ),
  ].obs;

  final List<String> recipeSteps = const [
    'Press the tofu for 10 min, then cut into 2 cm cubes.',
    'Grill the tofu 4–5 min per side until golden.',
    'Boil the eggs for 9 min, cool in cold water and slice.',
    'Toss spinach, tomatoes and cucumber with olive oil and lemon.',
    'Top with tofu and eggs. Season with salt & pepper.',
  ];

  // ─── 14 · Add a Meal Modal ───
  final RxInt addMealSlotIndex = 1.obs; // Lunch
  final describeMealController = TextEditingController();

  // ─── 14b · Photo Scan Result ───
  final RxList<ScannedFoodItem> scannedItems = <ScannedFoodItem>[
    const ScannedFoodItem(
      name: 'Grilled chicken breast',
      grams: 120,
      kcal: 198,
      macroSummary: '198 kcal · P 37g',
      proteinG: 37,
      carbsG: 0,
      fatsG: 5,
    ),
    const ScannedFoodItem(
      name: 'Quinoa, cooked',
      grams: 150,
      kcal: 180,
      macroSummary: '180 kcal · C 32g',
      proteinG: 4,
      carbsG: 32,
      fatsG: 3,
    ),
    const ScannedFoodItem(
      name: 'Steamed broccoli',
      grams: 80,
      kcal: 28,
      macroSummary: '28 kcal · C 4g',
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
      name: 'Baby spinach',
      detail: '200 g · 3 recipes',
      priceEur: 2.49,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'Cherry tomatoes',
      detail: '250 g · 2 recipes',
      priceEur: 2.99,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'Avocado',
      detail: '× 2 · 2 recipes',
      priceEur: 2.40,
    ),
    const GroceryItem(
      category: 'Produce',
      name: 'Bananas',
      detail: '× 6 · Breakfast',
      priceEur: 1.50,
    ),
    // Protein
    const GroceryItem(
      category: 'Protein',
      name: 'Firm tofu',
      detail: '400 g · Lunch · 2×',
      priceEur: 2.79,
    ),
    const GroceryItem(
      category: 'Protein',
      name: 'Chicken breast',
      detail: '600 g · Dinner · 3×',
      priceEur: 6.90,
    ),
    const GroceryItem(
      category: 'Protein',
      name: 'Free-range eggs',
      detail: '× 12 · 4 recipes',
      priceEur: 3.99,
    ),
    // Pantry & Dairy
    const GroceryItem(
      category: 'Pantry & Dairy',
      name: 'Quinoa',
      detail: '500 g · 2 recipes',
      priceEur: 3.49,
    ),
    const GroceryItem(
      category: 'Pantry & Dairy',
      name: 'Soy yogurt (lactose-free)',
      detail: '1 kg · Breakfast · 5×',
      priceEur: 4.29,
    ),
  ].obs;

  int get checkedGroceryCount => groceryItems.where((g) => g.checked).length;

  double get checkedGroceryEur => groceryItems
      .where((g) => g.checked)
      .fold(0.0, (sum, g) => sum + g.priceEur);

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
    AppHelperFunctions.showSnackBar('${todayMeals[idx].title} logged!');
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
      prepLabel: 'Prep ${alt.prepMin}',
      costEur: alt.costEur,
    );
    AppHelperFunctions.showSnackBar('Swapped to ${alt.title}');
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
      'Logged $scannedTotalKcal kcal to ${mealSlotTabs[addMealSlotIndex.value]}!',
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
