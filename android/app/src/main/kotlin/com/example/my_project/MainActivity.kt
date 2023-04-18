package kaleo.chat.app
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.provider.Settings


class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/device_id"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceId") {
                val deviceId = getDeviceId()
                if (deviceId != null) {
                    result.success(deviceId)
                } else {
                    result.error("UNAVAILABLE", "Device ID not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceId(): String? {
        return Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
    }
}