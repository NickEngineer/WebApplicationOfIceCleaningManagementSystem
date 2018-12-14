package com.SmartBuildingManagementSystem.System.Service;

import com.SmartBuildingManagementSystem.System.DAO.RealDeviceDAO;
import org.springframework.stereotype.Service;

import java.util.Scanner;


@Service
public class RealDeviceService {

    public String executeQueryToRealDevice(String query) {

        byte[] bytesQuery = null;

        try (Scanner scanner = new Scanner(query)) {
            int sizeOfQuery = Integer.parseInt(scanner.useDelimiter("n").next());

            bytesQuery = new byte[sizeOfQuery];

            for (int i = 0; i < sizeOfQuery; ++i) {
                bytesQuery[i] = Byte.parseByte((Integer.toString(
                        Integer.parseInt(
                                scanner.useDelimiter("n").next()))));
            }
        }
        return RealDeviceDAO.executeQueryToRealDevice(bytesQuery);
    }
}
