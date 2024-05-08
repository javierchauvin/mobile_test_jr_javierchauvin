import 'location_model.dart';

class IssLocation{
  final String message;
  final Location position;
  final DateTime timestamp;

  Location get getPosition => position;


  IssLocation({
    required this.message,
    required this.position,
    required this.timestamp,
});

  factory IssLocation.fromMap(Map<String, dynamic> json){

    return IssLocation(
      message: json['message'] ?? "No message",
      timestamp: null != json['timestamp']
          ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'] * 1000)
          : DateTime.fromMillisecondsSinceEpoch(0),
      position: Location.fromMap( json['iss_position']),
    );
  }

  Map<String,dynamic> toMap() => {
    'message': message,
    'timestamp': timestamp,
    'position': position,
  };

}

