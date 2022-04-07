class Paths{
  static final Paths _paths = Paths._internal();
  factory Paths() {
    return _paths;
  }
  Paths._internal();

  final String imagesPath = "lib/app/assets/images/";
  final String svgsPath = "lib/app/assets/svgs/";
}