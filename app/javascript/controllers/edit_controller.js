import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "button", "formNurse"]
  // connect() {
  //   console.log("Hello")
  // }

  displayForm() {
    this.formTarget.classList.toggle("d-none");
  }
  displayFormNurse() {
    this.formNurseTarget.classList.toggle("d-none");
  }

}
