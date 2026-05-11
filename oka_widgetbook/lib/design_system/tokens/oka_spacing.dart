abstract class OkaSpacing {
  // Primitivos
  static const double xMicro = 4;
  static const double micro  = 8;
  static const double xs     = 16;
  static const double xxs    = 24;
  static const double xxxs   = 32;
  static const double small  = 40;
  static const double medium = 48;
  static const double large  = 56;
  static const double xl     = 64;
  static const double xxl    = 72;
  static const double xxxl   = 80;

  // Semânticos — Gap
  static const double gap2xs  = xMicro;
  static const double gapSm   = micro;
  static const double gapMd   = xs;
  static const double gapLg   = xxs;
  static const double gap2xl  = xxxs;

  // Semânticos — Padding
  static const double padXMicro = xMicro;
  static const double padMicro  = micro;
  static const double padXs     = xs;
  static const double pad2xs    = xxs;
  static const double padSm     = xxxs;
  static const double padMd     = small;
  static const double padLg     = medium;
  static const double pad2xl    = large;
  static const double pad3xl    = xl;
  static const double pad4xl    = xxl;
  static const double pad5xl    = xxxl;
}

abstract class OkaBorderRadius {
  static const double none   = 0;
  static const double small  = 8;
  static const double medium = 16;
  static const double large  = 24;
}
