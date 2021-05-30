package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Base64;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

interface response1 {
    String messages = "";
    String token = "";
}

public class Success extends AppCompatActivity implements response1 {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);

        SharedPreferences sharedPreferences = getPreferences(MODE_PRIVATE);
        String token = sharedPreferences.getString("token", "0");
        Toast.makeText(Success.this, token, Toast.LENGTH_LONG).show();

//        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://10.0.2.2:8000/api/user/user",
//                new Response.Listener<String>() {
//                    @Override
//                    public void onResponse(String response) {
//                        Toast.makeText(Success.this, response.toString(), Toast.LENGTH_LONG).show();
//                    }
//                }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                Toast.makeText(Success.this, error.networkResponse.statusCode, Toast.LENGTH_LONG).show();
//            }
//        }
//        )
//        {
//            @Override
//            public Map<String, String> getHeaders() throws AuthFailureError {
//                Map<String,String> params = new HashMap<String, String>();
////                            params.put("Content-Type","application/x-www-form-urlencoded");
//                params.put("X-Requested-With", "XMLHttpRequest");
//                params.put(
//                        "Authorization",
//                        String.format("Basic %s", Base64.encodeToString(
//                                String.format("%s:%s", "username", "password").getBytes(), Base64.DEFAULT)));
//                return params;
//            }
//        }
//                ;
//        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
//        requestQueue.add(stringRequest);
    }
}
