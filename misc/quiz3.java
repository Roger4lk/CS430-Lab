public class quiz3 {
    public static void main(String[] args) {
        long start = 1800000064L;
        
        while (true) {
            // Check if the number can be accurately represented as a float
            if (isRepresentableAsFloat(start)) {
                System.out.println("The first integer after 1800000064 that can be represented as a float is: " + start);
                break;
            }
            start++;
        }
    }
    
    private static boolean isRepresentableAsFloat(long number) {
        // Convert the number to float and back to check if it remains the same
        return number == (long) ((float) number);
    }
}