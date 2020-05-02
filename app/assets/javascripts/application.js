// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle
//= require best_in_place
//= require_tree .

$(function(){
  var addTaskButton = document.getElementById("add-task-toggle");
  var taskForm = document.getElementById("task-form");
  
  var displayForm = function () {
  
    if (taskForm.classList.contains("display")) {
      taskForm.classList.remove("display");
    } else {
      taskForm.classList.add("display");
    }
  };
  
  addTaskButton.addEventListener("click", displayForm);  
});

$(document).ready(function() {
  jQuery(".best_in_place").best_in_place();
});