//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .

const setCalendar = (events) => {
  console.log(events);
  $('#calendar').datepicker();
}
