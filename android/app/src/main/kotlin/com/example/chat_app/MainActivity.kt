package com.example.chat_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "chat.service.channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "receiveMsg"){
                val text = call.argument<String>("msg")
                receiveMsg(text, result)
            }
        }
    }

    private fun randomAlphaNumericString(desiredStrLength: Int): String {
        val charPool: List<Char> = ('a'..'z') + ('A'..'Z') + ('0'..'9')
        return (1..desiredStrLength)
                .map{ kotlin.random.Random.nextInt(0, charPool.size) }
                .map(charPool::get)
                .joinToString("")
    }

    private fun receiveMsg(arg: String?, result: MethodChannel.Result) {
        if (arg is String) {
            val randomString = randomAlphaNumericString(100)
            val rs = "Reply from Android native for message: \"$arg\" \n$randomString"
            result.success(rs)
        }
    }
}
