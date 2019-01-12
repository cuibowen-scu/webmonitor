package edu.scdx.controller;

import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.service.AlarmService;
import edu.scdx.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    public ProjectService getProjectService() {
        return projectService;
    }

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    @Autowired
    private AlarmService alarmService;

    public AlarmService getAlarmService() {
        return alarmService;
    }

    public void setAlarmService(AlarmService alarmService) {
        this.alarmService = alarmService;
    }

    @RequestMapping("/getProjectList.do")
    public String getProjectList(Model model, HttpSession session) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            List<UserProjectBean> projects = alarmService.getUserProjects(phone);
            model.addAttribute("projects", projects);
            return "project_list_page";
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
            List<CostMethodInfoBean> methods = alarmService.getAllProjectMethods(projectId);
            model.addAttribute("methods", methods);
            model.addAttribute("projectId", projectId);
            return "project_methods_list_page";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/addProject.do")
    public String addProject(Model model, HttpSession session, String project_name, String host, String port, String user,
                             String password, String db, String cpu_need, String mem_need, String disk_need,
                             String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            boolean flag = projectService.addProject(phone, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, cpu_alarm_num, mem_alarm_num, disk_alarm_num);
            if (!flag) {
                return "db_not_exit";
            }

            return "project_success";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/updateProject.do")
    public String updateProject(Model model, HttpSession session, String project_id, String project_name, String host, String port,
                                String user, String password, String db, String cpu_need, String mem_need, String disk_need,
                                String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            boolean flag = projectService.updateProject(phone, project_id, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, cpu_alarm_num, mem_alarm_num, disk_alarm_num);
            if (!flag) {
                return "db_not_exit";
            }
            return "project_success";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/deleteProject.do")
    public String deleteProject(Model model, HttpSession session, String projectId) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            projectService.deleteProject(projectId);

            return "project_success";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/addProjectMethod.do")
    public String addProjectMethod(Model model, HttpSession session, String project_id, String method_class, String method_name, String need_cost_cal,
                                   String cost_need_alarm, String cost_alarm_num, String need_offline_param) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            boolean flag = projectService.addProjectMethod(project_id, method_class, method_name, need_cost_cal, cost_need_alarm, cost_alarm_num, need_offline_param);
            if (!flag) {
                return "db_not_exit";
            }

            model.addAttribute("projectId", project_id);
            return "project_method_add_success";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/updateProjectMethod.do")
    public String updateProjectMethod(Model model, HttpSession session, String project_id, String method_id, String method_class, String method_name,
                                      String need_cost_cal, String cost_need_alarm, String cost_alarm_num, String need_offline_param) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            boolean flag = projectService.updateProjectMethod(method_id, method_class, method_name, need_cost_cal, cost_need_alarm, cost_alarm_num, need_offline_param);
            if (!flag) {
                return "db_not_exit";
            }

            model.addAttribute("projectId", project_id);
            return "project_method_add_success";
        } catch (Exception e) {
            return "404";
        }
    }

    @RequestMapping("/deleteProjectMethod.do")
    public String deleteProjectMethod(Model model, HttpSession session, String methodId, String projectId) {
        try {
            String phone = (String) session.getAttribute("phone");
            if (null == phone) {
                return "please_login";
            }
            projectService.deleteProjectMethod(methodId);

            model.addAttribute("projectId", projectId);
            return "project_method_add_success";
        } catch (Exception e) {
            return "404";
        }
    }


}
