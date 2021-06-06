package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;

import com.android.volley.*;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.snackbar.Snackbar;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.util.Base64;
import android.view.View;

import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import com.example.myapplication.databinding.ActivityMainBinding;

import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    Button button_first;
    EditText editTextTextEmailAddress, editTextTextPassword;

    private AppBarConfiguration appBarConfiguration;
    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(GetToken().trim().length() > 0){
            Intent intent = new Intent(MainActivity.this, Success.class);
            startActivity(intent);
            finish();
        }

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        button_first = findViewById(R.id.button_first);
        editTextTextEmailAddress = findViewById(R.id.editTextTextEmailAddress);
        editTextTextPassword = findViewById(R.id.editTextTextPassword);

        button_first.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String email = editTextTextEmailAddress.getText().toString().trim();
                String password = editTextTextPassword.getText().toString().trim();
                if(!email.equals("") && !password.equals("")){
                    Map<String, String> params = new HashMap();
                    params.put("email", email);
                    params.put("password", password);

                    JSONObject parameters = new JSONObject(params);

                    JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST, "http://10.0.2.2:8000/api/login", parameters,
                            new Response.Listener<JSONObject>() {
                        @Override
                        public void onResponse(JSONObject response) {
                            String token = "";
                            try {
                                    token = response.getString("token");
                                } catch (JSONException e){
                                    e.printStackTrace();
                                }

                            SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
                            Editor editor = sharedPref.edit();
                            editor.putString("token", token);
                            editor.apply();

                            Intent intent = new Intent(MainActivity.this, Success.class);
                            startActivity(intent);
                            finish();
                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            if( error instanceof AuthFailureError) {
                                Toast.makeText(MainActivity.this, "Invalid credentials", Toast.LENGTH_LONG).show();
                            } else if( error instanceof TimeoutError) {
                                Toast.makeText(MainActivity.this, "Timeout error", Toast.LENGTH_LONG).show();
                            } else if( error instanceof NetworkError) {
                                Toast.makeText(MainActivity.this, "Network error", Toast.LENGTH_LONG).show();
                            }
                        }
                    }
                    );
                    RequestSingleton.getInstance(MainActivity.this).addToRequestQueue(jsonObjectRequest);
                } else {
                    Toast.makeText(MainActivity.this, "empty fields", Toast.LENGTH_SHORT).show();
                }
            }
        });

        setSupportActionBar(binding.toolbar);

        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        appBarConfiguration = new AppBarConfiguration.Builder(navController.getGraph()).build();
        NavigationUI.setupActionBarWithNavController(this, navController, appBarConfiguration);

        binding.fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
        
    }

    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment_content_main);
        return NavigationUI.navigateUp(navController, appBarConfiguration)
                || super.onSupportNavigateUp();
    }

    private String GetToken(){
        SharedPreferences sharedPref = getSharedPreferences("sett", MODE_PRIVATE);
        return sharedPref.getString("token", "");
    }
}