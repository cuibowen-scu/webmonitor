package edu.scdx.service;

import edu.scdx.dao.ProjectMapper;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    public ProjectMapper getProjectMapper() {
        return projectMapper;
    }

    public void setProjectMapper(ProjectMapper projectMapper) {
        this.projectMapper = projectMapper;
    }

    @Override
    public boolean addProject(String phone, String project_name, String host, String port, String user, String password, String db,
                              String cpu_need, String mem_need, String disk_need, String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num) {
        boolean argsValid = checkArgsValid(phone, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, cpu_alarm_num, mem_alarm_num, disk_alarm_num);
        if (!argsValid) {
            return false;
        }
        projectMapper.addProject(phone, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, Double.parseDouble(cpu_alarm_num), Double.parseDouble(mem_alarm_num), Double.parseDouble(disk_alarm_num));

        return true;
    }

    private boolean checkArgsValid(String phone, String project_name, String host, String port, String user, String password, String db, String cpu_need, String mem_need, String disk_need, String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num) {
        if (null == project_name || "".equals(project_name.trim())
                || null == host || "".equals(host.trim())
                || null == port || "".equals(port.trim())
                || null == user || "".equals(user.trim())
                || null == password || "".equals(password.trim())
                || null == db || "".equals(db.trim())
                || null == cpu_need || "".equals(cpu_need.trim())
                || null == mem_need || "".equals(mem_need.trim())
                || null == disk_need || "".equals(disk_need.trim())
                || null == cpu_alarm_num || "".equals(cpu_alarm_num.trim())
                || null == mem_alarm_num || "".equals(mem_alarm_num.trim())
                || null == disk_alarm_num || "".equals(disk_alarm_num.trim())) {
            return false;
        }
        try {
            Integer.parseInt(port);
            Double.parseDouble(cpu_alarm_num);
            Double.parseDouble(mem_alarm_num);
            Double.parseDouble(disk_alarm_num);
        } catch (NumberFormatException e) {
            return false;
        }
        if (!("yes".equals(cpu_need) || "no".equals(cpu_need)) || !("yes".equals(mem_need) || "no".equals(mem_need)) || !("yes".equals(disk_need) || "no".equals(disk_need))) {
            return false;
        }
        boolean flag = DBUtil.createTables(host, port, user, password, db);

        return flag;
    }

    @Override
    public boolean updateProject(String phone, String project_id, String project_name, String host, String port, String user, String password, String db, String cpu_need, String mem_need, String disk_need, String cpu_alarm_num, String mem_alarm_num, String disk_alarm_num) {
        boolean argsValid = checkArgsValid(phone, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, cpu_alarm_num, mem_alarm_num, disk_alarm_num);
        if (!argsValid) {
            return false;
        }
        projectMapper.updateProject(phone, project_id, project_name, host, port, user, password, db, cpu_need, mem_need, disk_need, Double.parseDouble(cpu_alarm_num), Double.parseDouble(mem_alarm_num), Double.parseDouble(disk_alarm_num));
        return true;
    }

    @Override
    public void deleteProject(String project_id) {
        projectMapper.deleteProject(Integer.parseInt(project_id));
    }

    @Override
    public boolean addProjectMethod(String project_id, String method_class, String method_name, String need_cost_cal, String cost_need_alarm, String cost_alarm_num, String need_offline_param) {
        boolean argsValid = checkMethodArgsValid(method_class, method_name, need_cost_cal, cost_need_alarm, cost_alarm_num, need_offline_param);
        if (!argsValid) {
            return false;
        }
        int flag = checkFlag(need_cost_cal, need_offline_param);
        projectMapper.addProjectMethod(Integer.parseInt(project_id), method_class, method_name, cost_need_alarm, Integer.parseInt(cost_alarm_num), flag);
        return true;
    }

    private int checkFlag(String need_cost_cal, String need_offline_param) {
        if ("yes".equals(need_cost_cal) && "yes".equals(need_offline_param)) {
            return 0;
        } else if ("yes".equals(need_cost_cal) && "no".equals(need_offline_param)) {
            return 1;
        } else {
            return 2;
        }
    }

    @Override
    public boolean updateProjectMethod(String method_id, String method_class, String method_name, String need_cost_cal, String cost_need_alarm, String cost_alarm_num, String need_offline_param) {
        boolean argsValid = checkMethodArgsValid(method_class, method_name, need_cost_cal, cost_need_alarm, cost_alarm_num, need_offline_param);
        if (!argsValid) {
            return false;
        }
        int flag = checkFlag(need_cost_cal, need_offline_param);
        projectMapper.updateProjectMethod(Integer.parseInt(method_id), method_class, method_name, cost_need_alarm, Integer.parseInt(cost_alarm_num), flag);
        return true;
    }

    @Override
    public void deleteProjectMethod(String methodId) {
        projectMapper.deleteProjectMethod(Integer.parseInt(methodId));
    }

    private boolean checkMethodArgsValid(String method_class, String method_name, String need_cost_cal, String cost_need_alarm,
                                         String cost_alarm_num, String need_offline_param) {
        if (null == method_class || "".equals(method_class.trim())
                || null == method_name || "".equals(method_name.trim())
                || null == need_cost_cal || "".equals(need_cost_cal.trim())
                || null == cost_need_alarm || "".equals(cost_need_alarm.trim())
                || null == cost_alarm_num || "".equals(cost_alarm_num.trim())
                || null == need_offline_param || "".equals(need_offline_param.trim())) {
            return false;
        }
        try {
            Integer.parseInt(cost_alarm_num);
        } catch (NumberFormatException e) {
            return false;
        }
        if (!("yes".equals(need_cost_cal) || "no".equals(need_cost_cal)) || !("yes".equals(cost_need_alarm) || "no".equals(cost_need_alarm)) || !("yes".equals(need_offline_param) || "no".equals(need_offline_param))) {
            return false;
        }
        return true;
    }
}
