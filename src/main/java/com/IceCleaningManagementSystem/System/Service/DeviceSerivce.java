package com.SmartBuildingManagementSystem.System.Service;

import com.SmartBuildingManagementSystem.System.DAO.DeviceDao;
import com.SmartBuildingManagementSystem.System.Model.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeviceSerivce {

    @Autowired
    private DeviceDao deviceDao;

    public boolean addNewDevice(Device newDevice) {
        return deviceDao.addNewDevice(newDevice);
    }

    public static Device[] getAllDevicesOfUser(String userName){
        return DeviceDao.getAllDevicesOfUser(userName);
    }
}
