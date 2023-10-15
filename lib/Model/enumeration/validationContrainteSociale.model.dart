enum ValidationContrainteSocialeModel {
  SUPERIEUR,
  INFERIEUR,
  VIDE,
}

ValidationContrainteSocialeModel ValidationContrainteSocialeModelfromMap(
    String value) {
  switch (value) {
    case 'SUPERIEUR':
      return ValidationContrainteSocialeModel.SUPERIEUR;
    case 'INFERIEUR':
      return ValidationContrainteSocialeModel.INFERIEUR;
    case 'VIDE':
      return ValidationContrainteSocialeModel.VIDE;
    default:
      throw ArgumentError('Unknown value: $value');
  }
}

ValidationContrainteSocialeModel validationContrainteSocialeFromJson(
    String value) {
  switch (value) {
    case 'SUPERIEUR':
      return ValidationContrainteSocialeModel.SUPERIEUR;
    case 'INFERIEUR':
      return ValidationContrainteSocialeModel.INFERIEUR;
    case 'VIDE':
      return ValidationContrainteSocialeModel.VIDE;
    default:
      throw ArgumentError(
          'Invalid value for ValidationContrainteSocialeModel: $value');
  }
}

ValidationContrainteSocialeModel getValidationContrainteSocialeModelFromString(
    String input) {
  try {
    return ValidationContrainteSocialeModelfromMap(input);
  } catch (e) {
    throw e; // Re-throw the error if you want to handle it elsewhere.
  }
}
