import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284243554),
      surfaceTint: Color(4284243554),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294112247),
      onPrimaryContainer: Color(4283388501),
      secondary: Color(4284374624),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293388007),
      onSecondaryContainer: Color(4283058764),
      tertiary: Color(4284636513),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294636022),
      onTertiaryContainer: Color(4283781204),
      error: Color(4288225821),
      onError: Color(4294967295),
      errorContainer: Color(4291577661),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032028),
      onSurfaceVariant: Color(4282730314),
      outline: Color(4285888379),
      outlineVariant: Color(4291151562),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4291151562),
      primaryFixed: Color(4292993766),
      onPrimaryFixed: Color(4279835679),
      primaryFixedDim: Color(4291151562),
      onPrimaryFixedVariant: Color(4282664778),
      secondaryFixed: Color(4293124835),
      onSecondaryFixed: Color(4279966749),
      secondaryFixedDim: Color(4291282631),
      onSecondaryFixedVariant: Color(4282795848),
      tertiaryFixed: Color(4293517541),
      onTertiaryFixed: Color(4280162846),
      tertiaryFixedDim: Color(4291609801),
      onTertiaryFixedVariant: Color(4283057481),
      surfaceDim: Color(4292663769),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045165),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }



  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294967295),
      surfaceTint: Color(4291151562),
      onPrimary: Color(4281217332),
      primaryContainer: Color(4292072664),
      onPrimaryContainer: Color(4282203971),
      secondary: Color(4291282631),
      onSecondary: Color(4281348146),
      secondaryContainer: Color(4282203454),
      onSecondaryContainer: Color(4292006098),
      tertiary: Color(4294967295),
      onTertiary: Color(4281544499),
      tertiaryContainer: Color(4292530903),
      onTertiaryContainer: Color(4282596930),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4291051832),
      onErrorContainer: Color(4294967295),
      surface: Color(4279440147),
      onSurface: Color(4293255905),
      onSurfaceVariant: Color(4291151562),
      outline: Color(4287598996),
      outlineVariant: Color(4282730314),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4284243554),
      primaryFixed: Color(4292993766),
      onPrimaryFixed: Color(4279835679),
      primaryFixedDim: Color(4291151562),
      onPrimaryFixedVariant: Color(4282664778),
      secondaryFixed: Color(4293124835),
      onSecondaryFixed: Color(4279966749),
      secondaryFixedDim: Color(4291282631),
      onSecondaryFixedVariant: Color(4282795848),
      tertiaryFixed: Color(4293517541),
      onTertiaryFixed: Color(4280162846),
      tertiaryFixedDim: Color(4291609801),
      onTertiaryFixedVariant: Color(4283057481),
      surfaceDim: Color(4279440147),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032028),
      surfaceContainer: Color(4280295200),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676853),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
