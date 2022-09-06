import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star"
export default class extends Controller {

  static targets = ["starIcon"]

  connect() {
    console.log("coucou")
    console.log(this.starIconTarget)
  }

  changeStarClass() {
    this.starIconTarget.classList.toggle("fa-regular")
    this.starIconTarget.classList.toggle("fa-solid")
  }
}
