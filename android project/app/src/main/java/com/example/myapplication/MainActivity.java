package com.example.myapplication;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
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

    SharedPreferences sPref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

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
//                            Toast.makeText(MainActivity.this, token, Toast.LENGTH_LONG).show();

//                            SharedPreferences sharedPreferences = getPreferences(MODE_PRIVATE);
//                            SharedPreferences.Editor editor = sharedPreferences.edit();
//                            editor.putString("name", "max");
//                            editor.apply();

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
                            Toast.makeText(MainActivity.this, error.toString(), Toast.LENGTH_LONG).show();
                        }
                    }
                    )
                            //Works only for StringRequest
//                    {
//                         @Override
//                        protected Map<String,String> getParams(){
//                            Map<String,String> params = new HashMap<String, String>();
//                            params.put("email", email);
//                            params.put("password", password);
//                            return params;
//                         }
//
//                        @Override
//                        public Map<String, String> getHeaders() throws AuthFailureError {
//                            Map<String,String> params = new HashMap<String, String>();
////                            params.put("Content-Type","application/x-www-form-urlencoded");
//                            params.put("X-Requested-With", "XMLHttpRequest");
//                            params.put(
//                                    "Authorization",
//                                    String.format("Basic %s", Base64.encodeToString(
//                                            String.format("%s:%s", "username", "password").getBytes(), Base64.DEFAULT)));
//                            return params;
//                        }
//                    }
                    ;
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    requestQueue.add(jsonObjectRequest);
                } else {
                    Toast.makeText(MainActivity.this, "empty fields", Toast.LENGTH_SHORT).show();
                }
//                // Instantiate the RequestQueue.
//                RequestQueue queue = Volley.newRequestQueue(MainActivity.this);
//                String url ="https://jsonplaceholder.typicode.com/comments/" + editTextTextEmailAddress.getText().toString();
//
//                // Request a string response from the provided URL.
//                JsonObjectRequest objectRequest = new JsonObjectRequest(Request.Method.GET, url, null,
//                        new Response.Listener<JSONObject>() {
//                            @Override
//                            public void onResponse(JSONObject response) {
//                                String email = "";
//                                try {
//                                    email = response.getString("email");
//                                } catch (JSONException e){
//                                    e.printStackTrace();
//                                }
//                                Toast.makeText(MainActivity.this, email, Toast.LENGTH_SHORT).show();
//                            }
//                        }, new Response.ErrorListener() {
//                    @Override
//                    public void onErrorResponse(VolleyError error) {
//                        Toast.makeText(MainActivity.this, "error", Toast.LENGTH_SHORT).show();
//                    }
//                });
//
//                 // Add the request to the RequestQueue.
//                queue.add(objectRequest);

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
}