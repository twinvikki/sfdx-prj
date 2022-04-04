import { LightningElement,track,api } from 'lwc';
import pCapture from '@salesforce/apex/photoCaptureControllerApex.saveImageFile';
let preData;
export default class LwsServices extends LightningElement {
   // https://www.salesforce.com/video/28384979/
    @api recordId;
    photoCaptured = true;
    data;
    renderedCallback()
    {
        this.functionClick('rendered'); 
    }
    clickCapture()
    {
        this.functionClick("capture");    
    }
  
    clickClear()
    {
        this.functionClick('clear');
        this.photoCaptured = true;
    }
    functionClick(detail)
    {
        var width = 400; // scale the photo width to this
        var height = 0; // computed based on the input stream
        var streaming = false;
        var video = null;
        var canvas = null;
        var photo = null;
        video = this.template.querySelector('video');
        canvas = this.template.querySelector('canvas');
        photo = this.template.querySelector('photo');
        navigator.mediaDevices.getUserMedia({video: true, audio: false})
        .then(function(stream) {
                video.srcObject = stream;
                video.play();
        })
        .catch(function(err) {
                console.log("An error occurred: " + err);
        });
        video.addEventListener('canplay', function(ev)
        {
            if (!streaming) {
                height = video.videoHeight / (video.videoWidth/width);
                console.log('height initial-->'+height);
                // Firefox currently has a bug where the height can't be read from
                // the video, so make assumptions if this happens.
                if (isNaN(height)) {
                    height = width / (4/3);
                }
                video.setAttribute('width', width);
                video.setAttribute('height', height);
                canvas.setAttribute('width', width);
                canvas.setAttribute('height', height);
                streaming = true;

                if(detail != null && detail === 'capture')
                {
                    takepicture();
                }
                if(detail != null && detail === 'clear')
                {
                    clearphoto();
                }
            }
        }, false);
        
        function clearphoto() {
                var context = canvas.getContext('2d');
                context.fillStyle = "#AAA";
                context.fillRect(0, 0, canvas.width, canvas.height);
                var data = canvas.toDataURL('image/png');
                preData = null;
                photo.setAttribute('src', data);
        }
        
        function takepicture() {
            var context = canvas.getContext('2d');
            if (width && height) 
            {
                console.log('width-->'+width);
                canvas.width = width;
                canvas.height = height;
                context.drawImage(video, 0, 0, width, height);
                var data = canvas.toDataURL('image/png');
                preData = data;
                photo.setAttribute('src', data);
            } 
            else {
                clearphoto();
            }
        };

    }
    savePhoto(event)
    {

        pCapture({recId:this.recordId,imageUrl:preData})
        .then(result=>{
            console.log('result-->'+result);
        })
        .catch(error=>{
            console.log('error-->'+error);
        });
    }
}