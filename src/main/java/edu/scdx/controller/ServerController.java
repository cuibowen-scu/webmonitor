package edu.scdx.controller;

import edu.scdx.entity.Page;
import edu.scdx.entity.ServerPerformance;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.service.AlarmService;
import edu.scdx.service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/server")
public class ServerController {

    @Autowired
    private ServerService serverService;

    public ServerService getServerService() {
        return serverService;
    }

    public void setServerService(ServerService serverService) {
        this.serverService = serverService;
    }

    @Autowired
    private AlarmService alarmService;

    public AlarmService getAlarmService() {
        return alarmService;
    }

    public void setAlarmService(AlarmService alarmService) {
        this.alarmService = alarmService;
    }

    @RequestMapping("/getServerStateProjectPage.do")
    public String getServerStateProjectPage(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);

            return "server_state_project_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectServerState.do")
    public String getProjectServerState(Model model, HttpSession session, String projectId) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<ServerPerformance> states = serverService.getServerState(projectId, project, 1);
            ServerPerformance serverPerformance = null == states || 0 == states.size() ? new ServerPerformance() : states.get(0);

            model.addAttribute("serverState", serverPerformance);
            return "project_server_state";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getHistoryServerStateProjectPage.do")
    public String getHistoryServerStateProjectPage(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);

            return "server_state_history_project_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/getProjectServerStateHistory.do")
    public String getProjectServerStateHistory(Model model, HttpSession session, String projectId, Integer start) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            UserProjectBean project = alarmService.getUserProject(phone, projectId);
            List<ServerPerformance> states = serverService.getServerState(projectId, project, 0);

            List<ServerPerformance> res = new ArrayList<>();
            int total = states.size();
            int lastStart = Page.caculateLast(total, 10);
            if (null == start || 0 > start) {
                start = 0;
            }
            for (int i = start; i < start + 10 && i < total; i++) {
                res.add(states.get(i));
            }
            model.addAttribute("start", start);
            model.addAttribute("lastStart", lastStart);
            model.addAttribute("states", res);

            return "project_server_state_history";
        } catch (Exception e) {
            return "404";
        }
    }
}
