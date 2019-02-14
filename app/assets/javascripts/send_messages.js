//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/


handleNexmoResponse = () => {
    const form = document.getElementById('sms-form');
    console.log(form)
    document.getElementById('submit-sms').addEventListener("click", (e) => {    
        e.preventDefault();    
        console.log(e);
        fetch('http://localhost:3000/send_messages/new').then(res => {
                return res.json();
            }).then((message) => {
                console.log("Success!")
                const successMessage = document.createElement("p");
                successMessage.innerHTML = `Successfully sent sms: ${message}`;
                successMessage.id = "notice";
                form.appendChild(successMessage);
                form.reset(); 
                
            }).catch( (error) => {
            
                const errorMessage = document.createElement("p");
                errorMessage.innerHTML = `Error message: ${error}`;
                errorMessage.id = "error_explanation";
                form.appendChild(errorMessage);
        });
     });
}