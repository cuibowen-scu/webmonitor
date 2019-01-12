package edu.scdx.service;

import edu.scdx.entity.TimeCostBean;
import edu.scdx.entity.UserProjectBean;

import java.util.List;

public interface CostService {
    List<TimeCostBean> getProjectMethodApiAlarm(String methodId, UserProjectBean project);
}
