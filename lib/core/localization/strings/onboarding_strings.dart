// Onboarding strings. Keys: 'onboarding.<screen>.<name>'.
// Keep both maps in the same order with identical keys.

const Map<String, String> onboardingEn = {
  // ─── Common ───
  'onboarding.common.continue': 'Continue',
  'onboarding.common.friend': 'Friend',
  'onboarding.common.other': 'Other',
  'onboarding.common.today': 'Today',
  'onboarding.common.yrs': 'yrs',
  'onboarding.common.weeks_approx': '~@weeks weeks',
  'onboarding.common.euro': '€@amount',
  'onboarding.common.decimal_separator': '.',
  'onboarding.common.date_short': '@month @day',

  // ─── Months (short) ───
  'onboarding.month.jan': 'Jan',
  'onboarding.month.feb': 'Feb',
  'onboarding.month.mar': 'Mar',
  'onboarding.month.apr': 'Apr',
  'onboarding.month.may': 'May',
  'onboarding.month.jun': 'Jun',
  'onboarding.month.jul': 'Jul',
  'onboarding.month.aug': 'Aug',
  'onboarding.month.sep': 'Sep',
  'onboarding.month.oct': 'Oct',
  'onboarding.month.nov': 'Nov',
  'onboarding.month.dec': 'Dec',

  // ─── Week days ───
  'onboarding.day.mon': 'Mon',
  'onboarding.day.tue': 'Tue',
  'onboarding.day.wed': 'Wed',
  'onboarding.day.thu': 'Thu',
  'onboarding.day.fri': 'Fri',
  'onboarding.day.sat': 'Sat',
  'onboarding.day.sun': 'Sun',
  'onboarding.day_letter.mon': 'M',
  'onboarding.day_letter.tue': 'T',
  'onboarding.day_letter.wed': 'W',
  'onboarding.day_letter.thu': 'T',
  'onboarding.day_letter.fri': 'F',
  'onboarding.day_letter.sat': 'S',
  'onboarding.day_letter.sun': 'S',

  // ─── Shared option labels ───
  'onboarding.goal.lose_weight': 'Lose Weight',
  'onboarding.goal.build_muscle': 'Build Muscle',
  'onboarding.goal.stay_fit': 'Stay Fit',
  'onboarding.env.gym': 'Gym',
  'onboarding.env.home': 'Home',
  'onboarding.env.hybrid': 'Hybrid',
  'onboarding.time.morning_reminder': '7:00 AM',
  'onboarding.time.lunch_reminder': '12:15 PM',
  'onboarding.time.evening_reminder': '6:30 PM',

  // ─── 01 · Profile & Goals ───
  'onboarding.profile_goals.eyebrow': 'STEP 1 · PROFILE & GOALS',
  'onboarding.profile_goals.title': "Let's build your plan",
  'onboarding.profile_goals.subtitle':
      'A few basics so MILON can personalize your workouts and meals.',
  'onboarding.profile_goals.name_title': 'What should I call you?',
  'onboarding.profile_goals.name_hint': 'Your first name',
  'onboarding.profile_goals.name_helper':
      'Your first name. MILON Coach will use it in your messages.',
  'onboarding.profile_goals.gender_title': 'Gender',
  'onboarding.profile_goals.gender_female': 'Female',
  'onboarding.profile_goals.gender_male': 'Male',
  'onboarding.profile_goals.demo_title': 'Who should demo your exercises?',
  'onboarding.profile_goals.demo_woman': 'A woman',
  'onboarding.profile_goals.demo_man': 'A man',
  'onboarding.profile_goals.demo_helper':
      'Videos and photos will show this model. You can change it anytime in Settings.',
  'onboarding.profile_goals.metrics_title': 'Age, height & weight',
  'onboarding.profile_goals.age': 'Age',
  'onboarding.profile_goals.height': 'Height',
  'onboarding.profile_goals.weight': 'Weight',
  'onboarding.profile_goals.goal_title': 'Primary goal',
  'onboarding.profile_goals.activity_title': 'Daily activity level',
  'onboarding.profile_goals.sedentary_title': 'Sedentary / Desk Job',
  'onboarding.profile_goals.sedentary_subtitle':
      'Mostly sitting, < 5k steps a day',
  'onboarding.profile_goals.active_title': 'Active',
  'onboarding.profile_goals.active_subtitle':
      'On your feet, 5k–10k steps a day',
  'onboarding.profile_goals.very_active_title': 'Very Active',
  'onboarding.profile_goals.very_active_subtitle':
      'Physical job or 10k+ steps a day',

  // ─── 01b · Target Weight & Pace ───
  'onboarding.target_weight.eyebrow': 'STEP 2 · YOUR TARGET',
  'onboarding.target_weight.title': 'What weight are you aiming for?',
  'onboarding.target_weight.subtitle':
      'Pick a realistic target. Steady progress lasts longer.',
  'onboarding.target_weight.delta_maintain':
      'Maintain current weight (@current kg)',
  'onboarding.target_weight.delta_change': '@delta kg from today (@current kg)',
  'onboarding.target_weight.pace_title': 'Your pace',
  'onboarding.target_weight.recommended_pace': 'Recommended pace',
  'onboarding.target_weight.pace_maintenance':
      'Steady maintenance pace for lasting results',
  'onboarding.target_weight.pace_change':
      '@pace kg / week, the safest pace for lasting results',
  'onboarding.target_weight.reach_by':
      'You could reach @target kg around @date',
  'onboarding.target_weight.today_weight': 'Today · @current kg',
  'onboarding.target_weight.estimate_note':
      'Estimate based on @pace kg per week. Faster loss is not recommended. We adjust every week.',
  'onboarding.target_weight.healthy_range':
      'Healthy range for @height cm: @range. MILON never sets your intake below 1,200 kcal/day.',

  // ─── 01c · With MILON ───
  'onboarding.with_milon.eyebrow': 'YOUR GOAL, MADE REAL',
  'onboarding.with_milon.title_prefix': '@name, with MILON you can reach ',
  'onboarding.with_milon.title_suffix': ' by @date',
  'onboarding.with_milon.cta': "Let's do it",
  'onboarding.with_milon.pace_note':
      'A steady @pace kg per week, about @weeks weeks. Slow and safe, so the results last.',
  'onboarding.with_milon.benefits_title': 'With MILON, you get',
  'onboarding.with_milon.workouts_title': 'Workouts built around you',
  'onboarding.with_milon.workouts_subtitle':
      'Adapted to your body, injuries, equipment and schedule',
  'onboarding.with_milon.meals_title': 'Meals that fit your budget',
  'onboarding.with_milon.meals_subtitle':
      'A weekly meal plan and grocery list, ready to go',
  'onboarding.with_milon.coach_title': 'A coach by your side',
  'onboarding.with_milon.coach_subtitle':
      'MILON Coach checks in and adjusts your plan every week',

  // ─── 01d · Health Screening ───
  'onboarding.health.title': 'Your health',
  'onboarding.health.subtitle':
      "Answer honestly so we can adapt your program. MILON doesn't replace a doctor.",
  'onboarding.health.condition_heart':
      'Heart condition or chest pain during effort',
  'onboarding.health.condition_blood_pressure':
      'Uncontrolled high blood pressure',
  'onboarding.health.condition_kidney': 'Kidney disease',
  'onboarding.health.condition_surgery': 'Recent surgery or injury',
  'onboarding.health.condition_diabetes': 'Diabetes',
  'onboarding.health.condition_pregnant': 'Pregnant or breastfeeding',
  'onboarding.health.condition_eating_disorder':
      'Eating disorder, current or past',
  'onboarding.health.condition_treatment': 'Ongoing medical treatment',
  'onboarding.health.adapt_title': 'If you switch one on, MILON adapts:',
  'onboarding.health.adapt_rules':
      '• Eating disorder → no calorie counting, habit-based coaching only\n'
      '• Pregnancy → no weight-loss target, pregnancy-safe moves\n'
      "• Heart, blood pressure, kidney, diabetes → we ask for your doctor's OK first",
  'onboarding.health.consent':
      'I consent to MILON processing my health data to personalize my plan. I can withdraw anytime.',

  // ─── 02a · Anything to Report ───
  'onboarding.report.eyebrow': 'STEP 3 · SENSITIVE AREAS',
  'onboarding.report.title': 'Anything we should know about?',
  'onboarding.report.subtitle':
      "Pain, an injury or a movement that bothers you? I'll adapt your workouts around it.",
  'onboarding.report.no_title': 'No, all good',
  'onboarding.report.no_subtitle': 'No pain, no discomfort',
  'onboarding.report.yes_title': 'Yes, let me show you',
  'onboarding.report.yes_subtitle': "I'll point to where it bothers me",

  // ─── 02 · Injury Body Map ───
  'onboarding.body_map.eyebrow': 'STEP 3 · SENSITIVE AREAS',
  'onboarding.body_map.title': 'Any injuries or sensitive areas?',
  'onboarding.body_map.subtitle':
      'Tap a zone on the body. MILON will automatically adapt every exercise to protect it.',
  'onboarding.body_map.legend_selected': 'Selected',
  'onboarding.body_map.legend_tap': 'Tap to flag',
  'onboarding.body_map.list_title': 'Or choose from the list',
  'onboarding.body_map.skip_banner':
      'No injuries? Skip this step. You can add them later in Profile.',
  'onboarding.body_map.front': 'FRONT',
  'onboarding.body_map.back': 'BACK',

  // ─── Body zones ───
  'onboarding.zone.neck': 'Neck',
  'onboarding.zone.shoulders': 'Shoulders',
  'onboarding.zone.chest': 'Chest',
  'onboarding.zone.back': 'Back',
  'onboarding.zone.elbows': 'Elbows',
  'onboarding.zone.wrists_hands': 'Wrists & Hands',
  'onboarding.zone.abdomen': 'Abdomen',
  'onboarding.zone.hips_glutes': 'Hips & Glutes',
  'onboarding.zone.thighs_calves': 'Thighs & Calves',
  'onboarding.zone.knees': 'Knees',
  'onboarding.zone.ankles_feet': 'Ankles & Feet',
  'onboarding.zone.pregnancy': 'Pregnancy / Postpartum',
  'onboarding.zone.surgery': 'Surgery or fracture',
  'onboarding.zone_short.neck': 'Neck',
  'onboarding.zone_short.shoulders': 'Shoulders',
  'onboarding.zone_short.chest': 'Chest',
  'onboarding.zone_short.back': 'Back',
  'onboarding.zone_short.elbows': 'Elbows',
  'onboarding.zone_short.wrists_hands': 'Wrists',
  'onboarding.zone_short.abdomen': 'Abdomen',
  'onboarding.zone_short.hips_glutes': 'Hips',
  'onboarding.zone_short.thighs_calves': 'Thighs',
  'onboarding.zone_short.knees': 'Knees',
  'onboarding.zone_short.ankles_feet': 'Ankles',
  'onboarding.zone_short.pregnancy': 'Pregnancy',
  'onboarding.zone_short.surgery': 'Surgery',

  // ─── Body map views ───
  'onboarding.view.front_left': 'Front view · Left side',
  'onboarding.view.front_right': 'Front view · Right side',
  'onboarding.view.front_both': 'Front view · Both sides',
  'onboarding.view.back_left': 'Back view · Left side',
  'onboarding.view.back_right': 'Back view · Right side',
  'onboarding.view.back_upper': 'Back view · Upper back',
  'onboarding.view.back_lower': 'Back view · Lower back',
  'onboarding.view.back_both': 'Back view · Both sides',

  // ─── Injury conditions ───
  'onboarding.condition.carpal_tunnel': 'Carpal Tunnel',
  'onboarding.condition.tendinitis': 'Tendinitis',
  'onboarding.condition.sprain': 'Sprain',
  'onboarding.condition.arthritis': 'Arthritis',
  'onboarding.condition.post_surgery': 'Post-surgery',

  // ─── 02b · Injury Detail Sheet ───
  'onboarding.injury_sheet.condition_title': "What's the condition?",
  'onboarding.injury_sheet.severity_title': 'How severe is it?',
  'onboarding.injury_sheet.severity_mild': 'Mild',
  'onboarding.injury_sheet.severity_moderate': 'Moderate',
  'onboarding.injury_sheet.severity_severe': 'Severe',
  'onboarding.injury_sheet.notes_hint': 'Anything else to add? (optional)',
  'onboarding.injury_sheet.adapt_title': 'MILON will adapt your plan',
  'onboarding.injury_sheet.avoid': 'AVOID',
  'onboarding.injury_sheet.include': 'INCLUDE',
  'onboarding.injury_sheet.avoid_push_ups': 'Push-ups on palms',
  'onboarding.injury_sheet.avoid_burpees': 'Burpees',
  'onboarding.injury_sheet.avoid_front_squat': 'Barbell front squat',
  'onboarding.injury_sheet.avoid_high_plank': 'High plank holds',
  'onboarding.injury_sheet.include_forearm_plank': 'Forearm plank',
  'onboarding.injury_sheet.include_neutral_press': 'Neutral-grip DB press',
  'onboarding.injury_sheet.include_machine_press': 'Machine chest press',
  'onboarding.injury_sheet.include_leg_press': 'Leg press',
  'onboarding.injury_sheet.disclaimer':
      "MILON isn't a medical device. If pain persists or gets worse, stop and see a health professional.",
  'onboarding.injury_sheet.confirm': 'Confirm & Save',

  // ─── 03 · Environment & Equipment ───
  'onboarding.environment.eyebrow': 'STEP 4 · ENVIRONMENT',
  'onboarding.environment.title': 'Where will you train?',
  'onboarding.environment.subtitle':
      'Your program only uses the equipment you actually have.',
  'onboarding.environment.environment_title': 'Training environment',
  'onboarding.environment.gym_subtitle': 'Full equipment',
  'onboarding.environment.home_subtitle': 'Minimal setup',
  'onboarding.environment.hybrid_subtitle': 'Mix of both',
  'onboarding.environment.equipment_title': 'Available equipment',
  'onboarding.environment.selected_one':
      '@count item selected · You can update this anytime in Profile.',
  'onboarding.environment.selected_other':
      '@count items selected · You can update this anytime in Profile.',
  'onboarding.equipment.bodyweight_only': 'Bodyweight Only',
  'onboarding.equipment.dumbbells': 'Dumbbells',
  'onboarding.equipment.kettlebells': 'Kettlebells',
  'onboarding.equipment.resistance_bands': 'Resistance Bands',
  'onboarding.equipment.pull_up_bar': 'Pull-up Bar',
  'onboarding.equipment.bench': 'Bench',

  // ─── 03b · Schedule & Availability ───
  'onboarding.schedule.eyebrow': 'STEP 5 · AVAILABILITY',
  'onboarding.schedule.title': 'When can you train?',
  'onboarding.schedule.subtitle':
      "We'll fit your program into your real week, with rest days built in.",
  'onboarding.schedule.sessions_title': 'Sessions per week',
  'onboarding.schedule.sessions_accent': '3 recommended',
  'onboarding.schedule.days_title': 'Preferred days',
  'onboarding.schedule.tip':
      'Tip: avoid back-to-back days for the same muscles.',
  'onboarding.schedule.length_title': 'Session length',
  'onboarding.schedule.length_accent': '30 min recommended',
  'onboarding.schedule.time_title': 'Preferred time',
  'onboarding.schedule.morning': 'Morning',
  'onboarding.schedule.morning_range': '6–10 AM',
  'onboarding.schedule.lunch': 'Lunch break',
  'onboarding.schedule.lunch_range': '12–2 PM',
  'onboarding.schedule.evening': 'Evening',
  'onboarding.schedule.evening_range': '6–9 PM',
  'onboarding.schedule.banner':
      '@count × @length min = @duration / week · @days · Reminders at @time',

  // ─── 04a · Food Preferences ───
  'onboarding.food_prefs.eyebrow': 'STEP 6 · FOOD PREFERENCES',
  'onboarding.food_prefs.title': 'What do you like to eat?',
  'onboarding.food_prefs.subtitle':
      "Tell us what you love and what you'd rather avoid. MILON will adapt your meals.",
  'onboarding.food_prefs.search_hint': 'Search a food or ingredient',
  'onboarding.food_prefs.love_title': 'I love',
  'onboarding.food_prefs.dislike_title': "I don't like",
  'onboarding.food_prefs.selected_one': '@count selected',
  'onboarding.food_prefs.selected_other': '@count selected',
  'onboarding.food_prefs.tap_to_add': 'Tap to add',
  'onboarding.food.chicken': 'Chicken',
  'onboarding.food.salmon': 'Salmon',
  'onboarding.food.avocado': 'Avocado',
  'onboarding.food.pasta': 'Pasta',
  'onboarding.food.greek_yogurt': 'Greek yogurt',
  'onboarding.food.berries': 'Berries',
  'onboarding.food.mushrooms': 'Mushrooms',
  'onboarding.food.tuna': 'Tuna',
  'onboarding.food.coriander': 'Coriander',
  'onboarding.food.eggs': 'Eggs',
  'onboarding.food.tofu': 'Tofu',
  'onboarding.food.lentils': 'Lentils',
  'onboarding.food.quinoa': 'Quinoa',
  'onboarding.food.broccoli': 'Broccoli',
  'onboarding.food.sweet_potato': 'Sweet potato',
  'onboarding.food.beef': 'Beef',
  'onboarding.food.shrimp': 'Shrimp',
  'onboarding.food.oats': 'Oats',
  'onboarding.food.chickpeas': 'Chickpeas',
  'onboarding.food.spinach': 'Spinach',
  'onboarding.food.cottage_cheese': 'Cottage cheese',

  // ─── 04 · Nutrition & Budget ───
  'onboarding.nutrition_budget.eyebrow': 'STEP 6 · NUTRITION',
  'onboarding.nutrition_budget.title': 'Your food, your budget',
  'onboarding.nutrition_budget.subtitle':
      "We'll match recipes to your diet and generate a grocery list within budget.",
  'onboarding.nutrition_budget.cta': 'Generate My Plan',
  'onboarding.nutrition_budget.diet_title': 'Dietary preferences',
  'onboarding.nutrition_budget.meals_title': 'Meals per week',
  'onboarding.nutrition_budget.per_day': '@count / day',
  'onboarding.nutrition_budget.budget_title': 'Weekly grocery budget',
  'onboarding.nutrition_budget.weekly_budget': 'WEEKLY BUDGET',
  'onboarding.nutrition_budget.per_meal': '≈ €@cost / meal',
  'onboarding.nutrition_budget.range': '€@min ———————— €@max',
  'onboarding.diet.classic': 'Classic',
  'onboarding.diet.flexitarian': 'Flexitarian',
  'onboarding.diet.vegetarian': 'Vegetarian',
  'onboarding.diet.vegan': 'Vegan',
  'onboarding.diet.halal': 'Halal',
  'onboarding.diet.gluten_free': 'Gluten-Free',
  'onboarding.diet.lactose_free': 'Lactose-Free',

  // ─── 04b · Generating Plan ───
  'onboarding.generating.title': 'Building your plan...',
  'onboarding.generating.duration': 'This takes about 20 seconds.',
  'onboarding.generating.step_profile': 'Analyzing your profile & goal',
  'onboarding.generating.step_injuries': 'Applying injury rules',
  'onboarding.generating.injuries_none':
      'No restrictions · full exercise library',
  'onboarding.generating.injuries_some':
      '@zone · 12 exercises excluded, 9 swapped',
  'onboarding.generating.step_schedule': 'Scheduling your sessions',
  'onboarding.generating.step_recipes': 'Matching recipes to your budget',
  'onboarding.generating.recipes_subtitle': '@diets · €@budget / week',
  'onboarding.generating.step_grocery': 'Generating your grocery list',
  'onboarding.generating.grocery_subtitle': '@count meals for your first week',
  'onboarding.generating.built_by': 'Built by MILON from your answers',

  // ─── 04c · Plan Ready ───
  'onboarding.plan_ready.badge': 'PLAN READY',
  'onboarding.plan_ready.title': "@name, here's your first week",
  'onboarding.plan_ready.cta': 'Start My 7-Day Free Trial',
  'onboarding.plan_ready.review': 'Review plan details',
  'onboarding.plan_ready.goal_eyebrow': 'YOUR GOAL · @goal',
  'onboarding.plan_ready.target': 'Target',
  'onboarding.plan_ready.pace_note':
      'About @pace kg per week. This is an estimate, not a guarantee. We adjust every week with your check-in.',
  'onboarding.plan_ready.training': 'TRAINING',
  'onboarding.plan_ready.sessions_per_week': '@count × @length min / week',
  'onboarding.plan_ready.full_body_env': 'Full Body · @environment',
  'onboarding.plan_ready.tailored': 'Tailored to your level',
  'onboarding.plan_ready.wrist_safe': 'Wrist-safe moves only',
  'onboarding.plan_ready.nutrition': 'NUTRITION',
  'onboarding.plan_ready.kcal_per_day': '1,485 kcal / day',
  'onboarding.plan_ready.macros': 'P 125g · C 145g · F 45g',
  'onboarding.plan_ready.meals_cost': '@count meals · ≈ €@cost / wk',
  'onboarding.plan_ready.week_title': 'Week 1 · Nov 16–22',
  'onboarding.plan_ready.rest_included': 'Rest days included',
  'onboarding.plan_ready.adapted_title': 'Adapted for you',
  'onboarding.workout.full_body_a': 'Full Body A',
  'onboarding.workout.full_body_b': 'Full Body B',
  'onboarding.workout.lower_core': 'Lower + Core',
  'onboarding.workout.cardio_circuit': 'Cardio circuit',
  'onboarding.workout.upper_body': 'Upper Body',
  'onboarding.workout.mobility_core': 'Mobility & Core',
  'onboarding.workout.active_walk': 'Active walk',
  'onboarding.workout.rest': 'Rest',

  // ─── 04d · Notifications & Apple Health ───
  'onboarding.notifications.eyebrow': 'ALMOST THERE',
  'onboarding.notifications.title': 'Stay on track, gently',
  'onboarding.notifications.subtitle':
      'Helpful reminders, never spam. You choose the timing.',
  'onboarding.notifications.cta': 'Turn On Notifications',
  'onboarding.notifications.not_now': 'Not now',
  'onboarding.notifications.preview_workout':
      "Your Full Body session is ready: @minutes min at @place. Let's go!",
  'onboarding.notifications.place_gym': 'gym',
  'onboarding.notifications.place_home': 'home',
  'onboarding.notifications.place_hybrid': 'hybrid',
  'onboarding.notifications.preview_checkin_title': 'MILON · Sunday',
  'onboarding.notifications.preview_checkin_body':
      '2-min weekly check-in: how was your week?',
  'onboarding.notifications.workout_reminders': 'Workout reminders',
  'onboarding.notifications.meal_nudges': 'Meal & water nudges',
  'onboarding.notifications.meal_nudges_subtitle':
      'Lunch 12:15 PM · Dinner 7:00 PM',
  'onboarding.notifications.weekly_checkin': 'Weekly check-in',
  'onboarding.notifications.weekly_checkin_subtitle':
      'Sunday evening · 2 minutes',
  'onboarding.notifications.motivation_title':
      'Motivation messages from MILON Coach',
  'onboarding.notifications.frequency_daily': 'Daily',
  'onboarding.notifications.frequency_three_per_week': '3× a week',
  'onboarding.notifications.frequency_weekly': 'Weekly',
  'onboarding.notifications.frequency_off': 'Off',
  'onboarding.notifications.motivation_note':
      'Short check-ins and encouragement. 3× a week is recommended.',
  'onboarding.notifications.apple_health_title': 'Connect Apple Health',
  'onboarding.notifications.apple_health_subtitle':
      'Sync workouts, steps and weight automatically',
  'onboarding.notifications.connected': 'Connected',
  'onboarding.notifications.connect': 'Connect',
};

const Map<String, String> onboardingFr = {
  // ─── Common ───
  'onboarding.common.continue': 'Continuer',
  'onboarding.common.friend': 'Ami·e',
  'onboarding.common.other': 'Autre',
  'onboarding.common.today': "Aujourd'hui",
  'onboarding.common.yrs': 'ans',
  'onboarding.common.weeks_approx': '~@weeks semaines',
  'onboarding.common.euro': '@amount €',
  'onboarding.common.decimal_separator': ',',
  'onboarding.common.date_short': '@day @month',

  // ─── Months (short) ───
  'onboarding.month.jan': 'janv.',
  'onboarding.month.feb': 'févr.',
  'onboarding.month.mar': 'mars',
  'onboarding.month.apr': 'avr.',
  'onboarding.month.may': 'mai',
  'onboarding.month.jun': 'juin',
  'onboarding.month.jul': 'juil.',
  'onboarding.month.aug': 'août',
  'onboarding.month.sep': 'sept.',
  'onboarding.month.oct': 'oct.',
  'onboarding.month.nov': 'nov.',
  'onboarding.month.dec': 'déc.',

  // ─── Week days ───
  'onboarding.day.mon': 'Lun',
  'onboarding.day.tue': 'Mar',
  'onboarding.day.wed': 'Mer',
  'onboarding.day.thu': 'Jeu',
  'onboarding.day.fri': 'Ven',
  'onboarding.day.sat': 'Sam',
  'onboarding.day.sun': 'Dim',
  'onboarding.day_letter.mon': 'L',
  'onboarding.day_letter.tue': 'M',
  'onboarding.day_letter.wed': 'M',
  'onboarding.day_letter.thu': 'J',
  'onboarding.day_letter.fri': 'V',
  'onboarding.day_letter.sat': 'S',
  'onboarding.day_letter.sun': 'D',

  // ─── Shared option labels ───
  'onboarding.goal.lose_weight': 'Perdre du poids',
  'onboarding.goal.build_muscle': 'Prendre du muscle',
  'onboarding.goal.stay_fit': 'Rester en forme',
  'onboarding.env.gym': 'Salle',
  'onboarding.env.home': 'Maison',
  'onboarding.env.hybrid': 'Hybride',
  'onboarding.time.morning_reminder': '7h00',
  'onboarding.time.lunch_reminder': '12h15',
  'onboarding.time.evening_reminder': '18h30',

  // ─── 01 · Profile & Goals ───
  'onboarding.profile_goals.eyebrow': 'ÉTAPE 1 · PROFIL & OBJECTIFS',
  'onboarding.profile_goals.title': 'Créons votre programme',
  'onboarding.profile_goals.subtitle':
      'Quelques informations de base pour que MILON personnalise vos séances et vos repas.',
  'onboarding.profile_goals.name_title': 'Comment dois-je vous appeler ?',
  'onboarding.profile_goals.name_hint': 'Votre prénom',
  'onboarding.profile_goals.name_helper':
      "Votre prénom. MILON Coach l'utilisera dans ses messages.",
  'onboarding.profile_goals.gender_title': 'Genre',
  'onboarding.profile_goals.gender_female': 'Femme',
  'onboarding.profile_goals.gender_male': 'Homme',
  'onboarding.profile_goals.demo_title': 'Qui doit montrer vos exercices ?',
  'onboarding.profile_goals.demo_woman': 'Une femme',
  'onboarding.profile_goals.demo_man': 'Un homme',
  'onboarding.profile_goals.demo_helper':
      'Les vidéos et photos montreront ce modèle. Vous pouvez le modifier à tout moment dans les Réglages.',
  'onboarding.profile_goals.metrics_title': 'Âge, taille & poids',
  'onboarding.profile_goals.age': 'Âge',
  'onboarding.profile_goals.height': 'Taille',
  'onboarding.profile_goals.weight': 'Poids',
  'onboarding.profile_goals.goal_title': 'Objectif principal',
  'onboarding.profile_goals.activity_title': "Niveau d'activité quotidien",
  'onboarding.profile_goals.sedentary_title': 'Sédentaire / Travail de bureau',
  'onboarding.profile_goals.sedentary_subtitle':
      'Surtout assis·e, < 5 000 pas par jour',
  'onboarding.profile_goals.active_title': 'Actif·ve',
  'onboarding.profile_goals.active_subtitle':
      'Souvent debout, 5 000 à 10 000 pas par jour',
  'onboarding.profile_goals.very_active_title': 'Très actif·ve',
  'onboarding.profile_goals.very_active_subtitle':
      'Travail physique ou plus de 10 000 pas par jour',

  // ─── 01b · Target Weight & Pace ───
  'onboarding.target_weight.eyebrow': 'ÉTAPE 2 · VOTRE OBJECTIF',
  'onboarding.target_weight.title': 'Quel poids visez-vous ?',
  'onboarding.target_weight.subtitle':
      'Choisissez un objectif réaliste. Des progrès réguliers durent plus longtemps.',
  'onboarding.target_weight.delta_maintain':
      'Maintenir le poids actuel (@current kg)',
  'onboarding.target_weight.delta_change':
      "@delta kg par rapport à aujourd'hui (@current kg)",
  'onboarding.target_weight.pace_title': 'Votre rythme',
  'onboarding.target_weight.recommended_pace': 'Rythme recommandé',
  'onboarding.target_weight.pace_maintenance':
      'Rythme de maintien régulier pour des résultats durables',
  'onboarding.target_weight.pace_change':
      '@pace kg / semaine, le rythme le plus sûr pour des résultats durables',
  'onboarding.target_weight.reach_by':
      'Vous pourriez atteindre @target kg vers le @date',
  'onboarding.target_weight.today_weight': "Aujourd'hui · @current kg",
  'onboarding.target_weight.estimate_note':
      "Estimation basée sur @pace kg par semaine. Une perte plus rapide n'est pas recommandée. Nous ajustons chaque semaine.",
  'onboarding.target_weight.healthy_range':
      'Fourchette saine pour @height cm : @range. MILON ne fixe jamais vos apports en dessous de 1 200 kcal/jour.',

  // ─── 01c · With MILON ───
  'onboarding.with_milon.eyebrow': 'VOTRE OBJECTIF, À PORTÉE DE MAIN',
  'onboarding.with_milon.title_prefix':
      '@name, avec MILON vous pouvez atteindre ',
  'onboarding.with_milon.title_suffix': " d'ici le @date",
  'onboarding.with_milon.cta': "C'est parti",
  'onboarding.with_milon.pace_note':
      'Un rythme régulier de @pace kg par semaine, environ @weeks semaines. En douceur et en toute sécurité, pour des résultats durables.',
  'onboarding.with_milon.benefits_title': 'Avec MILON, vous profitez de',
  'onboarding.with_milon.workouts_title': 'Des séances conçues pour vous',
  'onboarding.with_milon.workouts_subtitle':
      'Adaptées à votre corps, vos blessures, votre équipement et votre emploi du temps',
  'onboarding.with_milon.meals_title': 'Des repas adaptés à votre budget',
  'onboarding.with_milon.meals_subtitle':
      "Un plan de repas hebdomadaire et une liste de courses, prêts à l'emploi",
  'onboarding.with_milon.coach_title': 'Un coach à vos côtés',
  'onboarding.with_milon.coach_subtitle':
      'MILON Coach fait le point avec vous et ajuste votre programme chaque semaine',

  // ─── 01d · Health Screening ───
  'onboarding.health.title': 'Votre santé',
  'onboarding.health.subtitle':
      'Répondez honnêtement pour que nous puissions adapter votre programme. MILON ne remplace pas un médecin.',
  'onboarding.health.condition_heart':
      "Problème cardiaque ou douleur thoracique à l'effort",
  'onboarding.health.condition_blood_pressure':
      'Hypertension artérielle non contrôlée',
  'onboarding.health.condition_kidney': 'Maladie rénale',
  'onboarding.health.condition_surgery': 'Opération ou blessure récente',
  'onboarding.health.condition_diabetes': 'Diabète',
  'onboarding.health.condition_pregnant': 'Enceinte ou allaitante',
  'onboarding.health.condition_eating_disorder':
      'Trouble du comportement alimentaire, actuel ou passé',
  'onboarding.health.condition_treatment': 'Traitement médical en cours',
  'onboarding.health.adapt_title': "Si vous en activez un, MILON s'adapte :",
  'onboarding.health.adapt_rules':
      '• Trouble alimentaire → pas de comptage des calories, coaching basé uniquement sur les habitudes\n'
      "• Grossesse → pas d'objectif de perte de poids, mouvements adaptés à la grossesse\n"
      "• Cœur, tension artérielle, reins, diabète → nous demandons d'abord l'accord de votre médecin",
  'onboarding.health.consent':
      "J'accepte que MILON traite mes données de santé pour personnaliser mon programme. Je peux retirer mon consentement à tout moment.",

  // ─── 02a · Anything to Report ───
  'onboarding.report.eyebrow': 'ÉTAPE 3 · ZONES SENSIBLES',
  'onboarding.report.title': 'Y a-t-il quelque chose à signaler ?',
  'onboarding.report.subtitle':
      "Une douleur, une blessure ou un mouvement qui vous gêne ? J'adapterai vos séances en conséquence.",
  'onboarding.report.no_title': 'Non, tout va bien',
  'onboarding.report.no_subtitle': 'Aucune douleur, aucune gêne',
  'onboarding.report.yes_title': 'Oui, je vous montre',
  'onboarding.report.yes_subtitle': "J'indique l'endroit qui me gêne",

  // ─── 02 · Injury Body Map ───
  'onboarding.body_map.eyebrow': 'ÉTAPE 3 · ZONES SENSIBLES',
  'onboarding.body_map.title': 'Des blessures ou des zones sensibles ?',
  'onboarding.body_map.subtitle':
      'Touchez une zone du corps. MILON adaptera automatiquement chaque exercice pour la protéger.',
  'onboarding.body_map.legend_selected': 'Sélectionnée',
  'onboarding.body_map.legend_tap': 'Touchez pour signaler',
  'onboarding.body_map.list_title': 'Ou choisissez dans la liste',
  'onboarding.body_map.skip_banner':
      'Aucune blessure ? Passez cette étape. Vous pourrez en ajouter plus tard dans votre Profil.',
  'onboarding.body_map.front': 'FACE',
  'onboarding.body_map.back': 'DOS',

  // ─── Body zones ───
  'onboarding.zone.neck': 'Cou',
  'onboarding.zone.shoulders': 'Épaules',
  'onboarding.zone.chest': 'Poitrine',
  'onboarding.zone.back': 'Dos',
  'onboarding.zone.elbows': 'Coudes',
  'onboarding.zone.wrists_hands': 'Poignets & mains',
  'onboarding.zone.abdomen': 'Abdomen',
  'onboarding.zone.hips_glutes': 'Hanches & fessiers',
  'onboarding.zone.thighs_calves': 'Cuisses & mollets',
  'onboarding.zone.knees': 'Genoux',
  'onboarding.zone.ankles_feet': 'Chevilles & pieds',
  'onboarding.zone.pregnancy': 'Grossesse / Post-partum',
  'onboarding.zone.surgery': 'Opération ou fracture',
  'onboarding.zone_short.neck': 'Cou',
  'onboarding.zone_short.shoulders': 'Épaules',
  'onboarding.zone_short.chest': 'Poitrine',
  'onboarding.zone_short.back': 'Dos',
  'onboarding.zone_short.elbows': 'Coudes',
  'onboarding.zone_short.wrists_hands': 'Poignets',
  'onboarding.zone_short.abdomen': 'Abdomen',
  'onboarding.zone_short.hips_glutes': 'Hanches',
  'onboarding.zone_short.thighs_calves': 'Cuisses',
  'onboarding.zone_short.knees': 'Genoux',
  'onboarding.zone_short.ankles_feet': 'Chevilles',
  'onboarding.zone_short.pregnancy': 'Grossesse',
  'onboarding.zone_short.surgery': 'Opération',

  // ─── Body map views ───
  'onboarding.view.front_left': 'Vue de face · Côté gauche',
  'onboarding.view.front_right': 'Vue de face · Côté droit',
  'onboarding.view.front_both': 'Vue de face · Des deux côtés',
  'onboarding.view.back_left': 'Vue de dos · Côté gauche',
  'onboarding.view.back_right': 'Vue de dos · Côté droit',
  'onboarding.view.back_upper': 'Vue de dos · Haut du dos',
  'onboarding.view.back_lower': 'Vue de dos · Bas du dos',
  'onboarding.view.back_both': 'Vue de dos · Des deux côtés',

  // ─── Injury conditions ───
  'onboarding.condition.carpal_tunnel': 'Canal carpien',
  'onboarding.condition.tendinitis': 'Tendinite',
  'onboarding.condition.sprain': 'Entorse',
  'onboarding.condition.arthritis': 'Arthrite',
  'onboarding.condition.post_surgery': 'Post-opératoire',

  // ─── 02b · Injury Detail Sheet ───
  'onboarding.injury_sheet.condition_title': "De quoi s'agit-il ?",
  'onboarding.injury_sheet.severity_title': 'Quelle est la gravité ?',
  'onboarding.injury_sheet.severity_mild': 'Légère',
  'onboarding.injury_sheet.severity_moderate': 'Modérée',
  'onboarding.injury_sheet.severity_severe': 'Sévère',
  'onboarding.injury_sheet.notes_hint': 'Autre chose à ajouter ? (facultatif)',
  'onboarding.injury_sheet.adapt_title': 'MILON adaptera votre programme',
  'onboarding.injury_sheet.avoid': 'À ÉVITER',
  'onboarding.injury_sheet.include': 'À INCLURE',
  'onboarding.injury_sheet.avoid_push_ups': 'Pompes sur les paumes',
  'onboarding.injury_sheet.avoid_burpees': 'Burpees',
  'onboarding.injury_sheet.avoid_front_squat': 'Front squat à la barre',
  'onboarding.injury_sheet.avoid_high_plank': 'Gainage en planche haute',
  'onboarding.injury_sheet.include_forearm_plank': 'Planche sur les avant-bras',
  'onboarding.injury_sheet.include_neutral_press':
      'Développé haltères prise neutre',
  'onboarding.injury_sheet.include_machine_press':
      'Développé pectoraux à la machine',
  'onboarding.injury_sheet.include_leg_press': 'Presse à cuisses',
  'onboarding.injury_sheet.disclaimer':
      "MILON n'est pas un dispositif médical. Si la douleur persiste ou s'aggrave, arrêtez et consultez un professionnel de santé.",
  'onboarding.injury_sheet.confirm': 'Confirmer & enregistrer',

  // ─── 03 · Environment & Equipment ───
  'onboarding.environment.eyebrow': 'ÉTAPE 4 · ENVIRONNEMENT',
  'onboarding.environment.title': 'Où allez-vous vous entraîner ?',
  'onboarding.environment.subtitle':
      "Votre programme n'utilise que l'équipement dont vous disposez vraiment.",
  'onboarding.environment.environment_title': "Lieu d'entraînement",
  'onboarding.environment.gym_subtitle': 'Équipement complet',
  'onboarding.environment.home_subtitle': 'Équipement minimal',
  'onboarding.environment.hybrid_subtitle': 'Un mélange des deux',
  'onboarding.environment.equipment_title': 'Équipement disponible',
  'onboarding.environment.selected_one':
      '@count équipement sélectionné · Vous pouvez le modifier à tout moment dans votre Profil.',
  'onboarding.environment.selected_other':
      '@count équipements sélectionnés · Vous pouvez les modifier à tout moment dans votre Profil.',
  'onboarding.equipment.bodyweight_only': 'Poids du corps',
  'onboarding.equipment.dumbbells': 'Haltères',
  'onboarding.equipment.kettlebells': 'Kettlebells',
  'onboarding.equipment.resistance_bands': 'Bandes élastiques',
  'onboarding.equipment.pull_up_bar': 'Barre de traction',
  'onboarding.equipment.bench': 'Banc',

  // ─── 03b · Schedule & Availability ───
  'onboarding.schedule.eyebrow': 'ÉTAPE 5 · DISPONIBILITÉS',
  'onboarding.schedule.title': 'Quand pouvez-vous vous entraîner ?',
  'onboarding.schedule.subtitle':
      'Nous intégrons votre programme à votre vraie semaine, jours de repos compris.',
  'onboarding.schedule.sessions_title': 'Séances par semaine',
  'onboarding.schedule.sessions_accent': '3 recommandées',
  'onboarding.schedule.days_title': 'Jours préférés',
  'onboarding.schedule.tip':
      "Conseil : évitez de travailler les mêmes muscles deux jours d'affilée.",
  'onboarding.schedule.length_title': 'Durée des séances',
  'onboarding.schedule.length_accent': '30 min recommandées',
  'onboarding.schedule.time_title': 'Moment préféré',
  'onboarding.schedule.morning': 'Matin',
  'onboarding.schedule.morning_range': '6h–10h',
  'onboarding.schedule.lunch': 'Pause déjeuner',
  'onboarding.schedule.lunch_range': '12h–14h',
  'onboarding.schedule.evening': 'Soir',
  'onboarding.schedule.evening_range': '18h–21h',
  'onboarding.schedule.banner':
      '@count × @length min = @duration / semaine · @days · Rappels à @time',

  // ─── 04a · Food Preferences ───
  'onboarding.food_prefs.eyebrow': 'ÉTAPE 6 · PRÉFÉRENCES ALIMENTAIRES',
  'onboarding.food_prefs.title': "Qu'aimez-vous manger ?",
  'onboarding.food_prefs.subtitle':
      'Dites-nous ce que vous aimez et ce que vous préférez éviter. MILON adaptera vos repas.',
  'onboarding.food_prefs.search_hint': 'Rechercher un aliment ou un ingrédient',
  'onboarding.food_prefs.love_title': "J'adore",
  'onboarding.food_prefs.dislike_title': "Je n'aime pas",
  'onboarding.food_prefs.selected_one': '@count sélectionné',
  'onboarding.food_prefs.selected_other': '@count sélectionnés',
  'onboarding.food_prefs.tap_to_add': 'Touchez pour ajouter',
  'onboarding.food.chicken': 'Poulet',
  'onboarding.food.salmon': 'Saumon',
  'onboarding.food.avocado': 'Avocat',
  'onboarding.food.pasta': 'Pâtes',
  'onboarding.food.greek_yogurt': 'Yaourt grec',
  'onboarding.food.berries': 'Fruits rouges',
  'onboarding.food.mushrooms': 'Champignons',
  'onboarding.food.tuna': 'Thon',
  'onboarding.food.coriander': 'Coriandre',
  'onboarding.food.eggs': 'Œufs',
  'onboarding.food.tofu': 'Tofu',
  'onboarding.food.lentils': 'Lentilles',
  'onboarding.food.quinoa': 'Quinoa',
  'onboarding.food.broccoli': 'Brocoli',
  'onboarding.food.sweet_potato': 'Patate douce',
  'onboarding.food.beef': 'Bœuf',
  'onboarding.food.shrimp': 'Crevettes',
  'onboarding.food.oats': "Flocons d'avoine",
  'onboarding.food.chickpeas': 'Pois chiches',
  'onboarding.food.spinach': 'Épinards',
  'onboarding.food.cottage_cheese': 'Cottage cheese',

  // ─── 04 · Nutrition & Budget ───
  'onboarding.nutrition_budget.eyebrow': 'ÉTAPE 6 · NUTRITION',
  'onboarding.nutrition_budget.title': 'Vos repas, votre budget',
  'onboarding.nutrition_budget.subtitle':
      'Nous choisissons des recettes adaptées à votre alimentation et générons une liste de courses dans votre budget.',
  'onboarding.nutrition_budget.cta': 'Générer mon programme',
  'onboarding.nutrition_budget.diet_title': 'Préférences alimentaires',
  'onboarding.nutrition_budget.meals_title': 'Repas par semaine',
  'onboarding.nutrition_budget.per_day': '@count / jour',
  'onboarding.nutrition_budget.budget_title': 'Budget courses hebdomadaire',
  'onboarding.nutrition_budget.weekly_budget': 'BUDGET HEBDO',
  'onboarding.nutrition_budget.per_meal': '≈ @cost € / repas',
  'onboarding.nutrition_budget.range': '@min € ———————— @max €',
  'onboarding.diet.classic': 'Classique',
  'onboarding.diet.flexitarian': 'Flexitarien',
  'onboarding.diet.vegetarian': 'Végétarien',
  'onboarding.diet.vegan': 'Végan',
  'onboarding.diet.halal': 'Halal',
  'onboarding.diet.gluten_free': 'Sans gluten',
  'onboarding.diet.lactose_free': 'Sans lactose',

  // ─── 04b · Generating Plan ───
  'onboarding.generating.title': 'Création de votre programme…',
  'onboarding.generating.duration': 'Cela prend environ 20 secondes.',
  'onboarding.generating.step_profile': 'Analyse de votre profil & objectif',
  'onboarding.generating.step_injuries':
      'Application des règles liées aux blessures',
  'onboarding.generating.injuries_none':
      "Aucune restriction · bibliothèque d'exercices complète",
  'onboarding.generating.injuries_some':
      '@zone · 12 exercices exclus, 9 remplacés',
  'onboarding.generating.step_schedule': 'Planification de vos séances',
  'onboarding.generating.step_recipes':
      'Sélection de recettes adaptées à votre budget',
  'onboarding.generating.recipes_subtitle': '@diets · @budget € / semaine',
  'onboarding.generating.step_grocery': 'Création de votre liste de courses',
  'onboarding.generating.grocery_subtitle':
      '@count repas pour votre première semaine',
  'onboarding.generating.built_by': 'Conçu par MILON à partir de vos réponses',

  // ─── 04c · Plan Ready ───
  'onboarding.plan_ready.badge': 'PROGRAMME PRÊT',
  'onboarding.plan_ready.title': '@name, voici votre première semaine',
  'onboarding.plan_ready.cta': 'Commencer mon essai gratuit de 7 jours',
  'onboarding.plan_ready.review': 'Voir le détail du programme',
  'onboarding.plan_ready.goal_eyebrow': 'VOTRE OBJECTIF · @goal',
  'onboarding.plan_ready.target': 'Objectif',
  'onboarding.plan_ready.pace_note':
      "Environ @pace kg par semaine. Il s'agit d'une estimation, pas d'une garantie. Nous ajustons chaque semaine grâce à votre bilan.",
  'onboarding.plan_ready.training': 'ENTRAÎNEMENT',
  'onboarding.plan_ready.sessions_per_week': '@count × @length min / semaine',
  'onboarding.plan_ready.full_body_env': 'Full Body · @environment',
  'onboarding.plan_ready.tailored': 'Adapté à votre niveau',
  'onboarding.plan_ready.wrist_safe':
      'Mouvements sans risque pour les poignets',
  'onboarding.plan_ready.nutrition': 'NUTRITION',
  'onboarding.plan_ready.kcal_per_day': '1 485 kcal / jour',
  'onboarding.plan_ready.macros': 'P 125g · G 145g · L 45g',
  'onboarding.plan_ready.meals_cost': '@count repas · ≈ @cost € / sem.',
  'onboarding.plan_ready.week_title': 'Semaine 1 · 16–22 nov.',
  'onboarding.plan_ready.rest_included': 'Jours de repos inclus',
  'onboarding.plan_ready.adapted_title': 'Adapté pour vous',
  'onboarding.workout.full_body_a': 'Full Body A',
  'onboarding.workout.full_body_b': 'Full Body B',
  'onboarding.workout.lower_core': 'Bas du corps + gainage',
  'onboarding.workout.cardio_circuit': 'Circuit cardio',
  'onboarding.workout.upper_body': 'Haut du corps',
  'onboarding.workout.mobility_core': 'Mobilité & gainage',
  'onboarding.workout.active_walk': 'Marche active',
  'onboarding.workout.rest': 'Repos',

  // ─── 04d · Notifications & Apple Health ───
  'onboarding.notifications.eyebrow': 'PRESQUE FINI',
  'onboarding.notifications.title': 'Gardez le cap, en douceur',
  'onboarding.notifications.subtitle':
      'Des rappels utiles, jamais de spam. Vous choisissez le moment.',
  'onboarding.notifications.cta': 'Activer les notifications',
  'onboarding.notifications.not_now': 'Plus tard',
  'onboarding.notifications.preview_workout':
      "Votre séance Full Body est prête : @minutes min @place. C'est parti !",
  'onboarding.notifications.place_gym': 'à la salle',
  'onboarding.notifications.place_home': 'à la maison',
  'onboarding.notifications.place_hybrid': 'en mode hybride',
  'onboarding.notifications.preview_checkin_title': 'MILON · Dimanche',
  'onboarding.notifications.preview_checkin_body':
      "Bilan hebdo de 2 min : comment s'est passée votre semaine ?",
  'onboarding.notifications.workout_reminders': "Rappels d'entraînement",
  'onboarding.notifications.meal_nudges': 'Rappels repas & hydratation',
  'onboarding.notifications.meal_nudges_subtitle':
      'Déjeuner 12h15 · Dîner 19h00',
  'onboarding.notifications.weekly_checkin': 'Bilan hebdomadaire',
  'onboarding.notifications.weekly_checkin_subtitle':
      'Dimanche soir · 2 minutes',
  'onboarding.notifications.motivation_title':
      'Messages de motivation de MILON Coach',
  'onboarding.notifications.frequency_daily': 'Chaque jour',
  'onboarding.notifications.frequency_three_per_week': '3× / sem.',
  'onboarding.notifications.frequency_weekly': 'Hebdo',
  'onboarding.notifications.frequency_off': 'Jamais',
  'onboarding.notifications.motivation_note':
      'De courts bilans et des encouragements. 3× par semaine est recommandé.',
  'onboarding.notifications.apple_health_title': 'Connecter Apple Health',
  'onboarding.notifications.apple_health_subtitle':
      'Synchronisez automatiquement vos séances, vos pas et votre poids',
  'onboarding.notifications.connected': 'Connecté',
  'onboarding.notifications.connect': 'Connecter',
};
