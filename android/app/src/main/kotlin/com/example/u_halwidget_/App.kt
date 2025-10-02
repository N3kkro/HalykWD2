package com.example.u_halwidget_

import android.app.Application
import android.util.Log
import kz.halyk.partner.monolith.PartnerPayActivity
import kz.halyk.partner.monolith.PartnerEntity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import kz.halyk.partner.monolith.PartnerPaySdk
import kz.halyk.partner.monolith.PartnerCallback

class App : Application() {
    override fun onCreate() {
        super.onCreate()
        PartnerPaySdk.init(this)
        PartnerPaySdk.languageFlow.value = SdkLanguage.RUSSIAN
    }
}
     class SdkLanguage {
     KAZAKH,
     RUSSIAN,
     ENGLISH
 }