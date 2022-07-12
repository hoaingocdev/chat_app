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

    private fun receiveMsg(arg: String?, result: MethodChannel.Result) {
        if (arg is String) {
            val rs = "Reply from Android native for message: $arg"
            result.success(rs)
        }
    }
}
