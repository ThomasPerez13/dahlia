import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["formDate", "button", "formNurse"]
  connect() {
    console.log("Hello")
  }

  displayFormDate() {
    this.formDateTarget.classList.toggle("d-none");
  }

  displayFormNurse() {
    this.formNurseTarget.classList.toggle("d-none");
  }

}
