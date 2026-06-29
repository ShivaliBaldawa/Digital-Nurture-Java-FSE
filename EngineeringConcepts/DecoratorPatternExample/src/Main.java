public class Main {

    public static void main(String[] args) {

        System.out.println("Email Notification:");
        Notifier email = new EmailNotifier();
        email.send("Hello User");

        System.out.println("\nEmail + SMS Notification:");
        Notifier emailSMS = new SMSNotifierDecorator(new EmailNotifier());
        emailSMS.send("Hello User");

        System.out.println("\nEmail + SMS + Slack Notification:");
        Notifier allNotifications =
                new SlackNotifierDecorator(
                        new SMSNotifierDecorator(
                                new EmailNotifier()));

        allNotifications.send("Hello User");
    }
}