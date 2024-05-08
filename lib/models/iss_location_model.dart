import 'location_model.dart';

class IssLocation{
  final String message;
  final Location iss_position;
  final DateTime timestamp;

  IssLocation({
    required this.message,
    required this.iss_position,
    required this.timestamp,
});

  factory IssLocation.fromMap(Map<String, dynamic> json){

    return IssLocation(
      message: json['message'] ?? "No message",
      timestamp: null != json['timestamp']
          ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'] * 1000)
          : DateTime.fromMillisecondsSinceEpoch(0),
      iss_position: Location.fromMap( json['iss_position']),
    );
  }

}

