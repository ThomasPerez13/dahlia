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
    // this.displayCalendarWeek()
    this.getCalendardata()
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
      id: "1",
      name: "My Calendar",
      defaultView: 'day',
      taskView: false,
      scheduleView: ['time'],
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
          // allday: function(schedule) {
          //     return schedule.title + ' <i class="fa fa-refresh"></i>';
          // },
          alldayTitle: function() {
              return 'All Day';
          },
          // time: function(schedule) {
          //     return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
          // }
      },
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

  getCalendardata(){
    this.schedules = JSON.parse(document.querySelector("#calendar").dataset.schedules);
    console.log(this.schedules);
    window.schedules = this.schedules;
    console.log(window.schedules);
    this.calendar = this.displayCalendarWeek();
    this.schedules.forEach(schedule => {
      console.log(schedule.id);
      console.log(schedule.patient_id);
      console.log(schedule.duration_in_min);
      console.log(typeof(schedule.start_date));
      console.log(schedule.dueDateClass);
    this.calendar.createSchedules([
    {
      id: schedule.id,
      calendarId: '1',
      title: schedule.patient_id,
      category: 'time',
      // dueDateClass: schedule.dueDateClass,
      // location: schedule.location,
      start: schedule.start_date,
      end:  new Date(new Date(schedule.start_date).setMinutes(new Date (schedule.start_date).getMinutes() + 30))
      // new Date(nowTest.setMinutes(nowTest.getMinutes() + 30))
    }
    ])
    });
  }

//   "id": 252,
// "start_date": "2022-10-24T09:00:00.000+02:00",
// "duration_in_min": 30,
// "patient_id": 62,
// "user_id": 13,
// "created_at": "2022-10-24T19:06:00.168+02:00",
// "updated_at": "2022-10-24T19:06:00.168+02:00"

  today() {
    console.log("today action");
    this.calendar = this.displayCalendarWeek();
    this.calendar.today();
    this.#removeCalendar();
  };

  previous() {
    console.log("previous action");
    this.calendar = this.displayCalendarWeek();
    this.dayToMove = this.#getTheDate();
    this.calendar.move(this.dayToMove - 1);
    this.#removeCalendar();
  };

  next() {
    console.log("next action");
    this.calendar = this.displayCalendarWeek();
    this.dayToMove = this.#getTheDate();
    this.calendar.move(this.dayToMove + 1);
    this.#removeCalendar();
  }

  #getTheDate() {
    this.displayedDates = document.getElementsByClassName("tui-full-calendar-dayname-date");
    this.displayDate = this.displayedDates[this.displayedDates.length - 1].innerText;
    this.getToday = new Date().getUTCDate();
    return this.displayDate - this.getToday;
  }

  #removeCalendar() {
    this.calendarLayoutElement = document.getElementsByClassName('tui-full-calendar-layout');
    this.calendarPreviousDate = this.calendarLayoutElement[0];
    // this.calendarPreviousDate.classList.add("d-none");
    this.calendarPreviousDate.parentNode.removeChild(this.calendarPreviousDate);
  }
};
