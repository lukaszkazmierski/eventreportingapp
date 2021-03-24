import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  
  Future<PermissionStatus> requestStoragePermission() async =>
    await Permission.storage.request();
  

  Future<bool> isStoragePermissionGranted() async => 
    _isGranted(await Permission.storage.status);


  Future<PermissionStatus> requestCameraPermission() async =>
    await Permission.camera.request();
  
  
  Future<bool> isCameraPermissionGranted() async => 
    _isGranted(await Permission.camera.status);


  Future<PermissionStatus> requestLocationPermission() async =>
    await Permission.location.request();
  

  Future<bool> isLocationPermissionGranted() async => 
    _isGranted(await Permission.location.status);


  bool _isGranted(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:  
        return true;

      case PermissionStatus.denied:
        return false;

      case PermissionStatus.permanentlyDenied:
        return null;

      case PermissionStatus.restricted:
        return null;

      case PermissionStatus.undetermined:
        return false;

      default:
        return null;
    }
  }

  Future<void> initializeStoragePermission() async {  
    var storageStatus = await permissionService.isStoragePermissionGranted();
    if(storageStatus == false) {
      await permissionService.requestStoragePermission();
    }
  }

  Future<void> initializeCameraPermission() async {
    var cameraStatus = await permissionService.isCameraPermissionGranted();
    if(cameraStatus == false) {
      await permissionService.requestCameraPermission();
    }
  }

  Future<void> initializeLocationPermission() async {
    var locationStatus = await permissionService.isLocationPermissionGranted();
    if(locationStatus == false) {
      await permissionService.requestLocationPermission();
    }
  }


  Future<void> initializeAllPermissions() async {
    await initializeStoragePermission();
    await initializeCameraPermission();
    await initializeLocationPermission();
  }

}

PermissionService permissionService = PermissionService();