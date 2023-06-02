import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-show"
export default class extends Controller {

  static targets = [ "button", "map" ]

  connect() {
  }

  toggle() {
    // this.mapTarget.style.display = "block";
    this.buttonTarget.classList.toggle("turn")
    this.mapTarget.classList.toggle("block")
  }
}
