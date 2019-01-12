package edu.scdx.controller;

import edu.scdx.entity.UserInfoBean;
import edu.scdx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/logPage.do")
    public String logPage(Model model, HttpSession session) {
        return "log_page";
    }

    @RequestMapping("/login.do")
    public String logIn(Model model, HttpSession session, String phone, String password) {
        try {
            boolean legal = userService.checkIfLogInLegal(phone, password);
            if (!legal) return "input_illegal";
            boolean hasUser = userService.getUser(phone, password);
            if (hasUser) {
                model.addAttribute("phone", phone);
                session.setAttribute("phone", phone);
                return "main";
            } else {
                return "phone_pass_incorrect";
            }
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/logout.do")
    public String logout(Model model, HttpSession session, String phone, String password) {
        try {
            session.setAttribute("phone", null);
            return "main";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/reg.do")
    public String reg(Model model, HttpSession session, String phone, String email, String password1, String password2) {
        try {
            boolean legal = userService.checkIfRegLegal(phone, email, password1, password2);
            if (!legal) return "input_illegal";
            boolean same = userService.checkIfPassSame(password1, password2);
            if (!same) return "pass_not_same";
            boolean success = userService.addUser(phone, email, password1);
            return success ? "reg_success" : "already_have_user";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/infoPage.do")
    public String infoPage(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserInfoBean userInfo = userService.getUserInfo(phone);
            model.addAttribute("userInfo", userInfo);
            return "info_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/modify.do")
    public String modify(Model model, HttpSession session, String email, String password) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserInfoBean oUserInfo = userService.getUserInfo(phone);
            userService.updateUserInfo(phone, email, password);
            if (null != oUserInfo && password.equals(oUserInfo.getPassword())) {
                UserInfoBean newUser = new UserInfoBean(phone, email, password);
                model.addAttribute("userInfo", newUser);
                return "info_page";
            } else {
                session.setAttribute("phone", null);
                return "log_page";
            }
        } catch (Exception e) {
            return "404";
        }
    }
}