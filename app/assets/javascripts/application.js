// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(e){
  
  $(document.body).delegate("div.add-task form#new_task input[type=submit]", "click", function(e) { 
    var form = $(this).parents('form:first');
    $.ajax({
      type: form.attr("method"),
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response) {  
        $('div.tasks-not-completed').html(response);
      }
    });
    e.preventDefault();
    return false;
  });  
  
  $(document.body).delegate("p.item-task input", "change", function() { 
    var listId = $(this).attr("data-list-id");
    var taskId = $(this).attr("data-task-id");
    
    $.ajax({
         type: "put",
         url: "/lists/" + listId + "/tasks/" + taskId + "/update_status",
         data: {authenticity_token: window._authenticity_token},
         success: function(response) {  
           if(response == "successful") {
             $.ajax({
                  type: "get",
                  url: " /lists/"+ listId +"/tasks_is_completed",
                  success: function(response23) {  
                    $('div.tasks-is-completed').html(response23);
                  }
              });
            $.ajax({
                 type: "get",
                 url: " /lists/"+ listId +"/tasks_not_completed",
                 success: function(response2) {  
                   $('div.tasks-not-completed').html(response2);
                 }
             });
               
        }
      }
    });
    
  });
});