package com.example.myapplication;

public class RecordModel {
    private Integer userID;
    private Integer garbageID;
    private Double weight;
    private Double sum;
    private String created_at;
    private Integer historyID;

    public RecordModel(Integer userID, Integer garbageID, Double weight, Double sum, String created_at, Integer historyID) {
        this.userID = userID;
        this.garbageID = garbageID;
        this.weight = weight;
        this.sum = sum;
        this.created_at = created_at;
        this.historyID = historyID;
    }

    public RecordModel() {
    }

    public Integer getUserID() {
        return userID;
    }

    public Integer getGarbageID() {
        return garbageID;
    }

    public Double getWeight() {
        return weight;
    }

    public Double getSum() {
        return sum;
    }

    public String getCreated_at() {
        return created_at;
    }

    public Integer getHistoryID(){
        return getHistoryID();
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public void setGarbageID(Integer garbageID) {
        this.garbageID = garbageID;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setHistoryID(Integer historyID) {
        this.historyID = historyID;
    }
}
