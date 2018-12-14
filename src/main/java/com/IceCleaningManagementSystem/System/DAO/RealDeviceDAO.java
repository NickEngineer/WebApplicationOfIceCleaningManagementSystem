package com.SmartBuildingManagementSystem.System.DAO;

import org.springframework.stereotype.Repository;

import java.net.Socket;
import java.util.Scanner;

@Repository
public class RealDeviceDAO {

    public static String executeQueryToRealDevice(byte[] query) {

        String responseBody = "";
        String temp1 = "";

        try {

            Socket socket = new Socket("192.168.88.250", 1715);

            socket.getOutputStream().write(query);

            byte buf[] = new byte[64 * 1024];
            int r = socket.getInputStream().read(buf);
            String data = new String(buf, 0, r);

            System.out.println(data);

            try (Scanner scanner = new Scanner(data)) {
                responseBody = scanner.useDelimiter("<delim>").next();
            }

            temp1 = Double.toString(((double) (256 + new Integer(buf[8]))) / 10);

            socket.close();


        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("init error: " + e);
        }

        return temp1.toString();
    }
}
