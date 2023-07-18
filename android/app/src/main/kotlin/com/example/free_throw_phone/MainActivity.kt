package com.example.free_throw_phone

import android.Manifest
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodChannel
import android.os.Build.VERSION_CODES
import android.view.TextureView
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import android.content.pm.PackageManager
import android.annotation.SuppressLint
import android.content.Context
import android.graphics.*
import android.hardware.camera2.CameraCaptureSession
import android.hardware.camera2.CameraDevice
import android.hardware.camera2.CameraManager
import android.os.Bundle
import android.os.Handler
import android.os.HandlerThread
import android.view.Surface
import com.example.free_throw_phone.ml.SsdMobilenetV11Metadata1
import org.tensorflow.lite.support.common.FileUtil
import org.tensorflow.lite.support.image.ImageProcessor
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.support.image.ops.ResizeOp

class MainActivity: FlutterActivity() {
    private val CHANNEL = "object_detection_channel"
    lateinit var labels: List<String>
    var colors = listOf<Int>(
        Color.BLUE, Color.GREEN, Color.RED, Color.CYAN, Color.GRAY, Color.BLACK,
        Color.DKGRAY, Color.MAGENTA, Color.YELLOW, Color.RED
    )
    val paint = Paint()
    lateinit var imageProcessor: ImageProcessor
    lateinit var bitmap: Bitmap
    lateinit var cameraDevice: CameraDevice
    lateinit var handler: Handler
    lateinit var cameraManager: CameraManager
    lateinit var model: SsdMobilenetV11Metadata1

    @RequiresApi(VERSION_CODES.M)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
                if (call.method == "startObjectDetection") {
                    startObjectDetection()
                    result.success(null)
                } else {
                    result.notImplemented()
                }

        }
    }

    @RequiresApi(VERSION_CODES.M)
    private fun startObjectDetection() {
        get_permission()

        labels = FileUtil.loadLabels(this, "labels.txt")

    }

    @RequiresApi(VERSION_CODES.M)
    fun get_permission(){
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(arrayOf(Manifest.permission.CAMERA), 101)
        }
    }
}
