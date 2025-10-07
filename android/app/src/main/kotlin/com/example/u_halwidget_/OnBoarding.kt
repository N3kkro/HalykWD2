package com.example.u_halwidget_
//onBoarding
import android.content.Intent
import android.os.Bundle
import android.util.Log
import kz.halyk.partner.monolith.PartnerPayActivity
import kz.halyk.partner.monolith.PartnerEntity
import kz.halyk.partner.monolith.PartnerPaySdk
import kz.halyk.partner.monolith.PartnerCallback
import android.widget.Toast
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.EventChannel
import java.util.UUID

class OnBoarding : PartnerPayActivity(){
    override val partnerEntity: PartnerEntity by lazy {
        PartnerEntity(
            process = PartnerPaySdk.Process.Onboarding(
                UUID.randomUUID().toString()            // Уникальный идентификатор операции
            ),
            token = "WprHVisLzUpzcfKn_Mobile_Test",
            isEdgeToEdge = false
        )

    }
    //Channel
    private var eventSink: EventChannel.EventSink? = null
    companion object{
        val Event_channel = "onboarding_channel"
        lateinit var flutterEngine: FlutterEngine
    }
    override fun onCreate(savedInstanceState: Bundle?){
        super.onCreate(savedInstanceState);
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()

        )
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, Event_channel)
            .setStreamHandler(object: EventChannel.StreamHandler{
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                }

                override fun onCancel(arguments: Any?) {
                    eventSink = null
                }
            })
    }
    override fun onPayload(payload: PartnerCallback.Payload){
        when(payload){

        PartnerCallback.Payload.CardSelectionDiscarded -> {
            Log.d("PartnerPay", "Карта отменена")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.DefaultCardSelected -> {
            Log.d("PartnerPay", "Карта выбрана по умолчанию")
            eventSink?.success("Карта выбрана по умолчанию")
        }
        is PartnerCallback.Payload.Error.CardError -> {
            Log.e("PartnerPay", "Ошибка карты")
            eventSink?.success("Ошибка карты")
        }
        is PartnerCallback.Payload.ChildrenListReceived -> {
            Log.d("PartnerPay", "Список детей получен: ${payload.message}")
            eventSink?.success("Список детей получен")
        }
        is PartnerCallback.Payload.DocumentReceived -> {
            Log.d("PartnerPay", "Документ получен")
            eventSink?.success("Документ получен")
        }
        is PartnerCallback.Payload.Dynamic -> {
            Log.d("PartnerPay", "Dynamic payload: ${payload.data}")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.EmptyIIN -> {
            Log.w("PartnerPay", "Пустой ИИН")
            eventSink?.success("Пустой ИНН")
        }
        PartnerCallback.Payload.Error.IncorrectIIN -> {
            Log.e("PartnerPay", "Неправильный ИИН")
            eventSink?.success("Неправильный ИИН")
        }
        PartnerCallback.Payload.Error.HalykIdExecutionFailed -> {
            Log.e("PartnerPay", "Ошибка Halyk ID")
            eventSink?.success("Ошибка halyk id")
        }
        is PartnerCallback.Payload.Error.LivenessSendError -> {
            Log.e("PartnerPay", "Ошибка Liveness")
            eventSink?.success("ОшибкаLiveness")
        }
        PartnerCallback.Payload.Error.NoInternetConnection -> {
            Log.e("PartnerPay", "Нет интернет соединения")
            eventSink?.success("Нет интернет соединения")
        }
        PartnerCallback.Payload.Error.OnboardingFailed -> {
            Log.e("PartnerPay", "Онбординг не пройден")
            eventSink?.success("Онбординг не пройден")
        }//from here
        PartnerCallback.Payload.Error.PartnerTokenExpired -> {
            Log.e("PartnerPay", "Токен партнера устарел")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.PartnerTokenInvalid -> {
            Log.e("PartnerPay", "Токен партнера неверный")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.PhoneIncorrectLength -> {
            Log.e("PartnerPay", "Телефон неверной длины")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.PhoneMismatch -> {
            Log.e("PartnerPay", "Телефон не совпадает")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.PhoneNotDigit -> {
            Log.e("PartnerPay", "Телефон содержит недопустимые символы")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.PinAttemptExhausted -> {
            Log.e("PartnerPay", "Превышено число попыток PIN")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.ProcessNotAllowed -> {
            Log.e("PartnerPay", "Процесс онбординга недоступен")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.RootTokenExpired -> {
            Log.e("PartnerPay", "Корневой токен истек")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.RootTokenInvalid -> {
            Log.e("PartnerPay", "Корневой токен недействителен")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.Rooted -> {
            Log.e("PartnerPay", "Устройство рутовано")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.SdkNotInitialized -> {
            Log.e("PartnerPay", "SDK не инициализирован")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.UserAlreadyAuthorized -> {
            Log.w("PartnerPay", "Пользователь уже авторизован")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.UserNotAuthorized -> {
            Log.w("PartnerPay", "Пользователь не авторизован")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.WrongActivityExtended -> {
            Log.e("PartnerPay", "Activity наследована неверно")
            eventSink?.success("Карта отменена")
        }
        is PartnerCallback.Payload.Error.RepositoryRequestError -> {
            Log.e("PartnerPay", "Ошибка запроса репозитория")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.RequestedQrScanner -> {
            Log.d("PartnerPay", "Запрошен сканер QR")
            eventSink?.success("Карта отменена")
        }
        PartnerCallback.Payload.Error.QrExpired -> {
            Log.w("PartnerPay", "QR истек")
            eventSink?.success("Карта отменена")
        }
        is PartnerCallback.Payload.Log -> Log.d("PartnerPaySDK", payload.info ?: "Empty log")
        PartnerCallback.Payload.Success.OnboardingSuccess -> {
            Log.d("PartnerPay", "Онбординг успешен")
            eventSink?.success("Онбординг успешен")
            startActivity(Intent(this, OnBoarding::class.java))
            finish()
        }

        PartnerCallback.Payload.Success.Dismiss -> {
            Log.d("PartnerPay", "Онбординг закрыт")
            eventSink?.success("Онбординг закрыт")
            PartnerPaySdk.logout(this)
        }

        // ------------------ Прочие события ------------------
        is PartnerCallback.Payload.ScanQrAgainTap -> {
            Log.d("PartnerPay", "Сканировать QR снова")
            eventSink?.success("Карта отменена")
        }
        else -> {
            Log.d("PartnerPay", "Необработанное событие: $payload")
            eventSink?.success("Карта отменена")
        }

        }
        super.onPayload(payload)
    }
    private fun showError(message: String){
        Toast.makeText(this, message, Toast.LENGTH_LONG).show()
    }
}

    