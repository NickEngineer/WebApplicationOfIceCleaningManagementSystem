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

    public List<User> getAllUsers() {
        return users;
    }

    public static String getUserIdByLogin(String login) {
        User user = new User();
        String query = "get\n" +
                "userIdByLogin\n" +
                "1\n" +
                login;

        String result = AccessToGeneralServer.exequteQueryToServer(query);

        String userId;

        try (Scanner scanner = new Scanner(result)) {
            scanner.useDelimiter("\n").next();
            userId = scanner.useDelimiter("\n").next();
        }

        return userId;
    }

    public static User getUserByLogin(String login) {
        User user = new User();
        String query = "get\n" +
                "userByLogin\n" +
                "1\n" +
                login;

        String result = AccessToGeneralServer.exequteQueryToServer(query);

        String loginFromDB;
        String passwordFromDB;

        try (Scanner scanner = new Scanner(result)) {
            scanner.useDelimiter("\n").next();
            passwordFromDB = scanner.useDelimiter("\n").next();
            loginFromDB = scanner.useDelimiter("\n").next();
        }

        user.setLogin(loginFromDB);
        user.setPassword(passwordFromDB);

        return user;
    }

    public boolean addNewUser(User newUser) {
        String query = "set\n" +
                "addNewUser\n" +
                "2\n" +
                newUser.getLogin() + "\n" +
                newUser.getPassword();

        String result = AccessToGeneralServer.exequteQueryToServer(query);

        return result.equals("1");
    }
}