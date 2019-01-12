package edu.scdx.entity;

public class ParamsBean {

    int project_id;
    int method_id;
    String method_class;
    String method_name;
    String time_s;
    String content;

    public ParamsBean(int project_id, int method_id, String method_class, String method_name, String time_s, String content) {
        this.project_id = project_id;
        this.method_id = method_id;
        this.method_class = method_class;
        this.method_name = method_name;
        this.time_s = time_s;
        this.content = content;
    }

    public ParamsBean() {
        this.project_id = 0;
        this.method_id = 0;
        this.method_class = method_class;
        this.method_name = method_name;
        this.time_s = time_s;
        this.content = content;
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

    public String getTime_s() {
        return time_s;
    }

    public void setTime_s(String time_s) {
        this.time_s = time_s;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ParamsBean{" +
                "project_id=" + project_id +
                ", method_id=" + method_id +
                ", method_class='" + method_class + '\'' +
                ", method_name='" + method_name + '\'' +
                ", time_s='" + time_s + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
