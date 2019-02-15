# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@ajaxEmailListener = -> 
    $(document).ready -> 
        $("#email-form").on("ajax:success", (event) -> 
        [data, status, xhr] = event.detail
        $("#serverResponse").html("Successfully sent email!") 
        serverResponse.style.color = 'green'
        ).on "ajax:error", (event) ->
        $("#serverResponse").html("There was an error with your request") 
        serverResponse.style.color = 'red'