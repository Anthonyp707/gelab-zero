package ai.stepfun.gelabzero

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv = findViewById<TextView>(R.id.hello_text)
        tv.text = "Gelab Zero — Android demo\n(ARM64-ready APK)"
    }
}
