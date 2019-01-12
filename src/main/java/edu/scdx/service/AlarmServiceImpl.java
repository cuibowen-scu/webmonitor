package edu.scdx.service;

import edu.scdx.dao.AlarmMapper;
import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.ServerPerformance;
import edu.scdx.entity.TimeCostBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AlarmServiceImpl implements AlarmService {

    @Autowired
    private AlarmMapper alarmMapper;

    public AlarmMapper getAlarmMapper() {
        return alarmMapper;
    }

    public void setAlarmMapper(AlarmMapper alarmMapper) {
        this.alarmMapper = alarmMapper;
    }

    @Override
    public List<UserProjectBean> getUserProjects(String phone) {
        return alarmMapper.getUserProjects(phone);
    }

    @Override
    public UserProjectBean getUserProject(String phone, String projectId) {
        return alarmMapper.getUserProject(phone, projectId);
    }

    @Override
    public List<CostMethodInfoBean> getProjectMethods(String projectId) {
        return alarmMapper.getProjectMethods(projectId);
    }

    @Override
    public List<TimeCostBean> getProjectMethodApiAlarm(String methodId, UserProjectBean project) {
        List<TimeCostBean> all = DBUtil.getProjectMethodTimeCosts(methodId, project);
        List<TimeCostBean> res = new ArrayList<>();
        for (TimeCostBean bean : all) {
            if ("yes".equals(bean.getIf_warned())) {
                res.add(bean);
            }
        }
        return res;
    }

    @Override
    public List<ServerPerformance> getServerPerformanceAlarm(String projectId, UserProjectBean project) {
        List<ServerPerformance> all = DBUtil.getServerState(projectId, project, 0);
        List<ServerPerformance> res = new ArrayList<>();
        for (ServerPerformance serverPerformance : all) {
            if ("yes".equals(serverPerformance.getIf_cpu_warned()) || "yes".equals(serverPerformance.getIf_mem_warned()) ||
                    "yes".equals(serverPerformance.getIf_disk_warned())) {
                res.add(serverPerformance);
            }
        }
        return res;
    }

    @Override
    public List<CostMethodInfoBean> getProjectParamMethods(String projectId) {
        return alarmMapper.getProjectParamMethods(projectId);
    }

    @Override
    public List<CostMethodInfoBean> getAllProjectMethods(String projectId) {
        return alarmMapper.getAllProjectMethods(projectId);
    }

}
