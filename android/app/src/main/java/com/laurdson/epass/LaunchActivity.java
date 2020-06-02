import com.laurdson.epass.MainActivity;

import io.flutter.embedding.android.FlutterActivity;
import android.os.Bundle;
import android.content.Intent;

public class LaunchActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
        finish();
    }
}