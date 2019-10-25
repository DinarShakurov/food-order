package ru.itis.web_project.utils.permissions;

public class Permission {
    private  Integer id_role;//
    private  Integer id_action;//
    private  String role_name;//
    private  String action;
    private  String action_name;

    public Integer getId_role() {
        return id_role;
    }

    public void setId_role(Integer id_role) {
        this.id_role = id_role;
    }

    public Integer getId_action() {
        return id_action;
    }

    public void setId_action(Integer id_action) {
        this.id_action = id_action;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getAction_name() {
        return action_name;
    }

    public void setAction_name(String action_name) {
        this.action_name = action_name;
    }
}
