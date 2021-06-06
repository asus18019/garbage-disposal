package com.example.myapplication;

import java.sql.Array;

public class UserModel {
    private Integer id;
    private String first_name;
    private String last_name;
    private String email;
    private Integer houseID;
    private String created_at;
    private String updated_at;
    private Array roles;

    public UserModel(Integer id, String first_name, String last_name, String email, Integer houseID, String created_at, String updated_at, Array roles) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.houseID = houseID;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.roles = roles;
    }

    public UserModel() {
    }

    public Integer getId() {
        return id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getEmail() {
        return email;
    }

    public Integer getHouseID() {
        return houseID;
    }

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public Array getRoles() {
        return roles;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setHouseID(Integer houseID) {
        this.houseID = houseID;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public void setRoles(Array roles) {
        this.roles = roles;
    }
}
