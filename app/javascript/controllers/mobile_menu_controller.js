import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon"]

  connect() {
    this.open = false
  }

  toggle() {
    this.open = !this.open
    this.menuTarget.classList.toggle("hidden", !this.open)
    this.openIconTarget.classList.toggle("hidden", this.open)
    this.closeIconTarget.classList.toggle("hidden", !this.open)
  }
} 