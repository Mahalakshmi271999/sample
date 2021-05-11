public class ParkLocator {
    
    public static String[] country(String str) {
        
        ParkService.ParksImplPort parkobj = new ParkService.ParksImplPort();
        return parkobj.byCountry(str);
    }

}