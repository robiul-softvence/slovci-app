# 📋 Project Rules — Milky Amsterdamm App (`tavonza_ai`)

> **Scope:** All contributors and AI agents working on this repository MUST follow every rule in this document without exception.
> These rules are derived from the existing codebase, `ARCHITECTURE.md`, `AGENTS.md`, and `.agents/rules/architecture.md`.

---

## 1. 🏗️ Architecture — Feature-First Clean Architecture

This project enforces a strict **Feature-First Clean Architecture** powered by **GetX**.

### 1.1 Mandatory Feature Folder Structure

Every feature under `lib/features/<feature_name>/` **MUST** follow this exact layout:

```
features/<feature_name>/
├── domain/                   # Pure Dart — NO Flutter/GetX imports allowed
│   ├── entities/             # Core business objects (plain Dart classes)
│   ├── repositories/         # Abstract interface contracts
│   └── usecases/             # Single-responsibility business rules
├── data/                     # External communication & JSON parsing
│   ├── datasources/          # API calls via NetworkCaller / local DB
│   ├── models/               # DTO classes — must implement toEntity() / fromEntity()
│   └── repositories/         # Concrete implementations of domain interfaces
├── presentation/             # UI & State Management
│   ├── controllers/          # GetxControllers — call UseCases, manage Rx state
│   ├── screens/              # Full routed screens (StatelessWidget / GetView)
│   └── widgets/              # Feature-private UI components
└── bindings/                 # GetX Bindings — wire DataSource→Repo→UseCase→Controller
```

### 1.2 Dependency Direction (NEVER violate)

```
Presentation  →  Domain  ←  Data
                   ↑
                Core / Services
```

- `Domain` depends on **nothing** (pure Dart only).
- `Data` depends only on `Domain` interfaces.
- `Presentation` depends only on `Domain` entities and use cases.
- **Cross-feature imports are strictly forbidden.** Shared code belongs in `lib/core/`.

---

## 2. 🔵 Domain Layer Rules

- **Pure Dart only.** Never import `flutter`, `get`, `dio`, or any third-party package inside `domain/`.
- **Entities** are plain Dart classes that represent business objects. They must never hold raw JSON or Flutter types.
- **Repository interfaces** are abstract classes defining data contracts; they do not know how data is fetched.
- **UseCases** are single-purpose classes (e.g., `LoginUseCase`) with an `execute(...)` or `call(...)` method. Controllers call these — never DataSources directly.

---

## 3. 🟡 Data Layer Rules

- **Models** are DTOs that parse JSON. Every model **MUST** implement:
  - `toEntity()` → converts the DTO to a pure Domain Entity.
  - `fromEntity(Entity e)` or `fromJson(Map<String, dynamic> json)` → constructs a model from JSON or an entity.
- **DataSources** are the only classes allowed to call `NetworkCaller` or local storage directly.
- **Repository implementations** receive DataSources via constructor injection and convert Models to Entities before returning results. UseCases and Controllers must always receive Domain Entities — never raw JSON or DTOs.
- Never instantiate `Dio` directly in a feature. All HTTP traffic MUST go through `NetworkCaller` (`lib/core/services/network/network_caller.dart`).

---

## 4. 🟢 Presentation Layer Rules

### 4.1 Widget Type Policy
- **ALWAYS use `StatelessWidget` or `GetView<ControllerType>`** for all screens and widgets.
- **NEVER use `StatefulWidget`** unless it is strictly mandatory for complex low-level animations that require explicit `TickerProviderStateMixin`.

### 4.2 State Management (GetX)
- All reactive state (`Rx`, `TextEditingController`, loading flags, etc.) lives inside `GetxController` classes.
- Use `.obs` to make state reactive.
- Wrap only the **smallest possible widget** that needs updates in `Obx(...)`. Do not wrap entire screens in `Obx`.
- Controllers **never make API calls directly**; they call UseCases.
- Screens and widgets **only observe state**; they never contain business logic.

### 4.3 Controller Access
- Access controllers via `Get.find<ControllerType>()` or by extending `GetView<ControllerType>` (preferred for screens).
- **Never instantiate a controller or binding manually inside a `build()` method.**

---

## 5. 🔗 Dependency Injection & Routing Rules

### 5.1 Bindings
- Every feature MUST have a `Binding` class inside its `bindings/` folder.
- Wire the full dependency chain inside `dependencies()`:
  ```dart
  DataSource → RepositoryImpl (injected into) → UseCase (injected into) → Controller
  ```
- Use `Get.lazyPut(...)` for feature-scoped dependencies.
- Use `Get.put(..., permanent: true)` only for truly global services (e.g., `InternetService`, `ThemeController`).

### 5.2 Routes
- **All routes are registered in `lib/routes/app_routes.dart`** inside the `AppRoute` class.
- Every `GetPage` entry MUST reference its `Binding` (where applicable):
  ```dart
  GetPage(name: loginScreen, page: () => const LoginScreen(), binding: AuthBinding())
  ```
- Navigate using named routes: `Get.toNamed(AppRoute.someScreen)` or `Get.offAllNamed(...)`.
- **NEVER use `Get.to(SomeScreen())` directly** — always use named routes.

---

## 6. 🎨 Design Tokens — STRICTLY ENFORCED

### 6.1 Colors — `AppColors`
- **All colors MUST come from `AppColors`** (`lib/core/utils/constants/colors.dart`).
- **Hardcoded hex values (e.g., `Color(0xFF...)`) are absolutely forbidden in UI files.**
- Use theme-aware helpers (`AppColors.background(context)`, `AppColors.textPrimary(context)`) for adaptive light/dark colors.

**Key palette:**

| Token | Value | Usage |
|---|---|---|
| `AppColors.primary` | `#FF7176` | Primary brand color (pink-red) |
| `AppColors.yellowColorFFD60A` | `#FFD60A` | Accent / CommonButton default background |
| `AppColors.darkBackground` | `#000000` | Dark scaffold |
| `AppColors.cardBackground` | `#161618` | Dark card surfaces |
| `AppColors.white` | `#FFFFFF` | White |
| `AppColors.black` | `#000000` | Black |

### 6.2 Sizing — `Sizer` / `DesignPixel` Extensions
- **All dimensions (width, height, font sizes, padding, radius) MUST use the `Sizer` extension system.**
- Design canvas: **360 × 690**.
- **Absolutely forbidden:** hardcoded pixel values like `SizedBox(height: 20)`, `fontSize: 16`, `padding: EdgeInsets.all(8)`.

| Extension | Usage |
|---|---|
| `20.w` | Width scaled to device (maps to design width ratio) |
| `20.h` | Height scaled to device |
| `16.sp` | Font size (scales with width ratio) |
| `8.r` | Uniform radius / icon size (min ratio) |
| `Gap(16)` | Vertical spacer widget |
| `Gap.h(16)` | Horizontal spacer widget |

---

## 7. 🧩 Common Components — Use, Don't Reinvent

All globally reusable components live in `lib/core/common/` and are exported through `lib/core/core.dart`.

### 7.1 Buttons

| Component | When to Use |
|---|---|
| `CommonButton` | **Standard button** — always use this for primary actions. Built on `Container` + `GestureDetector`. Default background: `AppColors.yellowColorFFD60A`. |
| `ProElevatedButton` | Feature-rich button with loading state, gradient, icons. Use when `CommonButton` is insufficient. |

> ❌ Do NOT create custom button widgets when `CommonButton` or `ProElevatedButton` already satisfies the requirement.

### 7.2 Text Fields
- Use `CommonTextField` and `CommonPasswordField` from `lib/core/common/common_text_field/`.

### 7.3 Loading Indicators
- Use `ThreeDotsLoading` from `lib/core/common/loading/`.

### 7.4 Text Styles
- Use `AppTextStyle(context)` from `lib/core/common/styles/global_text_style.dart`.
- Use `AppTextTheme` for Material theme-level text styles.

---

## 8. 🌐 Networking Rules

- **All API calls go through `NetworkCaller`** (`lib/core/services/network/network_caller.dart`) — a singleton using Dio.
- `NetworkCaller` is injected into DataSources via constructor injection — never `Get.find` inside a datasource.
- `StorageService` (`lib/core/services/cache/storage_service.dart`) handles all key/value persistence. Initialize it before `runApp` in `main.dart`.
- All API base URLs and endpoint paths go in `ApiConstants` (`lib/core/utils/constants/api_constants.dart`). **No raw URL strings in DataSources**.
- All network responses are wrapped in `ResponseData` (`lib/core/models/response_data.dart`).

---

## 9. 📁 File & Naming Conventions

| Item | Convention | Example |
|---|---|---|
| Files | `snake_case` | `auth_controller.dart` |
| Classes | `PascalCase` | `AuthController` |
| Variables / methods | `camelCase` | `isLoading`, `fetchUser()` |
| Route name constants | `camelCase` | `loginScreen = "/loginScreen"` |
| Assets | `snake_case` | `assets/icons/arrow_right.svg` |
| Feature folders | `snake_case` | `lib/features/splash_and_onboarding/` |
| Entities | `<Name>Entity` | `UserEntity` |
| Models (DTOs) | `<Name>Model` | `UserModel` |
| UseCases | `<Action>UseCase` | `LoginUseCase` |
| Repositories (abstract) | `<Name>Repository` | `AuthRepository` |
| Repository implementations | `<Name>RepositoryImpl` | `AuthRepositoryImpl` |
| Bindings | `<Feature>Binding` | `AuthBinding` |
| Controllers | `<Feature>Controller` | `AuthController` |
| Screens | `<Name>Screen` | `LoginScreen` |

---

## 10. 🖌️ Theme Rules

- The app supports **light and dark themes**, configured in `AppTheme` (`lib/core/utils/theme/theme.dart`).
- All theme sub-configs live in `lib/core/utils/theme/custom_themes/`:
  - `AppBarThemes` — AppBar theming
  - `AppElevatedButtonTheme` — ElevatedButton theming
  - `AppTextTheme` — Material TextTheme
  - `AppTextFormFieldTheme` — InputDecoration theming
- `ThemeController` manages `ThemeMode`. Access via `ThemeController.to.themeMode`.
- `textScaler` is locked to `TextScaler.linear(1.0)` globally — do NOT allow system font scaling to break layouts.

---

## 11. ✅ Code Quality Standards

- **Run `flutter analyze` before every commit.** The CI/CD pipeline requires **0 warnings**.
- **No hardcoded strings in UI** — use `AppTexts` or localization strings (`lib/core/localization/`).
- **No duplication** — always check `lib/core/` for existing utilities before creating new ones.
- **Minimal `Obx` scope** — rebuild the smallest possible widget, never full pages.
- **No business logic in UI** — controllers own all logic; widgets only render.
- **No `StatefulWidget` in screens** — use GetX reactive state instead.
- Branch naming: `feat/<name>`, `fix/<name>`, `chore/<name>`.

---

## 12. 📦 Key Dependencies

| Package | Purpose | Usage Rule |
|---|---|---|
| `get ^4.7.3` | State, DI, routing | Use for all 3 roles; do not use `Provider` or `Riverpod` |
| `dio ^5.9.2` | HTTP client | Only through `NetworkCaller` singleton |
| `sizer ^3.1.3` | Responsive sizing | Wrap app in `Sizer(...)` widget in `app.dart` |
| `google_fonts ^8.0.2` | Typography | Use through `AppTextTheme` / `AppTextStyle` |
| `shared_preferences ^2.5.5` | Local storage | Only through `StorageService` |
| `flutter_svg ^2.2.4` | SVG rendering | Reference paths via `IconPath` / `ImagePath` constants |
| `lottie ^3.3.3` | Animations | Use for onboarding / loading animations |
| `connectivity_plus ^6.1.4` | Internet detection | Managed by `InternetService` + `InternetToastListener` |
| `flutter_map ^8.3.2` | Map rendering | Use `latlong2` for coordinate models |
| `geolocator ^13.0.2` | GPS | Use through `AllowLocationController` / `SelectLocationController` |

---

## 13. 🗂️ Core Directory Map

```
lib/
├── main.dart                          # App entry; initializes StorageService & ThemeController
├── app.dart                           # GetMaterialApp wrapped in Sizer; sets routes & themes
├── routes/
│   └── app_routes.dart                # Single source of truth for all named routes
├── core/
│   ├── core.dart                      # Barrel export for everything in core/
│   ├── bindings/
│   │   └── controller_binder.dart     # Global permanent bindings (InternetService)
│   ├── common/
│   │   ├── common_button/             # CommonButton, ProElevatedButton
│   │   ├── common_text_field/         # CommonTextField, CommonPasswordField
│   │   ├── loading/                   # ThreeDotsLoading
│   │   └── styles/                    # AppTextStyle (global_text_style.dart)
│   ├── controllers/
│   │   └── theme_controller.dart      # ThemeController (light/dark toggle)
│   ├── models/
│   │   └── response_data.dart         # Standard API response wrapper
│   ├── services/
│   │   ├── cache/storage_service.dart # SharedPreferences wrapper
│   │   ├── network/
│   │   │   ├── network_caller.dart    # Dio singleton — all HTTP calls here
│   │   │   └── internet_service.dart  # Connectivity monitoring
│   │   └── firebase/                  # FCM, notifications
│   └── utils/
│       ├── constants/
│       │   ├── colors.dart            # AppColors — ALL colors defined here
│       │   ├── sizer.dart             # DesignPixel (.w .h .sp .r), Gap widget
│       │   ├── api_constants.dart     # Base URL + endpoint paths
│       │   ├── icon_path.dart         # SVG/icon asset path constants
│       │   ├── image_path.dart        # Image asset path constants
│       │   ├── app_texts.dart         # Static string constants
│       │   └── enums.dart             # All project-wide enums
│       ├── theme/                     # AppTheme, AppBarThemes, AppTextTheme, etc.
│       ├── validators/                # AppValidator
│       ├── formatters/                # AppFormatters
│       ├── helpers/                   # AppHelper
│       ├── logging/                   # Logger
│       └── device/                    # DeviceUtility
└── features/
    ├── authentication/                # Login, OTP, forgot-password, location screens
    ├── splash_and_onboarding/         # Splash + onboarding flow
    ├── bottom_nav/                    # Bottom navigation shell
    ├── home/                          # Home feature (in progress)
    ├── search/                        # Search feature
    └── waiter_flow/                   # Waiter-specific flow (in progress)
```

---

## 14. ⛔ Absolute Prohibitions

| ❌ Forbidden | ✅ Required Instead |
|---|---|
| `StatefulWidget` in screens/widgets | `StatelessWidget` or `GetView` |
| `Dio()` directly in a feature | `NetworkCaller()` singleton |
| Hardcoded color hex in UI | `AppColors.someColor` |
| Hardcoded pixel values (`16`, `0.5`) | `.w`, `.h`, `.sp`, `.r` extensions |
| API calls inside a Controller | Controller → UseCase → DataSource |
| JSON/raw maps returned from Repository | Mapped Domain Entities |
| `Get.to(SomeScreen())` | `Get.toNamed(AppRoute.someScreen)` |
| `Binding().dependencies()` in `build()` | Wire bindings via `GetPage(binding: ...)` |
| Global imports from another feature | Only `lib/core/` for shared code |
| New button widget from scratch | `CommonButton` or `ProElevatedButton` |
| Cross-feature direct imports | Shared code in `lib/core/` only |
