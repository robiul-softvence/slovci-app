/// Pure Dart domain models for the MILON Nutrition feature.
class NutritionMeal {
  const NutritionMeal({
    required this.id,
    required this.slotLabel,
    required this.timeLabel,
    required this.title,
    required this.imagePath,
    required this.kcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatsG,
    required this.prepLabel,
    required this.costEur,
    required this.dietTags,
    this.eaten = false,
  });

  final String id;
  final String slotLabel;
  final String timeLabel;
  final String title;
  final String imagePath;
  final int kcal;
  final int proteinG;
  final int carbsG;
  final int fatsG;
  final String prepLabel;
  final double costEur;
  final String dietTags;
  final bool eaten;

  NutritionMeal copyWith({
    String? title,
    String? imagePath,
    int? kcal,
    int? proteinG,
    int? carbsG,
    int? fatsG,
    String? prepLabel,
    double? costEur,
    bool? eaten,
  }) {
    return NutritionMeal(
      id: id,
      slotLabel: slotLabel,
      timeLabel: timeLabel,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      kcal: kcal ?? this.kcal,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      fatsG: fatsG ?? this.fatsG,
      prepLabel: prepLabel ?? this.prepLabel,
      costEur: costEur ?? this.costEur,
      dietTags: dietTags,
      eaten: eaten ?? this.eaten,
    );
  }
}

class RecipeAlternative {
  const RecipeAlternative({
    required this.title,
    required this.imagePath,
    required this.prepMin,
    required this.costEur,
    required this.kcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatsG,
  });

  final String title;
  final String imagePath;
  final String prepMin;
  final double costEur;
  final int kcal;
  final int proteinG;
  final int carbsG;
  final int fatsG;
}

class RecipeIngredient {
  const RecipeIngredient({
    required this.name,
    required this.quantity,
    required this.inGroceryList,
  });

  final String name;
  final String quantity;
  final bool inGroceryList;

  RecipeIngredient copyWith({bool? inGroceryList}) {
    return RecipeIngredient(
      name: name,
      quantity: quantity,
      inGroceryList: inGroceryList ?? this.inGroceryList,
    );
  }
}

class ScannedFoodItem {
  const ScannedFoodItem({
    required this.name,
    required this.grams,
    required this.kcal,
    required this.macroSummary,
    required this.proteinG,
    required this.carbsG,
    required this.fatsG,
    this.selected = true,
  });

  final String name;
  final int grams;
  final int kcal;
  final String macroSummary;
  final int proteinG;
  final int carbsG;
  final int fatsG;
  final bool selected;

  ScannedFoodItem copyWith({bool? selected, int? grams}) {
    return ScannedFoodItem(
      name: name,
      grams: grams ?? this.grams,
      kcal: kcal,
      macroSummary: macroSummary,
      proteinG: proteinG,
      carbsG: carbsG,
      fatsG: fatsG,
      selected: selected ?? this.selected,
    );
  }
}

class GroceryItem {
  const GroceryItem({
    required this.category,
    required this.name,
    required this.detail,
    required this.priceEur,
    this.checked = false,
  });

  final String category;
  final String name;
  final String detail;
  final double priceEur;
  final bool checked;

  GroceryItem copyWith({bool? checked}) {
    return GroceryItem(
      category: category,
      name: name,
      detail: detail,
      priceEur: priceEur,
      checked: checked ?? this.checked,
    );
  }
}
