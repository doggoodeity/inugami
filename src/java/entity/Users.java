/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author X1 carbon
 */
public class Users {
    private int userId;
    private String user;
    private String pass;
    private int isUser;
    private int isAdmin;

    public Users() {
    }

    public Users(int userId, String user, String pass, int isUser, int isAdmin) {
        this.userId = userId;
        this.user = user;
        this.pass = pass;
        this.isUser = isUser;
        this.isAdmin = isAdmin;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsUser() {
        return isUser;
    }

    public void setIsUser(int isUser) {
        this.isUser = isUser;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", user=" + user + ", pass=" + pass + ", isUser=" + isUser + ", isAdmin=" + isAdmin + '}';
    }
    
    
}
