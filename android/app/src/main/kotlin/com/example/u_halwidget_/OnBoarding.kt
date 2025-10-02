package com.example.u_halwidget_
//onBoarding
import android.content.Intent
import android.util.Log
import kz.halyk.partner.monolith.PartnerPayActivity
import kz.halyk.partner.monolith.PartnerEntity
import kz.halyk.partner.monolith.PartnerPaySdk
import kz.halyk.partner.monolith.PartnerCallback
import android.widget.Toast
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
    override fun onPayload(payload: PartnerCallback.Payload){
        super.onPayload(payload)
        when(payload){
            
        PartnerCallback.Payload.CardSelectionDiscarded -> {
            Log.d("PartnerPay", "Карта отменена")
        }
        PartnerCallback.Payload.DefaultCardSelected -> {
            Log.d("PartnerPay", "Карта выбрана по умолчанию")
        }
        is PartnerCallback.Payload.Error.CardError -> {
            Log.e("PartnerPay", "Ошибка карты")
        }
        is PartnerCallback.Payload.ChildrenListReceived -> {Log.d("PartnerPay", "Список детей получен: ${payload.children}")}
        is PartnerCallback.Payload.DocumentReceived -> {Log.d("PartnerPay", "Документ получен")}
        is PartnerCallback.Payload.Dynamic -> {Log.d("PartnerPay", "Dynamic payload: ${payload.info}")}
        PartnerCallback.Payload.Error.EmptyIIN -> Log.w("PartnerPay", "Пустой ИИН")
        PartnerCallback.Payload.Error.IncorrectIIN -> Log.e("PartnerPay", "Неправильный ИИН")
        PartnerCallback.Payload.Error.HalykIdExecutionFailed -> Log.e("PartnerPay", "Ошибка Halyk ID")
        is PartnerCallback.Payload.Error.LivenessSendError -> Log.e("PartnerPay", "Ошибка Liveness")
        PartnerCallback.Payload.Error.NoInternetConnection -> Log.e("PartnerPay", "Нет интернет соединения")
        PartnerCallback.Payload.Error.OnboardingFailed -> Log.e("PartnerPay", "Онбординг не пройден")
        PartnerCallback.Payload.Error.PartnerTokenExpired -> Log.e("PartnerPay", "Токен партнера устарел")
        PartnerCallback.Payload.Error.PartnerTokenInvalid -> Log.e("PartnerPay", "Токен партнера неверный")
        PartnerCallback.Payload.Error.PhoneIncorrectLength -> Log.e("PartnerPay", "Телефон неверной длины")
        PartnerCallback.Payload.Error.PhoneMismatch -> Log.e("PartnerPay", "Телефон не совпадает")
        PartnerCallback.Payload.Error.PhoneNotDigit -> Log.e("PartnerPay", "Телефон содержит недопустимые символы")
        PartnerCallback.Payload.Error.PinAttemptExhausted -> Log.e("PartnerPay", "Превышено число попыток PIN")
        PartnerCallback.Payload.Error.ProcessNotAllowed -> Log.e("PartnerPay", "Процесс онбординга недоступен")
        PartnerCallback.Payload.Error.RootTokenExpired -> Log.e("PartnerPay", "Корневой токен истек")
        PartnerCallback.Payload.Error.RootTokenInvalid -> Log.e("PartnerPay", "Корневой токен недействителен")
        PartnerCallback.Payload.Error.Rooted -> Log.e("PartnerPay", "Устройство рутовано")
        PartnerCallback.Payload.Error.SdkNotInitialized -> Log.e("PartnerPay", "SDK не инициализирован")
        PartnerCallback.Payload.Error.UserAlreadyAuthorized -> Log.w("PartnerPay", "Пользователь уже авторизован")
        PartnerCallback.Payload.Error.UserNotAuthorized -> Log.w("PartnerPay", "Пользователь не авторизован")
        PartnerCallback.Payload.Error.WrongActivityExtended -> Log.e("PartnerPay", "Activity наследована неверно")
        is PartnerCallback.Payload.Error.RepositoryRequestError -> Log.e("PartnerPay", "Ошибка запроса репозитория")
        PartnerCallback.Payload.Error.RequestedQrScanner -> Log.d("PartnerPay", "Запрошен сканер QR")
        PartnerCallback.Payload.Error.QrExpired -> Log.w("PartnerPay", "QR истек")
        is PartnerCallback.Payload.Log -> Log.d("PartnerPaySDK", payload.message ?: "Empty log")
        PartnerCallback.Payload.Canceled -> Log.d("PartnerPay", "Пользователь отменил процесс")
        PartnerCallback.Payload.Success.OnboardingSuccess -> {
            Log.d("PartnerPay", "Онбординг успешен")
            startActivity(Intent(this, OnBoarding::class.java))
            finish()
        }

        PartnerCallback.Payload.Success.Dismiss -> {
            Log.d("PartnerPay", "Онбординг закрыт")
            PartnerPaySdk.logout(this)
        }

        // ------------------ Прочие события ------------------
        is PartnerCallback.Payload.ScanQrAgainTap -> Log.d("PartnerPay", "Сканировать QR снова")
        else -> Log.d("PartnerPay", "Необработанное событие: $payload")

        }
        super.onPayload(payload)
    }
    private fun showError(message: String){
        Toast.makeText(this, message, Toast.LENGTH_LONG).show()
    }
}

    