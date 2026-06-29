import java.lang.module.ModuleDescriptor;
import java.util.*;
public class Computer {
    private String cpu;
    private int ram;
    private int storage;

    private Computer(Builder builder){
        this.cpu = builder.cpu;
        this.ram = builder.ram;
        this.storage = builder.storage;
    }

    public void display(){
        System.out.println("Comp Config: ");
        System.out.println("CPU: " + cpu);
        System.out.println("RAM: " + ram);
        System.out.println("Storage: "+ storage);
    }
    public static class Builder{
        private String cpu;
        private int ram;
        private int storage;

        public Builder(String cpu, int ram, int storage){
            this.cpu = cpu;
            this.ram = ram;
            this.storage = storage;
        }

        public Computer build(){
            return new Computer(this);
        }
}


}
