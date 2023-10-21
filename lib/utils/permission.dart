import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> cameraAndStoragePermission() async {
    if (Platform.isIOS) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.camera, Permission.storage].request();
      if (statuses[Permission.camera] == PermissionStatus.granted &&
          statuses[Permission.storage] == PermissionStatus.granted) {
        return true;
      } else if (statuses[Permission.camera] ==
              PermissionStatus.permanentlyDenied &&
          statuses[Permission.storage] == PermissionStatus.permanentlyDenied) {
        openAppSettings();
        return false;
      } else {
        return false;
      }
    } else {
      print("object");
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt > 32) {
        Map<Permission, PermissionStatus> statuses =
            await [Permission.camera, Permission.photos].request();
        if (statuses[Permission.camera] == PermissionStatus.granted &&
            statuses[Permission.photos] == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
      } else {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.camera,
          Permission.storage,
        ].request();
        // print("object2");

        if (statuses[Permission.camera] == PermissionStatus.granted &&
            statuses[Permission.storage] == PermissionStatus.granted) {
          print("object2");

          return true;
        } else {
          return false;
        }
      }
    }
  }

  Future<bool> storagePermission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage] == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestCameraAndStoragePermission(
      {required Function onPermissionDenied,
      required Function onPermissionSuccess}) async {
    var granted = await cameraAndStoragePermission();
    if (!granted) {
      onPermissionDenied();
    } else {
      onPermissionSuccess();
    }
    return granted;
  }

  Future<bool> requestStoragePermission(
      {required Function onPermissionDenied,
      required Function onPermissionSuccess}) async {
    var granted = await storagePermission();
    if (!granted) {
      onPermissionDenied();
    } else {
      onPermissionSuccess();
    }
    return granted;
  }

  Future<bool> hasPermission(Permission permission) async {
    var permissionStatus = await permission.status;
    return permissionStatus == PermissionStatus.granted;
  }
}
