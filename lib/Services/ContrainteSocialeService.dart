import 'dart:core';
import 'package:pointeuse/Model/decoupage.horaire.model.dart';
import 'package:pointeuse/Model/employee.model.dart';
import 'package:pointeuse/Model/enumeration/codeNameContrainteSocial.dart';
import 'package:pointeuse/Model/enumeration/validationContrainteSociale.model.dart';
import 'package:pointeuse/Model/jourFeries.model.dart';
import 'package:pointeuse/Model/loi.pays.model.dart';
import 'package:pointeuse/Model/shift.model.dart';
import 'JsStoreServices/decoupageHoraireJsStore.service.dart';
import 'dateService.dart';

class ContrainteSocialeService {
  JourSemaine? firstRestaurantDay;
  DateTime? heureDebutWeekEnd;
  DateTime? heureFinWeekEnd;
  JourSemaine? jourDebutWeekEnd;
  JourSemaine? jourFinWeekEnd;
  List<JourFeriesModel>? joursFeries;
  DateTime? now;
  int minBeforeCoupure = 0;
  DateService dateService =
      DateService(); // Create an instance of the DateService class

  static Map<String, dynamic> validContrainteWithTreatment(
    dynamic realValue,
    LoiPaysModel loi,
    bool tempsTravailPartiel,
    bool majeur,
    bool isValidated,
    int Function(String) fn,
  ) {
    double loiValue;

    if (loi.validationContrainteSociale ==
        ValidationContrainteSocialeModel.INFERIEUR) {
      if (tempsTravailPartiel) {
        return {
          'isValidated': majeur
              ? realValue >=
                  (loiValue = fn(loi.valeurMajeurTempsPartiel!) as double)
              : realValue >=
                  (loiValue = fn(loi.valeurMineurTempsPartiel!) as double),
          'loiValue': loiValue,
        };
      } else {
        return {
          'isValidated': majeur
              ? realValue >=
                  (loiValue = fn(loi.valeurMajeurTempsPlein!) as double)
              : realValue >=
                  (loiValue = fn(loi.valeurMineurTempsPlein!) as double),
          'loiValue': loiValue,
        };
      }
    } else if (loi.validationContrainteSociale ==
        ValidationContrainteSocialeModel.SUPERIEUR) {
      if (tempsTravailPartiel) {
        return {
          'isValidated': majeur
              ? realValue <=
                  (loiValue = fn(loi.valeurMajeurTempsPartiel!) as double)
              : realValue <=
                  (loiValue = fn(loi.valeurMineurTempsPartiel!) as double),
          'loiValue': loiValue,
        };
      } else {
        return {
          'isValidated': majeur
              ? realValue <=
                  (loiValue = fn(loi.valeurMajeurTempsPlein!) as double)
              : realValue <=
                  (loiValue = fn(loi.valeurMineurTempsPlein!) as double),
          'loiValue': loiValue,
        };
      }
    }

    return {
      'isValidated': false,
      'loiValue': null,
    };
  }

  static Future<bool> checkIsNight(
      DateTime nowDate, DateTime referenceDate) async {
    final decoupageService = DecoupageHoraireJsStoreService();
    List<DecoupageHoraireModel>? listDecoupageHoraire =
        await decoupageService.getListDecoupage();
    DecoupageHoraireModel finJournee = listDecoupageHoraire!.firstWhere(
      (item) => item.phaseLibelle == 'FJA',
      orElse: () => DecoupageHoraireModel(
        idDecoupageHoraire: 0,
        valeurDimancheIsNight: false,
        valeurDimancheIsNew: false,
        idFront: 'default_id',
        valeurLundiIsNight: false,
        valeurLundiIsNew: false,
        valeurMardiIsNight: false,
        valeurMardiIsNew: false,
        valeurMercrediIsNight: false,
        valeurMercrediIsNew: false,
        valeurJeudiIsNight: false,
        valeurJeudiIsNew: false,
        valeurVendrediIsNight: false,
        valeurVendrediIsNew: false,
        valeurSamediIsNight: false,
        valeurSamediIsNew: false,
        hasCorrectValue: false,
        isVisited: false,
        canDelete: false,
        phaseLibelle: 'default_phase',
        debut: DateTime.now(), // Provide an appropriate default DateTime
        fin: DateTime.now(), // Provide an appropriate default DateTime
      ),
    );

    JourSemaine day =
        DateService.getJourSemaine(DateService.getCorrectDateJourneeStatic());
    String key = day.toString().split('.').last[0].toLowerCase() +
        day.toString().split('.').last.substring(1).toLowerCase();
    String endTime = finJournee['valeur' + key];

    // If we are on the next day, consider it as nighttime
    // No need to check the time slots
    return nowDate.day > referenceDate.day ||
        (nowDate.month > referenceDate.month);
  }

  static bool validDureeMaxSansBreak(EmployeeModel employee, int nbrHour) {
    final specificLoi = employee.loiPointeuse.firstWhere(
      (loi) =>
          loi.codeName ==
          CodeNameContrainteSocial.LONGUEUR_MAXI_SHIFT_SANS_BREAK,
      orElse: () =>
          LoiPaysModel(), // Provide a default empty instance of LoiPaysModel
    );

    if (specificLoi != null) {
      final data = validContrainteWithTreatment(
        nbrHour,
        specificLoi,
        employee.hebdoCourant < 35,
        employee.majeur,
        false, // Pass the appropriate value for isValidated
        DateService
            .HHmmTimeStringToNumber, // Pass the function reference directly
      );

      return data['isValidated'];
    }

    return false; // Return a default value if specificLoi is null
  }

  static void sortListShift(List<dynamic> listShift) {
    listShift.sort((a, b) {
      if (a['heureDebut'] < b['heureDebut']) {
        return -1;
      }
      if (a['heureDebut'] > b['heureDebut']) {
        return 1;
      }
      return 0;
    });
  }

  static bool validDureeMinBreak(
      EmployeeModel employee, int differenceTimeFromNowInMinutes) {
    final specificLoi = employee.loiPointeuse.firstWhere(
      (loi) => loi.codeName == CodeNameContrainteSocial.LONGUEUR_MINI_BREAK,
      orElse: () =>
          LoiPaysModel(), // Provide a default instance of LoiPaysModel
    );

    if (specificLoi != null) {
      final data = validContrainteWithTreatment(
        differenceTimeFromNowInMinutes,
        specificLoi,
        employee.hebdoCourant < 35,
        employee.majeur,
        false, // Pass the appropriate value for isValidated
        DateService
            .HHmmTimeStringToNumber, // Pass the function reference directly
      );

      return data['isValidated'];
    }

    return false;
  }

  static verificationContraintMaxShiftWithoutBreakInListShift(
      EmployeeModel employeeDisplay) {
    bool verificationContrainte = true;
    int nbrHourCurrent = 0;
    int nbrHour = 0;
    int i = 0;

    if (employeeDisplay.shifts.length == 1) {
      ShiftModel shift = employeeDisplay.shifts[0];
      DateInterval dateInterval = shift.dateInterval
          as DateInterval; // Get the ShiftModel object// Assuming dateInterval is part of the shift data
      nbrHour = DateService.getTotalMinutes(dateInterval);
      employeeDisplay.shifts[0].sign = false;
      verificationContrainte = validDureeMaxSansBreak(
          employeeDisplay,
          DateService.HHmmTimeStringToNumber(
              DateService.convertNumberToTime(nbrHour)));

      if (!verificationContrainte) {
        employeeDisplay.shifts[0].sign = true;
        return verificationContrainte;
      }
    } else {
      sortListShift(employeeDisplay.shifts);

      for (int index = 0; index < employeeDisplay.shifts.length; index++) {
        employeeDisplay.shifts[index].sign = false;

        int totalHeure =
            DateService.getTotalMinutesForShift(employeeDisplay.shifts[index]);
        nbrHour += totalHeure;
        nbrHourCurrent = totalHeure;
        verificationContrainte = validDureeMaxSansBreak(
            employeeDisplay,
            DateService.HHmmTimeStringToNumber(
                DateService.convertNumberToTime(nbrHourCurrent)));

        if (!verificationContrainte) {
          employeeDisplay.shifts[index].sign = true;
          nbrHour = 0;
        }

        if (index >= 1) {
          ShiftModel shift1 = employeeDisplay.shifts[index];
          ShiftModel shift2 = employeeDisplay.shifts[index - 1];
          verificationContrainte = validDureeMaxSansBreak(
              employeeDisplay,
              DateService.HHmmTimeStringToNumber(
                  DateService.convertNumberToTime(nbrHour)));

          DateInterval firstShiftInterval = DateInterval(
            dateJournee: shift1.dateJournee,
            heureDebut: shift1.heureDebut,
            heureFin: shift1.heureFin,
            heureDebutIsNight: shift1.heureDebutIsNight,
            heureFinIsNight: shift1.heureFinIsNight,
          );

          DateInterval secondShiftInterval = DateInterval(
            dateJournee: shift2.dateJournee,
            heureDebut: shift2.heureDebut,
            heureFin: shift2.heureFin,
            heureDebutIsNight: shift2.heureDebutIsNight,
            heureFinIsNight: shift2.heureFinIsNight,
          );

          int pause = DateService.getBreakBetweenTwoShifts(
              firstShiftInterval, secondShiftInterval);

          bool dureeMinBreak = validDureeMinBreak(employeeDisplay, pause);

          if (dureeMinBreak) {
            i = index;
            nbrHour = nbrHourCurrent;
          } else if (!verificationContrainte) {
            employeeDisplay.shifts[i].sign = true;

            for (int loop = i; loop <= index; loop++) {
              if (employeeDisplay.shifts[i].totalHeure <
                  employeeDisplay.shifts[loop].totalHeure) {
                employeeDisplay.shifts[i].sign = false;
                employeeDisplay.shifts[loop].sign = true;
                i = loop;
              }
            }
          }
        }
      }
    }
  }

// Add methods and other properties as needed...
}
