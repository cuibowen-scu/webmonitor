package edu.scdx.service;

import edu.scdx.entity.CostMethodInfoBean;
import edu.scdx.entity.ServerPerformance;
import edu.scdx.entity.TimeCostBean;
import edu.scdx.entity.UserProjectBean;

import java.util.List;

public interface AlarmService {

    List<UserProjectBean> getUserProjects(String phone);

    List<CostMethodInfoBean> getProjectMethods(String projectId);

    List<TimeCostBean> getProjectMethodApiAlarm(String methodId, UserProjectBean project);

    UserProjectBean getUserProject(String phone, String projectId);

    List<ServerPerformance> getServerPerformanceAlarm(String projectId, UserProjectBean project);

    List<CostMethodInfoBean> getProjectParamMethods(String projectId);

    List<CostMethodInfoBean> getAllProjectMethods(String projectId);
}
