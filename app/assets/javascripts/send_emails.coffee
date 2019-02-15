# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



@ajaxEmailListener = -> 
    $(document).ready -> 
        $("#email-form").on("ajax:success", (event) -> 
         sendgridResponse.style.color = 'green'
         $("#sendgridResponse").html("Successfully sent email!") 
        ).on "ajax:error", (event) ->
         sendgridResponse.style.color = 'red'
         $("#sendgridResponse").html("There was an error with your request") 