import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users-filter"
export default class extends Controller {
  filter() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 200);
  }
}
