package com.example.myapplication;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Success extends AppCompatActivity {

    TextView first_name_tv, last_name_tv, email_tv, house_tv, created_tv;
    Button button3;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home_1);

        first_name_tv = findViewById(R.id.first_name_tv);
        last_name_tv = findViewById(R.id.last_name_tv);
        email_tv = findViewById(R.id.email_tv);
        house_tv = findViewById(R.id.house_tv);
        created_tv = findViewById(R.id.created_tv);
        button3 = findViewById(R.id.button3);

        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
                Editor editor = sharedPref.edit();
                editor.putString("token", "");
                editor.apply();

                Intent intent = new Intent(Success.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
        String token = sharedPref.getString("token", "");
        GetUser(token);
    }

    protected void GetUser(String token){
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, "http://10.0.2.2:8000/api/user/user", null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            UserModel user = new UserModel();

                            user.setId(response.getInt("id"));
                            user.setFirst_name(response.getString("first_name"));
                            user.setLast_name(response.getString("last_name"));
                            user.setEmail(response.getString("email"));
                            user.setHouseID(response.getInt("houseID"));
                            user.setCreated_at(response.getString("created_at"));
                            user.setUpdated_at(response.getString("updated_at"));

                            SharedPreferences sharedPref = getSharedPreferences("user", MODE_PRIVATE);
                            Editor editor = sharedPref.edit();
                            editor.putInt("id", user.getId());
                            editor.putString("first_name", user.getFirst_name());
                            editor.putString("last_name", user.getLast_name());
                            editor.putString("email", user.getEmail());
                            editor.putInt("houseID", user.getHouseID());
                            editor.putString("created_at", user.getCreated_at());
                            editor.putString("updated_at", user.getUpdated_at());
                            editor.apply();

                            setFields();
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(Success.this, error.toString(), Toast.LENGTH_LONG).show();
            }
        }
        )
        {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Authorization", "Bearer " + token);
                return headers;
            }
        };

        RequestSingleton.getInstance(Success.this).addToRequestQueue(jsonObjectRequest);
    }

    @SuppressLint("SetTextI18n")
    private void setFields() {
        SharedPreferences sharedPref = getSharedPreferences("user", MODE_PRIVATE);
        first_name_tv.setText(first_name_tv.getText().toString() + sharedPref.getString("first_name", ""));
        last_name_tv.setText(last_name_tv.getText().toString() + sharedPref.getString("last_name", ""));
        email_tv.setText(email_tv.getText().toString() + sharedPref.getString("email", ""));
        house_tv.setText(house_tv.getText().toString() + sharedPref.getInt("houseID", 0));
        created_tv.setText(created_tv.getText().toString() + sharedPref.getString("created_at", "").substring(0, 10));
    }

}
