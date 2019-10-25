package ru.itis.web_project.utils.permissions;

import ru.itis.web_project.DAO.access.ActionsDAO;
import ru.itis.web_project.DAO.access.PermissionDAO;
import ru.itis.web_project.DAO.RoleDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class RolesUtil {
    public static List<Permission> setPermissionForUser(Integer id_role) {
        //присваиваем какое-то право пользователю
        List<Permission> userPermission = null;
        Optional<List<Integer>> optionalListOfActionID = PermissionDAO.getActionsByRoleId(id_role);
        if (optionalListOfActionID.isPresent()) {
            List<Integer> listOfActionID = optionalListOfActionID.get();
            userPermission = new ArrayList<>();
            for (Integer i : listOfActionID) {
                Permission permission = new Permission();
                permission.setId_role(id_role);
                permission.setId_action(i);
                permission.setRole_name(RoleDAO.getNameById(id_role));
                permission.setAction(ActionsDAO.getActionByActionID(i));
                permission.setAction_name(ActionsDAO.getActionNameByActionID(i));
                userPermission.add(permission);
            }
        }
        return userPermission;
    }

    public static void getUserPermission() {

    }

    public static void getAdminPermission() {

    }

    public static void getKitchenPermission() {

    }
}
