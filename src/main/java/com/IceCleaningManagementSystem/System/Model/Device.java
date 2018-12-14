package com.SmartBuildingManagementSystem.System.Model;

public class Device {
    private int id;
    private String model;
    private int userId;
    private String userName;
    private String ip;

    public Device() {
    }

    public Device(int id, String model, int userId) {
        this.id = id;
        this.model = model;
        this.userId = userId;
    }

    public Device(int id, String model, String userName) {
        this.id = id;
        this.model = model;
        this.userName = userName;
    }

    public Device(String model, int userId, String ip) {
        this.model = model;
        this.userId = userId;
        this.ip = ip;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
