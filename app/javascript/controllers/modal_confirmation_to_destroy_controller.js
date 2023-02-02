import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-confirmation-to-destroy"
export default class extends Controller {
  connect() {
    console.log("ready to destroy something ?");
  }
}
