import { LightningElement } from 'lwc';
import quill from '@salesforce/resourceUrl/Quill';
import { loadScript } from 'lightning/platformResourceLoader';

export default class Richtxt extends LightningElement {

    

    connectedCallback() {
        loadScript(this, quill)
            .then(() => {
                console.log("success***************");
                var toolbarOptions = [
        
                    ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
                    ['blockquote', 'code-block'],
                  
                    [{ 'header': 1 }, { 'header': 2 }],               // custom button values
                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                    [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
                    [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
                    [{ 'direction': 'rtl' }],                         // text direction
                  
                    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                  
                    [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
                    [{ 'font': [] }],
                    [{ 'align': [] }],
                  
                    ['clean']                                         // remove formatting button
                  ];
                  
                  var quill = new Quill('#editor-container', {
                    modules: {
                      toolbar: toolbarOptions
                    },
                    theme: 'snow'
                  });
                       })
            .catch(error => {
              console.log("error",error);
            });
    }

    
    handleCodeBlockButtonClick() {
        const inputRichText = this.template.querySelector('lightning-input-rich-text');
        let format = inputRichText.getFormat();

        // Set or unset code-block format based on format on current selection
        if (format['code-block']) {
            inputRichText.setFormat({ 'code-block': false });
        } else {
            inputRichText.setFormat({ 'code-block': true });
        }
    }

    handleQuotationButtonClick() {

        const inputRichText1 = this.template.querySelector('lightning-input-rich-text');
        let format = inputRichText1.getFormat();

        inputRichText1.setFormat(this.quill.format('blockquote'));

    }

    handleindentupButtonClick() {

        const inputRichText2 = this.template.querySelector('lightning-input-rich-text');
        inputRichText2.setFormat(this.quill.format('indent','+1'));

    }
    myCustomButtons = [
        {
            category: "FORMAT_TEXT",
            label: 'Format Text',
            buttons: [
                {
                    value: 'like',
                    label: 'Like',
                    iconName: 'utility:like',
                    format: 'like',
                    handler: function () {
                        // format selection to be h1...
                        this.quill.format('header', 'h1'); 
                    }
                }
            ]
        },
    
    ];

    
}