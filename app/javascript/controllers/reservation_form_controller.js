import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["memberSelection", "nameField"]

  connect() {
    console.log("ReservationFormController connected!")
    this.loadMembersData()
    this.toggleMemberSelection()
    this.updateNameField()
    this.updateReservationFields()
  }

  async loadMembersData() {
    try {
      const response = await fetch('/api/members')
      this.membersData = await response.json()
      console.log("Members data loaded:", this.membersData)
    } catch (error) {
      console.error("Failed to load members data:", error)
      this.membersData = []
    }
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
    
    // Also update other fields when name changes
    this.updateReservationFields()
  }

  updateReservationFields() {
    console.log("updateReservationFields called")
    const myselfRadio = this.element.querySelector('input[value="myself"]')
    const otherMemberRadio = this.element.querySelector('input[value="other_member"]')
    const guestRadio = this.element.querySelector('input[value="guest"]')
    const memberSelect = this.element.querySelector('select[name*="other_member_id"]')
    
    let userData = null
    
    if (myselfRadio && myselfRadio.checked) {
      // Get current user data from hidden field attributes
      const userIdField = this.element.querySelector('input[name*="user_id"]')
      if (userIdField) {
        userData = {
          sex: userIdField.getAttribute('data-user-sex'),
          membership_type: userIdField.getAttribute('data-user-membership-type')
        }
      }
    } else if (otherMemberRadio && otherMemberRadio.checked && memberSelect && memberSelect.value) {
      // Find selected member data
      if (this.membersData) {
        userData = this.membersData.find(member => member.id.toString() === memberSelect.value)
      }
    } else if (guestRadio && guestRadio.checked) {
      // For guests, set membership type to "Guest", don't change sex
      userData = {
        membership_type: "Guest"
      }
    }
    
    // Update sex field if we have data
    if (userData && userData.sex) {
      const sexRadio = this.element.querySelector(`input[name*="sex"][value="${userData.sex}"]`)
      if (sexRadio) {
        sexRadio.checked = true
      }
    }
    
    // Update membership type field if we have data
    if (userData && userData.membership_type) {
      const memberTypeRadio = this.element.querySelector(`input[name*="res_member_type"][value="${userData.membership_type}"]`)
      if (memberTypeRadio) {
        memberTypeRadio.checked = true
      }
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