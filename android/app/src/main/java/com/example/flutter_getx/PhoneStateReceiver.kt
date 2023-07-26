package com.example.flutter_getx

import android.app.Service;
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.PhoneStateListener
import android.telephony.SmsMessage
import android.telephony.TelephonyManager
import android.util.Log
import android.widget.Toast
import java.text.SimpleDateFormat
import java.util.Date
import java.util.TimeZone

class PhoneStateReceiver : BroadcastReceiver() {
	private var mContext: Context? = null
	private val SMS_RECEIVED_ACTION = "android.provider.Telephony.SMS_RECEIVED"
	private val SMS_DELIVER_ACTION = "android.provider.Telephony.SMS_DELIVER"
	override fun onReceive(context: Context, intent: Intent) {
		Toast.makeText(context, "Boot Complete", Toast.LENGTH_LONG).show()
		mContext = context
		println("action" + intent.action)
		if (intent.action == Intent.ACTION_NEW_OUTGOING_CALL) {
			//如果是去电（拨出）
			Log.e("TAG", "拨出")
		} else if("android.intent.action.PHONE_STATE" == intent.action){
			Log.e("TAG", "来电")
			val tm = context.getSystemService(Service.TELEPHONY_SERVICE) as TelephonyManager
			//设置一个监听器
			tm.listen(listener, PhoneStateListener.LISTEN_CALL_STATE)
		} else if (SMS_RECEIVED_ACTION == intent.action || SMS_DELIVER_ACTION == intent.action) {
			Log.e("日志：onReceive。。。", "开始接收短信.....")
			val bundle = intent.extras
			if (bundle != null) {
				val pdus = bundle["pdus"] as Array<Any>?
				if (!pdus.isNullOrEmpty()) {
					val messages: Array<SmsMessage?> = arrayOfNulls<SmsMessage>(pdus.size)
					for (i in pdus.indices) {
						val pdu = pdus[i] as ByteArray
						messages[i] = SmsMessage.createFromPdu(pdu)
					}
					for (message in messages) {
						val content: String = message?.messageBody ?:"" // 得到短信内容
						val sender: String = message?.originatingAddress ?:"" // 得到发信息的号码
						val date = message?.timestampMillis?.let { Date(it) }
						val format = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						format.timeZone = TimeZone.getTimeZone("GMT+08:00")
						val dateContent: String = format.format(date)
						Log.e("日志：短信时间：：： ", format.format(date) + " ")
						Log.e("日志：发信息的号码 ", "$sender ")
						Log.e("日志：得到短信内容 ", "$content ")
						MethodChannelTest.sms("${format.format(date) +sender + content }");
						// 中止
						this.abortBroadcast();
					}
				}
			}
		}
	}

	private val listener: PhoneStateListener = object : PhoneStateListener() {
		override fun onCallStateChanged(state: Int, incomingNumber: String) {
			// TODO Auto-generated method stub
			//state 当前状态 incomingNumber,貌似没有去电的API
			super.onCallStateChanged(state, incomingNumber)

			when (state) {

				TelephonyManager.CALL_STATE_IDLE -> {
//					Log.e("TAG", "挂断");
//					//输出来电号码
//					Log.e("TAG", "响铃:来电号码$incomingNumber")
//					Log.e("TAG", "响铃:======" + Thread.currentThread().name)
//					MethodChannelTest.phone(incomingNumber);
				}
				TelephonyManager.CALL_STATE_OFFHOOK -> {
//					Log.e("TAG", "接听")
//					//输出来电号码
//					Log.e("TAG", "响铃:来电号码$incomingNumber")
//					Log.e("TAG", "响铃:======" + Thread.currentThread().name)
//					MethodChannelTest.phone(incomingNumber);
				}
				TelephonyManager.CALL_STATE_RINGING -> {
					//输出来电号码
					Log.e("TAG", "响铃:来电号码$incomingNumber")
					Log.e("TAG", "响铃:======" + Thread.currentThread().name)
					MethodChannelTest.phone(incomingNumber);
				}
			}
		}
	}
}