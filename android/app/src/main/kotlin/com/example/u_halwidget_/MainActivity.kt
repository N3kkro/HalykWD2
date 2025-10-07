package com.example.u_halwidget_

import android.app.Application
import android.content.Intent
import android.util.Log
import kz.halyk.partner.monolith.PartnerPayActivity
import kz.halyk.partner.monolith.PartnerEntity
import kz.halyk.partner.monolith.PartnerPaySdk
import kz.halyk.partner.monolith.PartnerCallback
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import kz.halyk.partner.monolith.data.UserAuthorization
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.launch
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
class MainActivity : AppCompatActivity() {
    private lateinit var flutterEngine: FlutterEngine
    private val METHOD_CHANNEL = "partner_pay_channel"
    private var eventSink: EventChannel.EventSink? = null
    private val partnerToken = "WprHVisLzUpzcfKn_Mobile_Test"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        //Канал
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when(call.method){
                    "checkStatus" ->{
                        val correlationId = call.argument<String>("correlationId");
                        Log.d("FlutterToNative", "CorrelationId: $correlationId")
                        checkOnBoarding(correlationId, result);
                    }
                    else -> result.notImplemented();
                }
            }

    }

    private fun checkOnBoarding(correlationId: String?, result: MethodChannel.Result){
        lifecycleScope.launch {
            try {
                val status = PartnerPaySdk.isAuthorizationValid(
                    this@MainActivity,
                    partnerToken
                )
                val responce = mapOf(
                    "status" to status.name,
                    "correlationId" to (correlationId ?: "Unknown")
                )
                result.success(responce);

            when (status) {
                UserAuthorization.VALID -> {
                    startActivity(Intent(this@MainActivity, OnBoarding::class.java));
                    finish()
                }

                UserAuthorization.NOT_ONBOARDED -> {
                    startActivity(Intent(this@MainActivity, OnBoarding::class.java))
                    Log.e("OnBoarding", "Онбординг токен недействителен")
                }

                UserAuthorization.ROOT_TOKEN_INVALID -> {
                    Log.e("OnBoarding", "Онбординг токен недействителен")
                }

                UserAuthorization.ROOT_TOKEN_EXPIRED -> {
                    Log.w("OnBoarding", "Онбординг токен истёк")
                }

                UserAuthorization.UNKNOWN -> {
                    Log.d("OnBoarding", "Онбординг токен неизвестен")
                }
            }
        }catch(e: Exception){
                result.error("Error: $e", e.message, null)
            }
        }
    }
}


