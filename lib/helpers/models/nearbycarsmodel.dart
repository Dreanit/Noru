class NearByCarsModel {
  String carName;
  double rating;
  int reviewTotal;
  String fromLocation;
  String toLocation;
  String imagePath;

  NearByCarsModel(
      {required this.carName,
      required this.rating,
      required this.reviewTotal,
      required this.fromLocation,
      required this.toLocation,required this.imagePath});
}
