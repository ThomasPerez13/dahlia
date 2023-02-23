import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-confirmation-to-destroy"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    console.log("well connected to modal controller");
  }

  displayModal(event) {
    event.preventDefault()
    this.modalTarget.classList.toggle("d-none")
  }
}
