package com.example.myapplication;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.DialogInterface;
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

public class Register extends AppCompatActivity {
    Button button_first4, button_first3;
    EditText editTextTextPersonName, editTextTextPersonName2, editTextTextPersonName4, editTextTextPersonName6;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.register);

        editTextTextPersonName = findViewById(R.id.editTextTextPersonName);
        editTextTextPersonName2 = findViewById(R.id.editTextTextPersonName2);
        editTextTextPersonName4 = findViewById(R.id.editTextTextPersonName4);
        editTextTextPersonName6 = findViewById(R.id.editTextTextPersonName6);

        button_first4 = findViewById(R.id.button_first4);
        button_first3 = findViewById(R.id.button_first3);

        button_first4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Register.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        button_first3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String first_name = editTextTextPersonName.getText().toString().trim();
                String last_name = editTextTextPersonName2.getText().toString().trim();
                String email = editTextTextPersonName4.getText().toString().trim();
                String password = editTextTextPersonName6.getText().toString().trim();

                if(email.equals("") && password.equals("") && first_name.equals("") && last_name.equals("")){
                    Toast.makeText(Register.this, "Fill all fields", Toast.LENGTH_LONG).show();
                } else {
//                    Map<String, String> params = new HashMap();
//                    params.put("email", email);
//                    params.put("password", password);
//                    params.put("first_name", first_name);
//                    params.put("last_name", last_name);
//                    JSONObject parameters = new JSONObject(params);

                    Map<String, String> params = new HashMap();
                    params.put("first_name", first_name);
                    params.put("last_name", last_name);
                    params.put("email", email);
                    params.put("password", password);
                    JSONObject parameters = new JSONObject(params);

                    JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, "http://10.0.2.2:8000/api/register", parameters,
                            new Response.Listener<JSONObject>() {
                                @Override
                                public void onResponse(JSONObject response) {
                                    new AlertDialog.Builder(Register.this)
                                            .setTitle("Info")
                                            .setMessage("Successfully registered")
                                            .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                                public void onClick(DialogInterface dialog, int which) {
                                                    Intent intent = new Intent(Register.this, MainActivity.class);
                                                    startActivity(intent);
                                                    finish();
                                                }
                                            })
                                            .setIcon(android.R.drawable.ic_dialog_info)
                                            .show();
                                }
                            }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {

                            Toast.makeText(Register.this, error.toString(), Toast.LENGTH_LONG).show();
                        }
                    }
                    );
                    RequestSingleton.getInstance(Register.this).addToRequestQueue(jsonObjectRequest);
                }
            }
        });
    }
}
