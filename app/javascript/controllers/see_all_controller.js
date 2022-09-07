import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="see-all"
export default class extends Controller {
  static targets = ["content", "button"]

  revealContent() {
    this.contentTarget.classList.toggle("d-none")

    if(this.buttonTarget.innerHTML === "+") {
      this.buttonTarget.innerHTML = "-"
    } else {
      this.buttonTarget.innerHTML = "+"
    }
  }

}
