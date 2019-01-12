package edu.scdx.controller;

import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.Page;
import edu.scdx.entity.TimeCostBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.service.AlarmService;
import edu.scdx.service.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/cost")
public class CostController {

    @Autowired
    private CostService costService;

    public CostService getCostService() {
        return costService;
    }

    public void setCostService(CostService costService) {
        this.costService = costService;
    }

    @Autowired
    private AlarmService alarmService;

    public AlarmService getAlarmService() {
        return alarmService;
    }

    public void setAlarmService(AlarmService alarmService) {
        this.alarmService = alarmService;
    }

    @RequestMapping("/getCostProject.do")
    public String api(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);
            return "cost_project_page";
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
            return "cost_project_method_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectMethodCost.do")
    public String getProjectMethodCost(Model model, HttpSession session, String projectId, String methodId, Integer start) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<TimeCostBean> timeCostBeans = costService.getProjectMethodApiAlarm(methodId, project);

            List<TimeCostBean> res = new ArrayList<>();
            int total = timeCostBeans.size();
            int lastStart = Page.caculateLast(total, 10);
            if (null == start || 0 > start) {
                start = 0;
            }
            for (int i = start; i < start + 10 && i < total; i++) {
                res.add(timeCostBeans.get(i));
            }
            Collections.reverse(res);
            model.addAttribute("start", start);
            model.addAttribute("lastStart", lastStart);
            model.addAttribute("costs", res);

            return "project_method_cost";
        } catch (Exception e) {
            return "404";
        }
    }


}
