import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-confirmation-to-destroy"
export default class extends Controller {
  connect() {
    console.log("ready to destroy something ?");
  }

  displayModal(event) {
    event.preventDefault()
    console.log("Do you really want to destroy it ?");
  }
}
