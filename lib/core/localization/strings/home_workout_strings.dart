// Home & Workout strings. Keys: 'home_workout.<screen>.<name>'.
// Keep both maps in the same order with identical keys.
//
// Exercise and workout names (e.g. "Goblet Squat", "Full Body") are mock
// backend content and intentionally stay in English in both languages.

const Map<String, String> homeWorkoutEn = {
  // ─── Shared ───
  'home_workout.common.sets': 'sets',
  'home_workout.common.min': 'min',
  'home_workout.common.exercises': 'exercises',
  'home_workout.common.kcal': 'kcal',
  'home_workout.common.grams_suffix': 'g',
  'home_workout.common.rest': 'REST',
  'home_workout.common.minus_15s': '−15s',
  'home_workout.common.plus_15s': '+15s',

  // ─── 05 · Home — Daily Planner ───
  'home_workout.home.hello': 'Hello, @name',
  'home_workout.home.today_date': 'Wednesday, Nov 18',
  'home_workout.home.month_label': 'November 2026',
  'home_workout.home.streak': '@count-day streak',
  'home_workout.home.weekday_mon': 'Mon',
  'home_workout.home.weekday_tue': 'Tue',
  'home_workout.home.weekday_wed': 'Wed',
  'home_workout.home.weekday_thu': 'Thu',
  'home_workout.home.weekday_fri': 'Fri',
  'home_workout.home.weekday_sat': 'Sat',
  'home_workout.home.weekday_sun': 'Sun',
  'home_workout.home.generate_plan': 'Generate My Personalized Plan',
  'home_workout.home.todays_meals': "Today's meals",
  'home_workout.home.planned_logged': '@logged / @planned planned logged',
  'home_workout.home.new_badge': 'NEW',
  'home_workout.home.todays_workout': "TODAY'S WORKOUT",
  'home_workout.home.workout_meta': '45 min · Home',
  'home_workout.home.workout_kcal_moves': '~@kcal kcal · @count moves',
  'home_workout.home.start': 'Start',
  'home_workout.home.planned_count': '@count PLANNED',
  'home_workout.home.todays_nutrition': "TODAY'S NUTRITION",
  'home_workout.home.protein_target': '@amount Protein',
  'home_workout.home.protein': 'Protein',
  'home_workout.home.protein_progress': '@logged / @target',
  'home_workout.home.view_plan': 'View Plan',
  'home_workout.home.meal_tag_breakfast': 'BREAKFAST · YOUR CHOICE',
  'home_workout.home.meal_tag_lunch': 'LUNCH · PLANNED',
  'home_workout.home.meal_tag_snack': 'SNACK · YOUR CHOICE',
  'home_workout.home.meal_tag_dinner': 'DINNER · PLANNED',
  'home_workout.home.meal_title_breakfast': 'Soy Yogurt Power Bowl',
  'home_workout.home.meal_title_lunch': 'Grilled Tofu & Egg Salad',
  'home_workout.home.meal_title_snack': 'Apple & Almond Butter',
  'home_workout.home.meal_title_dinner': 'Chicken Quinoa Stir-fry',
  'home_workout.home.meal_prep_breakfast': 'Prep 5 min',
  'home_workout.home.meal_prep_lunch': 'Prep 10 · Cook 5 min',
  'home_workout.home.meal_prep_snack': 'Prep 2 min',
  'home_workout.home.meal_prep_dinner': 'Prep 10 · Cook 15 min',

  // ─── 05b · Home — Free Plan ───
  'home_workout.free_plan.badge': 'FREE PLAN',
  'home_workout.free_plan.scans_left': '@count free photo scans left',
  'home_workout.free_plan.scans_subtitle':
      'Snap your plate to get calories & macros',
  'home_workout.free_plan.free_session': 'YOUR FREE SESSION',
  'home_workout.free_plan.included': 'Included',
  'home_workout.free_plan.session_title': '@workout · 45 min · Home',
  'home_workout.free_plan.session_meta': 'Wrist-safe · 6 exercises',
  'home_workout.free_plan.start_free_session': 'Start Free Session',
  'home_workout.free_plan.locked_title': 'Your full program is waiting',
  'home_workout.free_plan.locked_body':
      'Meal plan, grocery list, all 4 weekly sessions and your MILON Coach.',
  'home_workout.free_plan.try_free': 'Try 7 Days Free',
  'home_workout.free_plan.then_price':
      'Then annual price (TBC) · cancel anytime',

  // ─── Muscles ───
  'home_workout.muscles.quadriceps': 'Quadriceps',
  'home_workout.muscles.glutes': 'Glutes',
  'home_workout.muscles.hamstrings': 'Hamstrings',
  'home_workout.muscles.chest': 'Chest',
  'home_workout.muscles.triceps': 'Triceps',
  'home_workout.muscles.core': 'Core',
  'home_workout.muscles.shoulders': 'Shoulders',
  'home_workout.muscles.other': 'Other',

  // ─── 06 · Workout — Session Overview ───
  'home_workout.overview.plan_badge': 'MILON PLAN · WEEK @week · DAY @day',
  'home_workout.overview.meta': '45 min · Home · 6 exercises · Intermediate',
  'home_workout.overview.targeted_muscles': 'Targeted muscles',
  'home_workout.overview.muscle_share': '@muscle @percent%',
  'home_workout.overview.wrist_title': 'Adapted to protect your wrists',
  'home_workout.overview.wrist_body':
      'Push-ups swapped for neutral-grip press. Planks done on forearms.',
  'home_workout.overview.exercises': 'Exercises',
  'home_workout.overview.moves_sets': '@moves moves · @sets sets',
  'home_workout.overview.start_workout': 'Start Workout',

  // ─── 07 · Workout — Exercise Detail ───
  'home_workout.exercise_detail.demo': 'Demo · @duration',
  'home_workout.exercise_detail.pro_tip': 'PRO TIP',
  'home_workout.exercise_detail.how_to': 'How to do it',
  'home_workout.exercise_detail.muscles_worked': 'Muscles worked',
  'home_workout.exercise_detail.front': 'FRONT',
  'home_workout.exercise_detail.back': 'BACK',
  'home_workout.exercise_detail.primary': 'Primary · Quads, Glutes',
  'home_workout.exercise_detail.assisted': 'Assisted · Core, Calves',

  // ─── Exercise content (mock; names stay in English) ───
  'home_workout.exercises.goblet_squat.sets_reps': '3 sets × 12 reps · 15 kg',
  'home_workout.exercises.goblet_squat.equipment': 'Dumbbell · 15 kg',
  'home_workout.exercises.goblet_squat.target': '3 × 12',
  'home_workout.exercises.goblet_squat.pro_tip':
      'Keep the dumbbell close to your chest and drive through your heels. Never let your knees cave in.',
  'home_workout.exercises.goblet_squat.step_1':
      'Stand with feet shoulder-width apart, toes slightly turned out.',
  'home_workout.exercises.goblet_squat.step_2':
      'Hold one dumbbell vertically against your chest with both hands.',
  'home_workout.exercises.goblet_squat.step_3':
      'Brace your core and keep your chest tall and proud.',
  'home_workout.exercises.goblet_squat.step_4':
      'Push your hips back and bend your knees to lower down.',
  'home_workout.exercises.goblet_squat.step_5':
      'Descend until your thighs are parallel to the floor.',
  'home_workout.exercises.goblet_squat.step_6':
      'Drive through your heels to return to standing. Exhale.',
  'home_workout.exercises.romanian_deadlift.sets_reps':
      '3 sets × 10 reps · 20 kg',
  'home_workout.exercises.romanian_deadlift.equipment': 'Dumbbells · 20 kg',
  'home_workout.exercises.romanian_deadlift.target': '3 × 10',
  'home_workout.exercises.romanian_deadlift.pro_tip':
      'Hinge at the hips with soft knees and keep the dumbbells grazing your thighs.',
  'home_workout.exercises.romanian_deadlift.step_1':
      'Stand tall holding dumbbells in front of your thighs.',
  'home_workout.exercises.romanian_deadlift.step_2':
      'Slightly unlock your knees and brace your core.',
  'home_workout.exercises.romanian_deadlift.step_3':
      'Push your hips straight back while keeping your spine neutral.',
  'home_workout.exercises.romanian_deadlift.step_4':
      'Lower until you feel a deep stretch in your hamstrings.',
  'home_workout.exercises.romanian_deadlift.step_5':
      'Drive hips forward and squeeze glutes to stand back up.',
  'home_workout.exercises.incline_db_press.sets_reps':
      '3 sets × 12 reps · 10 kg',
  'home_workout.exercises.incline_db_press.equipment': 'Dumbbells · 10 kg',
  'home_workout.exercises.incline_db_press.target': '3 × 12',
  'home_workout.exercises.incline_db_press.pro_tip':
      'Neutral palms-in grip keeps wrists straight and removes joint compression.',
  'home_workout.exercises.incline_db_press.step_1':
      'Set bench to a 30° incline and hold dumbbells with palms facing each other.',
  'home_workout.exercises.incline_db_press.step_2':
      'Press weights up smoothly above your upper chest.',
  'home_workout.exercises.incline_db_press.step_3':
      'Lower slowly with elbows at a 45° angle.',
  'home_workout.exercises.incline_db_press.step_4':
      'Pause lightly at chest level, then press back up.',
  'home_workout.exercises.reverse_lunge.sets_reps':
      '3 sets × 10 reps/leg · 8 kg',
  'home_workout.exercises.reverse_lunge.equipment': 'Dumbbells · 8 kg',
  'home_workout.exercises.reverse_lunge.target': '3 × 10/leg',
  'home_workout.exercises.reverse_lunge.pro_tip':
      'Step back softly and keep your front shin nearly vertical.',
  'home_workout.exercises.reverse_lunge.step_1':
      'Stand tall with dumbbells by your sides.',
  'home_workout.exercises.reverse_lunge.step_2':
      'Step one foot backward and lower your back knee toward the floor.',
  'home_workout.exercises.reverse_lunge.step_3':
      'Push through your front heel to return to standing.',
  'home_workout.exercises.reverse_lunge.step_4':
      'Alternate legs or finish all reps on one side.',
  'home_workout.exercises.forearm_plank.sets_reps': '3 sets × 45 sec',
  'home_workout.exercises.forearm_plank.equipment': 'Bodyweight · Wrist-safe',
  'home_workout.exercises.forearm_plank.target': '3 × 45s',
  'home_workout.exercises.forearm_plank.pro_tip':
      'Done on forearms to protect your wrists. Squeeze glutes and draw ribs down.',
  'home_workout.exercises.forearm_plank.step_1':
      'Place forearms flat on the mat with elbows directly under shoulders.',
  'home_workout.exercises.forearm_plank.step_2':
      'Extend legs back and lift hips into a straight line.',
  'home_workout.exercises.forearm_plank.step_3':
      'Breathe steadily and hold without letting hips sag.',
  'home_workout.exercises.glute_bridge.sets_reps': '3 sets × 15 reps · 15 kg',
  'home_workout.exercises.glute_bridge.equipment': 'Dumbbell · 15 kg',
  'home_workout.exercises.glute_bridge.target': '3 × 15',
  'home_workout.exercises.glute_bridge.pro_tip':
      'Pause for 1 second at the top with full glute squeeze.',
  'home_workout.exercises.glute_bridge.step_1':
      'Lie on your back with knees bent and feet flat on the floor.',
  'home_workout.exercises.glute_bridge.step_2':
      'Rest a dumbbell across your hips.',
  'home_workout.exercises.glute_bridge.step_3':
      'Drive through heels to lift hips until knees, hips, and shoulders align.',
  'home_workout.exercises.glute_bridge.step_4': 'Lower with control and repeat.',

  // ─── 08 · Workout — Active Set Logging ───
  'home_workout.active_set.exercise_of': 'EXERCISE @current OF @total',
  'home_workout.active_set.target': 'Target · 3 sets × 12 reps',
  'home_workout.active_set.recommended': 'Recommended @value',
  'home_workout.active_set.recommended_kg': '@kg kg',
  'home_workout.active_set.bodyweight': 'Bodyweight',
  'home_workout.active_set.milon_tip': 'MILON: +1 kg if the set feels easy',
  'home_workout.active_set.log_sets': 'Log your sets',
  'home_workout.active_set.col_set': 'SET',
  'home_workout.active_set.col_previous': 'PREVIOUS',
  'home_workout.active_set.col_kg': 'KG',
  'home_workout.active_set.col_reps': 'REPS',
  'home_workout.active_set.add_set': 'Add Set',
  'home_workout.active_set.rest_timer': 'Rest timer',
  'home_workout.active_set.per_set_custom': 'Per-set · customizable',
  'home_workout.active_set.skip_rest': 'Skip rest',
  'home_workout.active_set.complete_set': 'Complete Set @number',

  // ─── 08b · Workout — Rest Time per Set ───
  'home_workout.rest_time.title': 'Rest time',
  'home_workout.rest_time.subtitle': '@exercise · @sets sets',
  'home_workout.rest_time.same_for_all': 'Same for all',
  'home_workout.rest_time.per_set': 'Per set',
  'home_workout.rest_time.set_number': 'Set @number',
  'home_workout.rest_time.suggestion':
      'MILON suggests 1:30–2:00 for strength sets at this effort level.',
  'home_workout.rest_time.save': 'Save',

  // ─── 09 · Workout — RPE Feedback ───
  'home_workout.rpe.set_complete': 'SET @number COMPLETE',
  'home_workout.rpe.reps_kg': '@reps reps · @kg kg',
  'home_workout.rpe.question': 'How hard was that set?',
  'home_workout.rpe.description':
      'Rate it from 1 (easy) to 5 (max effort). MILON uses your answer to adjust the weight of your next set.',
  'home_workout.rpe.easy': 'Easy',
  'home_workout.rpe.moderate': 'Moderate',
  'home_workout.rpe.hard': 'Hard',
  'home_workout.rpe.max_effort': 'Max effort',
  'home_workout.rpe.easy_advice':
      'Too light! Next set increases to 17 kg. Rest 01:15.',
  'home_workout.rpe.moderate_advice':
      'Good effort! Next set stays at 16 kg. Rest 01:30.',
  'home_workout.rpe.hard_advice': 'Strong push! Keep 16 kg and rest 02:00.',
  'home_workout.rpe.max_effort_advice':
      'All-out set! Drop to 15 kg next set. Rest 02:00.',
  'home_workout.rpe.save_start_rest': 'Save & Start Rest',

  // ─── 10 · Workout — Timed Circuit ───
  'home_workout.circuit.eyebrow': 'HIIT CIRCUIT · LOW IMPACT',
  'home_workout.circuit.round': 'ROUND @round / @total',
  'home_workout.circuit.total_time': 'TOTAL TIME',
  'home_workout.circuit.now_work': 'NOW · WORK',
  'home_workout.circuit.current_variation':
      'Step-out variation · no wrist load',
  'home_workout.circuit.up_next': 'UP NEXT',
  'home_workout.circuit.next_exercise': '@name · Forearms',
  'home_workout.circuit.work_rest': '@work sec work · @rest sec rest',

  // ─── 11 · Workout — Rest Countdown ───
  'home_workout.rest_countdown.round_complete': 'ROUND @round COMPLETE',
  'home_workout.rest_countdown.encouragement': "Breathe. You're doing great.",
  'home_workout.rest_countdown.of_total': 'of @total',
  'home_workout.rest_countdown.avg_bpm': 'avg bpm',
  'home_workout.rest_countdown.round': 'round',
  'home_workout.rest_countdown.next_round': 'NEXT · ROUND @round OF @total',
  'home_workout.rest_countdown.skip_rest': 'Skip Rest',

  // ─── 11b · Workout — End-of-Session Feedback ───
  'home_workout.end_feedback.eyebrow': 'SESSION COMPLETE · @workout',
  'home_workout.end_feedback.title': 'How was your session?',
  'home_workout.end_feedback.subtitle':
      'Your feedback helps MILON Coach adjust your next workouts.',
  'home_workout.end_feedback.see_summary': 'See my session summary',
  'home_workout.end_feedback.feel_title': 'How did it feel overall?',
  'home_workout.end_feedback.feel_too_easy': 'Too easy',
  'home_workout.end_feedback.feel_easy': 'Easy',
  'home_workout.end_feedback.feel_just_right': 'Just right',
  'home_workout.end_feedback.feel_hard': 'Hard',
  'home_workout.end_feedback.feel_too_hard': 'Too hard',
  'home_workout.end_feedback.pain_title': 'Any pain or discomfort?',
  'home_workout.end_feedback.pain_no': 'No, all good',
  'home_workout.end_feedback.pain_yes': 'Yes, somewhere',
  'home_workout.end_feedback.pain_hint':
      'If yes, we will ask where and adapt your next session.',
  'home_workout.end_feedback.enjoy_title': 'Did you enjoy it?',
  'home_workout.end_feedback.enjoy_loved': 'Loved it',
  'home_workout.end_feedback.enjoy_ok': 'It was OK',
  'home_workout.end_feedback.enjoy_not_really': 'Not really',
  'home_workout.end_feedback.coach_note_title':
      'A word for your coach? (optional)',
  'home_workout.end_feedback.coach_note_hint':
      'e.g. The lunges were hard on my knees',

  // ─── 11c · Workout — Session Summary ───
  'home_workout.summary.title': 'Session Summary',
  'home_workout.summary.shared': 'Session summary shared!',
  'home_workout.summary.eyebrow': '@workout · TODAY',
  'home_workout.summary.session_score': 'SESSION SCORE',
  'home_workout.summary.outstanding': 'Outstanding session!',
  'home_workout.summary.top_percent': 'Top 5% of your sessions this month',
  'home_workout.summary.duration': 'duration',
  'home_workout.summary.kg_volume': 'kg volume',
  'home_workout.summary.new_record': 'NEW PERSONAL RECORD',
  'home_workout.summary.analysis_time': 'Analysis · just now',
  'home_workout.summary.reply_hint': 'Reply to your coach...',
  'home_workout.summary.consistency_title': 'Consistency',
  'home_workout.summary.consistency_body':
      'You hit every target rep across all 18 sets. 3rd perfect session in a row.',
  'home_workout.summary.cadence_title': 'Cadence',
  'home_workout.summary.cadence_body':
      'Squat tempo stayed steady at ~3 s down / 1 s up. Excellent control.',
  'home_workout.summary.progression_title': 'Progression',
  'home_workout.summary.progression_body':
      'Increase Goblet Squat to 17 kg next session; keep RDL at 20 kg.',
  'home_workout.summary.wrist_title': 'Wrist safety',
  'home_workout.summary.wrist_body':
      'No palm-loaded moves were needed. Keep using neutral grips.',
};

const Map<String, String> homeWorkoutFr = {
  // ─── Shared ───
  'home_workout.common.sets': 'séries',
  'home_workout.common.min': 'min',
  'home_workout.common.exercises': 'exercices',
  'home_workout.common.kcal': 'kcal',
  // Non-breaking space before the unit (French typography).
  'home_workout.common.grams_suffix': '\u00A0g',
  'home_workout.common.rest': 'REPOS',
  'home_workout.common.minus_15s': '−15 s',
  'home_workout.common.plus_15s': '+15 s',

  // ─── 05 · Home — Daily Planner ───
  'home_workout.home.hello': 'Bonjour, @name',
  'home_workout.home.today_date': 'Mercredi 18 nov.',
  'home_workout.home.month_label': 'Novembre 2026',
  'home_workout.home.streak': "@count jours d'affilée",
  'home_workout.home.weekday_mon': 'Lun',
  'home_workout.home.weekday_tue': 'Mar',
  'home_workout.home.weekday_wed': 'Mer',
  'home_workout.home.weekday_thu': 'Jeu',
  'home_workout.home.weekday_fri': 'Ven',
  'home_workout.home.weekday_sat': 'Sam',
  'home_workout.home.weekday_sun': 'Dim',
  'home_workout.home.generate_plan': 'Générer mon programme',
  'home_workout.home.todays_meals': 'Repas du jour',
  'home_workout.home.planned_logged': '@logged / @planned prévus enregistrés',
  'home_workout.home.new_badge': 'NOUVEAU',
  'home_workout.home.todays_workout': 'SÉANCE DU JOUR',
  'home_workout.home.workout_meta': '45 min · Maison',
  'home_workout.home.workout_kcal_moves': '~@kcal kcal · @count exercices',
  'home_workout.home.start': 'Commencer',
  'home_workout.home.planned_count': '@count PRÉVUS',
  'home_workout.home.todays_nutrition': 'NUTRITION DU JOUR',
  'home_workout.home.protein_target': '@amount de protéines',
  'home_workout.home.protein': 'Protéines',
  'home_workout.home.protein_progress': '@logged / @target',
  'home_workout.home.view_plan': 'Voir le plan',
  'home_workout.home.meal_tag_breakfast': 'PETIT-DÉJ · AU CHOIX',
  'home_workout.home.meal_tag_lunch': 'DÉJEUNER · PRÉVU',
  'home_workout.home.meal_tag_snack': 'COLLATION · AU CHOIX',
  'home_workout.home.meal_tag_dinner': 'DÎNER · PRÉVU',
  'home_workout.home.meal_title_breakfast': 'Bowl énergie au yaourt de soja',
  'home_workout.home.meal_title_lunch': 'Salade tofu grillé & œuf',
  'home_workout.home.meal_title_snack': "Pomme & purée d'amande",
  'home_workout.home.meal_title_dinner': 'Poêlée poulet-quinoa',
  'home_workout.home.meal_prep_breakfast': 'Prép. 5 min',
  'home_workout.home.meal_prep_lunch': 'Prép. 10 · Cuisson 5 min',
  'home_workout.home.meal_prep_snack': 'Prép. 2 min',
  'home_workout.home.meal_prep_dinner': 'Prép. 10 · Cuisson 15 min',

  // ─── 05b · Home — Free Plan ───
  'home_workout.free_plan.badge': 'OFFRE GRATUITE',
  'home_workout.free_plan.scans_left':
      '@count analyses photo gratuites restantes',
  'home_workout.free_plan.scans_subtitle':
      'Photographiez votre assiette pour obtenir calories et macros',
  'home_workout.free_plan.free_session': 'VOTRE SÉANCE GRATUITE',
  'home_workout.free_plan.included': 'Incluse',
  'home_workout.free_plan.session_title': '@workout · 45 min · Maison',
  'home_workout.free_plan.session_meta': 'Poignets préservés · 6 exercices',
  'home_workout.free_plan.start_free_session': 'Commencer la séance gratuite',
  'home_workout.free_plan.locked_title': 'Votre programme complet vous attend',
  'home_workout.free_plan.locked_body':
      'Plan de repas, liste de courses, les 4 séances de la semaine et votre MILON Coach.',
  'home_workout.free_plan.try_free': 'Essai gratuit de 7 jours',
  'home_workout.free_plan.then_price':
      'Puis tarif annuel (à confirmer) · résiliable à tout moment',

  // ─── Muscles ───
  'home_workout.muscles.quadriceps': 'Quadriceps',
  'home_workout.muscles.glutes': 'Fessiers',
  'home_workout.muscles.hamstrings': 'Ischio-jambiers',
  'home_workout.muscles.chest': 'Pectoraux',
  'home_workout.muscles.triceps': 'Triceps',
  'home_workout.muscles.core': 'Sangle abdominale',
  'home_workout.muscles.shoulders': 'Épaules',
  'home_workout.muscles.other': 'Autres',

  // ─── 06 · Workout — Session Overview ───
  'home_workout.overview.plan_badge':
      'PROGRAMME MILON · SEMAINE @week · JOUR @day',
  'home_workout.overview.meta':
      '45 min · Maison · 6 exercices · Intermédiaire',
  'home_workout.overview.targeted_muscles': 'Muscles ciblés',
  'home_workout.overview.muscle_share': '@muscle @percent %',
  'home_workout.overview.wrist_title': 'Adapté pour protéger vos poignets',
  'home_workout.overview.wrist_body':
      'Pompes remplacées par un développé en prise neutre. Gainage sur les avant-bras.',
  'home_workout.overview.exercises': 'Exercices',
  'home_workout.overview.moves_sets': '@moves exercices · @sets séries',
  'home_workout.overview.start_workout': 'Commencer la séance',

  // ─── 07 · Workout — Exercise Detail ───
  'home_workout.exercise_detail.demo': 'Démo · @duration',
  'home_workout.exercise_detail.pro_tip': 'CONSEIL PRO',
  'home_workout.exercise_detail.how_to': "Comment l'exécuter",
  'home_workout.exercise_detail.muscles_worked': 'Muscles sollicités',
  'home_workout.exercise_detail.front': 'AVANT',
  'home_workout.exercise_detail.back': 'ARRIÈRE',
  'home_workout.exercise_detail.primary': 'Principaux · Quadriceps, fessiers',
  'home_workout.exercise_detail.assisted':
      'Secondaires · Sangle abdominale, mollets',

  // ─── Exercise content (mock; names stay in English) ───
  'home_workout.exercises.goblet_squat.sets_reps':
      '3 séries × 12 rép. · 15 kg',
  'home_workout.exercises.goblet_squat.equipment': 'Haltère · 15 kg',
  'home_workout.exercises.goblet_squat.target': '3 × 12',
  'home_workout.exercises.goblet_squat.pro_tip':
      "Gardez l'haltère près de la poitrine et poussez dans vos talons. Ne laissez jamais vos genoux rentrer vers l'intérieur.",
  'home_workout.exercises.goblet_squat.step_1':
      "Tenez-vous debout, pieds écartés à largeur d'épaules, pointes légèrement vers l'extérieur.",
  'home_workout.exercises.goblet_squat.step_2':
      'Tenez un haltère à la verticale contre votre poitrine, à deux mains.',
  'home_workout.exercises.goblet_squat.step_3':
      'Gainez vos abdominaux et gardez la poitrine haute et ouverte.',
  'home_workout.exercises.goblet_squat.step_4':
      "Poussez les hanches vers l'arrière et fléchissez les genoux pour descendre.",
  'home_workout.exercises.goblet_squat.step_5':
      "Descendez jusqu'à ce que vos cuisses soient parallèles au sol.",
  'home_workout.exercises.goblet_squat.step_6':
      'Poussez dans vos talons pour remonter. Expirez.',
  'home_workout.exercises.romanian_deadlift.sets_reps':
      '3 séries × 10 rép. · 20 kg',
  'home_workout.exercises.romanian_deadlift.equipment': 'Haltères · 20 kg',
  'home_workout.exercises.romanian_deadlift.target': '3 × 10',
  'home_workout.exercises.romanian_deadlift.pro_tip':
      'Basculez depuis les hanches, genoux légèrement fléchis, en gardant les haltères au contact des cuisses.',
  'home_workout.exercises.romanian_deadlift.step_1':
      'Tenez-vous droit, haltères devant les cuisses.',
  'home_workout.exercises.romanian_deadlift.step_2':
      'Déverrouillez légèrement les genoux et gainez vos abdominaux.',
  'home_workout.exercises.romanian_deadlift.step_3':
      "Poussez les hanches vers l'arrière en gardant le dos neutre.",
  'home_workout.exercises.romanian_deadlift.step_4':
      "Descendez jusqu'à sentir un étirement profond des ischio-jambiers.",
  'home_workout.exercises.romanian_deadlift.step_5':
      "Ramenez les hanches vers l'avant et contractez les fessiers pour vous redresser.",
  'home_workout.exercises.incline_db_press.sets_reps':
      '3 séries × 12 rép. · 10 kg',
  'home_workout.exercises.incline_db_press.equipment': 'Haltères · 10 kg',
  'home_workout.exercises.incline_db_press.target': '3 × 12',
  'home_workout.exercises.incline_db_press.pro_tip':
      'La prise neutre, paumes face à face, garde les poignets droits et supprime la compression articulaire.',
  'home_workout.exercises.incline_db_press.step_1':
      'Inclinez le banc à 30° et tenez les haltères paumes face à face.',
  'home_workout.exercises.incline_db_press.step_2':
      'Poussez les charges de façon fluide au-dessus du haut de la poitrine.',
  'home_workout.exercises.incline_db_press.step_3':
      'Redescendez lentement, coudes à 45°.',
  'home_workout.exercises.incline_db_press.step_4':
      'Marquez une courte pause au niveau de la poitrine, puis poussez à nouveau.',
  'home_workout.exercises.reverse_lunge.sets_reps':
      '3 séries × 10 rép./jambe · 8 kg',
  'home_workout.exercises.reverse_lunge.equipment': 'Haltères · 8 kg',
  'home_workout.exercises.reverse_lunge.target': '3 × 10/jambe',
  'home_workout.exercises.reverse_lunge.pro_tip':
      'Reculez en douceur et gardez le tibia avant presque vertical.',
  'home_workout.exercises.reverse_lunge.step_1':
      'Tenez-vous droit, haltères le long du corps.',
  'home_workout.exercises.reverse_lunge.step_2':
      'Reculez un pied et descendez le genou arrière vers le sol.',
  'home_workout.exercises.reverse_lunge.step_3':
      'Poussez dans le talon avant pour revenir debout.',
  'home_workout.exercises.reverse_lunge.step_4':
      "Alternez les jambes ou terminez toutes les répétitions d'un côté.",
  'home_workout.exercises.forearm_plank.sets_reps': '3 séries × 45 s',
  'home_workout.exercises.forearm_plank.equipment':
      'Poids du corps · Poignets préservés',
  'home_workout.exercises.forearm_plank.target': '3 × 45 s',
  'home_workout.exercises.forearm_plank.pro_tip':
      'Réalisé sur les avant-bras pour protéger vos poignets. Contractez les fessiers et rentrez les côtes.',
  'home_workout.exercises.forearm_plank.step_1':
      'Posez les avant-bras à plat sur le tapis, coudes sous les épaules.',
  'home_workout.exercises.forearm_plank.step_2':
      "Tendez les jambes vers l'arrière et levez les hanches pour former une ligne droite.",
  'home_workout.exercises.forearm_plank.step_3':
      "Respirez régulièrement et tenez sans laisser les hanches s'affaisser.",
  'home_workout.exercises.glute_bridge.sets_reps':
      '3 séries × 15 rép. · 15 kg',
  'home_workout.exercises.glute_bridge.equipment': 'Haltère · 15 kg',
  'home_workout.exercises.glute_bridge.target': '3 × 15',
  'home_workout.exercises.glute_bridge.pro_tip':
      "Marquez une pause d'1 seconde en haut en contractant pleinement les fessiers.",
  'home_workout.exercises.glute_bridge.step_1':
      'Allongez-vous sur le dos, genoux fléchis et pieds à plat au sol.',
  'home_workout.exercises.glute_bridge.step_2':
      'Posez un haltère sur vos hanches.',
  'home_workout.exercises.glute_bridge.step_3':
      "Poussez dans les talons pour lever les hanches jusqu'à aligner genoux, hanches et épaules.",
  'home_workout.exercises.glute_bridge.step_4':
      'Redescendez avec contrôle et recommencez.',

  // ─── 08 · Workout — Active Set Logging ───
  'home_workout.active_set.exercise_of': 'EXERCICE @current SUR @total',
  'home_workout.active_set.target': 'Objectif · 3 séries × 12 rép.',
  'home_workout.active_set.recommended': 'Recommandé : @value',
  'home_workout.active_set.recommended_kg': '@kg kg',
  'home_workout.active_set.bodyweight': 'Poids du corps',
  'home_workout.active_set.milon_tip':
      'MILON : +1 kg si la série vous semble facile',
  'home_workout.active_set.log_sets': 'Enregistrez vos séries',
  'home_workout.active_set.col_set': 'SÉRIE',
  'home_workout.active_set.col_previous': 'PRÉCÉDENT',
  'home_workout.active_set.col_kg': 'KG',
  'home_workout.active_set.col_reps': 'RÉP.',
  'home_workout.active_set.add_set': 'Ajouter une série',
  'home_workout.active_set.rest_timer': 'Minuteur de repos',
  'home_workout.active_set.per_set_custom': 'Par série · personnalisable',
  'home_workout.active_set.skip_rest': 'Passer le repos',
  'home_workout.active_set.complete_set': 'Terminer la série @number',

  // ─── 08b · Workout — Rest Time per Set ───
  'home_workout.rest_time.title': 'Temps de repos',
  'home_workout.rest_time.subtitle': '@exercise · @sets séries',
  'home_workout.rest_time.same_for_all': 'Identique pour toutes',
  'home_workout.rest_time.per_set': 'Par série',
  'home_workout.rest_time.set_number': 'Série @number',
  'home_workout.rest_time.suggestion':
      "MILON recommande 1:30–2:00 pour les séries de force à ce niveau d'effort.",
  'home_workout.rest_time.save': 'Enregistrer',

  // ─── 09 · Workout — RPE Feedback ───
  'home_workout.rpe.set_complete': 'SÉRIE @number TERMINÉE',
  'home_workout.rpe.reps_kg': '@reps rép. · @kg kg',
  'home_workout.rpe.question': 'Quelle était la difficulté de cette série ?',
  'home_workout.rpe.description':
      'Notez-la de 1 (facile) à 5 (effort max). MILON utilise votre réponse pour ajuster la charge de votre prochaine série.',
  'home_workout.rpe.easy': 'Facile',
  'home_workout.rpe.moderate': 'Modéré',
  'home_workout.rpe.hard': 'Difficile',
  'home_workout.rpe.max_effort': 'Effort max',
  'home_workout.rpe.easy_advice':
      'Trop léger ! La prochaine série passe à 17 kg. Repos 01:15.',
  'home_workout.rpe.moderate_advice':
      'Bel effort ! La prochaine série reste à 16 kg. Repos 01:30.',
  'home_workout.rpe.hard_advice':
      'Bien poussé ! Gardez 16 kg et reposez-vous 02:00.',
  'home_workout.rpe.max_effort_advice':
      'Série à fond ! Passez à 15 kg à la prochaine série. Repos 02:00.',
  'home_workout.rpe.save_start_rest': 'Enregistrer et lancer le repos',

  // ─── 10 · Workout — Timed Circuit ───
  'home_workout.circuit.eyebrow': 'CIRCUIT HIIT · FAIBLE IMPACT',
  'home_workout.circuit.round': 'TOUR @round / @total',
  'home_workout.circuit.total_time': 'TEMPS TOTAL',
  'home_workout.circuit.now_work': 'EN COURS · EFFORT',
  'home_workout.circuit.current_variation':
      'Variante pas latéral · sans appui sur les poignets',
  'home_workout.circuit.up_next': 'À SUIVRE',
  'home_workout.circuit.next_exercise': '@name · Avant-bras',
  'home_workout.circuit.work_rest': "@work s d'effort · @rest s de repos",

  // ─── 11 · Workout — Rest Countdown ───
  'home_workout.rest_countdown.round_complete': 'TOUR @round TERMINÉ',
  'home_workout.rest_countdown.encouragement':
      'Respirez. Vous vous en sortez très bien.',
  'home_workout.rest_countdown.of_total': 'sur @total',
  'home_workout.rest_countdown.avg_bpm': 'bpm moy.',
  'home_workout.rest_countdown.round': 'tour',
  'home_workout.rest_countdown.next_round': 'ENSUITE · TOUR @round SUR @total',
  'home_workout.rest_countdown.skip_rest': 'Passer le repos',

  // ─── 11b · Workout — End-of-Session Feedback ───
  'home_workout.end_feedback.eyebrow': 'SÉANCE TERMINÉE · @workout',
  'home_workout.end_feedback.title': "Comment s'est passée votre séance ?",
  'home_workout.end_feedback.subtitle':
      'Vos retours aident MILON Coach à ajuster vos prochaines séances.',
  'home_workout.end_feedback.see_summary': 'Voir le résumé de ma séance',
  'home_workout.end_feedback.feel_title':
      "Comment l'avez-vous ressentie dans l'ensemble ?",
  'home_workout.end_feedback.feel_too_easy': 'Trop facile',
  'home_workout.end_feedback.feel_easy': 'Facile',
  'home_workout.end_feedback.feel_just_right': 'Parfait',
  'home_workout.end_feedback.feel_hard': 'Difficile',
  'home_workout.end_feedback.feel_too_hard': 'Trop dur',
  'home_workout.end_feedback.pain_title': 'Une douleur ou une gêne ?',
  'home_workout.end_feedback.pain_no': 'Non, tout va bien',
  'home_workout.end_feedback.pain_yes': 'Oui, quelque part',
  'home_workout.end_feedback.pain_hint':
      'Si oui, nous vous demanderons où et adapterons votre prochaine séance.',
  'home_workout.end_feedback.enjoy_title': 'Avez-vous aimé cette séance ?',
  'home_workout.end_feedback.enjoy_loved': "J'ai adoré",
  'home_workout.end_feedback.enjoy_ok': "C'était correct",
  'home_workout.end_feedback.enjoy_not_really': 'Pas vraiment',
  'home_workout.end_feedback.coach_note_title':
      'Un mot pour votre coach ? (facultatif)',
  'home_workout.end_feedback.coach_note_hint':
      'ex. : Les fentes étaient dures pour mes genoux',

  // ─── 11c · Workout — Session Summary ───
  'home_workout.summary.title': 'Résumé de la séance',
  'home_workout.summary.shared': 'Résumé de la séance partagé !',
  'home_workout.summary.eyebrow': "@workout · AUJOURD'HUI",
  'home_workout.summary.session_score': 'SCORE DE LA SÉANCE',
  'home_workout.summary.outstanding': 'Séance exceptionnelle !',
  'home_workout.summary.top_percent': 'Top 5 % de vos séances ce mois-ci',
  'home_workout.summary.duration': 'durée',
  'home_workout.summary.kg_volume': 'kg de volume',
  'home_workout.summary.new_record': 'NOUVEAU RECORD PERSONNEL',
  'home_workout.summary.analysis_time': "Analyse · à l'instant",
  'home_workout.summary.reply_hint': 'Répondez à votre coach...',
  'home_workout.summary.consistency_title': 'Régularité',
  'home_workout.summary.consistency_body':
      "Vous avez atteint toutes les répétitions cibles sur les 18 séries. 3e séance parfaite d'affilée.",
  'home_workout.summary.cadence_title': 'Tempo',
  'home_workout.summary.cadence_body':
      'Le tempo du squat est resté stable à ~3 s en descente / 1 s en montée. Excellent contrôle.',
  'home_workout.summary.progression_title': 'Progression',
  'home_workout.summary.progression_body':
      'Passez le Goblet Squat à 17 kg à la prochaine séance ; gardez le RDL à 20 kg.',
  'home_workout.summary.wrist_title': 'Protection des poignets',
  'home_workout.summary.wrist_body':
      "Aucun mouvement en appui sur les paumes n'a été nécessaire. Continuez avec les prises neutres.",
};
