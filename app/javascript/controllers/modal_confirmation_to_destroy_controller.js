import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-confirmation-to-destroy"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    console.log("ready to destroy something ?");
  }

  displayModal(event) {
    event.preventDefault()
    this.modalTarget.classList.toggle("d-none")
    console.log("Do you really want to destroy it ?");
  }
}
