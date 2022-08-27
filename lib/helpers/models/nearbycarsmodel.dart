class NearByCarsModel {
  String carName;
  double rating;
  int reviewTotal;
  String fromLocation;
  String toLocation;

  NearByCarsModel(
      {required this.carName,
      required this.rating,
      required this.reviewTotal,
      required this.fromLocation,
      required this.toLocation});
}
