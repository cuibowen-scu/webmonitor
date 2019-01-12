package edu.scdx.service;

import edu.scdx.entity.UserInfoBean;

public interface UserService {

    boolean checkIfLogInLegal(String phone, String password);

    boolean getUser(String phone, String password);

    boolean checkIfRegLegal(String phone, String email, String password1, String password2);

    boolean checkIfPassSame(String password1, String password2);

    boolean addUser(String phone, String email, String password1);

    UserInfoBean getUserInfo(String phone);

    void updateUserInfo(String phone, String email, String password);
}
