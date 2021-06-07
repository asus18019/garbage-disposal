package com.example.myapplication;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.view.View;
import android.widget.*;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.*;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Throw extends AppCompatActivity {

    Button button3, button, button4;
    RadioButton radioButton, radioButton2, radioButton3, radioButton4;
    EditText editTextNumber2;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.throwgarbage);

        button3 = findViewById(R.id.button3);
        button = findViewById(R.id.button);
        button4 = findViewById(R.id.button4);

        radioButton = findViewById(R.id.radioButton);
        radioButton2 = findViewById(R.id.radioButton2);
        radioButton3 = findViewById(R.id.radioButton3);
        radioButton4 = findViewById(R.id.radioButton4);

        editTextNumber2 = findViewById(R.id.editTextNumber2);

        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
                Editor editor = sharedPref.edit();
                editor.putString("token", "");
                editor.apply();

                Intent intent = new Intent(Throw.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ThrowRequest(GetToken(), Integer.parseInt(editTextNumber2.getText().toString()), GetGarbageType());
            }
        });

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Throw.this, Success.class);
                startActivity(intent);
                finish();
            }
        });

        SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
        String token = sharedPref.getString("token", "");
    }

    private String GetToken(){
        SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
        return sharedPref.getString("token", "");
    }

    private Integer GetGarbageType(){
        if(radioButton.isChecked()){
//            Toast.makeText(Throw.this, "Organic", Toast.LENGTH_SHORT).show();
            return 3;
        } else if(radioButton2.isChecked()){
//            Toast.makeText(Throw.this, "Glass", Toast.LENGTH_SHORT).show();
             return 1;
        } else if(radioButton3.isChecked()){
//            Toast.makeText(Throw.this, "Paper", Toast.LENGTH_SHORT).show();
            return 2;
        } else if(radioButton4.isChecked()){
//            Toast.makeText(Throw.this, "Unsorted", Toast.LENGTH_SHORT).show();
            return 0;
        }
        return 0;
    }

    private void ThrowRequest(String token, Integer weight, Integer garbageID){

        Map<String, Integer> params = new HashMap();
        params.put("weight", weight);
        params.put("garbageID", garbageID);
        JSONObject parameters = new JSONObject(params);

        String url = "http://10.0.2.2:8000/api/history/create";
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, url, parameters,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
//                        try {
//                            RecordModel record = new RecordModel();
//
//                            record.setUserID(response.getInt("userID"));
//                            record.setGarbageID(response.getInt("garbageID"));
//                            record.setWeight(response.getDouble("weight"));
//                            record.setSum(response.getDouble("sum"));
//                            record.setCreated_at(response.getString("created_at"));
//                            record.setHistoryID(response.getInt("historyID"));
//
//                            Toast.makeText(Throw.this, WriteResult(record.getSum()), Toast.LENGTH_LONG).show();
//
//                        } catch (JSONException e) {
//                            Toast.makeText(Throw.this, e.toString(), Toast.LENGTH_LONG).show();
//                        }
                          Toast.makeText(Throw.this, response.toString(), Toast.LENGTH_LONG).show();
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                if( error instanceof AuthFailureError) {
                    Toast.makeText(Throw.this, "Invalid credentials", Toast.LENGTH_LONG).show();
                } else if( error instanceof TimeoutError) {
                    Toast.makeText(Throw.this, "Timeout error", Toast.LENGTH_LONG).show();
                } else if( error instanceof NetworkError) {
                    Toast.makeText(Throw.this, "Network error", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(Throw.this, error.networkResponse.toString(), Toast.LENGTH_LONG).show();
                }
            }
        }
        )
        {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Authorization", "Bearer " + token);
                headers.put("Content-Type", "application/json");
//                headers.put("X-Requested-With", "XMLHttpRequest");
                return headers;
            }
        };

        RequestSingleton.getInstance(Throw.this).addToRequestQueue(jsonObjectRequest);
    }

    public String WriteResult(Double sum){
        return "Вы успешно выкинули мусор\n Сумма к оплате " + sum;
    }
}
