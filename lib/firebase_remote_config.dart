// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class RemoteConfigService {
//   static Future<bool> getForceUpdate() async {
//     final RemoteConfig remoteConfig = await RemoteConfig.instance;
//     try {
//       // Set the duration for cache expiration to 0 seconds to ensure
//       // the latest parameter values are always retrieved.
//       await remoteConfig.fetchAndActivate();
//       return remoteConfig.getBool('force_update');
//     } on FetchThrottledException catch (exception) {
//       // Fetch throttled.
//       print(exception);
//       return false;
//     } catch (exception) {
//       print(
//           'Unable to fetch remote config. Cached or default values will be used');
//       return false;
//     }
//   }
// }