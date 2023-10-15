class VerificationContrainteModel {
  int id;
  String message;
  bool bloquante;

  VerificationContrainteModel(
      {required this.id, required this.message, this.bloquante = false});
}
