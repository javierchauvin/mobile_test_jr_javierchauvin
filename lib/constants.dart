import 'package:flutter/material.dart';

enum MonthsMMM{
  NO_MONTH,
  JANUARY,
  FEBRUARY,
  MARCH,
  APRIL,
  MAY,
  JUNE,
  JULY,
  AUGUST,
  SEPTEMBER,
  OCTOBER,
  NOVEMBER,
  DECEMBER,
}

String int2MMM(MonthsMMM month){
  String mmm = "";

  switch(month){
    case MonthsMMM.JANUARY:
      mmm = "ENE";
    case MonthsMMM.FEBRUARY:
      mmm = "FEB";
    case MonthsMMM.MARCH:
      mmm = "MAR";
    case MonthsMMM.APRIL:
      mmm = "ABR";
    case MonthsMMM.MAY:
      mmm = "MAY";
    case MonthsMMM.JUNE:
      mmm = "JUN";
    case MonthsMMM.JULY:
      mmm = "JUL";
    case MonthsMMM.AUGUST:
      mmm = "AGO";
    case MonthsMMM.SEPTEMBER:
      mmm = "SEP";
    case MonthsMMM.OCTOBER:
      mmm = "OCT";
    case MonthsMMM.NOVEMBER:
      mmm = "NOV";
    case MonthsMMM.DECEMBER:
      mmm = "DIC";

    case MonthsMMM.NO_MONTH:
      mmm = "ERROR";
  }
  return mmm;
}

class LocalColors extends Color {
  LocalColors() : super(100);

  static const primary = const Color(0xFF0D47A1);
  static const shadow = const Color(0xFF3D3D3D);
  static const background = const Color(0xFFFCFCFC);
}


