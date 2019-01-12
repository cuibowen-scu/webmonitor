package edu.scdx.controller;

import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.Page;
import edu.scdx.entity.ParamsBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.service.AlarmService;
import edu.scdx.service.OfflineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/offline")
public class OfflineController {

    @Autowired
    private OfflineService offlineService;

    public OfflineService getOfflineService() {
        return offlineService;
    }

    public void setOfflineService(OfflineService offlineService) {
        this.offlineService = offlineService;
    }

    @Autowired
    private AlarmService alarmService;

    public AlarmService getAlarmService() {
        return alarmService;
    }

    public void setAlarmService(AlarmService alarmService) {
        this.alarmService = alarmService;
    }

    @RequestMapping("/getOfflineProject.do")
    public String api(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);
            return "offline_project_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectMethods.do")
    public String getProjectMethods(Model model, HttpSession session, String projectId) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<CostMethodInfoBean> methods = alarmService.getProjectParamMethods(projectId);
            model.addAttribute("methods", methods);
            return "offline_project_method_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectMethodParam.do")
    public String getProjectMethodParam(Model model, HttpSession session, String projectId, String methodId, Integer start) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<ParamsBean> paramsList = offlineService.getProjectMethodParam(methodId, project);

            List<ParamsBean> res = new ArrayList<>();
            int total = paramsList.size();
            int lastStart = Page.caculateLast(total, 10);
            if (null == start || 0 > start) {
                start = 0;
            }
            for (int i = start; i < start + 10 && i < total; i++) {
                res.add(paramsList.get(i));
            }
            model.addAttribute("start", start);
            model.addAttribute("lastStart", lastStart);
            model.addAttribute("methodParams", res);

            return "offline_project_method_params";
        } catch (Exception e) {
            return "404";
        }
    }
}
