package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
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
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Success extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);

        SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
        String token = sharedPref.getString("token", "");
        ConsoleLog(token);
        GetUser(token);

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

    protected void ConsoleLog(String str){
        Toast.makeText(Success.this, str, Toast.LENGTH_LONG).show();
    }

    protected void GetUser(String token){
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, "http://10.0.2.2:8000/api/user/user", null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        Toast.makeText(Success.this, "Yspeshno", Toast.LENGTH_LONG).show();

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(Success.this, error.toString(), Toast.LENGTH_LONG).show();
            }
        }
        )
        {
            /**
             * Passing some request headers
             */
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                //headers.put("Content-Type", "application/json");
                headers.put("Authorization", "Bearer " + token);
                return headers;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        requestQueue.add(jsonObjectRequest);
    }

}
