// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
handleSendgridResponse = () => {
    const form = document.getElementById('email-form');

    document.getElementById('submit-button').addEventListener("submit", (e) => {        
        console.log(e.detail)
        fetch('http://localhost:3000/send_emails/new').then(res => {
                console.log(res.json())
            }).then((message) => {
                console.log("Success!")
                const successMessage = document.createElement("p");
                successMessage.innerHTML = `Successfully sent email: ${message}`;
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
