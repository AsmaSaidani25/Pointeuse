enum RestaurantDePretEnumeration { RestaurantA, RestaurantB, AUCUN }
RestaurantDePretEnumeration restaurantDePretFromMap(String value) {
  switch (value) {
    case 'RestaurantA':
      return RestaurantDePretEnumeration.RestaurantA;
    case 'RestaurantB':
      return RestaurantDePretEnumeration.RestaurantB;
    case 'AUCUN':
      return RestaurantDePretEnumeration.AUCUN;

    default:
      throw ArgumentError('Unknown value: $value');
  }
}

RestaurantDePretEnumeration getRestaurantDePretFromString(String input) {
  try {
    return restaurantDePretFromMap(input);
  } catch (e) {
    throw e; // Re-throw the error if you want to handle it elsewhere.
  }
}
