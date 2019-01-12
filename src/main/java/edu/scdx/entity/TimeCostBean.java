package edu.scdx.entity;

public class TimeCostBean {

    int project_id;
    int method_id;
    String class_name;
    String method_name;
    long start_nano_time;
    String start_user_time;
    long end_nano_time;
    String if_cost_need_warn;
    int cost_warn_num;
    int cost;
    String if_warned;

    public TimeCostBean(int project_id, int method_id, String class_name, String method_name, long start_nano_time, String start_user_time, long end_nano_time, String if_cost_need_warn, int cost_warn_num, int cost, String if_warned) {
        this.project_id = project_id;
        this.method_id = method_id;
        this.class_name = class_name;
        this.method_name = method_name;
        this.start_nano_time = start_nano_time;
        this.start_user_time = start_user_time;
        this.end_nano_time = end_nano_time;
        this.if_cost_need_warn = if_cost_need_warn;
        this.cost_warn_num = cost_warn_num;
        this.cost = cost;
        this.if_warned = if_warned;
    }

    public TimeCostBean() {
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

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getMethod_name() {
        return method_name;
    }

    public void setMethod_name(String method_name) {
        this.method_name = method_name;
    }

    public long getStart_nano_time() {
        return start_nano_time;
    }

    public void setStart_nano_time(long start_nano_time) {
        this.start_nano_time = start_nano_time;
    }

    public String getStart_user_time() {
        return start_user_time;
    }

    public void setStart_user_time(String start_user_time) {
        this.start_user_time = start_user_time;
    }

    public long getEnd_nano_time() {
        return end_nano_time;
    }

    public void setEnd_nano_time(long end_nano_time) {
        this.end_nano_time = end_nano_time;
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

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getIf_warned() {
        return if_warned;
    }

    public void setIf_warned(String if_warned) {
        this.if_warned = if_warned;
    }

    @Override
    public String toString() {
        return "TimeCostBean{" +
                "project_id=" + project_id +
                ", method_id=" + method_id +
                ", class_name='" + class_name + '\'' +
                ", method_name='" + method_name + '\'' +
                ", start_nano_time=" + start_nano_time +
                ", start_user_time='" + start_user_time + '\'' +
                ", end_nano_time=" + end_nano_time +
                ", if_cost_need_warn='" + if_cost_need_warn + '\'' +
                ", cost_warn_num=" + cost_warn_num +
                ", cost=" + cost +
                ", if_warned='" + if_warned + '\'' +
                '}';
    }
}
