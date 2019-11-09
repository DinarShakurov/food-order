package ru.itis.web_project.utils.admin_action;

import ru.itis.web_project.DAO.DishCategoryDAO;
import ru.itis.web_project.DAO.DishDAO;
import ru.itis.web_project.DAO.DishPairDAO;
import ru.itis.web_project.models.Dish;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.util.List;

public class EditMenu {
    public static void deleteFromMenu(HttpServletRequest request) {
        Integer id_menu = Integer.parseInt(request.getParameter("id_menu"));
        DishPairDAO.deletePair(id_menu);
        DishDAO.deleteDishFromMenu(id_menu);
    }

    public static boolean addToMenu(Part filePart, String name_dish, Integer price, String composition, String category) {
        Dish dish = new Dish();
        dish.setName(name_dish);
        dish.setPrice(price);
        dish.setComposition(composition);
        dish.setId_category(DishCategoryDAO.getIdCategoryByName(category));
        List<Dish> dishList = DishDAO.getAllDishes().orElse(null);
        dish.setFileName(uploadFile(filePart));
        boolean tag = DishDAO.insert(dish);

        if (dishList != null && tag) {
            dish = DishDAO.findByName(name_dish);
            for (Dish dish1 : dishList) {
                int id = dish1.getId();
                DishPairDAO.insertNewPair(id, dish.getId());
            }
        }
        return tag;

    }

    private static String uploadFile(Part file) {
        String fileName = getFileName(file);
        String path = "C:\\Users\\Dinar Shakurov\\IdeaProjects\\Project_1sem\\src\\main\\webapp\\image\\" + fileName;

        File photo = new File(path);
        File photoTomcat = new File("D:\\apache-tomcat-9.0.24-windows-x64\\webapps\\ROOT\\image\\" + fileName);
        try (OutputStream out = new FileOutputStream(photo);
             OutputStream out2 = new FileOutputStream(photoTomcat);
             InputStream filecontent = file.getInputStream()) {

            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
                out2.write(bytes, 0, read);
            }

            return fileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    private static String getFileName(Part file) {
        String fileHeader = file.getHeader("content-disposition");
        for (String content : fileHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 2, content.lastIndexOf('"'));
            }
        }
        return "";
    }
}
