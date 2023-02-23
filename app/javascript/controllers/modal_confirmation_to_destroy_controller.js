import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-confirmation-to-destroy"
export default class extends Controller {
  static targets = ["modal", "modalDestroyGroup"]

  connect() {

  }

  displayModal(event) {
    event.preventDefault()
    this.modalTarget.classList.toggle("d-none")
  }

  displayModalToDestroyGroup(event) {
    event.preventDefault()
    console.log(this.modalTarget.classList.contains("d-none"));
    if (!this.modalTarget.classList.contains("d-none")) {
      this.modalTarget.classList.toggle("d-none")
    }
    this.modalDestroyGroupTarget.classList.toggle("d-none")
  }
}
