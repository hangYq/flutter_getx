import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.SmsMessage
import android.telephony.TelephonyManager
import android.telephony.TelephonyManager.ACTION_PHONE_STATE_CHANGED
import android.util.Log
import android.widget.Toast


class a : BroadcastReceiver() {
	override fun onReceive(context: Context, intent: Intent) {
		if (ACTION_PHONE_STATE_CHANGED == intent.action && "RINGING" == intent.getStringExtra(
				TelephonyManager.EXTRA_STATE
			)
		) {
			val number = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER)
		}
	}
}

//
//class SmsReceiver : BroadcastReceiver() {
//	//    private static MessageListener mMessageListener;
//	private var mContext: Context? = null
//	override fun onReceive(context: Context, intent: Intent) {
//		mContext = context
//		Toast.makeText(context, "接收短信执行了.....", Toast.LENGTH_LONG).show()
//		Log.e("日志：广播：：onReceive", isOrderedBroadcast.toString() + "")
//		Log.e("日志：onReceive...", "-接收短信执行了......" + intent.getStringExtra("sele"))
//		val action = intent.action
//		if (SMS_RECEIVED_ACTION == action || SMS_DELIVER_ACTION == action) {
//			Log.e("日志：onReceive。。。", "开始接收短信.....")
//			val bundle = intent.extras
//			if (bundle != null) {
//				val pdus = bundle["pdus"] as Array<Any>?
//				if (pdus != null && pdus.size > 0) {
//					val messages: Array<SmsMessage?> = arrayOfNulls<SmsMessage>(pdus.size)
//					for (i in pdus.indices) {
//						val pdu = pdus[i] as ByteArray
//						messages[i] = SmsMessage.createFromPdu(pdu)
//					}
//					for (message in messages) {
//						val content: String = message.getMessageBody() // 得到短信内容
//						val sender: String = message.getOriginatingAddress() // 得到发信息的号码
//						val date = Date(message.getTimestampMillis())
//						val format = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
//						format.setTimeZone(TimeZone.getTimeZone("GMT+08:00"))
//						val dateContent: String = format.format(date)
//						if (sender == "8610086" || sender == Constant.phone) {
//							Log.e("日志：短信时间：：： ", format.format(date) + " ")
//							Log.e("日志：发信息的号码 ", "$sender ")
//							Log.e("日志：得到短信内容 ", "$content ")
//							abortBroadcast() // 中止
//						}
//					}
//				}
//			}
//		}
//	}
//
//	companion object {
//		const val SMS_RECEIVED_ACTION = "android.provider.Telephony.SMS_RECEIVED"
//		const val SMS_DELIVER_ACTION = "android.provider.Telephony.SMS_DELIVER"
//	}
//}

//
//class PhoneStateReceiver : BroadcastReceiver() {
//	private var mcontext: Context? = null
//	@RequiresApi(Build.VERSION_CODES.M)
//	override fun onReceive(context: Context, intent: Intent) {
//		mcontext = context
//		println("action" + intent.action)
//		if (intent.action == Intent.ACTION_NEW_OUTGOING_CALL) {
//			//如果是去电（拨出）
//			Log.e("TAG", "拨出")
//		} else {
//			Log.e("TAG", "来电")
//			val tm = context.getSystemService<Any>(Service.TELEPHONY_SERVICE) as TelephonyManager
//			tm.listen(listener, PhoneStateListener.LISTEN_CALL_STATE)
//			//设置一个监听器
//		}
//	}
//
//	private val listener: PhoneStateListener = object : PhoneStateListener() {
//		override fun onCallStateChanged(state: Int, incomingNumber: String) {
//			// TODO Auto-generated method stub
//			//state 当前状态 incomingNumber,貌似没有去电的API
//			super.onCallStateChanged(state, incomingNumber)
//			when (state) {
//				TelephonyManager.CALL_STATE_IDLE -> Log.e("TAG", "挂断")
//				TelephonyManager.CALL_STATE_OFFHOOK -> Log.e("TAG", "接听")
//				TelephonyManager.CALL_STATE_RINGING -> {
//
//					//输出来电号码
//					Log.e("TAG", "响铃:来电号码$incomingNumber")
//					Log.e("TAG", "响铃:======" + Thread.currentThread().name)
//				}
//			}
//		}
//	}
//}