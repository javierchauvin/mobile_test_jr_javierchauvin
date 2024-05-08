class Location{

  final double latitude;
  final double longitude;

  Location({
    this.latitude = 0,
    this.longitude = 0,
  });

  factory Location.fromMap(Map<String, dynamic> json){
    return Location(
      latitude: double.parse(json['latitude'] ?? ""),
      longitude: double.parse(json['longitude'] ?? ""),
    );
  }

  Map<String,dynamic> toMap() => {
    'latitude': latitude,
    'longitude': longitude,
  };

}