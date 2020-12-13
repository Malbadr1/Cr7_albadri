import java.sql.*;
import java.util.*;

public class Main_TESt {
    static Scanner scanner = new Scanner(System.in);
    static final String JDBC_Driver = "com.mysql.cj.jdbc.Driver";
    static final String url = "jdbc:mysql://localhost:3306/cr7_albadri";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    Connection connection = null;

    public static void menu() {
        System.out.println("1. Display all Students");
        System.out.println("2. Display all Teachers");
        System.out.println("3. Display all Classes");
        System.out.println("4. Display all Classes Of Teacher");
        System.out.println("5. Quit");

    }

    public void ShowAllStudents() {


        try {


            Class.forName(JDBC_Driver);

            connection = DriverManager.getConnection(url, USERNAME, PASSWORD);

            PreparedStatement ps = connection.prepareStatement("SELECT student_name,student_surname, student_email,classes.class_name FROM students inner join classes on students.ID_class=classes.ID_class");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("student_name: " + rs.getString("student_name") + " | " + "student_surname: " + rs.getString("student_surname") + " | " + "student_email: " + rs.getString("student_email") + " | " + "class_name: " + rs.getString("class_name"));
                System.out.println("______________________");
            }
            connection.close();


        } catch (SQLException sql) {
            sql.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public void showAllTeachers() {

        try {
            Class.forName(JDBC_Driver);

            connection = DriverManager.getConnection(url, USERNAME, PASSWORD);

            PreparedStatement ps = connection.prepareStatement("SELECT * from teachers");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("teacher_name: " + " " + rs.getString("teacher_name") + " | " + "teacher_surname: " + rs.getString("teacher_surname") + " | " + "teacher_email: " + rs.getString("teacher_email"));
                System.out.println("______________________");
            }
            connection.close();


        } catch (SQLException sql) {
            sql.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public void showAllClasses() {

        try {
            Class.forName(JDBC_Driver);

            connection = DriverManager.getConnection(url, USERNAME, PASSWORD);


            PreparedStatement ps = connection.prepareStatement("SELECT * from classes");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("class_name : " + rs.getString("class_name"));
                System.out.println("______________________");
            }
            connection.close();


        } catch (SQLException sql) {
            sql.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }


    public void showAllClassesOfTeacher() {

        try {
            Class.forName(JDBC_Driver);

            connection = DriverManager.getConnection(url, USERNAME, PASSWORD);


            PreparedStatement ps = connection.prepareStatement("SELECT teachers.ID_teacher,teachers.teacher_name, teachers.teacher_surname, teachers.teacher_email, classes.class_name FROM teachers\n" +
                    "inner join teachers_classes on teachers.ID_teacher=teachers_classes.ID_teacher\n" +
                    "inner join classes on classes.ID_class=teachers_classes.ID_class\n" +
                    "where teachers.ID_teacher=?");

            System.out.println("Enter teacher ID");
            Scanner scc = new Scanner(System.in);

            int id = scc.nextInt();
            if (id >= 1 && id <= 4) {
                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                int n = 0;
                while (rs.next()) {
                    if (n == 0) {
                        System.out.print("ID " + rs.getInt("ID_teacher") + ": Teacher : " + rs.getString("teacher_name") + " " + rs.getString("teacher_surname") + " teaches: " + rs.getString("class_name"));
                    } else {
                        System.out.println(" and " + rs.getString("class_name"));
                    }
                    n = 1;
                }
            }  else {
            System.out.println("\"Enter Valid number ID from 1-4 \"");
        }
            connection.close();


        } catch (SQLException sql) {
            sql.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public void UserInput() {
        int n = 0;
        try {
            do {
                Scanner user_input = new Scanner(System.in);
                System.out.println("Enter Your Choice");
                int x = user_input.nextInt();
                if (x >= 1 && x <= 5) {
                    switch (x) {
                        case 1: {
                            Main_TESt me = new Main_TESt();
                            me.ShowAllStudents();
                            break;
                        }
                        case 2: {
                            Main_TESt me = new Main_TESt();
                            me.showAllTeachers();
                            break;
                        }
                        case 3: {
                            Main_TESt me = new Main_TESt();
                            me.showAllClasses();
                            break;
                        }
                        case 4: {


                            Main_TESt me = new Main_TESt();
                            me.showAllClassesOfTeacher();

                            break;
                        }
                        case 5: {
                            System.out.println("Exit");
                            n = -1;
                            break;
                        }

                    } } else {
                    System.out.println("\"Enter Valid number from 1-5 \"");
                }


            } while (n == 0);
            System.out.println("Thanks bye");
        } catch (NumberFormatException e) {
            System.out.println("Enter numeric value");
        }
    }


    public static void main(String[] args) {

        Main_TESt main_teSt = new Main_TESt();
        main_teSt.menu();
        main_teSt.UserInput();
    }

}