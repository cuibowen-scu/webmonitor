package edu.scdx.entity;

public class UserInfoBean {

    String phone;
    String email;
    String password;

    public UserInfoBean(String phone, String email, String password) {
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public UserInfoBean() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserInfoBean{" +
                "phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
