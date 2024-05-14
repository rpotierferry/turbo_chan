import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-form"
export default class extends Controller {

  static targets = ["form"]
  toggleForm(event) {
    event.preventDefault();
    this.formTarget.classList.toggle('hidden');
  }
}
