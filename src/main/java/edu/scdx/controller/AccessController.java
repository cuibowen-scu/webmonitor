package edu.scdx.controller;

import edu.scdx.entity.AccessBean;
import edu.scdx.entity.AccessField;
import edu.scdx.service.AccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/access")
public class AccessController {

    @Autowired
    private AccessService accessService;

    public AccessService getAccessService() {
        return accessService;
    }

    public void setAccessService(AccessService accessService) {
        this.accessService = accessService;
    }

    @RequestMapping("/getAccessList.do")
    public String getAccessList(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<AccessBean> accessBeanList = accessService.getAccessList(phone);
            model.addAttribute("accessList", accessBeanList);
            return "access_list_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getAccess.do")
    public String getAccess(Model model, HttpSession session, int accessId) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            AccessBean accessBean = accessService.getAccessInfo(phone, accessId);
            List<AccessField> fields = accessService.getAccessFields(accessBean);
            Collections.reverse(fields);

            model.addAttribute("fields", fields);
            return "access_field_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/addAccessPage.do")
    public String addAccessPage(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            return "access_add_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/addAccess.do")
    public String addAccess(Model model, HttpSession session, String access_name, String hostname, String port, String username, String password, String db_name, String table, String time_field, String action_field) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }

            AccessBean accessBean = new AccessBean(phone, access_name, hostname, port, username, password, db_name, table, time_field, action_field);
            accessService.addAccess(accessBean);
            int access_id = accessService.getAccessId();
            accessBean.setAccess_id(access_id);

            model.addAttribute("accessBean", accessBean);
            return "access_field_page_add";
        } catch (Exception e) {
            return "404";
        }
    }


}