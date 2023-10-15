import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pointeuse/Model/decoupage.horaire.model.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum JourSemaine {
  DIMANCHE,
  LUNDI,
  MARDI,
  MERCREDI,
  JEUDI,
  VENDREDI,
  SAMEDI,
}

enum Diff {
  YEAR,
  MONTH,
  DAY,
  HOUR,
  MINUTE,
  SECOND,
}

class DateInterval {
  final String dateJournee;
  final String heureDebut;
  final String heureFin;
  final bool heureDebutIsNight;
  final bool heureFinIsNight;
  DateInterval({
    required this.dateJournee,
    required this.heureDebut,
    required this.heureFin,
    bool? heureDebutIsNight,
    bool? heureFinIsNight,
    // ... other named parameters ...
  })  : heureDebutIsNight =
            heureDebutIsNight ?? false, // Providing default value if null
        heureFinIsNight =
            heureFinIsNight ?? false; // Providing default value if null
}

class DateService {
  final int ONE_DAY_AS_MILLISECONDS = 86400000;

  late Stream<DateTime> _clockStream;

  DateService() {
    runClock();
  }

  Stream<DateTime> get clockStream => _clockStream;

  void runClock() {
    _clockStream = Stream.periodic(Duration(minutes: 1), (_) => DateTime.now());
  }

  static DateTime substractMinuteToDate(DateTime date, int minutesToSubtract) {
    return date.subtract(Duration(minutes: minutesToSubtract));
  }

  static DateTime setTimeFormatHHMM(dynamic param) {
    if (param != null && !(param is DateTime)) {
      if (param != null) {
        final dateParser = DateTime.now()
            .add(Duration(
                minutes: int.parse(param.toString().substring(3, 5)),
                hours: int.parse(param.toString().substring(0, 2))))
            .subtract(Duration(
                seconds: DateTime.now().second,
                milliseconds: DateTime.now().millisecond));
        param = dateParser;
      }
    }
    return param;
  }

  static DateTime createDatePlusHHmmTime(DateTime date, String time) {
    date = date.subtract(
        Duration(seconds: date.second, milliseconds: date.millisecond));
    final timeToMilliseconds = HHmmTimeStringToNumber(time) * 60 * 1000;
    return date.add(Duration(milliseconds: timeToMilliseconds));
  }

  static String convertStringToCamelCase(String day) {
    String convertedItem =
        day[0].toUpperCase() + day.substring(1).toLowerCase();
    return convertedItem;
  }

  static String setStringFromDate(DateTime date) {
    final hours = date.hour.toString().padLeft(2, '0');
    final minutes = date.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  static Map<String, DateTime> createDateFromDecoupageValues(
      String day,
      int offset,
      DecoupageHoraireModel debutJournee,
      DecoupageHoraireModel finJournee) {
    var currentDate = DateTime.now().add(Duration(days: offset));

    currentDate = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      currentDate.hour,
      currentDate.minute,
      0,
      0,
    );

    final heureDebut = debutJournee['valeur${convertStringToCamelCase(day)}'];
    final heureFin = finJournee['valeur${convertStringToCamelCase(day)}'];

    var dateDebut = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        int.parse(heureDebut.substring(0, 2)),
        int.parse(heureDebut.substring(3, 5)));

    if (debutJournee['valeur${convertStringToCamelCase(day)}IsNight']) {
      dateDebut = dateDebut.add(Duration(days: 1));
    }

    var dateFin = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        int.parse(heureFin.substring(0, 2)),
        int.parse(heureFin.substring(3, 5)));

    if (finJournee['valeur${convertStringToCamelCase(day)}IsNight']) {
      dateFin = dateFin.add(Duration(days: 1));
    }

    return {'debut': dateDebut, 'fin': dateFin};
  }

  static DateTime setTimeNull(DateTime? date) {
    if (date != null) {
      date = DateTime(date.year, date.month, date.day);
    } else {
      date = DateTime.now();
    }
    date = DateTime(date.year, date.month, date.day, 0, 0, 0, 0);
    return date;
  }

  static String convertNumberToTime(int minutesCumule) {
    String diffAsString = '';
    int hours = (minutesCumule ~/ 60);
    diffAsString = diffAsString + hours.toString() + '.';
    int minutes = minutesCumule - (hours * 60);

    if (minutes < 10) {
      diffAsString = diffAsString + '0' + minutes.toString();
    } else {
      diffAsString = diffAsString + minutes.toString();
    }

    return diffAsString;
  }

  static int HHmmTimeStringToNumber(String time) {
    List<String> hoursMinutes = time.split(RegExp(r'[.:]'));
    int hours = int.parse(hoursMinutes[0]);
    int minutes = hoursMinutes.length > 1 ? int.parse(hoursMinutes[1]) : 0;
    return (hours * 60) + minutes;
  }

  static int getDiffInMinutes(DateTime heureFin, DateTime heureDebut) {
    Duration difference = heureFin.difference(heureDebut);
    return difference.inMinutes;
  }

  static DateTime getCorrectDateJourneeStatic(
      [dynamic date, bool initHours = false]) {
    final rawDate =
        date != null ? DateTime.parse(date.toString()) : DateTime.now();
    final userTimezoneOffset = rawDate.timeZoneOffset.inMilliseconds;

    if (userTimezoneOffset > 0) {
      if (initHours) {
        return DateTime(
          rawDate.year,
          rawDate.month,
          rawDate.day,
          rawDate.hour,
          rawDate.minute,
          rawDate.second,
          rawDate.millisecond,
        );
      } else {
        return rawDate.add(Duration(milliseconds: userTimezoneOffset));
      }
    } else {
      return rawDate;
    }
  }

  static int getTotalMinutesForShift(ShiftModel shift) {
    DateInterval dateInterval = shift.dateInterval as DateInterval;
    return DateService.getTotalMinutes(dateInterval);
  }

  static int getTotalMinutes(DateInterval dateInterval) {
    final dateDebut = createDateFromHourAndNightValue(
        DateTime.parse("${dateInterval.dateJournee} ${dateInterval.heureFin}"),
        dateInterval.heureFinIsNight);

    final dateFin = createDateFromHourAndNightValue(
        DateTime.parse(
            "${dateInterval.dateJournee} ${dateInterval.heureDebut}"),
        dateInterval.heureDebutIsNight);
    return getDiffInMinutes(dateFin, dateDebut);
  }

  static int getBreakBetweenTwoShifts(
      DateInterval firstInterval, DateInterval secondInterval) {
    return getDiffInMinutes(
      createDateFromHourAndNightValue(
          DateTime.parse(
              "${firstInterval.dateJournee} ${firstInterval.heureDebut}"),
          firstInterval.heureDebutIsNight),
      createDateFromHourAndNightValue(
          DateTime.parse(
              "${secondInterval.dateJournee} ${secondInterval.heureFin}"),
          secondInterval.heureFinIsNight),
    );
  }

  DateTime getCorrectDateJournee([DateTime? date, bool initHours = false]) {
    final rawDate = date ?? DateTime.now();
    final userTimezoneOffset = rawDate.timeZoneOffset.inMilliseconds;
    if (userTimezoneOffset > 0) {
      return initHours
          ? DateTime(rawDate.year, rawDate.month, rawDate.day)
          : DateTime.fromMillisecondsSinceEpoch(
              rawDate.millisecondsSinceEpoch + userTimezoneOffset);
    } else {
      return rawDate;
    }
  }

  static DateTime initializeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0, 0);
  }

  static String getHHmmformatFromDateAndWithSeparator(
      Object date, String separator) {
    DateTime dateTime;
    if (date is String) {
      dateTime = DateTime.parse(date);
    } else if (date is DateTime) {
      dateTime = date;
    } else {
      throw ArgumentError('Invalid date type');
    }

    String hours = ('0' + dateTime.hour.toString()).padLeft(2, '0');
    String minutes = ('0' + dateTime.minute.toString()).padLeft(2, '0');

    return '$hours$separator$minutes';
  }

  String getMonthAsStringFromNumber(int monthNumber) {
    switch (monthNumber) {
      case 0:
        return 'JAN';
      case 1:
        return 'FEV';
      case 2:
        return 'MARS';
      case 3:
        return 'AVRIL';
      case 4:
        return 'MAI';
      case 5:
        return 'JUIN';
      case 6:
        return 'JUL';
      case 7:
        return 'AOUT';
      case 8:
        return 'SEP';
      case 9:
        return 'OCT';
      case 10:
        return 'NOV';
      case 11:
        return 'DEC';
      default:
        return '';
    }
  }

  String setFullDateAsString(DateTime dateJournee) {
    final dayOfWeek = getJourSemaine(dateJournee).toString().split('.').last;
    final dayOfMonth = dateJournee.day;
    final month = getMonthAsStringFromNumber(dateJournee.month);
    final year = dateJournee.year;

    return '$dayOfWeek $dayOfMonth $month $year';
  }

  static JourSemaine getJourSemaine(DateTime jour) {
    return getJourSemaineFromInteger(jour.weekday - 1);
  }

  static JourSemaine getJourSemaineFromInteger(int jour) {
    return JourSemaine.values[jour];
  }

  static String formatDateToScoreDelimiter(DateTime dateChosit) {
    // dateChosit = setCorrectDate(dateChosit);
    final dateFinMonth = dateChosit.month + 1;
    final stringDateChoisitDay = dateChosit.day.toString().padLeft(2, '0');
    final stringDateChoisitMonth = dateFinMonth.toString().padLeft(2, '0');
    final stringDateChoisit =
        '$stringDateChoisitDay-$stringDateChoisitMonth-${dateChosit.year}';
    return stringDateChoisit;
  }

  String getDareFormat(DateTime date) {
    final year = date.year;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String dateToShortForm(DateTime dateJournee) {
    final year = dateJournee.year;
    final month = (dateJournee.month + 1).toString().padLeft(2, '0');
    final day = dateJournee.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  String dateToLongForm(DateTime dateJournee) {
    final dayOfWeek = getJourSemaine(dateJournee).toString().toLowerCase();
    final dayOfMonth = dateJournee.day.toString().padLeft(2, '0');
    final month = getMonthAsStringFromNumber(dateJournee.month);
    return '$dayOfWeek $dayOfMonth $month';
  }

  Future<void> delay(int milliSeconds) async {
    await Future.delayed(Duration(milliseconds: milliSeconds));
  }

  int getDiffBetweenTwoDatesWithNightHours(
      DateTime d1, bool d1IsNight, DateTime d2, bool d2IsNight, Diff unit) {
    if (d1IsNight) d1 = DateTime(d1.year, d1.month, d1.day + 1);
    if (d2IsNight) d2 = DateTime(d2.year, d2.month, d2.day + 1);
    return d1.difference(d2).inMilliseconds;
  }

  String getYesterDay(DateTime today) {
    final yesterday = today.subtract(Duration(days: 1));
    return DateFormat('yyyy-MM-dd').format(yesterday);
  }

  DateTime getDateFromDateIntervalFor(DateInterval interval, String hour) {
    final date = createDateFromHourAndNightValue(
        DateTime.parse('${interval.dateJournee} $hour'),
        interval.heureDebutIsNight);
    return date;
  }

  static DateTime createDateFromHourAndNightValue(DateTime date, bool isNight) {
    final daysToAdd = isNight ? 1 : 0;
    final newDate = date.add(Duration(days: daysToAdd));
    return newDate;
  }

  Future<void> refreshClock() async {
    runClock();
  }
}
