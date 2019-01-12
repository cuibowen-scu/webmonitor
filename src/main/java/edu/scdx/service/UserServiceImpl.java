package edu.scdx.service;

import edu.scdx.dao.UserMapper;
import edu.scdx.entity.UserInfoBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public boolean checkIfLogInLegal(String phone, String password) {
        try {
            if (null == phone || null == password || "".equals(phone.trim()) || "".equals(password.trim())) {
                return false;
            }
            try {
                Long.parseLong(phone);
            } catch (NumberFormatException e) {
                return false;
            }
            return 11 == phone.length();
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean getUser(String phone, String password) {
        int num = userMapper.getUser(phone, password);
        return 0 != num;
    }

    @Override
    public boolean checkIfRegLegal(String phone, String email, String password1, String password2) {
        try {
            if (null == phone || null == email || null == password1 || null == password2 || "".equals(phone.trim())
                    || "".equals(email.trim()) || "".equals(password1.trim()) || "".equals(password2.trim())) {
                return false;
            }
            try {
                Long.parseLong(phone);
            } catch (NumberFormatException e) {
                return false;
            }
            return 11 == phone.length();
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean checkIfPassSame(String password1, String password2) {
        return null != password1 && null != password2 && password1.equals(password2);
    }

    @Override
    public boolean addUser(String phone, String email, String password1) {
        try {
            userMapper.addUser(phone, email, password1);
            return true;
        } catch (DuplicateKeyException e) {
            return false;
        }
    }

    @Override
    public UserInfoBean getUserInfo(String phone) {
        return userMapper.getUserInfo(phone);
    }

    @Override
    public void updateUserInfo(String phone, String email, String password) {
        userMapper.updateUserInfo(phone, email, password);
    }

}
