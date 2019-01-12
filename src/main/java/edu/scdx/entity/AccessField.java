package edu.scdx.entity;

public class AccessField {

    String time_field;
    String action_field;

    public AccessField(String time_field, String action_field) {
        this.time_field = time_field;
        this.action_field = action_field;
    }

    public AccessField() {
    }

    public String getTime_field() {
        return time_field;
    }

    public void setTime_field(String time_field) {
        this.time_field = time_field;
    }

    public String getAction_field() {
        return action_field;
    }

    public void setAction_field(String action_field) {
        this.action_field = action_field;
    }

    @Override
    public String toString() {
        return "AccessField{" +
                "time_field='" + time_field + '\'' +
                ", action_field='" + action_field + '\'' +
                '}';
    }
}
