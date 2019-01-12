package edu.scdx.entity;

public class CostMethodInfoBean {

    int project_id;
    int method_id;
    String method_class;
    String method_name;
    String if_cost_need_warn;
    int cost_warn_num;
    int flag;

    public CostMethodInfoBean(int project_id, int method_id, String method_class, String method_name, String if_cost_need_warn, int cost_warn_num, int flag) {
        this.project_id = project_id;
        this.method_id = method_id;
        this.method_class = method_class;
        this.method_name = method_name;
        this.if_cost_need_warn = if_cost_need_warn;
        this.cost_warn_num = cost_warn_num;
        this.flag = flag;
    }

    public CostMethodInfoBean() {
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public int getMethod_id() {
        return method_id;
    }

    public void setMethod_id(int method_id) {
        this.method_id = method_id;
    }

    public String getMethod_class() {
        return method_class;
    }

    public void setMethod_class(String method_class) {
        this.method_class = method_class;
    }

    public String getMethod_name() {
        return method_name;
    }

    public void setMethod_name(String method_name) {
        this.method_name = method_name;
    }

    public String getIf_cost_need_warn() {
        return if_cost_need_warn;
    }

    public void setIf_cost_need_warn(String if_cost_need_warn) {
        this.if_cost_need_warn = if_cost_need_warn;
    }

    public int getCost_warn_num() {
        return cost_warn_num;
    }

    public void setCost_warn_num(int cost_warn_num) {
        this.cost_warn_num = cost_warn_num;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "CostMethodInfoBean{" +
                "project_id=" + project_id +
                ", method_id=" + method_id +
                ", method_class='" + method_class + '\'' +
                ", method_name='" + method_name + '\'' +
                ", if_cost_need_warn='" + if_cost_need_warn + '\'' +
                ", cost_warn_num=" + cost_warn_num +
                ", flag=" + flag +
                '}';
    }
}
