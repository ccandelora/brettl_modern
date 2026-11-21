import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["otherActivity"]

  connect() {
    this.toggleOther()
  }

  toggleOther() {
    const otherSelected = this.element.querySelector('input[name="contact[activities][]"][value="Other"]')?.checked
    this.otherActivityTarget.classList.toggle("hidden", !otherSelected)
  }
}
