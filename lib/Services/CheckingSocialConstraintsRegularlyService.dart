/*
import 'dart:html';

import 'package:flutter/services.dart';
import 'package:pointeuse/Model/employeCoordinations.model.dart';
import 'package:pointeuse/Model/enumeration/NameOfTable.enum.dart';
import 'package:pointeuse/Services/JsStoreServices/AnomalieJsStoreService.dart';

import 'ContrainteSocialeService.dart';
import 'JsStoreServices/EmployeJsStoreService.dart';
import 'JsStoreServices/ParametreJsStoreService.dart';
import 'JsStoreServices/PointingJsStoreService.dart';
import 'JsStoreServices/dbJsStore.service.dart';
import 'Session.service.dart';
import 'dateService.dart'; // You might need to import 'dart:html' for Audio if this code is running in a web context.

class CheckingSocialConstraintsRegularlyService extends DbJsStoreService {
  final String minCheckCont = 'MINCHECKCONT';
  final String mpreventDelay = 'MPREVENTDELAY';
  final String washingDelay = 'WASHINGDELAY';
  final String tableName = NameOfTable.POINTAGE;
  final List<EmployeeCoordinations> employesCoordinationsList = [];
  final SystemSound audio = SystemSound();
  final Audio audioPrealarme = Audio();
  final int minuteInMillisecond = 60000;
  dynamic audioLang;

  CheckingSocialConstraintsRegularlyService(
    ContrainteSocialeService constraintService,
    EmployeJsStoreService employeJsStoreService,
    PointingJsStoreService pointageService,
    ParametreJsStoreService parameterJsStoreParameter,
    ContrainteSocialeService contraintreSocialService,
    DateService dateService,
    SessionService sessionService,
    AnomalieJsStoreService anomalieJsStoreService,
    // RhisTranslateService rhisTranslateService,
    SessionService sessionservice,
    //  LanguageStorageService languageStorageService,
  ) : super();

  void stopAudio() {
    audio.src = '';
    audio.pause();
    audio.currentTime = 0;
  }

  void stopPreAlarme() {
    audioPrealarme.src = '';
    audioPrealarme.pause();
    audioPrealarme.currentTime = 0;
  }
}
*/
