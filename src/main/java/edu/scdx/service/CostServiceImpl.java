package edu.scdx.service;

import edu.scdx.dao.CostMapper;
import edu.scdx.entity.TimeCostBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CostServiceImpl implements CostService {

    @Autowired
    private CostMapper costMapper;

    public CostMapper getCostMapper() {
        return costMapper;
    }

    public void setCostMapper(CostMapper costMapper) {
        this.costMapper = costMapper;
    }

    @Override
    public List<TimeCostBean> getProjectMethodApiAlarm(String methodId, UserProjectBean project) {
        return DBUtil.getProjectMethodTimeCosts(methodId, project);
    }
}
