package edu.scdx.service;

import edu.scdx.entity.ParamsBean;
import edu.scdx.entity.UserProjectBean;

import java.util.List;

public interface OfflineService {
    List<ParamsBean> getProjectMethodParam(String methodId, UserProjectBean project);
}
