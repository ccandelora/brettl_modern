import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  
  // Global registry to track all dropdown instances
  static dropdownInstances = new Set()

  connect() {
    this.close = this.close.bind(this)
    // Register this dropdown instance
    this.constructor.dropdownInstances.add(this)
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()
    
    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    // Close all other dropdowns before opening this one
    this.closeAllOthers()
    
    this.menuTarget.classList.remove("hidden")
    document.addEventListener("click", this.close)
  }

  close() {
    this.menuTarget.classList.add("hidden")
    document.removeEventListener("click", this.close)
  }

  closeAllOthers() {
    // Close all other dropdown instances except this one
    this.constructor.dropdownInstances.forEach(instance => {
      if (instance !== this && !instance.menuTarget.classList.contains("hidden")) {
        instance.close()
      }
    })
  }

  disconnect() {
    document.removeEventListener("click", this.close)
    // Unregister this dropdown instance
    this.constructor.dropdownInstances.delete(this)
  }
} 