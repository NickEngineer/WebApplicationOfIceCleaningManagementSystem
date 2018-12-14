package com.SmartBuildingManagementSystem.System.DAO;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.Scanner;

public class AccessToGeneralServer {

    public static String exequteQueryToServer(String query) {
        try {
            String url ="http://192.168.88.213:9999"; //"http://localhost:9999";
            Charset charset = Charset.forName("UTF8");
            URLConnection connection = new URL(url).openConnection();
            connection.setDoOutput(true); // Triggers POST
            connection.setRequestProperty("Accept-Charset", charset.toString());
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);

            try (OutputStream output = connection.getOutputStream()) {
                output.write(query.getBytes(charset));
            }

            InputStream response = null;

            try {
                response = connection.getInputStream();
            } catch (Exception e) {
                //to do
            } finally {
                //to do
            }

            String responseBody;

            try (Scanner scanner = new Scanner(response)) {
                responseBody = scanner.useDelimiter("Z\tn").next();
            }
            return responseBody;
        } catch (Exception e) {
            return "falseExequteQueryToServer";
        } finally {
            //to do
        }
    }
}
