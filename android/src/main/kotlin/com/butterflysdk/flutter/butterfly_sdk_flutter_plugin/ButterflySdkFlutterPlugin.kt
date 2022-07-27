package com.butterflysdk.flutter.butterfly_sdk_flutter_plugin

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import com.butterfly.sdk.ButterflySdk
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import java.lang.ref.WeakReference
import kotlin.collections.HashMap

/** ButterflySdkFlutterPlugin */
class ButterflySdkFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activityWeakReference: WeakReference<Activity>? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "TheButterflySdkFlutterPlugin")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        var didSucceed = false

        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }

            "openReporter" -> {
                activityWeakReference?.get()?.let { flutterActivity ->
                    call.arguments?.let { args ->
                        when (args) {
                            is HashMap<*, *> -> {
                                val apiKeyString: String? = args["apiKey"]?.toString()
                                apiKeyString.let { apiKey ->
                                    ButterflySdk.openReporter(flutterActivity, apiKey)
                                    didSucceed = true
                                }
                            }
                        }
                    } ?: run {
//          print(TAG, "Missing call arguments in ${call.method}!")
//          nativeChannelResult = Constants.Keys.FlutterMethodChannel.FAILURE_RESULT
                    }
                }
            }

            "useColor" -> {
                call.arguments?.let { args ->
                    when (args) {
                        is HashMap<*, *> -> {
                            val colorHexa: String? = args["colorHexa"]?.toString()
                            colorHexa.let { colorHexaString ->
                                ButterflySdk.useCustomColor(colorHexaString)
                                didSucceed = true
                            }
                        }
                    }
                } ?: run {
//          print(TAG, "Missing call arguments in ${call.method}!")
//          nativeChannelResult = Constants.Keys.FlutterMethodChannel.FAILURE_RESULT
                }
            }

            "overrideLanguage" -> {
                call.arguments?.let { args ->
                    when (args) {
                        is HashMap<*, *> -> {
                            val languageCode: String? = args["languageCode"]?.toString()
                            languageCode.let { languageCodeString ->
                                ButterflySdk.overrideLanguage(languageCodeString)
                                didSucceed = true
                            }
                        }
                    }
                } ?: run {
//          print(TAG, "Missing call arguments in ${call.method}!")
//          nativeChannelResult = Constants.Keys.FlutterMethodChannel.FAILURE_RESULT
                }
            }

            "overrideCountry" -> {
                call.arguments?.let { args ->
                    when (args) {
                        is HashMap<*, *> -> {
                            val countryCode: String? = args["countryCode"]?.toString()
                            countryCode.let { countryCodeString ->
                                ButterflySdk.overrideCountry(countryCodeString)
                                didSucceed = true
                            }
                        }
                    }
                } ?: run {
//          print(TAG, "Missing call arguments in ${call.method}!")
//          nativeChannelResult = Constants.Keys.FlutterMethodChannel.FAILURE_RESULT
                }

            }

            else -> {
                print("Missing handling for method channel named: " + call.method)
            }
        }

        if (didSucceed) {
            result.success(true)
        } else {
            result.error("0", "Something went wrong", null)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityWeakReference = WeakReference(binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
//    activityWeakReference?.clear()
//    activityWeakReference = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityWeakReference = WeakReference(binding.activity)
    }

    override fun onDetachedFromActivity() {
        activityWeakReference?.clear()
        activityWeakReference = null
    }
}