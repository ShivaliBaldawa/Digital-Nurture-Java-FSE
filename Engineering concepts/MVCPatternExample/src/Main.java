public class Main {

    public static void main(String[] args) {

        Student student = new Student("ABC", 101, "A");

        StudentView view = new StudentView();

        StudentController controller =
                new StudentController(student, view);

        System.out.println("Initial Details:");
        controller.updateView();

        System.out.println();

        controller.setStudentName("Aarav");
        controller.setStudentGrade("A+");

        System.out.println("Updated Details:");
        controller.updateView();
    }
}