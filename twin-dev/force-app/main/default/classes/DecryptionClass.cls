public class DecryptionClass {
    public static void decryptionmethod(){ 
        //Blob cryptoKey = Crypto.generateAesKey(192);
        Blob key = EncodingUtil.convertFromHex('14e1d997bf332f01c15fc2f14ccde235b4baf4cfd08ef7a771d9391d6a95e487');
        Blob IV = EncodingUtil.convertFromHex('c83ab487f80dae7423ab544dcb0928da'); //converting hexa format key

        system.debug('Size3:-'+key.size()); 
       // Blob exampleIv = Blob.valueOf('Example of IV123');        
        string url = 'https://appiriodev-hondafinance.cs23.force.com/acurahelp/s/ddc-change-request?finnumber=VYSZ7OJaDblnQAULKt81WA%3D%3D';
      //  string recordId =url.substr(url.lastIndexOf('=') + 1);
     //   system.debug('recordId-->'+recordId);
        string tempString = 'VC/1kjwYdI70JMbNsShXPg==';
        string tempencode = 'VYSZ7OJaDblnQAULKt81WA%3D%3D';
        string tempEncodeBlob = EncodingUtil.urlDecode(tempencode, 'UTF-8');
        system.debug('tempEncodeBlob-->'+tempEncodeBlob);
        Blob tempBlob = EncodingUtil.base64Decode(tempEncodeBlob); 
        system.debug('type:'+tempBlob);

        Blob decryptedData = Crypto.decrypt('AES256', key ,IV,tempBlob);
        string dryptData = decryptedData.toString();
        system.debug('Decrypted Format:-->'+dryptData);              
        
    }
}
/*   System.debug('KeyBlobSize:-'+cryptoKey.size());
System.debug('Blob:-'+EncodingUtil.base64Encode(cryptoKey).length());

Blob newcryptoKey128 = EncodingUtil.base64Decode('xGhMrqIixKvQ4S1bqv8CYw==');
Blob newcryptoKey192 = EncodingUtil.base64Decode('kBsCore1SUxZ8sTxSU5FCGqUGLhJ8IGq');
//     ('c83ab487f80dae7423ab544dcbc62e0480e0f32c45eba98cc86644a63103f53dee8688826aab1034227b10a80c0928da')
Blob newcryptoKey256 = EncodingUtil.base64Decode('Wc0gT/1xfFAjlRwip7l7MmEdjw7DzMXamEHLjyCOQQ0=');

system.debug('Size1:-'+newcryptoKey128.size());
system.debug('Size2:-'+newcryptoKey192.size());
system.debug('Size3:-'+newcryptoKey256.size());

Blob data = Blob.valueOf('00000410981964');
Blob encryptedData = Crypto.encryptWithManagedIV('AES256', newcryptoKey256, data);
String encodedString = EncodingUtil.base64Encode(encryptedData);
system.debug('encodedString :-'+encodedString); */