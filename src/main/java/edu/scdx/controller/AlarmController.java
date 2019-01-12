package edu.scdx.controller;

import edu.scdx.entity.*;
import edu.scdx.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

    @Autowired
    private AlarmService alarmService;

    public AlarmService getAlarmService() {
        return alarmService;
    }

    public void setAlarmService(AlarmService alarmService) {
        this.alarmService = alarmService;
    }

    @RequestMapping("/api.do")
    public String api(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);
            return "alarm_api_project_page";
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
            List<CostMethodInfoBean> methods = alarmService.getProjectMethods(projectId);
            model.addAttribute("methods", methods);
            return "alarm_api_project_method_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectMethodApiAlarm.do")
    public String getProjectMethodApiAlarm(Model model, HttpSession session, String projectId, String methodId, Integer start) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<TimeCostBean> timeCostBeans = alarmService.getProjectMethodApiAlarm(methodId, project);

            List<TimeCostBean> res = new ArrayList<>();
            int total = timeCostBeans.size();
            int lastStart = Page.caculateLast(total, 10);
            if (null == start || 0 > start) {
                start = 0;
            }
            for (int i = start; i < start + 10 && i < total; i++) {
                res.add(timeCostBeans.get(i));
            }
            model.addAttribute("start", start);
            model.addAttribute("lastStart", lastStart);
            model.addAttribute("alarmTimeCostBeans", res);

            return "alarm_api_project_method_alarms";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/server.do")
    public String server(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);
            return "alarm_server_project_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectServerAlarms.do")
    public String getProjectServerAlarms(Model model, HttpSession session, String projectId, Integer start) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<ServerPerformance> serverPerformances = alarmService.getServerPerformanceAlarm(projectId, project);

            List<ServerPerformance> res = new ArrayList<>();
            int total = serverPerformances.size();
            int lastStart = Page.caculateLast(total, 10);
            if (null == start || 0 > start) {
                start = 0;
            }
            for (int i = start; i < start + 10 && i < total; i++) {
                res.add(serverPerformances.get(i));
            }
            model.addAttribute("start", start);
            model.addAttribute("lastStart", lastStart);
            model.addAttribute("alarmServerPerformances", res);

            return "alarm_server_project__alarms";
        } catch (Exception e) {
            return "404";
        }
    }

}
