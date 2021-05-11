public class UploadDemo {
    
    @AuraEnabled
    public static void fileUpload(String base64,String filename) {
        
        string form64 = '';
        form64 += HttpFormBuilder.WriteBoundary();
        form64 += HttpFormBuilder.WriteBodyParameter('file', base64);
      
        
        string contentType = HttpFormBuilder.GetContentType();
        
        Blob body =EncodingUtil.base64Decode(form64);
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type', contentType);
        req.setHeader('accept','*/*');
        //req.setHeader('Content-Type', 'application/json');
        req.setEndpoint('http://casevault.bi-cloud.net:8080/pgps/api/input/payment/upload');
        req.setMethod('POST');
        req.setBodyAsBlob(body);
        Http http = new Http();
        HttpResponse response=http.send(req);
        if(response.getstatuscode()==200){
        system.debug('success');
        }
        else{
        system.debug(response.getbody());
        }
      
    }

}