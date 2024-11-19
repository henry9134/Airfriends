import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keyup"
export default class extends Controller {
  connect() {
    console.log("hi")
  }

  keyup(event) {

  }
}
