import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.os.RemoteException
import androidx.core.app.NotificationCompat
import org.altbeacon.beacon.Beacon
import org.altbeacon.beacon.BeaconConsumer
import org.altbeacon.beacon.BeaconManager
import org.altbeacon.beacon.BeaconParser
import org.altbeacon.beacon.Identifier
import org.altbeacon.beacon.RangeNotifier
import org.altbeacon.beacon.Region

class BeaconService : Service(), BeaconConsumer {

    private lateinit var beaconManager: BeaconManager

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onCreate() {
        super.onCreate()

        // Create a notification for the foreground service
        createNotificationChannel()

        val notification: Notification = NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("Beacon Attendance Service")
                .setContentText("Scanning for beacons...")
                .setSmallIcon(R.drawable.ic_notification)
                .build()

        startForeground(NOTIFICATION_ID, notification)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        beaconManager = BeaconManager.getInstanceForApplication(applicationContext)
        beaconManager.beaconParsers.add(BeaconParser().setBeaconLayout(YOUR_BEACON_LAYOUT))
        beaconManager.bind(this)

        return START_STICKY
    }

    override fun onDestroy() {
        super.onDestroy()
        beaconManager.unbind(this)
    }

    override fun onBeaconServiceConnect() {
        // Set up a range notifier to handle detected beacons
        val rangeNotifier = RangeNotifier { beacons, _ ->
            handleDetectedBeacons(beacons)
        }

        try {
            beaconManager.addRangeNotifier(rangeNotifier)
            beaconManager.startRangingBeaconsInRegion(Region("myRangingUniqueId", null, null, null))
        } catch (e: RemoteException) {
            e.printStackTrace()
        }
    }

    private fun handleDetectedBeacons(beacons: Collection<Beacon>) {
        // Handle detected beacons here, e.g., update attendance in Firestore
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "Beacon Attendance Service"
            val descriptionText = "This channel is used for the beacon attendance service."
            val importance = NotificationManager.IMPORTANCE_LOW
            val channel = NotificationChannel(CHANNEL_ID, name, importance).apply {
                description = descriptionText
            }

            val notificationManager: NotificationManager =
                    getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }

    companion object {
        const val CHANNEL_ID = "beacon_attendance_service"
        const val NOTIFICATION_ID = 101
        const val YOUR_BEACON_LAYOUT = "m:2-3=0215,i:4-19,i:20-21,i:22-23,p:24-24"
    }
}