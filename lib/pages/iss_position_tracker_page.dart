import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../api/issPosition_API.dart';
import '../models/iss_location_model.dart';
import '../constants.dart';

class IssPositionPage extends StatefulWidget {
  const IssPositionPage({super.key});

  @override
  State<IssPositionPage> createState() => _IssPositionPageState();
}

class _IssPositionPageState extends State<IssPositionPage> {

  late GoogleMapController mapController;
  late Future<IssLocation> newIssLocation;

  @override
  void initState() {
    super.initState();
    newIssLocation = IssLocationApi.fetchPosition();
    Timer.periodic(const Duration(seconds: 15), (timer){
      if(mounted) {
        setState((){
          newIssLocation = IssLocationApi.fetchPosition();
        });
      }
    });

  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget _map(){
    return Center(child:
      FutureBuilder<IssLocation>(
        future: newIssLocation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    snapshot.data!.position.latitude,
                    snapshot.data!.position.longitude
                ),
                zoom: 2.5,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("ISS"),
                  position: LatLng(
                      snapshot.data!.position.latitude,
                      snapshot.data!.position.longitude
                  ),
                ), // Marker
              }, // markers
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )
    );
  }

  Widget _timeStamp(){
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(5.0),
      child: FutureBuilder<IssLocation>(
          future:newIssLocation,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                DateFormat('MMM d, k:mm a').format(snapshot.data!.timestamp)
              );
            }else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const LinearProgressIndicator();
          }
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: LocalColors.shadow,
        title: const Text(
            'Posición Actual ISS',
              style: TextStyle(color: LocalColors.background),
        ),
      ),
      body:
      Stack(
        children: <Widget>[
          _map(),
          _timeStamp(),
        ],
      ),
    );

  }
}