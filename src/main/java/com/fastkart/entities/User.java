package com.fastkart.entities;

import jakarta.persistence.*;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    private String userName;
    private String userEmail;
    @Column(length = 20)
    private String userPassword;
    private String userPhone;
    private String userpic;
    @Column(length = 1500)
    private String userAddress;
    private String userType;

    public User(String userName, String userEmail, String userPsswd, String userPhone, String userpic, String userAddress, String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPsswd;
        this.userPhone = userPhone;
        this.userpic = userpic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserpic() {
        return userpic;
    }

    public void setUserpic(String userpic) {
        this.userpic = userpic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" + "userEmail=" + userEmail + ", userPassword=" + userPassword + '}';
    }
    
    

}
