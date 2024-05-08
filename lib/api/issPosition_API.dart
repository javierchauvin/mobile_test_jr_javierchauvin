import 'package:http/http.dart';

import "../models/iss_location_model.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IssLocationApi{

    static Future<IssLocation> fetchPosition() async {
        IssLocation newIssPosition;

        final response = await http
            .get(Uri.parse('http://api.open-notify.org/iss-now.json'));

        if (response.statusCode == 200) {
          newIssPosition = IssLocation.fromMap(jsonDecode(response.body));
          return newIssPosition;
        } else {
          throw Exception('Failed to get IssPosition');
        }
    }

}