//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .

const compareDates = (date1, date2) => {
    return (date1.getFullYear() === date2.getFullYear()) &&
           (date1.getMonth() === date2.getMonth()) &&
           (date1.getDate() == date2.getDate());
}

const compareArray = (events, date) => {
  let check = false;
  events.forEach((event) => {
    if (compareDates(event, date)) {
      check = true;
    }
  })
  return check;
}

const setCalendar = (events) => {
  console.log(events)
  $('#calendar').datepicker({
    onRenderCell: function(date, cellType) {
      if (cellType == 'day') {
        let isEnabled = compareArray(events, date)

        return {
          disabled: !isEnabled
        }
      }
    }
  });
}

const gotoEvent = (event) => {
  $('#calendar').data('datepicker').selectedDates
}


$("#book-button").addEventListener("click", gotoEvent)
