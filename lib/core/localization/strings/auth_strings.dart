// Authentication strings. Keys: 'auth.<screen>.<name>'.
// Keep both maps in the same order with identical keys.

const Map<String, String> authEn = {
  // Shared fields & links
  'auth.common.email_label': 'Email',
  'auth.common.password_label': 'Password',
  'auth.common.password_hint': 'At least 8 characters',
  'auth.common.log_in_link': 'Log in',
  // Social sign-in
  'auth.social.continue_apple': 'Continue with Apple',
  'auth.social.continue_google': 'Continue with Google',
  'auth.social.or_email': 'or with email',
  'auth.social.apple_unavailable': 'Sign in with Apple is not connected yet.',
  'auth.social.google_unavailable': 'Sign in with Google is not connected yet.',
  // Sign in
  'auth.sign_in.title': 'Welcome back',
  'auth.sign_in.subtitle': 'Log in to pick up your plan where you left off.',
  'auth.sign_in.button': 'Log In',
  'auth.sign_in.new_prompt': 'New to MILON?',
  'auth.sign_in.create_account_link': 'Create an account',
  'auth.sign_in.forgot_password': 'Forgot password?',
  // Sign up
  'auth.sign_up.title': 'Create your account',
  'auth.sign_up.subtitle': 'Save your plan and sync it across devices.',
  'auth.sign_up.button': 'Create Account',
  'auth.sign_up.have_account_prompt': 'Already have an account?',
  'auth.sign_up.terms': 'I agree to the Terms of Use and Privacy Policy.',
  'auth.sign_up.accept_terms_error':
      'Please accept the Terms of Use and Privacy Policy.',
  // Forgot password
  'auth.forgot_password.title': 'Reset your password',
  'auth.forgot_password.subtitle':
      "Enter your account email and we'll send you a link to reset your password.",
  'auth.forgot_password.button': 'Send Reset Link',
  'auth.forgot_password.remembered_prompt': 'Remembered it?',
  // Verify email
  'auth.verify_email.title': 'Check your email',
  'auth.verify_email.subtitle':
      'We sent a 6-digit code to @email. Enter it below to verify your account.',
  'auth.verify_email.your_email': 'your email',
  'auth.verify_email.button': 'Verify Email',
  'auth.verify_email.wrong_email_prompt': 'Wrong email?',
  'auth.verify_email.change_link': 'Change it',
  'auth.verify_email.code_label': 'Verification code',
  'auth.verify_email.not_received': "Didn't get it? ",
  'auth.verify_email.resend_in': 'Resend code in @time',
  'auth.verify_email.resend': 'Resend code',
  'auth.verify_email.code_resent': 'A new code is on its way.',
  'auth.verify_email.code_incomplete': 'Enter the 6-digit code.',
  // Create new password
  'auth.create_password.title': 'Create a new password',
  'auth.create_password.subtitle':
      'Choose a password you don’t use anywhere else.',
  'auth.create_password.button': 'Update Password',
  'auth.create_password.back_prompt': 'Back to',
  'auth.create_password.back_link': 'Log in',
  'auth.create_password.new_label': 'New password',
  'auth.create_password.confirm_label': 'Confirm new password',
  'auth.create_password.confirm_hint': 'Re-enter password',
  'auth.create_password.updated':
      'Password updated. Log in with your new password.',
  // Validation
  'auth.validation.password_min_length':
      'Password must be at least 8 characters.',
  'auth.validation.passwords_mismatch': 'Passwords do not match.',
};

const Map<String, String> authFr = {
  // Shared fields & links
  'auth.common.email_label': 'E-mail',
  'auth.common.password_label': 'Mot de passe',
  'auth.common.password_hint': 'Au moins 8 caractères',
  'auth.common.log_in_link': 'Se connecter',
  // Social sign-in
  'auth.social.continue_apple': 'Continuer avec Apple',
  'auth.social.continue_google': 'Continuer avec Google',
  'auth.social.or_email': 'ou par e-mail',
  'auth.social.apple_unavailable':
      'La connexion avec Apple n’est pas encore disponible.',
  'auth.social.google_unavailable':
      'La connexion avec Google n’est pas encore disponible.',
  // Sign in
  'auth.sign_in.title': 'Bon retour',
  'auth.sign_in.subtitle':
      'Connectez-vous pour reprendre votre programme là où vous l’avez laissé.',
  'auth.sign_in.button': 'Se connecter',
  'auth.sign_in.new_prompt': 'Nouveau sur MILON ?',
  'auth.sign_in.create_account_link': 'Créer un compte',
  'auth.sign_in.forgot_password': 'Mot de passe oublié ?',
  // Sign up
  'auth.sign_up.title': 'Créez votre compte',
  'auth.sign_up.subtitle':
      'Enregistrez votre programme et synchronisez-le sur tous vos appareils.',
  'auth.sign_up.button': 'Créer un compte',
  'auth.sign_up.have_account_prompt': 'Vous avez déjà un compte ?',
  'auth.sign_up.terms':
      'J’accepte les Conditions d’utilisation et la Politique de confidentialité.',
  'auth.sign_up.accept_terms_error':
      'Veuillez accepter les Conditions d’utilisation et la Politique de confidentialité.',
  // Forgot password
  'auth.forgot_password.title': 'Réinitialisez votre mot de passe',
  'auth.forgot_password.subtitle':
      'Saisissez l’e-mail de votre compte et nous vous enverrons un lien pour réinitialiser votre mot de passe.',
  'auth.forgot_password.button': 'Envoyer le lien',
  'auth.forgot_password.remembered_prompt': 'Vous vous en souvenez ?',
  // Verify email
  'auth.verify_email.title': 'Vérifiez vos e-mails',
  'auth.verify_email.subtitle':
      'Nous avons envoyé un code à 6 chiffres à @email. Saisissez-le ci-dessous pour vérifier votre compte.',
  'auth.verify_email.your_email': 'votre adresse e-mail',
  'auth.verify_email.button': 'Vérifier l’e-mail',
  'auth.verify_email.wrong_email_prompt': 'Mauvaise adresse ?',
  'auth.verify_email.change_link': 'La modifier',
  'auth.verify_email.code_label': 'Code de vérification',
  'auth.verify_email.not_received': 'Vous ne l’avez pas reçu ? ',
  'auth.verify_email.resend_in': 'Renvoyer le code dans @time',
  'auth.verify_email.resend': 'Renvoyer le code',
  'auth.verify_email.code_resent': 'Un nouveau code est en route.',
  'auth.verify_email.code_incomplete': 'Saisissez le code à 6 chiffres.',
  // Create new password
  'auth.create_password.title': 'Créez un nouveau mot de passe',
  'auth.create_password.subtitle':
      'Choisissez un mot de passe que vous n’utilisez nulle part ailleurs.',
  'auth.create_password.button': 'Mettre à jour le mot de passe',
  'auth.create_password.back_prompt': 'Retour à',
  'auth.create_password.back_link': 'la connexion',
  'auth.create_password.new_label': 'Nouveau mot de passe',
  'auth.create_password.confirm_label': 'Confirmez le nouveau mot de passe',
  'auth.create_password.confirm_hint': 'Saisissez à nouveau le mot de passe',
  'auth.create_password.updated':
      'Mot de passe mis à jour. Connectez-vous avec votre nouveau mot de passe.',
  // Validation
  'auth.validation.password_min_length':
      'Le mot de passe doit contenir au moins 8 caractères.',
  'auth.validation.passwords_mismatch':
      'Les mots de passe ne correspondent pas.',
};
