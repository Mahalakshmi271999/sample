import { LightningElement} from 'lwc';
import uploadFile from '@salesforce/apex/UploadDemo.fileUpload';

export default class FileUploadCallout extends LightningElement {

    fileData;
    

    handleFile(event) {

        const file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = () => {
            
            var base64 = reader.result.split(',')[1];
            this.fileData = {
                'filename' : file.name,
                'base64' : base64
            }
        }
        reader.readAsDataURL(file);

    }

    handleClick(){
        const {base64, filename} = this.fileData;
        uploadFile({ base64, filename}).then(result=>{
            this.fileData = null;
            
        })
    }    
}