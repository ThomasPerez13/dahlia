import { Controller } from "@hotwired/stimulus";
import Calendar from "@toast-ui/calendar";


// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["myCalendar", "todayAction", "menAvatar", "womenAvatar"]

  connect() {
    this.calendar = this.displayCalendar()
    this.getCalendarData()
    this.displayDate()
    this.changeTheme()
    this.addAvatar()
  }

  displayCalendar() {
    this.container = this.myCalendarTarget;
    this.options = {
      id: "1",
      name: "My Calendar",
      defaultView: 'day',
      usageStatistics: false,
      useCreationPopup: false,
      useFormPopup: false,
      useDetailPopup: true,
      isReadOnly: true,
      calendars: [
        {
          id: 'cal1',
          backgroundColor: '#ffffff',
          bgColor: "#ffffff",
          borderColor :"#ffffff",
          color: "#000000",
          dragBgColor: "#ffffff"
        }
      ],
      timezone: {
        zones: [
          {
            timezoneName: "Europe/Paris",
            displayLabel: "GMT+02:00",
            tooltip: "Paris",
          }
        ],
      },
      template: {
        popupDetailRepeat: function(schedule) {
          return 'Repeat : ' + schedule.recurrenceRule;
        },
        timegridDisplayPrimaryTime({ time }) {
          return `${time.getHours()}:${time.getMinutes()}0`;
        },
        time(event) {
          const patientLocation = event.location.length > 39 ? `${event.location.substring(0,39)}...` : event.location
          return `<div class='d-flex align-items-center' id='avatar-${event.id}'>
                    <div>
                      <p style="color: black; margin-bottom: 0px;"><strong>${event.title}</strong></p>
                      <p style="color: black; margin-bottom: 0px;"><span style="color: black;">${patientLocation}</span></p>
                      <div class='d-flex'>${event.state}</div>
                    </div>
                  </div>`;
        },
        popupDetailDate({ start, end }) {
          const startMinutes = start.getMinutes() === 0 ? `${start.getMinutes()}0` : start.getMinutes()
          const endMinutes = end.getMinutes() === 0 ? `${end.getMinutes()}0` : end.getMinutes()
          return `🕛 ${start.getHours()}:${startMinutes} à ${end.getHours()}:${endMinutes}`;
        },
        popupDetailAttendees({ attendees = [] }) {
          return `<div class='list-treatments-popup-detail'>${attendees.join('')}</div>`;
        },
        popupDetailState() {
          return `<div class='d-none'></div>`;
        },
        popupDetailBody: function(model) {
          return `<a href="${model.body}">Détail de la consultation</a>`;
        }
      },
      week: {
        daynames: ['Di', 'Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa'],
        hourStart: 5,
        hourEnd: 22,
        taskView: false,
        showNowIndicator: true,
        eventView: ['time'],
        workweek: true
      }
    };

    return new Calendar(this.container, this.options);
  }

  changeTheme() {
    this.calendar.setTheme({
      week: {
        nowIndicatorLabel: {
          color: '#545454',
        },
        nowIndicatorBullet: {
          backgroundColor: '#F28476',
        },
        nowIndicatorToday: {
          border: '1px solid #F28476',
        },
        timeGridHalfHourLine: {
          borderBottom: '1px dotted rgb(229, 229, 229)',
        },
        timeGridLeft: {
          width: '48px',
        },
      },
    });
  }

  getCalendarData() {
    this.url = "/consultations.json"
    fetch(this.url)
    .then(response =>response.json())
    .then(response =>response.forEach(consultation => {
      this.calendar.createEvents([
        {
          id: consultation.id,
          calendarId: 'cal1',
          title: `${consultation.first_name} ${consultation.last_name}`,
          category: 'time',
          location: consultation.address,
          start: consultation.start_date,
          end:  consultation.end_date,
          attendees: consultation.array_treatments,
          state: consultation.string_treatments,
          body:  consultation.url,
          isReadOnly: true
        }
      ])
    }))
  }

  // display today on the clendar
  today() {
    this.calendar.today();
    this.displayDate();
    this.addAvatar()
  };

  // display the next or the previous day on the clendar
  previous() {
    this.calendar.prev();
    this.displayDate();
    this.addAvatar()
  };

  next() {
    this.calendar.next();
    this.displayDate();
    this.addAvatar()
  };

  hideTodayAction() {
    this.todayActionTarget.classList.add("d-none")
  }

  showTodayAction() {
    this.todayActionTarget.classList.remove("d-none")
  }

  // display the date on the calendar header

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

  // get the avatar to display in the event element

  getAvatar(target) {
    this.img = document.createElement("img");
    this.img.src = `${target.getAttribute ('src')}`;
    this.img.setAttribute("style", "height:72px; padding-right: 12px; padding-left: 12px;");
    return this.img
  }

  addAvatar() {
    this.url = "/consultations.json"
    fetch(this.url)
    .then(response =>response.json())
    .then(response =>response.forEach(consultation => {
      this.avatarSection = document.getElementById(`avatar-${consultation.id}`)
      if(this.avatarSection !== null && consultation.gender === "Homme") {
        this.avatarSection.prepend(this.getAvatar(this.menAvatarTarget))
      } else if(this.avatarSection !== null && consultation.gender === "Femme") {
        this.avatarSection.prepend(this.getAvatar(this.womenAvatarTarget))
      }
    }))
  }
};
