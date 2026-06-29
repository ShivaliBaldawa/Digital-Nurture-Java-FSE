public class Main {

    public static void main(String[] args) {

        PaymentContext paymentContext = new PaymentContext();

        paymentContext.setPaymentStrategy(new CreditCardPayment());
        paymentContext.makePayment(2500);

        paymentContext.setPaymentStrategy(new PayPalPayment());
        paymentContext.makePayment(5000);
    }
}