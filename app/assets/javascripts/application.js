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
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require html.sortable
//= require cocoon
//= require gritter
//= require cable
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$('document').ready(function () {
  const textField = document.querySelector('textarea#comment_content');
  let counter = textField.parentElement.getElementsByClassName('counter')[0].innerText;
  textField.addEventListener('keyup', function () {
    const count = this.value.length;
    newCounter = counter - count;
    this.parentElement.querySelector('.counter').innerText = newCounter;
    if (newCounter < 0) {
      this.parentElement.querySelector('.counter').style.color = 'red';
    } else if (newCounter > 0) {
      this.parentElement.querySelector('.counter').style.color = 'black';
    }
  });
});
