public class StringArrayTest {
    public static List<String> generateStringArray(Integer num){
        List<String> names=new List<String>();
        for(Integer i=0;i<num;i++){
            names.add('Test '+i);   
        } 
        System.debug(names);
        return names;
    }
}