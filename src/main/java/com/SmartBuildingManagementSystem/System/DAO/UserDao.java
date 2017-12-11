package com.SmartBuildingManagementSystem.System.DAO;

import com.SmartBuildingManagementSystem.System.Model.User;
import org.springframework.stereotype.Repository;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;


@Repository
public class UserDao {

    private List<User> users = Arrays.asList(new User("admin", "admin"),
            new User("user1", "user1"));

    public static String exequteQueryToServer(String query) {
        try {
            String url = "http://localhost:9999";
            Charset charset = Charset.forName("UTF8");
            URLConnection connection = new URL(url).openConnection();
            connection.setDoOutput(true); // Triggers POST.
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
                responseBody = scanner.useDelimiter("\n").next();
            }
            return responseBody;
        } catch (Exception e) {
            return "falseExequteQueryToServer";
        } finally {
            //to do
        }
    }

    public List<User> getAllUsers() {
        return users;
    }

    public boolean addNewUser(User newUser) {
        String query = "set\n" +
                "addNewUser\n" +
                "2\n" +
                newUser.getLogin() + "\n" +
                newUser.getPassword();
        String result = "";
        result += exequteQueryToServer(query);
        return result.equals("1");

    }
}