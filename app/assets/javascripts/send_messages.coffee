#Place all the behaviors and hooks related to the matching controller here.
#All this logic will automatically be available in application.js.
#You can use CoffeeScript in this file: http://coffeescript.org/

@ajaxSmsListener = -> 
    $(document).ready -> 
        $("#sms-form").on("ajax:success", (event) ->
         event.preventDefault()
         serverResponse.style.color = 'green'
         $("#serverResponse").html("Successfully sent SMS!") 
        ).on "ajax:error", (event) ->
            $("#serverResponse").html("There was an error with your request") 
            event.preventDefault()
            serverResponse.style.color = 'red'