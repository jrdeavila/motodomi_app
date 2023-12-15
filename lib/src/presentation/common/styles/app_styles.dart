import 'package:motodomi_app/lib.dart';

abstract class AppTheme {
  static double get borderRadius => 30;
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // -------- Icon Theme --------
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        // -------- Color Scheme --------
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0F1F41),
          secondary: Color(0xff05C7F2),
          tertiary: Color(0xff11238C),
          surface: Color(0xffE8E9ED),
          background: Color(0xffF5F6FA),
        ),
        // -------- Input Decoration Theme --------
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0xff11238c),
          filled: true,
          labelStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          alignLabelWithHint: true,
          prefixIconColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 24,
          ),
          border: CustomOutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
        // -------- Button Theme --------
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff0f1f41),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            side: MaterialStateProperty.all(
              const BorderSide(
                width: 2,
                color: Color(0xff05C7F2),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(
              const Color(0xff05C7F2),
            ),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff05C7F2),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        // -------- Text Theme --------
        textTheme: TextTheme(
          // -------- Header Text --------
          displayLarge: GoogleFonts.nunito(
            fontSize: 52,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.nunito(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displaySmall: GoogleFonts.nunito(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          // -------- Headline Text --------
          headlineLarge: GoogleFonts.nunito(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineSmall: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          // -------- Body Text --------
          bodyLarge: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          // -------- Button Text --------
          labelLarge: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          labelMedium: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          labelSmall: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          // -------- Input Text --------
          titleLarge: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleMedium: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleSmall: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        // -------- Color Scheme --------
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff0F1F41),
          secondary: Color(0xff05C7F2),
          surface: Color(0xffE8E9ED),
          background: Color(0xffF5F6FA),
        ),
        // -------- Button Theme --------
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff05C7F2),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // -------- Text Theme --------
        textTheme: TextTheme(
          // -------- Header Text --------
          displayLarge: GoogleFonts.nunito(
            fontSize: 52,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          displayMedium: GoogleFonts.nunito(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          displaySmall: GoogleFonts.nunito(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          // -------- Headline Text --------
          headlineLarge: GoogleFonts.nunito(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          headlineSmall: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          // -------- Body Text --------
          bodyLarge: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          // -------- Button Text --------
          labelLarge: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          labelMedium: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          labelSmall: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
}
