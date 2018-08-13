//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .

var compareDates = function compareDates(date1, date2) {
  return date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth() && date1.getDate() == date2.getDate();
};

var compareArray = function compareArray(events, date) {
  var check = false;
  events.forEach(function (event) {
    if (compareDates(event, date)) {
      check = true;
    }
  });
  return check;
};

var setCalendar = function setCalendar(events) {
  $('#calendar').datepicker({
    onRenderCell: function onRenderCell(date, cellType) {
      if (cellType == 'day') {
        var isEnabled = compareArray(events, date);

        return {
          disabled: !isEnabled
        };
      }
    }
  });
};

var gotoEvent = function gotoEvent(event) {
  var selectedDate = $('#calendar').data('datepicker').selectedDates[0];
  if (selectedDate) {
    window.location.href = window.location.href + ('/events/' + eventHash[selectedDate] + '/bookings/new');
  } else {
    document.getElementById('text-span').innerHTML = 'Please select a valid date.';
  }
};
