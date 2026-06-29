public class Main {

    public static void main(String[] args) {

        StockMarket stockMarket = new StockMarket();

        Observer mobile = new MobileApp("Alice");
        Observer web = new WebApp("Bob");

        stockMarket.registerObserver(mobile);
        stockMarket.registerObserver(web);

        System.out.println("Updating Stock Price...\n");

        stockMarket.setStock("TCS", 3560.75);

        System.out.println();

        stockMarket.setStock("Infosys", 1625.50);

    }
}