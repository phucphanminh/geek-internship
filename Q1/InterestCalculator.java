import java.util.Calendar;

public class InterestCalculator {
    public static void main(String[] args) {
        double initialAmount = 250.0;
        double oddYearInterestRate = 0.20; // 20%
        double evenYearInterestRate = 0.10; // 10%
        
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        int numberOfYears = 10; // Calculate the number of years since this year
        
        double balance = calculateBalance(initialAmount, oddYearInterestRate, evenYearInterestRate, numberOfYears, currentYear);
        
        System.out.println("Balance after " + numberOfYears + " years: $" + balance);
    }
    
    public static double calculateBalance(double initialAmount, double oddRate, double evenRate, int numberOfYears, int currentYear) {
        double balance = initialAmount;
        
        for (int year = 1; year <= numberOfYears; year++) {
            if ((year + currentYear) % 2 == 1) {
                balance *= (1 + oddRate);
            } else {
                balance *= (1 + evenRate);
            }
        }
        return balance;
    }
}
