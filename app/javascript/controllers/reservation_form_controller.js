import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["memberSelection", "nameField"]

  connect() {
    console.log("ReservationFormController connected!")
    this.toggleMemberSelection()
    this.updateNameField()
  }

  toggleMemberSelection() {
    console.log("toggleMemberSelection called")
    const myselfRadio = this.element.querySelector('input[value="myself"]')
    const otherMemberRadio = this.element.querySelector('input[value="other_member"]')
    const guestRadio = this.element.querySelector('input[value="guest"]')
    
    if (otherMemberRadio && otherMemberRadio.checked) {
      // "For Another Member" selected - show member selection
      this.showElement(this.memberSelectionTarget)
    } else {
      // "For Myself" or "For a Guest" selected - hide member selection
      this.hideElement(this.memberSelectionTarget)
    }
  }

  updateNameField() {
    console.log("updateNameField called")
    const myselfRadio = this.element.querySelector('input[value="myself"]')
    const otherMemberRadio = this.element.querySelector('input[value="other_member"]')
    const guestRadio = this.element.querySelector('input[value="guest"]')
    const memberSelect = this.element.querySelector('select[name*="other_member_id"]')
    
    if (myselfRadio && myselfRadio.checked) {
      // "For Myself" selected - fill with current user's name
      const currentUserName = this.element.querySelector('input[name*="user_id"]').getAttribute('data-user-name')
      if (currentUserName) {
        this.nameFieldTarget.value = currentUserName
      }
    } else if (otherMemberRadio && otherMemberRadio.checked && memberSelect) {
      // "For Another Member" selected - fill with selected member's name
      const selectedOption = memberSelect.options[memberSelect.selectedIndex]
      if (selectedOption && selectedOption.value) {
        this.nameFieldTarget.value = selectedOption.text
      } else {
        this.nameFieldTarget.value = ""
      }
    } else if (guestRadio && guestRadio.checked) {
      // "For a Guest" selected - clear the name field
      this.nameFieldTarget.value = ""
    }
  }

  showElement(element) {
    if (element) {
      element.style.display = "block"
    }
  }

  hideElement(element) {
    if (element) {
      element.style.display = "none"
    }
  }
} 