import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "button"]
  // connect() {
  //   console.log("Hello")
  // }

  displayForm() {
    this.formTarget.classList.toggle("d-none");
  }

}
