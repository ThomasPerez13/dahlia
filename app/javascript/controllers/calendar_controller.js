import { Controller } from "@hotwired/stimulus";
import Calendar from "tui-calendar";
import 'tui-time-picker/dist/tui-time-picker.css';
import "tui-calendar/dist/tui-calendar.css";
// import Rails from "@rails/ujs";


// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["myCalendar"]

  connect() {
    console.log("welcom to our calendar controller");
    console.log(this.myCalendarTarget);
    this.displayCalendarWeek()
  }

  displayCalendarMonth() {
    this.calendar = new Calendar(document.getElementById('calendar'), {
      id: "1",
      name: "My Calendar",
      defaultView: 'month',
      color: '#00a9ff',
        bgColor: '#00a9ff',
        dragBgColor: '#00a9ff',
        borderColor: 'red',

      milestone: true,    // Can be also ['milestone', 'task']
      scheduleView: ['time'],  // Can be also ['allday', 'time']
      useCreationPopup: true,
      useDetailPopup: true,
      template: {

        popupDetailRepeat: function(schedule) {
          return 'Repeat : ' + schedule.recurrenceRule;
        },

        popupStateFree: function() {
          return 'Free';
        },
          milestone: function(schedule) {
              return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
          },
          milestoneTitle: function() {
              return 'Milestone';
          },
          task: function(schedule) {
              return '&nbsp;&nbsp;#' + schedule.title;
          },
          taskTitle: function() {
              return '<label><input type="checkbox" />Task</label>';
          },
          allday: function(schedule) {
              return schedule.title + ' <i class="fa fa-refresh"></i>';
          },
          alldayTitle: function() {
              return 'All Day';
          },
          time: function(schedule) {
              return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
          }
      },
      month: {
          daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          startDayOfWeek: 0,
          narrowWeekend: true,      },
      week: {
          daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          startDayOfWeek: 0,
          narrowWeekend: true
      }
    });
  }

  displayCalendarWeek() {
    this.container = document.getElementById('calendar');
    this.options = {
      defaultView: 'day',
      // milestone: false,
      taskView: false,
      scheduleView: ['time'],
      useCreationPopup: true,
      useDetailPopup: true,
      timezone: {
        zones: [
          {
            timezoneName: "Europe/Paris",
            displayLabel: "GMT+02:00",
            tooltip: "Paris",
          }
        ],
      },
      calendars: [
        {
          id: 'cal1',
          name: 'Personal',
          backgroundColor: '#03bd9e',
        }
      ],
      week: {
        daynames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
        hourStart: 7,
        hourEnd: 19,
        showNowIndicator: false
      }
    };

    return new Calendar(this.container, this.options);
    // console.log(document.getElementsByClassName("tui-view-15"));
    // // console.log(document.getElementsByClassName("tui-view-10").classList);
    // // console.log(document.getElementsByClassName("tui-view-12").classList);
    // document.getElementsByClassName("tui-view-15").style.display="none !important";
    // // document.getElementsByClassName("tui-view-10").classList.add("d-none");
    // // document.getElementsByClassName("tui-view-12").classList.add("d-none");
  }

  today() {
    console.log("today action");
    this.calendar = this.displayCalendarWeek()
    this.calendar.today();
  };

  previous() {
    console.log("previous action");
    this.calendar = this.displayCalendarWeek()
    this.calendar.move(-1);
  };

  next() {
    console.log("next action");
    this.calendar = this.displayCalendarWeek()
    this.calendar.move(1);
  }
};
