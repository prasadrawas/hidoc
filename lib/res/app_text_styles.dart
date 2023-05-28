import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  static const _xSmallFontSize = 10.0;
  static const _smallFontSize = 12.0;
  static const _regularFontSize = 14.0;
  static const _mediumFontSize = 16.0;
  static const _largeFontSize = 18.0;
  static const _largerFontSize = 18.0;
  static const _extraLargeFontSize = 26.0;
  static const _xxLargeFontSize = 30.0;

  static const poppins = 'Poppins';
  // ----------------   SMALL SIZE FONT ---------------------------//
  static TextStyle xSmallText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _xSmallFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle smallText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _smallFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle smallSemiBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: _smallFontSize,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? poppins,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle smallBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _smallFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle smallLightText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _smallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily ?? poppins);
  }
  // ----------------   MEDIUM SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle mediumText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _mediumFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily ?? poppins);
  }

  // App Text Color
  static TextStyle mediumBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _mediumFontSize,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily ?? poppins);
  }
  // ----------------   REGULAR SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle regularText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle regularMediumText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle regularSemiBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle regularBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily ?? poppins);
  }

/*  static TextStyle regularLightText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? lightTextColor,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? openSans);
  }*/

  // App Text Color
  static TextStyle largerText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _largerFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  // ----------------   LARGE SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle largeText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle largeMediumText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle largeTextLora({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle largeBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: _largeFontSize,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? poppins,
    );
  }

  static TextStyle largeLightText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  // ----------------  EXTRA LARGE SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle extraLargeText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle extraLargeSemiBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle extraLargeBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle xxLargeBoldText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _xxLargeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily ?? poppins);
  }

  static TextStyle extraLargeLightText({Color? color, String? fontFamily}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily ?? poppins);
  }
}
