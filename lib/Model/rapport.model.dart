import 'package:pointeuse/Model/enumeration/rapportContrat.enum.dart';

class RapportModel {
  int? idRapport;
  String? pathTemplate;
  String? description;
  String? categorie;
  DateTime? lastUsed;
  String? pathTemplateUnix;
  String? libelleFile;
  List<String> rapportContrat = RapportContrat.values.cast<String>();
  String? module;
  String? codeName;
  bool? paramsEnvoi;
  List<dynamic>? restaurants;
  String? lib;
  String? uuidRapport;
  String? categorieType;
}
