// Shared: core widgets, splash, welcome, bottom nav, system states strings. Keys: 'common.<screen>.<name>'.
// Keep both maps in the same order with identical keys.

const Map<String, String> commonEn = {
  // App
  'common.app.tagline': 'Every day, stronger.',
  'common.app.ok': 'OK',
  // Welcome
  'common.welcome.eyebrow': 'YOUR FITNESS & NUTRITION COACH',
  'common.welcome.title': 'Every day,\nstronger.',
  'common.welcome.subtitle':
      'Workouts and meals built around your body, your schedule and your budget, progressing at your pace.',
  'common.welcome.get_started': 'Get Started',
  'common.welcome.have_account': 'I already have an account',
  'common.welcome.preview_title': "TODAY'S PLAN",
  'common.welcome.preview_session': 'Full Body · 45 min · Home',
  'common.welcome.stat_kcal': 'kcal',
  'common.welcome.stat_protein': 'protein',
  'common.welcome.stat_water': 'water',
  // Bottom nav
  'common.bottom_nav.home': 'Home',
  'common.bottom_nav.workout': 'Workout',
  'common.bottom_nav.nutrition': 'Nutrition',
  'common.bottom_nav.progress': 'Progress',
  'common.bottom_nav.coach': 'MILON Coach',
  // Internet toast
  'common.internet.restored_title': 'Connection Restored',
  'common.internet.restored_message': 'You are back online now.',
  'common.internet.lost_title': 'No Internet Connection',
  'common.internet.lost_message': 'Please check your data or Wi-Fi settings.',
  // Validation
  'common.validation.email_required': 'Email is required.',
  'common.validation.email_invalid': 'Invalid email address.',
  'common.validation.password_required': 'Password is required.',
  'common.validation.password_min_length':
      'Password must be at least @count characters long.',
  'common.validation.password_uppercase':
      'Password must contain at least one uppercase letter.',
  'common.validation.password_number':
      'Password must contain at least one number.',
  'common.validation.password_special':
      'Password must contain at least one special character.',
  'common.validation.phone_required': 'Phone number is required.',
  'common.validation.phone_invalid':
      'Invalid phone number format (10 digits required).',
  // Relative time
  'common.time.invalid_date': 'Invalid date',
  'common.time.seconds_ago_one': '@count second ago',
  'common.time.seconds_ago_other': '@count seconds ago',
  'common.time.minutes_ago_one': '@count minute ago',
  'common.time.minutes_ago_other': '@count minutes ago',
  'common.time.hours_ago_one': '@count hour ago',
  'common.time.hours_ago_other': '@count hours ago',
  'common.time.days_ago_one': '@count day ago',
  'common.time.days_ago_other': '@count days ago',
  // File picker & network errors
  'common.picker.select_photo': 'Select Photo',
  'common.picker.select_video': 'Select Video',
  'common.picker.select_media': 'Select Media',
  'common.picker.take_photo': 'Take Photo',
  'common.picker.record_video': 'Record Video',
  'common.picker.choose_gallery': 'Choose from Gallery',
  'common.picker.use_camera': 'Use Camera',
  'common.picker.camera': 'Camera',
  'common.picker.gallery': 'Gallery',
  'common.picker.pick_image': 'Pick Image',
  'common.picker.pick_video': 'Pick Video',
  'common.network.unknown_error': 'Unknown error',
  'common.network.unknown_error_occurred': 'Unknown error occurred.',
  'common.network.bad_request': 'Bad Request',
  'common.network.server_error': 'Internal Server Error',
  'common.network.unexpected_error': 'Unexpected error occurred',
  'common.network.validation_error': 'Validation error',
  'common.network.timeout': 'Request timed out. Please try again.',
  'common.network.no_internet': 'No internet connection. Please check your network.',
  'common.network.cancelled': 'Request was cancelled.',
  'common.network.an_unexpected_error': 'An unexpected error occurred.',
};

const Map<String, String> commonFr = {
  // App
  'common.app.tagline': 'Chaque jour, plus fort·e.',
  'common.app.ok': 'OK',
  // Welcome
  'common.welcome.eyebrow': 'VOTRE COACH FITNESS & NUTRITION',
  'common.welcome.title': 'Chaque jour,\nplus fort·e.',
  'common.welcome.subtitle':
      'Des séances et des repas pensés pour votre corps, votre emploi du temps et votre budget, qui évoluent à votre rythme.',
  'common.welcome.get_started': 'Commencer',
  'common.welcome.have_account': 'J’ai déjà un compte',
  'common.welcome.preview_title': 'PLAN DU JOUR',
  'common.welcome.preview_session': 'Full Body · 45 min · Maison',
  'common.welcome.stat_kcal': 'kcal',
  'common.welcome.stat_protein': 'protéines',
  'common.welcome.stat_water': 'eau',
  // Bottom nav
  'common.bottom_nav.home': 'Accueil',
  'common.bottom_nav.workout': 'Séance',
  'common.bottom_nav.nutrition': 'Nutrition',
  'common.bottom_nav.progress': 'Progrès',
  'common.bottom_nav.coach': 'Coach MILON',
  // Internet toast
  'common.internet.restored_title': 'Connexion rétablie',
  'common.internet.restored_message': 'Vous êtes de nouveau en ligne.',
  'common.internet.lost_title': 'Pas de connexion Internet',
  'common.internet.lost_message':
      'Veuillez vérifier vos données mobiles ou vos paramètres Wi-Fi.',
  // Validation
  'common.validation.email_required': 'L’e-mail est obligatoire.',
  'common.validation.email_invalid': 'Adresse e-mail invalide.',
  'common.validation.password_required': 'Le mot de passe est obligatoire.',
  'common.validation.password_min_length':
      'Le mot de passe doit contenir au moins @count caractères.',
  'common.validation.password_uppercase':
      'Le mot de passe doit contenir au moins une lettre majuscule.',
  'common.validation.password_number':
      'Le mot de passe doit contenir au moins un chiffre.',
  'common.validation.password_special':
      'Le mot de passe doit contenir au moins un caractère spécial.',
  'common.validation.phone_required': 'Le numéro de téléphone est obligatoire.',
  'common.validation.phone_invalid':
      'Format de numéro de téléphone invalide (10 chiffres requis).',
  // Relative time
  'common.time.invalid_date': 'Date invalide',
  'common.time.seconds_ago_one': 'il y a @count seconde',
  'common.time.seconds_ago_other': 'il y a @count secondes',
  'common.time.minutes_ago_one': 'il y a @count minute',
  'common.time.minutes_ago_other': 'il y a @count minutes',
  'common.time.hours_ago_one': 'il y a @count heure',
  'common.time.hours_ago_other': 'il y a @count heures',
  'common.time.days_ago_one': 'il y a @count jour',
  'common.time.days_ago_other': 'il y a @count jours',
  // File picker & network errors
  'common.picker.select_photo': 'Choisir une photo',
  'common.picker.select_video': 'Choisir une vidéo',
  'common.picker.select_media': 'Choisir un média',
  'common.picker.take_photo': 'Prendre une photo',
  'common.picker.record_video': 'Filmer une vidéo',
  'common.picker.choose_gallery': 'Choisir dans la galerie',
  'common.picker.use_camera': 'Utiliser l’appareil photo',
  'common.picker.camera': 'Appareil photo',
  'common.picker.gallery': 'Galerie',
  'common.picker.pick_image': 'Choisir une image',
  'common.picker.pick_video': 'Choisir une vidéo',
  'common.network.unknown_error': 'Erreur inconnue',
  'common.network.unknown_error_occurred': 'Une erreur inconnue est survenue.',
  'common.network.bad_request': 'Requête invalide',
  'common.network.server_error': 'Erreur interne du serveur',
  'common.network.unexpected_error': 'Une erreur inattendue est survenue',
  'common.network.validation_error': 'Erreur de validation',
  'common.network.timeout': 'La requête a expiré. Veuillez réessayer.',
  'common.network.no_internet': 'Pas de connexion Internet. Veuillez vérifier votre réseau.',
  'common.network.cancelled': 'La requête a été annulée.',
  'common.network.an_unexpected_error': 'Une erreur inattendue est survenue.',
};
