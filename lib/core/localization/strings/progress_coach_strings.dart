// Progress & MILON Coach strings. Keys: 'progress_coach.<screen>.<name>'.
// Keep both maps in the same order with identical keys.

const Map<String, String> progressCoachEn = {
  // ─── 16 · Progress dashboard ───
  'progress_coach.dashboard.title': 'Progress',
  'progress_coach.dashboard.period_week': 'Week',
  'progress_coach.dashboard.period_month': 'Month',
  'progress_coach.dashboard.period_year': 'Year',
  'progress_coach.dashboard.kpi_workouts': 'workouts',
  'progress_coach.dashboard.kpi_day_streak': 'day streak',
  'progress_coach.dashboard.kpi_kcal_burned': 'kcal burned',
  'progress_coach.dashboard.body_weight_title': 'Body & weight',
  'progress_coach.dashboard.weekly_review_title': 'Weekly review',
  'progress_coach.dashboard.weekly_review_subtitle': 'Week 12 · 3/4 done',
  'progress_coach.dashboard.consistency_title': 'Consistency',
  'progress_coach.dashboard.consistency_period': 'Last 12 weeks',
  'progress_coach.dashboard.consistency_badge': '84% this month',
  'progress_coach.dashboard.day_mon_short': 'M',
  'progress_coach.dashboard.day_wed_short': 'W',
  'progress_coach.dashboard.day_fri_short': 'F',
  'progress_coach.dashboard.day_sun_short': 'S',
  'progress_coach.dashboard.legend_less': 'Less',
  'progress_coach.dashboard.legend_more': 'More',
  'progress_coach.dashboard.most_practiced': 'Most practiced',
  'progress_coach.dashboard.practiced_subtitle': '@count sessions · @load',
  'progress_coach.dashboard.recovery_title': 'Muscle recovery readiness',
  'progress_coach.dashboard.recovery_updated': 'Updated @time',
  'progress_coach.dashboard.muscle_calves': 'Calves',
  'progress_coach.dashboard.muscle_quads': 'Quads',
  'progress_coach.dashboard.muscle_biceps': 'Biceps',
  'progress_coach.dashboard.muscle_shoulders': 'Shoulders',
  'progress_coach.dashboard.status_ready': 'Ready to train',
  'progress_coach.dashboard.status_recovering': 'Recovering · @time',
  'progress_coach.dashboard.hydration_eyebrow': 'DAILY HYDRATION',
  'progress_coach.dashboard.hydration_hint':
      '8 glasses of 250 ml to reach your goal',
  'progress_coach.dashboard.hydration_button': 'I Drank Water (+250ml)',

  // ─── 16b · Body & Weight ───
  'progress_coach.body_weight.title': 'Body & Weight',
  'progress_coach.body_weight.current': 'CURRENT',
  'progress_coach.body_weight.change_since': '−0.4 kg since Nov 16',
  'progress_coach.body_weight.range_1w': '1W',
  'progress_coach.body_weight.range_1m': '1M',
  'progress_coach.body_weight.range_3m': '3M',
  'progress_coach.body_weight.legend_daily': 'Daily weigh-ins',
  'progress_coach.body_weight.legend_trend': 'Projected trend',
  'progress_coach.body_weight.goal_value': 'Goal @weight',
  'progress_coach.body_weight.start_value': 'Start @weight',
  'progress_coach.body_weight.to_goal': '10% to goal',
  'progress_coach.body_weight.pace':
      'On pace for about −0.4 kg / week · est. late January',
  'progress_coach.body_weight.measurements': 'Measurements',
  'progress_coach.body_weight.waist': 'Waist',
  'progress_coach.body_weight.hips': 'Hips',
  'progress_coach.body_weight.body_fat': 'Body fat',
  'progress_coach.body_weight.optional': 'Optional',
  'progress_coach.body_weight.info_banner':
      'Weight naturally moves ±1 kg from day to day. MILON looks at your weekly trend, not single weigh-ins.',
  'progress_coach.body_weight.log_button': "Log Today's Weight",
  'progress_coach.body_weight.logged_snackbar': 'Logged @weight kg for today!',

  // ─── 16c · Weekly Review ───
  'progress_coach.weekly_review.title': 'Weekly Review',
  'progress_coach.weekly_review.eyebrow': 'WEEK 12 · NOV 16–22',
  'progress_coach.weekly_review.heading': 'Your week in review',
  'progress_coach.weekly_review.subheading':
      "Great consistency, @name. Here's how your week went.",
  'progress_coach.weekly_review.workouts_eyebrow': 'WORKOUTS',
  'progress_coach.weekly_review.sessions_done': 'sessions done',
  'progress_coach.weekly_review.workouts_summary':
      '2 h 15 of training · 54 sets · 1,420 kcal burned',
  'progress_coach.weekly_review.weight': 'Weight',
  'progress_coach.weekly_review.nutrition': 'Nutrition',
  'progress_coach.weekly_review.days_on_target': 'days on target',
  'progress_coach.weekly_review.hydration': 'Hydration',
  'progress_coach.weekly_review.average_per_day': 'average per day',
  'progress_coach.weekly_review.streak': 'Streak',
  'progress_coach.weekly_review.streak_days': '@count days',
  'progress_coach.weekly_review.best_so_far': 'your best so far',
  'progress_coach.weekly_review.highlights': 'Highlights',
  'progress_coach.weekly_review.new_record': 'New record',
  'progress_coach.weekly_review.new_record_detail':
      'Goblet Squat: 16 kg × 12 reps',
  'progress_coach.weekly_review.best_day': 'Best day',
  'progress_coach.weekly_review.best_day_detail':
      'Wednesday, 100% of sets completed',
  'progress_coach.weekly_review.recovery': 'Recovery',
  'progress_coach.weekly_review.recovery_detail':
      'Quads and glutes fully recovered',
  'progress_coach.weekly_review.coach_message':
      'Solid week! Next week we keep 3 sessions and add 1 kg on your squats. Try to drink one more glass of water a day.',
  'progress_coach.weekly_review.cta': 'Start my weekly check-in',

  // ─── 17c · Weekly Check-in ───
  'progress_coach.weekly_checkin.title': 'Weekly Check-in',
  'progress_coach.weekly_checkin.heading': 'How was your week, @name?',
  'progress_coach.weekly_checkin.intro':
      "No judgment. Honest answers help MILON adjust next week's plan. Takes 2 minutes.",
  'progress_coach.weekly_checkin.auto_tracked': 'THIS WEEK · AUTO-TRACKED',
  'progress_coach.weekly_checkin.week_range': 'Week 1 · Nov 16–22',
  'progress_coach.weekly_checkin.workouts_done': 'workouts done',
  'progress_coach.weekly_checkin.planned_meals': 'planned meals',
  'progress_coach.weekly_checkin.avg_sleep': 'avg sleep',
  'progress_coach.weekly_checkin.energy_title': 'Energy levels',
  'progress_coach.weekly_checkin.energy_low': 'Exhausted',
  'progress_coach.weekly_checkin.energy_high': 'Full of energy',
  'progress_coach.weekly_checkin.hunger_title': 'Hunger between meals',
  'progress_coach.weekly_checkin.hunger_low': 'Never hungry',
  'progress_coach.weekly_checkin.hunger_high': 'Always hungry',
  'progress_coach.weekly_checkin.sleep_title': 'Sleep quality',
  'progress_coach.weekly_checkin.sleep_low': 'Poor',
  'progress_coach.weekly_checkin.sleep_high': 'Great',
  'progress_coach.weekly_checkin.stress_title': 'Stress',
  'progress_coach.weekly_checkin.stress_low': 'Very calm',
  'progress_coach.weekly_checkin.stress_high': 'Very stressed',
  'progress_coach.weekly_checkin.feel_title': 'How did your workouts feel?',
  'progress_coach.weekly_checkin.feel_too_easy': 'Too easy',
  'progress_coach.weekly_checkin.feel_just_right': 'Just right',
  'progress_coach.weekly_checkin.feel_too_hard': 'Too hard',
  'progress_coach.weekly_checkin.weight_title': 'Weight this morning',
  'progress_coach.weekly_checkin.weight_hint': 'Optional · same time each week',
  'progress_coach.weekly_checkin.submit': 'Submit Check-in',

  // ─── 17d · Week 2 Plan ───
  'progress_coach.week2_plan.title': 'Your Week 2 Plan',
  'progress_coach.week2_plan.recap_eyebrow': 'WEEK 1 RECAP',
  'progress_coach.week2_plan.recap_heading': 'Solid first week!',
  'progress_coach.week2_plan.recap_workouts': 'workouts',
  'progress_coach.week2_plan.recap_weight': 'weight',
  'progress_coach.week2_plan.recap_meals_followed': 'meals followed',
  'progress_coach.week2_plan.changes_title': 'What changes next week',
  'progress_coach.week2_plan.training_category': 'TRAINING',
  'progress_coach.week2_plan.training_headline':
      'Goblet Squat 15 → 17 kg · RDL stays 20 kg',
  'progress_coach.week2_plan.training_reason':
      'Workouts felt "just right" and you finished all sets, so we add a small, steady progression.',
  'progress_coach.week2_plan.nutrition_category': 'NUTRITION',
  'progress_coach.week2_plan.nutrition_headline':
      '+1 high-fibre snack on training days (+120 kcal)',
  'progress_coach.week2_plan.nutrition_reason':
      'You felt hungry often. Daily average stays ≈1,485 kcal, so your −0.4 kg/week pace is unchanged.',
  'progress_coach.week2_plan.schedule_category': 'SCHEDULE',
  'progress_coach.week2_plan.schedule_headline':
      'Saturday cardio → 30 min, or move it to Sunday',
  'progress_coach.week2_plan.schedule_reason':
      "You missed 1 session, that's normal. A shorter option makes it easier to fit in.",
  'progress_coach.week2_plan.recovery_category': 'RECOVERY',
  'progress_coach.week2_plan.recovery_headline':
      'No change · sleep 7h10 is on track',
  'progress_coach.week2_plan.recovery_reason':
      'Keep your evening routine; recovery is supporting your progress.',
  'progress_coach.week2_plan.accept': 'Accept Week 2 Plan',
  'progress_coach.week2_plan.discuss': 'Discuss with Coach',
  'progress_coach.week2_plan.accepted_snackbar': 'Week 2 Plan accepted!',

  // ─── 18 · MILON Coach chat ───
  'progress_coach.coach.subtitle': 'Fitness · Recovery · Nutrition',
  'progress_coach.coach.guardrail':
      'I only answer fitness, recovery & nutrition questions',
  'progress_coach.coach.timestamp_today': 'Today · @time',
  'progress_coach.coach.prompt_30_min': 'Make it 30 min',
  'progress_coach.coach.prompt_warm_up': 'Add a warm-up',
  'progress_coach.coach.prompt_swap_exercise': 'Swap an exercise',
  'progress_coach.coach.input_hint': 'Ask your coach...',
  'progress_coach.coach.auto_reply':
      'Got it! I have updated your wrist-safe plan based on "@request". Ready when you are!',
  'progress_coach.coach.workout_title': 'Full Body Gym · Wrist-Safe',
  'progress_coach.coach.workout_meta': '45 min · 5 exercises · Gym',
  'progress_coach.coach.start_session': 'Start Session',
  'progress_coach.coach.saved_snackbar': 'Workout saved to favorites!',
  'progress_coach.coach.removed_snackbar': 'Removed from saved.',
};

const Map<String, String> progressCoachFr = {
  // ─── 16 · Progress dashboard ───
  'progress_coach.dashboard.title': 'Progrès',
  'progress_coach.dashboard.period_week': 'Semaine',
  'progress_coach.dashboard.period_month': 'Mois',
  'progress_coach.dashboard.period_year': 'Année',
  'progress_coach.dashboard.kpi_workouts': 'séances',
  'progress_coach.dashboard.kpi_day_streak': "jours d'affilée",
  'progress_coach.dashboard.kpi_kcal_burned': 'kcal brûlées',
  'progress_coach.dashboard.body_weight_title': 'Corps & poids',
  'progress_coach.dashboard.weekly_review_title': 'Bilan de la semaine',
  'progress_coach.dashboard.weekly_review_subtitle':
      'Semaine 12 · 3/4 terminées',
  'progress_coach.dashboard.consistency_title': 'Régularité',
  'progress_coach.dashboard.consistency_period': '12 dernières semaines',
  'progress_coach.dashboard.consistency_badge': '84 % ce mois-ci',
  'progress_coach.dashboard.day_mon_short': 'L',
  'progress_coach.dashboard.day_wed_short': 'M',
  'progress_coach.dashboard.day_fri_short': 'V',
  'progress_coach.dashboard.day_sun_short': 'D',
  'progress_coach.dashboard.legend_less': 'Moins',
  'progress_coach.dashboard.legend_more': 'Plus',
  'progress_coach.dashboard.most_practiced': 'Les plus pratiqués',
  'progress_coach.dashboard.practiced_subtitle': '@count séances · @load',
  'progress_coach.dashboard.recovery_title': 'Récupération musculaire',
  'progress_coach.dashboard.recovery_updated': 'Mis à jour à @time',
  'progress_coach.dashboard.muscle_calves': 'Mollets',
  'progress_coach.dashboard.muscle_quads': 'Quadriceps',
  'progress_coach.dashboard.muscle_biceps': 'Biceps',
  'progress_coach.dashboard.muscle_shoulders': 'Épaules',
  'progress_coach.dashboard.status_ready': "Prêt pour l'entraînement",
  'progress_coach.dashboard.status_recovering': 'En récupération · @time',
  'progress_coach.dashboard.hydration_eyebrow': 'HYDRATATION DU JOUR',
  'progress_coach.dashboard.hydration_hint':
      '8 verres de 250 ml pour atteindre votre objectif',
  'progress_coach.dashboard.hydration_button': "J'ai bu de l'eau (+250 ml)",

  // ─── 16b · Body & Weight ───
  'progress_coach.body_weight.title': 'Corps & poids',
  'progress_coach.body_weight.current': 'ACTUEL',
  'progress_coach.body_weight.change_since': '−0.4 kg depuis le 16 nov.',
  'progress_coach.body_weight.range_1w': '1S',
  'progress_coach.body_weight.range_1m': '1M',
  'progress_coach.body_weight.range_3m': '3M',
  'progress_coach.body_weight.legend_daily': 'Pesées quotidiennes',
  'progress_coach.body_weight.legend_trend': 'Tendance prévue',
  'progress_coach.body_weight.goal_value': 'Objectif @weight',
  'progress_coach.body_weight.start_value': 'Départ @weight',
  'progress_coach.body_weight.to_goal': "10 % de l'objectif",
  'progress_coach.body_weight.pace':
      "Rythme d'environ −0.4 kg / semaine · prévu fin janvier",
  'progress_coach.body_weight.measurements': 'Mensurations',
  'progress_coach.body_weight.waist': 'Tour de taille',
  'progress_coach.body_weight.hips': 'Tour de hanches',
  'progress_coach.body_weight.body_fat': 'Masse grasse',
  'progress_coach.body_weight.optional': 'Facultatif',
  'progress_coach.body_weight.info_banner':
      "Le poids varie naturellement de ±1 kg d'un jour à l'autre. MILON se base sur votre tendance hebdomadaire, pas sur une pesée isolée.",
  'progress_coach.body_weight.log_button': 'Enregistrer mon poids du jour',
  'progress_coach.body_weight.logged_snackbar':
      "@weight kg enregistrés pour aujourd'hui !",

  // ─── 16c · Weekly Review ───
  'progress_coach.weekly_review.title': 'Bilan de la semaine',
  'progress_coach.weekly_review.eyebrow': 'SEMAINE 12 · 16–22 NOV.',
  'progress_coach.weekly_review.heading': 'Votre semaine en bref',
  'progress_coach.weekly_review.subheading':
      'Belle régularité, @name. Voici le bilan de votre semaine.',
  'progress_coach.weekly_review.workouts_eyebrow': 'SÉANCES',
  'progress_coach.weekly_review.sessions_done': 'séances réalisées',
  'progress_coach.weekly_review.workouts_summary':
      "2 h 15 d'entraînement · 54 séries · 1,420 kcal brûlées",
  'progress_coach.weekly_review.weight': 'Poids',
  'progress_coach.weekly_review.nutrition': 'Nutrition',
  'progress_coach.weekly_review.days_on_target': "jours dans l'objectif",
  'progress_coach.weekly_review.hydration': 'Hydratation',
  'progress_coach.weekly_review.average_per_day': 'en moyenne par jour',
  'progress_coach.weekly_review.streak': 'Série',
  'progress_coach.weekly_review.streak_days': '@count jours',
  'progress_coach.weekly_review.best_so_far': 'votre record',
  'progress_coach.weekly_review.highlights': 'Temps forts',
  'progress_coach.weekly_review.new_record': 'Nouveau record',
  'progress_coach.weekly_review.new_record_detail':
      'Goblet Squat : 16 kg × 12 répétitions',
  'progress_coach.weekly_review.best_day': 'Meilleur jour',
  'progress_coach.weekly_review.best_day_detail':
      'Mercredi, 100 % des séries terminées',
  'progress_coach.weekly_review.recovery': 'Récupération',
  'progress_coach.weekly_review.recovery_detail':
      'Quadriceps et fessiers entièrement récupérés',
  'progress_coach.weekly_review.coach_message':
      "Belle semaine ! La semaine prochaine, on garde 3 séances et on ajoute 1 kg sur vos squats. Essayez de boire un verre d'eau de plus par jour.",
  'progress_coach.weekly_review.cta': 'Commencer mon point hebdo',

  // ─── 17c · Weekly Check-in ───
  'progress_coach.weekly_checkin.title': 'Point hebdomadaire',
  'progress_coach.weekly_checkin.heading':
      "Comment s'est passée votre semaine, @name ?",
  'progress_coach.weekly_checkin.intro':
      'Aucun jugement. Des réponses sincères aident MILON à ajuster le programme de la semaine prochaine. Cela prend 2 minutes.',
  'progress_coach.weekly_checkin.auto_tracked': 'CETTE SEMAINE · SUIVI AUTO',
  'progress_coach.weekly_checkin.week_range': 'Semaine 1 · 16–22 nov.',
  'progress_coach.weekly_checkin.workouts_done': 'séances faites',
  'progress_coach.weekly_checkin.planned_meals': 'repas prévus',
  'progress_coach.weekly_checkin.avg_sleep': 'sommeil moyen',
  'progress_coach.weekly_checkin.energy_title': "Niveau d'énergie",
  'progress_coach.weekly_checkin.energy_low': 'Épuisé·e',
  'progress_coach.weekly_checkin.energy_high': "Plein·e d'énergie",
  'progress_coach.weekly_checkin.hunger_title': 'Faim entre les repas',
  'progress_coach.weekly_checkin.hunger_low': 'Jamais faim',
  'progress_coach.weekly_checkin.hunger_high': 'Toujours faim',
  'progress_coach.weekly_checkin.sleep_title': 'Qualité du sommeil',
  'progress_coach.weekly_checkin.sleep_low': 'Mauvaise',
  'progress_coach.weekly_checkin.sleep_high': 'Excellente',
  'progress_coach.weekly_checkin.stress_title': 'Stress',
  'progress_coach.weekly_checkin.stress_low': 'Très calme',
  'progress_coach.weekly_checkin.stress_high': 'Très stressé·e',
  'progress_coach.weekly_checkin.feel_title':
      'Comment avez-vous trouvé vos séances ?',
  'progress_coach.weekly_checkin.feel_too_easy': 'Trop facile',
  'progress_coach.weekly_checkin.feel_just_right': 'Parfait',
  'progress_coach.weekly_checkin.feel_too_hard': 'Trop difficile',
  'progress_coach.weekly_checkin.weight_title': 'Poids ce matin',
  'progress_coach.weekly_checkin.weight_hint':
      'Facultatif · même heure chaque semaine',
  'progress_coach.weekly_checkin.submit': 'Envoyer mon point',

  // ─── 17d · Week 2 Plan ───
  'progress_coach.week2_plan.title': 'Votre programme semaine 2',
  'progress_coach.week2_plan.recap_eyebrow': 'RÉCAP SEMAINE 1',
  'progress_coach.week2_plan.recap_heading': 'Belle première semaine !',
  'progress_coach.week2_plan.recap_workouts': 'séances',
  'progress_coach.week2_plan.recap_weight': 'poids',
  'progress_coach.week2_plan.recap_meals_followed': 'repas suivis',
  'progress_coach.week2_plan.changes_title':
      'Ce qui change la semaine prochaine',
  'progress_coach.week2_plan.training_category': 'ENTRAÎNEMENT',
  'progress_coach.week2_plan.training_headline':
      'Goblet Squat 15 → 17 kg · RDL reste à 20 kg',
  'progress_coach.week2_plan.training_reason':
      'Vos séances vous ont semblé « parfaites » et vous avez terminé toutes les séries : nous ajoutons donc une progression légère et régulière.',
  'progress_coach.week2_plan.nutrition_category': 'NUTRITION',
  'progress_coach.week2_plan.nutrition_headline':
      "+1 collation riche en fibres les jours d'entraînement (+120 kcal)",
  'progress_coach.week2_plan.nutrition_reason':
      'Vous aviez souvent faim. La moyenne quotidienne reste ≈1,485 kcal, votre rythme de −0.4 kg/semaine est donc inchangé.',
  'progress_coach.week2_plan.schedule_category': 'PLANNING',
  'progress_coach.week2_plan.schedule_headline':
      'Cardio du samedi → 30 min, ou déplacé au dimanche',
  'progress_coach.week2_plan.schedule_reason':
      "Vous avez manqué 1 séance, c'est normal. Une option plus courte sera plus facile à caser.",
  'progress_coach.week2_plan.recovery_category': 'RÉCUPÉRATION',
  'progress_coach.week2_plan.recovery_headline':
      'Aucun changement · sommeil de 7h10, objectif tenu',
  'progress_coach.week2_plan.recovery_reason':
      'Gardez votre routine du soir ; la récupération soutient vos progrès.',
  'progress_coach.week2_plan.accept': 'Accepter le programme semaine 2',
  'progress_coach.week2_plan.discuss': 'En parler au coach',
  'progress_coach.week2_plan.accepted_snackbar':
      'Programme semaine 2 accepté !',

  // ─── 18 · MILON Coach chat ───
  'progress_coach.coach.subtitle': 'Fitness · Récupération · Nutrition',
  'progress_coach.coach.guardrail':
      'Je réponds uniquement aux questions fitness, récupération et nutrition',
  'progress_coach.coach.timestamp_today': "Aujourd'hui · @time",
  'progress_coach.coach.prompt_30_min': 'En 30 min',
  'progress_coach.coach.prompt_warm_up': 'Ajouter un échauffement',
  'progress_coach.coach.prompt_swap_exercise': 'Remplacer un exercice',
  'progress_coach.coach.input_hint': 'Posez une question à votre coach...',
  'progress_coach.coach.auto_reply':
      "C'est noté ! J'ai adapté votre programme sans charge sur les poignets selon « @request ». À vous de jouer !",
  'progress_coach.coach.workout_title': 'Full Body salle · Poignets protégés',
  'progress_coach.coach.workout_meta': '45 min · 5 exercices · Salle',
  'progress_coach.coach.start_session': 'Démarrer la séance',
  'progress_coach.coach.saved_snackbar': 'Séance ajoutée aux favoris !',
  'progress_coach.coach.removed_snackbar': 'Retirée des favoris.',
};
