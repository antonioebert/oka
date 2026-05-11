import 'package:flutter/material.dart';

/// ─────────────────────────────────────────
/// PRIMITIVOS
/// ─────────────────────────────────────────
abstract class OkaPrimitiveColors {
  // Blue
  static const blue100 = Color(0xFFECEEFB);
  static const blue200 = Color(0xFFD4D9F7);
  static const blue300 = Color(0xFF8090E4);
  static const blue400 = Color(0xFF4059D7);
  static const blue500 = Color(0xFF172882);
  static const blue600 = Color(0xFF151E48);

  // Grey
  static const grey100 = Color(0xFFECECEC);
  static const grey200 = Color(0xFFE0E0E0);
  static const grey300 = Color(0xFFC6C6C6);
  static const grey400 = Color(0xFF8E8E8E);
  static const grey500 = Color(0xFF686868);
  static const grey600 = Color(0xFF424242);

  // Yellow
  static const yellow100 = Color(0xFFFDF8EA);
  static const yellow200 = Color(0xFFFCF0D5);
  static const yellow300 = Color(0xFFF5D381);
  static const yellow400 = Color(0xFFEFB52D);
  static const yellow500 = Color(0xFF8F6D1B);
  static const yellow600 = Color(0xFF503C0F);

  // Green
  static const green100 = Color(0xFFE6F4EA);
  static const green200 = Color(0xFFCEE9D6);
  static const green300 = Color(0xFF6BBD83);
  static const green400 = Color(0xFF008728);
  static const green500 = Color(0xFF05571D);
  static const green600 = Color(0xFF002D0D);

  // Red
  static const red100 = Color(0xFFFEE8E7);
  static const red200 = Color(0xFFFCD1CF);
  static const red300 = Color(0xFFF7756E);
  static const red400 = Color(0xFFE1190C);
  static const red500 = Color(0xFF910F08);
  static const red600 = Color(0xFF4B0804);

  // Base
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
}

/// ─────────────────────────────────────────
/// SEMÂNTICOS — Brand
/// ─────────────────────────────────────────
abstract class OkaColors {
  // Brand
  static const brandPrimary   = OkaPrimitiveColors.blue400;   // #4059d7
  static const brandSecondary = OkaPrimitiveColors.yellow400; // #efb52d
  static const brandLight     = OkaPrimitiveColors.white;     // #ffffff
  static const brandDark      = OkaPrimitiveColors.black;     // #000000

  // Text / Content
  static const textDefault   = OkaPrimitiveColors.grey600;
  static const textNeutral   = OkaPrimitiveColors.grey500;
  static const textPrimary   = OkaPrimitiveColors.blue600;
  static const textSecondary = OkaPrimitiveColors.blue500;
  static const textLight     = OkaPrimitiveColors.white;
  static const textDisabled  = OkaPrimitiveColors.grey400;
  static const textError     = OkaPrimitiveColors.red500;
  static const textWarning   = OkaPrimitiveColors.yellow600;
  static const textSuccess   = OkaPrimitiveColors.green500;

  // Text / Label
  static const labelPrimary  = OkaPrimitiveColors.white;
  static const labelLink     = OkaPrimitiveColors.blue400;
  static const labelDisabled = OkaPrimitiveColors.grey400;

  // Icon
  static const iconDefault   = OkaPrimitiveColors.grey600;
  static const iconPrimary   = OkaPrimitiveColors.blue400;
  static const iconSecondary = OkaPrimitiveColors.blue500;
  static const iconLight     = OkaPrimitiveColors.white;
  static const iconDark      = OkaPrimitiveColors.blue600;
  static const iconNeutral   = OkaPrimitiveColors.grey500;
  static const iconInfo      = OkaPrimitiveColors.grey400;
  static const iconError     = OkaPrimitiveColors.red500;
  static const iconWarning   = OkaPrimitiveColors.yellow600;
  static const iconSuccess   = OkaPrimitiveColors.green500;

  // Stroke
  static const strokeDefault   = OkaPrimitiveColors.grey300;
  static const strokePrimary   = OkaPrimitiveColors.blue400;
  static const strokeSecondary = OkaPrimitiveColors.blue500;
  static const strokeNeutral   = OkaPrimitiveColors.grey200;
  static const strokeDark      = OkaPrimitiveColors.grey600;

  // Fill / Background
  static const bgDefault  = OkaPrimitiveColors.grey100;
  static const bgPrimary  = OkaPrimitiveColors.blue100;
  static const bgNeutral  = OkaPrimitiveColors.blue200;
  static const bgWarning  = OkaPrimitiveColors.yellow200;
  static const bgLight    = OkaPrimitiveColors.white;
  static const bgBrand    = OkaPrimitiveColors.blue400;

  // Fill / Divider
  static const dividerDefault   = OkaPrimitiveColors.grey200;
  static const dividerPrimary   = OkaPrimitiveColors.grey300;
  static const dividerSecondary = OkaPrimitiveColors.blue300;
  static const dividerDark      = OkaPrimitiveColors.grey600;

  // Feedback / State
  static const stateActive   = OkaPrimitiveColors.blue400;
  static const stateHover    = OkaPrimitiveColors.blue200;
  static const stateDefault  = OkaPrimitiveColors.grey600;
  static const stateError    = OkaPrimitiveColors.red400;
  static const stateSuccess  = OkaPrimitiveColors.green400;
  static const stateDisabled = OkaPrimitiveColors.grey400;

  // Feedback / Background
  static const feedbackBgError   = OkaPrimitiveColors.red200;
  static const feedbackBgWarning = OkaPrimitiveColors.yellow300;
  static const feedbackBgSuccess = OkaPrimitiveColors.green200;
  static const feedbackBgNew     = OkaPrimitiveColors.blue400;
  static const feedbackBgInfo    = OkaPrimitiveColors.grey200;
  static const feedbackBgDark    = OkaPrimitiveColors.blue500;

  // Feedback / Button
  static const btnActive   = OkaPrimitiveColors.blue400;
  static const btnDisabled = OkaPrimitiveColors.grey200;
  static const btnHover    = OkaPrimitiveColors.blue200;

  // Feedback / Control
  static const controlActiveBorder   = OkaPrimitiveColors.blue400;
  static const controlActiveIcon     = OkaPrimitiveColors.white;
  static const controlActiveSurface  = OkaPrimitiveColors.blue200;
  static const controlDisabledBorder = OkaPrimitiveColors.grey300;
  static const controlIconDisabled   = OkaPrimitiveColors.grey400;
  static const controlDisabledSurface= OkaPrimitiveColors.grey200;
  static const controlDefault        = OkaPrimitiveColors.grey600;
}
