import 'package:permission_handler/permission_handler.dart';

class Settings {
  static Future<Map<Permission, PermissionStatus>> requestPermission(
      {Permission permission, List<Permission> permissionsToRequest}) async {
    assert(permission != null && permissionsToRequest == null ||
        permissionsToRequest != null && permission == null);

    if (permission != null) return {permission: await permission.request()};
    return await permissionsToRequest.request();
  }
}
