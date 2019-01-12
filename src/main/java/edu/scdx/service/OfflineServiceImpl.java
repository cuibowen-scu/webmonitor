package edu.scdx.service;

import edu.scdx.dao.OfflineMapper;
import edu.scdx.entity.ParamsBean;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfflineServiceImpl implements OfflineService {
    @Autowired
    private OfflineMapper offlineMapper;

    public OfflineMapper getOfflineMapper() {
        return offlineMapper;
    }

    public void setOfflineMapper(OfflineMapper offlineMapper) {
        this.offlineMapper = offlineMapper;
    }

    @Override
    public List<ParamsBean> getProjectMethodParam(String methodId, UserProjectBean project) {
        return DBUtil.getProjectMethodParam(methodId, project);
    }
}
