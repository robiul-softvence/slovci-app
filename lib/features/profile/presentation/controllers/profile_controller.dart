import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class ProfileController extends GetxController {
  // ─── 19 · Profile Main ───
  final RxBool motivatingStyle = true.obs; // false = Supportive, true = Motivating
  final RxString appLanguage = 'EN'.obs;
  final String referralCode = 'SOLENE30';

  // ─── 19d · Delete Account ───
  final deleteConfirmController = TextEditingController(text: 'DELETE');

  // ─── 19e · Edit Profile ───
  final firstNameController = TextEditingController(text: 'Solène');
  final lastNameController = TextEditingController(text: 'Martin');
  final dobController = TextEditingController(text: '12 Mar 1998 · 28 years');
  final heightController = TextEditingController(text: '165 cm');
  final weightController = TextEditingController(text: '62.0 kg');
  final targetWeightController = TextEditingController(
    text: '58.0 kg · Recommended pace (−0.4 kg/wk)',
  );
  final RxInt editGenderIndex = 0.obs; // 0 Female, 1 Male, 2 Other
  final RxInt editGoalIndex = 0.obs; // 0 Lose Weight, 1 Build Muscle, 2 Stay Fit

  // ─── 19f · Account & Security ───
  final RxBool twoStepEnabled = false.obs;

  // ─── 19g · Training Setup ───
  final RxInt trainEnvIdx = 1.obs; // 0 Gym, 1 Home, 2 Hybrid
  final RxSet<String> trainEquipment = <String>{
    'Dumbbells',
    'Resistance Bands',
    'Bench',
  }.obs;
  final RxSet<int> trainDays = <int>{0, 2, 4, 5}.obs;
  final RxBool cardioFinisher = true.obs;
  final RxBool warmUpEnabled = true.obs;

  // ─── 19i · Diet & Grocery Budget ───
  final RxString eatingStyle = 'Flexitarian'.obs;
  final RxSet<String> restrictions = <String>{'Lactose-Free'}.obs;
  final RxList<String> dislikedFoods = <String>['Mushrooms', 'Olives'].obs;
  final RxInt mealsPerWeekIdx = 1.obs; // 0: 7, 1: 14, 2: 21
  final RxDouble weeklyBudget = 50.0.obs;

  // ─── 19j · Notifications ───
  final RxBool allowNotifications = true.obs;
  final RxBool sessionReminders = true.obs;
  final RxBool restDayTips = false.obs;
  final RxBool mealReminders = true.obs;
  final RxBool waterNudges = true.obs;
  final RxBool weeklyCheckinNotif = true.obs;
  final RxBool achievementsNotif = true.obs;
  final RxBool coachMessagesNotif = true.obs;
  final RxBool offersNewsNotif = false.obs;
  final RxBool quietHoursEnabled = true.obs;

  // ─── 19k · Subscription & 20 · Paywall ───
  final promoCodeController = TextEditingController();
  final RxInt selectedPaywallPlan = 1.obs; // 0 Monthly, 1 Annual, 2 Quarterly

  // ─── 19l · Connected Apps ───
  final RxBool appleHealthConnected = true.obs;
  final RxBool syncWorkouts = true.obs;
  final RxBool syncActiveEnergy = true.obs;
  final RxBool syncSteps = true.obs;
  final RxBool syncWeight = true.obs;
  final RxBool syncSleep = true.obs;
  final RxBool syncHeartRate = false.obs;

  // ─── 19m · Privacy & Data ───
  final RxBool healthConsent = true.obs;
  final RxBool productAnalytics = true.obs;
  final RxBool personalizedOffers = false.obs;

  // ─── 19n · Units & Language ───
  final RxBool weightInKg = true.obs;
  final RxBool heightInCm = true.obs;
  final RxBool energyInKcal = true.obs;
  final RxBool distanceInKm = true.obs;
  final RxBool weekStartsMonday = true.obs;

  // ─── 19o · Help & Support ───
  final helpSearchController = TextEditingController();
  final supportMessageController = TextEditingController(
    text: 'I was charged twice for my annual plan this month. Can you check?',
  );
  final RxInt supportTopicIndex = 1.obs; // Billing
  final RxInt expandedFaqIndex = (-1).obs;

  // ─── Actions ───
  void copyReferralCode() {
    Clipboard.setData(ClipboardData(text: referralCode));
    AppHelperFunctions.showSnackBar('Referral code $referralCode copied!');
  }

  void toggleEquipment(String item) {
    if (trainEquipment.contains(item)) {
      trainEquipment.remove(item);
    } else {
      trainEquipment.add(item);
    }
  }

  void toggleTrainDay(int idx) {
    if (trainDays.contains(idx)) {
      if (trainDays.length > 1) trainDays.remove(idx);
    } else {
      trainDays.add(idx);
    }
  }

  void toggleRestriction(String item) {
    if (restrictions.contains(item)) {
      restrictions.remove(item);
    } else {
      restrictions.add(item);
    }
  }

  void removeDislikedFood(String food) => dislikedFoods.remove(food);

  void performLogOut() {
    Get.back();
    Get.offAllNamed(AppRoute.welcomeScreen);
  }

  void performDeleteAccount() {
    if (deleteConfirmController.text.trim().toUpperCase() != 'DELETE') {
      AppHelperFunctions.showSnackBar('Type DELETE to confirm.');
      return;
    }
    Get.back();
    Get.offAllNamed(AppRoute.welcomeScreen);
  }

  // ─── Navigation ───
  void openSettings() => Get.toNamed(AppRoute.profileSettingsScreen);
  void openEditProfile() => Get.toNamed(AppRoute.settingsEditProfileScreen);
  void openAccountSecurity() =>
      Get.toNamed(AppRoute.settingsAccountSecurityScreen);
  void openTrainingSetup() => Get.toNamed(AppRoute.settingsTrainingSetupScreen);
  void openInjuries() => Get.toNamed(AppRoute.settingsInjuriesScreen);
  void openDietBudget() => Get.toNamed(AppRoute.settingsDietBudgetScreen);
  void openNotifications() => Get.toNamed(AppRoute.settingsNotificationsScreen);
  void openSubscription() => Get.toNamed(AppRoute.settingsSubscriptionScreen);
  void openConnectedApps() => Get.toNamed(AppRoute.settingsConnectedAppsScreen);
  void openPrivacyData() => Get.toNamed(AppRoute.settingsPrivacyDataScreen);
  void openUnitsLanguage() => Get.toNamed(AppRoute.settingsUnitsLanguageScreen);
  void openHelpSupport() => Get.toNamed(AppRoute.settingsHelpSupportScreen);
  void openInviteFriends() => Get.toNamed(AppRoute.settingsInviteFriendsScreen);
  void openPrivacyPolicy() => Get.toNamed(AppRoute.settingsPrivacyPolicyScreen);
  void openPaywall() => Get.toNamed(AppRoute.paywallProScreen);

  @override
  void onClose() {
    deleteConfirmController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
    targetWeightController.dispose();
    promoCodeController.dispose();
    helpSearchController.dispose();
    supportMessageController.dispose();
    super.onClose();
  }
}
