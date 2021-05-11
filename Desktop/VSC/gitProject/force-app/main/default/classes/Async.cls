public class Async {
    
    @future
    public static void fmethod(){
        System.debug('Future method called');
    }
    
    public static void nmethod(){
        System.debug('Normal method called');
    }

}