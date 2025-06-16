import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quote" ]

  connect() {
    this.currentIndex = 0
    this.showQuote(this.currentIndex)
    this.startRotation()
  }

  disconnect() {
    this.stopRotation()
  }

  startRotation() {
    this.rotationInterval = setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.quoteTargets.length
      this.showQuote(this.currentIndex)
    }, 60000) // 60 seconds
  }

  stopRotation() {
    if (this.rotationInterval) {
      clearInterval(this.rotationInterval)
    }
  }

  showQuote(index) {
    this.quoteTargets.forEach((element, i) => {
      element.classList.toggle("hidden", i !== index)
    })
  }
} 