import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intelligent_meter_app/src/pages/staff/features/jobs/camera/geolocation.dart';

class Camera {
  File? imageFile;
  VoidCallback? onImageSelected;
  GeolocationService geolocationService = GeolocationService();

  Future<void> onTapCameraButton(BuildContext context) async {
    await getLocationAndImage(context: context, source: ImageSource.camera);
  }

  Future<void> getLocationAndImage(
      {required BuildContext context, required ImageSource source}) async {
    // Request location permissions
    bool isLocationPermissionGranted =
        await _requestLocationPermission(context);

    if (isLocationPermissionGranted) {
      // Get user's location coordinates
      Position? userLocation = await _getUserLocation();

      if (userLocation != null) {
        await getImage(context: context, source: source);
      } else {
        // Handle the case when location cannot be retrieved
        print('Error getting user location');
      }
    } else {
      // Handle the case when location permission is not granted
      print('Location permission not granted');
    }
  }

  Future<bool> _requestLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      print('Location permission required for this feature');
      return false;
    }
  }

  Future<Position?> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      print('Error getting user location: $e');
      return null;
    }
  }

  Future<void> getImage(
      {required BuildContext context, required ImageSource source}) async {
    ImagePicker().pickImage(source: source).then((file) {
      if (file?.path != null) {
        imageFile = File(file!.path);
        onImageSelected?.call();
        _storeImage(context);
      }
    });
  }


  Future<void> _storeImage(BuildContext context) async {
    try {
      // Store image and update progress

      // Get user's location coordinates
      Position? userLocation = await geolocationService.getCurrentLocation();

    } catch (e) {
      print('Error processing image: $e');
      // Handle error
    }
  }
}

// // Loading Screen Widget
// class LoadingScreen extends StatelessWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 16),
//             Text(
//               "Please wait as the AI works its Magic",
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }