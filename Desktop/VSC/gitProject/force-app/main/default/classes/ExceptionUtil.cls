public class ExceptionUtil {

public class MyException extends Exception{}

@InvocableMethod(label = 'Invoke ExceptionUtil')
public static void throwcustomException(List<String> excMessage) {
throw new MyException('Something went wrong: '+ excMessage[0]);
}
}