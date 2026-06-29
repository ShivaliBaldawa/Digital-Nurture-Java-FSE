public class Main {

    public static void main(String[] args) {

        Computer gamingPC = new Computer.Builder("AMD", 32, 1000)
                .build();

        Computer officePC = new Computer.Builder("Intel i5", 16, 512)
                .build();

        gamingPC.display();
        officePC.display();
    }
}