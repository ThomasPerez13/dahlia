import { Controller } from "@hotwired/stimulus";
import Calendar from "tui-calendar";
// import 'tui-time-picker/dist/tui-time-picker.css';
// import "tui-calendar/dist/tui-calendar.css";
// needed if we want to modify consultation with the popup
// import Rails from "@rails/ujs";


// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["myCalendar", "todayAction"]

  connect() {
    // console.log("welcom to our calendar controller");
    this.calendar = this.displayCalendar()
    this.getCalendarData()
    // this.updatedCalendarSchedule()
    this.displayDate()
  }

  displayCalendar() {
    // this.container = this.myCalendarTarget;
    this.container = document.getElementById('calendar');

    this.options = {
      id: "1",
      name: "My Calendar",
      defaultView: 'day',
      taskView: false,
      scheduleView: ['time'],
      useCreationPopup: false,
      useFormPopup: false,
      useDetailPopup: true,
      isReadOnly: true,
      template: {

        popupDetailRepeat: function(schedule) {
          return 'Repeat : ' + schedule.recurrenceRule;
        },

        // popupStateFree: function() {
        //   return 'Free';
        // },
        popupDetailBody: function(model) {
          return `<a href="${model.body}">Détail de la consultation</a>`;
        }
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
          backgroundColor: '#ffffff',
          bgColor: "#ffffff",
          borderColor :"#000000",
          color: "#000000",
          dragBgColor: "#ffffff"
        }
      ],
      week: {
        daynames: ['Di', 'Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa'],
        hourStart: 7,
        hourEnd: 19,
        showNowIndicator: false,
        workweek: true
        // narrowWeekend: true
      }
    };

    return new Calendar(this.container, this.options);
  }

  getCalendarData() {
    // console.log("Couuuuuucoooooou");
    this.url = "/consultations.json"
    // this.avatar = `try to display avatar in consultation`
    fetch(this.url)
    .then(response =>response.json())
    .then(response =>response.forEach(consultation => {
      this.calendar.createSchedules([
        {
          id: consultation.id,
          calendarId: 'cal1',
          title: `${consultation.start_time} - ${consultation.end_time} ${consultation.first_name} ${consultation.last_name}`,
          category: 'time',
          location: consultation.address,
          start: consultation.start_date,
          end:  consultation.end_date,
          body:  consultation.url
        }
      ])
    }))
  }

  // display today on the clendar
  today() {
    // console.log("today action");
    this.calendar.today();
    this.displayDate();
  };

  // display the next or the previous day on the clendar
  previous() {
    // console.log("previous action");
    this.calendar.prev();
    this.displayDate();
  };

  next() {
    // console.log("next action");
    this.calendar.next();
    this.displayDate();
  };

  hideTodayAction() {
    this.todayActionTarget.classList.add("d-none")
  }

  showTodayAction() {
    this.todayActionTarget.classList.remove("d-none")
  }

  catchDay() {
    this.date = this.calendar.getDate().getDay();
    this.dayDisplay = document.getElementById('calendar-day');
    this.dayDisplay.innerText = this.day()[this.date]
  }
  catchDate() {
    this.date = this.calendar.getDate().getDate();
    this.dateDisplay = document.getElementById('calendar-date');
    this.dateDisplay.innerText = this.date
  }
  catchMonth() {
    this.date = this.calendar.getDate().getMonth();
    this.monthDisplay = document.getElementById('calendar-month');
    this.monthDisplay.innerText = this.month()[this.date]
  }

  month() {
    return  [ "Janvier", "Février", "Mars", "Avril", "Mai", "Juin",
  "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" ]
  }

  day() {
    return  [ "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi",
  "Samedi" ]
  }

  displayDate() {
    this.catchDay();
    this.catchDate();
    this.catchMonth();
    this.showTodayAction();
    this.compareDate()
  }

  compareDate() {
    this.todayDate = new Date()
    this.calendarDate = this.calendar.getDate()
    if (this.todayDate.getDate() === this.calendarDate.getDate() && this.todayDate.getMonth() === this.calendarDate.getMonth()) {
      this.hideTodayAction()
    }
  }

  // getConsultationId(){
  //   let calendar = this.calendar;
  //   console.log(calendar);
  //   calendar.on('clickSchedule', function(event) {
  //     // this.consultation = event.schedule;
  //     // console.log(event.schedule.id);
  //   });
  // }

  // updatedCalendarSchedule(){
  //   let calendar = this.calendar;
  //   calendar.on('beforeUpdateSchedule', function(event) {
  //     console.log("coucou le chat");
  //     console.log(event.schedule);
  //     let schedule = event.schedule;
  //     let changes = event.changes;
  //     let formUpdate = new FormData()
  //     if (changes.end) {
  //     formUpdate.append("end", changes.end._date)
  //     }
  //     if (changes.start) {
  //     formUpdate.append("start", changes.start._date)
  //     }
  //     if (changes.title) {
  //     formUpdate.append("title", changes.title)
  //     }
  //     if (changes.category) {
  //     formUpdate.append("category", changes.category)
  //     }
  //     calendar.updateSchedule(schedule.id, schedule.calendarId, changes);

  //     Rails.ajax({
  //     type: "PATCH",
  //     url: '/schedules/'+ schedule.id,
  //     data: formUpdate
  //     })

  //   });
  // }
};


// theme: {
//   week: {
//     dayName: {
//       borderLeft: 'none',
//       borderTop: '1px dotted red',
//       borderBottom: '1px dotted red',
//       backgroundColor: 'rgba(81, 92, 230, 0.05)',
//     },
//     dayGrid: {
//       backgroundColor: 'rgba(81, 92, 230, 0.05)',
//     },
//     dayGridLeft: {
//       borderRight: 'none',
//       backgroundColor: 'rgba(81, 92, 230, 0.05)',
//       width: '144px',
//     },
//     timeGridLeft: {
//       borderRight: 'none',
//       backgroundColor: 'rgba(81, 92, 230, 0.05)',
//       width: '144px',
//     },
//     timeGridLeftAdditionalTimezone: {
//       backgroundColor: '#e5e5e5',
//     },
//     timeGridHalfHourLine: {
//       borderBottom: '1px dotted #e5e5e5',
//     },
//     nowIndicatorPast: {
//       border: '1px dashed red',
//     },
//     futureTime: {
//       color: 'red',
//     },
//   },
// },
