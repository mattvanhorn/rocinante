import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    timeZone: 'UTC',
    plugins: [ dayGridPlugin ],
    header: {
      left:   'title',
      center: '',
      right:  'today prev,next'
    },
    views: {
      dayGridMonth: { // name of view
        titleFormat: { year: 'numeric', month: 'long' }
        // other view-specific options here
      }
    },
    contentHeight: "auto",
    events: "/events/calendar"
  });

  calendar.render();
});
