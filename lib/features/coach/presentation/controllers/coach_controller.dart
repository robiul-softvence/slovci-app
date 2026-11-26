import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/core.dart';
import 'package:flutter_tamplate/routes/app_routes.dart';

class CoachChatMessage {
  const CoachChatMessage({
    required this.isUser,
    required this.text,
    this.hasWorkoutPlan = false,
  });

  final bool isUser;
  final String text;
  final bool hasWorkoutPlan;
}

class CoachController extends GetxController {
  final inputController = TextEditingController();
  final RxBool savedWorkout = false.obs;

  final List<String> quickPrompts = const [
    'Make it 30 min',
    'Add a warm-up',
    'Swap an exercise',
  ];

  final List<(String, String, String)> generatedWorkoutExercises = const [
    ('01', 'Leg Press', '4 × 10 · 80 kg'),
    ('02', 'Machine Chest Press · Neutral', '3 × 12 · 25 kg'),
    ('03', 'Seated Cable Row · Straps', '3 × 12 · 30 kg'),
    ('04', 'Romanian Deadlift · Straps', '3 × 10 · 22 kg'),
    ('05', 'Forearm Plank', '3 × 45 sec'),
  ];

  final RxList<CoachChatMessage> messages = <CoachChatMessage>[
    const CoachChatMessage(
      isUser: false,
      text:
          'Morning Solène! Your quads are recovered and you slept 7h40. What would you like to train today?',
    ),
    const CoachChatMessage(
      isUser: true,
      text:
          'Create a 45-min Full Body gym workout that protects my wrists',
    ),
    const CoachChatMessage(
      isUser: false,
      text:
          'Done! No direct wrist loading: neutral grips, straps and forearm-based core work only.',
      hasWorkoutPlan: true,
    ),
    const CoachChatMessage(
      isUser: true,
      text: "What's the weather tomorrow?",
    ),
    const CoachChatMessage(
      isUser: false,
      text:
          "I'm your fitness & nutrition coach, so I can't help with weather. But if it's sunny, I can plan a 30-min outdoor run for you!",
    ),
  ].obs;

  void sendMessage([String? preset]) {
    final content = (preset ?? inputController.text).trim();
    if (content.isEmpty) return;
    messages.add(CoachChatMessage(isUser: true, text: content));
    inputController.clear();
    messages.add(
      CoachChatMessage(
        isUser: false,
        text:
            'Got it! I have updated your wrist-safe plan based on "$content". Ready when you are!',
      ),
    );
  }

  void startGeneratedSession() => Get.toNamed(AppRoute.workoutActiveSetScreen);

  void toggleBookmark() {
    savedWorkout.toggle();
    AppHelperFunctions.showSnackBar(
      savedWorkout.value ? 'Workout saved to favorites!' : 'Removed from saved.',
    );
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
