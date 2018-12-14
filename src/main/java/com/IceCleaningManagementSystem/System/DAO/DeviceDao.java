package com.SmartBuildingManagementSystem.System.DAO;

import com.SmartBuildingManagementSystem.System.Model.Device;
import org.springframework.stereotype.Repository;

import java.util.Scanner;

@Repository
public class DeviceDao {

    public static Device[] getAllDevicesOfUser(String userName) {
        String query = "get\n" +
                "arrOfUsersDevices\n" +
                "1\n" +
                UserDao.getUserIdByLogin(userName);

        String result = "";
        result = AccessToGeneralServer.exequteQueryToServer(query);

        String sizeOfSet;
        String[] devicesParts;

        try (Scanner scanner = new Scanner(result)) {
            sizeOfSet = scanner.useDelimiter("\n").next();

            int size = Integer.parseInt(sizeOfSet);

            devicesParts = new String[size * 3];

            for (int i = 0; i < devicesParts.length; ++i) {
                devicesParts[i] = scanner.useDelimiter("\n").next();
            }
        }

        Device[] devicesObjects = new Device[devicesParts.length / 3];


        for (int i = 0, counter = 0; counter < devicesObjects.length; i += 3) {
            devicesObjects[counter++] = new Device(devicesParts[i],
                    Integer.parseInt(devicesParts[i + 1]), devicesParts[i + 2]);
        }

        return devicesObjects;
    }

    public boolean addNewDevice(Device newDevice) {
        String query = "update\n" +
                "addNewUserToDevice\n" +
                "3\n" +
                UserDao.getUserIdByLogin(newDevice.getUserName()) + "\n" +
                newDevice.getModel() + "\n" +
                newDevice.getId();
        String result = "";
        result = AccessToGeneralServer.exequteQueryToServer(query);
        return true;
    }
}
