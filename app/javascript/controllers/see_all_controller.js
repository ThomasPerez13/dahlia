import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["allconsultations", "button", "first3consultations"]

  revealContent() {
    this.allconsultationsTarget.classList.toggle("d-none")
    this.first3consultationsTarget.classList.toggle("d-none")


    if(this.buttonTarget.innerHTML === "Afficher plus") {
      this.buttonTarget.innerHTML = "Afficher moins"
    } else {
      this.buttonTarget.innerHTML = "Afficher plus"
    }
  }

}
