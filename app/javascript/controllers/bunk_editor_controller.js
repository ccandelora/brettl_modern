import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "dropZone", "assignedPerson", "assignmentSelect", "unassignedArea"]

  connect() {
    console.log('🚀🚀🚀 NEW BUNK EDITOR CONTROLLER LOADED! 🚀🚀🚀')
    console.log('Bunk Editor Controller connected')
    this.setupDragAndDrop()
    this.setupDropdownSync()
  }

  disconnect() {
    // Clean up any event listeners if needed
  }

  setupDragAndDrop() {
    console.log('Setting up new drag and drop system...')
    
    // Use event delegation for all drag events
    this.element.addEventListener('dragstart', this.handleDragStart.bind(this), true)
    this.element.addEventListener('dragend', this.handleDragEnd.bind(this), true)
    this.element.addEventListener('dragover', this.handleDragOver.bind(this), true)
    this.element.addEventListener('dragenter', this.handleDragEnter.bind(this), true)
    this.element.addEventListener('dragleave', this.handleDragLeave.bind(this), true)
    this.element.addEventListener('drop', this.handleDrop.bind(this), true)
    
    // Set draggable attribute on all draggable elements
    this.makeAllDraggable()
    
    console.log('✓ New drag and drop system initialized')
  }

  setupDropdownSync() {
    // Sync dropdown changes with the visual display
    this.assignmentSelectTargets.forEach(select => {
      select.addEventListener('change', this.handleSelectChange.bind(this))
    })
  }

  makeAllDraggable() {
    // Find all elements that should be draggable
    const draggableElements = this.element.querySelectorAll('.draggable-person')
    console.log(`Making ${draggableElements.length} elements draggable`)
    
    draggableElements.forEach(element => {
      element.setAttribute('draggable', 'true')
    })
  }

  handleDragStart(event) {
    const draggableElement = event.target.closest('.draggable-person')
    if (!draggableElement) return
    
    console.log('🚀 Drag start:', draggableElement.dataset.reservationName)
    console.log('📊 Drag data:', {
      id: draggableElement.dataset.reservationId,
      name: draggableElement.dataset.reservationName,
      gender: draggableElement.dataset.reservationGender,
      assignableType: draggableElement.dataset.assignableType,
      assignableId: draggableElement.dataset.assignableId
    })
    
    // Store drag data
    this.dragData = {
      reservationId: draggableElement.dataset.reservationId,
      reservationName: draggableElement.dataset.reservationName,
      reservationGender: draggableElement.dataset.reservationGender,
      assignableType: draggableElement.dataset.assignableType,
      assignableId: draggableElement.dataset.assignableId,
      sourceElement: draggableElement
    }
    
    // Set drag effect
    event.dataTransfer.effectAllowed = 'move'
    event.dataTransfer.setData('text/plain', JSON.stringify(this.dragData))
    
    // Add visual feedback
    draggableElement.classList.add('opacity-50')
  }

  handleDragEnd(event) {
    const draggableElement = event.target.closest('.draggable-person')
    if (!draggableElement) return
    
    console.log('🏁 Drag end:', draggableElement.dataset.reservationName)
    
    // Remove visual feedback
    draggableElement.classList.remove('opacity-50')
    
    // Clear drag data
    this.dragData = null
  }

  handleDragOver(event) {
    event.preventDefault()
    event.dataTransfer.dropEffect = 'move'
  }

  handleDragEnter(event) {
    const dropZone = event.target.closest('[data-bunk-editor-target="dropZone"]')
    const unassignedArea = event.target.closest('[data-bunk-editor-target="unassignedArea"]')
    
    if (!this.dragData) return
    
    // If dragging to unassigned area, always allow
    if (unassignedArea) {
      console.log('🔄 Dragging to unassigned area - always allowed')
      unassignedArea.classList.add('border-green-400', 'bg-green-50')
      return
    }
    
    // If dragging to a bunk drop zone
    if (dropZone) {
      console.log('🔥🔥🔥 NEW DRAG ENTER LOGIC EXECUTED! 🔥🔥🔥')
      
      // Check if this bunk is already assigned
      const assignedPerson = dropZone.querySelector('[data-bunk-editor-target="assignedPerson"] .draggable-person')
      if (assignedPerson) {
        // Bunk is already assigned - don't show drop feedback
        console.log('🚫 Bunk already assigned, no drop allowed')
        return
      }
      
      const dropZoneGender = dropZone.dataset.gender
      const dragGender = this.dragData.reservationGender
      
      console.log(`Drag enter: ${dragGender} -> ${dropZoneGender}`)
      
      if (this.isGenderCompatible(dropZoneGender, dragGender)) {
        dropZone.classList.add('border-green-400', 'bg-green-50')
        dropZone.classList.remove('border-red-400', 'bg-red-50')
      } else {
        dropZone.classList.add('border-red-400', 'bg-red-50')
        dropZone.classList.remove('border-green-400', 'bg-green-50')
      }
    }
  }

  handleDragLeave(event) {
    const dropZone = event.target.closest('[data-bunk-editor-target="dropZone"]')
    const unassignedArea = event.target.closest('[data-bunk-editor-target="unassignedArea"]')
    
    // Only remove classes if we're actually leaving the drop zone
    if (dropZone && !dropZone.contains(event.relatedTarget)) {
      dropZone.classList.remove('border-green-400', 'bg-green-50', 'border-red-400', 'bg-red-50')
    }
    
    // Only remove classes if we're actually leaving the unassigned area
    if (unassignedArea && !unassignedArea.contains(event.relatedTarget)) {
      unassignedArea.classList.remove('border-green-400', 'bg-green-50')
    }
  }

  handleDrop(event) {
    event.preventDefault()
    
    const dropZone = event.target.closest('[data-bunk-editor-target="dropZone"]')
    const unassignedArea = event.target.closest('[data-bunk-editor-target="unassignedArea"]')
    
    if (!this.dragData) {
      console.log('❌ Invalid drop: no drag data')
      return
    }
    
    // If dropping to unassigned area, unassign the person
    if (unassignedArea) {
      console.log('🔄 Dropping to unassigned area - unassigning person')
      unassignedArea.classList.remove('border-green-400', 'bg-green-50')
      
      // Move the person to unassigned area
      this.moveToUnassigned(this.dragData)
      
      // Clear the dropdown of the bunk they came from
      const sourceDropZone = this.dragData.sourceElement.closest('[data-bunk-editor-target="dropZone"]')
      if (sourceDropZone) {
        const bunkId = sourceDropZone.dataset.bunkId
        const select = this.element.querySelector(`select[name="assignments[${bunkId}]"]`)
        if (select) {
          select.value = ''
        }
        this.clearBunkAssignment(sourceDropZone)
      }
      
      // Re-setup draggable elements
      this.makeAllDraggable()
      return
    }
    
    // If dropping to a bunk drop zone
    if (dropZone) {
      // Check if this bunk is already assigned
      const assignedPerson = dropZone.querySelector('[data-bunk-editor-target="assignedPerson"] .draggable-person')
      if (assignedPerson) {
        console.log('❌ Drop rejected: bunk already assigned')
        return
      }
      
      console.log('🎯 DROP EVENT:', this.dragData.reservationName, '->', dropZone.dataset.gender)
      console.log('📊 Drop data being passed:', this.dragData)
      
      // Remove visual feedback
      dropZone.classList.remove('border-green-400', 'bg-green-50', 'border-red-400', 'bg-red-50')
      
      const dropZoneGender = dropZone.dataset.gender
      const dragGender = this.dragData.reservationGender
      
      // Check gender compatibility
      if (!this.isGenderCompatible(dropZoneGender, dragGender)) {
        this.showAlert(`Cannot assign ${dragGender} to ${dropZoneGender}'s room`)
        return
      }
      
      const bunkId = dropZone.dataset.bunkId
      const reservationId = this.dragData.reservationId
      
      // Update the visual assignment
      this.updateBunkAssignment(dropZone, this.dragData)
      
      // Update the corresponding dropdown
      this.updateDropdown(bunkId, reservationId)
      
      // Remove from source if it was in another bunk
      this.removeFromSource(reservationId)
      
      // Re-setup draggable elements (in case new ones were created)
      this.makeAllDraggable()
    }
  }

  handleSelectChange(event) {
    console.log('🔥🔥🔥 NEW SELECT CHANGE CODE EXECUTED! 🔥🔥🔥')
    
    const select = event.target
    const bunkId = this.extractBunkIdFromSelect(select)
    const reservationId = select.value
    const dropZone = this.findDropZoneByBunkId(bunkId)
    
    console.log('🔄 Select change:', { bunkId, reservationId, dropZone: !!dropZone })
    
    if (!dropZone) return
    
    if (reservationId) {
      // Find the reservation data
      const reservation = this.findReservationData(reservationId)
      console.log('🔍 Found reservation data:', reservation)
      
      if (!reservation) {
        console.log('❌ No reservation data found for:', reservationId)
        return
      }
      
      // Check gender compatibility
      const dropZoneGender = dropZone.dataset.gender
      if (!this.isGenderCompatible(dropZoneGender, reservation.gender)) {
        this.showAlert(`Cannot assign ${reservation.gender} to ${dropZoneGender}'s room`)
        select.value = '' // Reset the dropdown
        return
      }
      
      // Remove from source
      this.removeFromSource(reservation.id)
      
      // Update visual assignment
      this.updateBunkAssignment(dropZone, {
        reservationId: reservation.id,
        reservationName: reservation.name,
        reservationGender: reservation.gender
      })
    } else {
      // Empty assignment - move back to unassigned
      this.clearBunkAssignment(dropZone)
    }
    
    // Re-setup draggable elements
    this.makeAllDraggable()
  }

  updateBunkAssignment(dropZone, reservationData) {
    console.log('🎨 Updating bunk assignment with data:', reservationData)
    
    const assignedPersonArea = dropZone.querySelector('[data-bunk-editor-target="assignedPerson"]')
    const genderClass = this.getGenderClass(dropZone.dataset.gender)
    
    // Determine if this is a guest or reservation based on the data
    const isGuest = reservationData.reservationId && this.isGuestId(reservationData.reservationId)
    const assignableType = isGuest ? 'Guest' : 'Reservation'
    
    console.log('🎨 Creating assignment element:', {
      genderClass,
      isGuest,
      assignableType,
      name: reservationData.reservationName
    })
    
    assignedPersonArea.innerHTML = `
      <div class="draggable-person inline-flex items-center px-3 py-2 rounded-lg ${genderClass} cursor-move" 
           draggable="true"
           data-reservation-id="${reservationData.reservationId}"
           data-reservation-name="${reservationData.reservationName}"
           data-reservation-gender="${reservationData.reservationGender}"
           data-assignable-type="${assignableType}"
           data-assignable-id="${reservationData.reservationId}">
        <svg class="h-4 w-4 text-gray-400 mr-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="M7 2a1 1 0 000 2h6a1 1 0 100-2H7zM4 6a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1zM2 10a1 1 0 011-1h14a1 1 0 110 2H3a1 1 0 01-1-1zM2 14a1 1 0 011-1h14a1 1 0 110 2H3a1 1 0 01-1-1z"></path>
        </svg>
        <span class="text-sm font-medium">
          ${reservationData.reservationName}
          ${isGuest ? '<span class="text-xs opacity-75">(Guest)</span>' : ''}
        </span>
      </div>
    `
    
    console.log('✅ Bunk assignment updated successfully')
  }

  clearBunkAssignment(dropZone) {
    const assignedPersonArea = dropZone.querySelector('[data-bunk-editor-target="assignedPerson"]')
    const currentAssignment = assignedPersonArea.querySelector('.draggable-person')
    
    if (currentAssignment) {
      const reservationData = {
        reservationId: currentAssignment.dataset.reservationId,
        reservationName: currentAssignment.dataset.reservationName,
        reservationGender: currentAssignment.dataset.reservationGender
      }
      
      // Move to unassigned area
      this.moveToUnassigned(reservationData)
    }
    
    assignedPersonArea.innerHTML = `
      <div class="text-center py-3 text-gray-400 text-sm border-2 border-dashed border-gray-200 rounded-lg">
        Drop here or select below
      </div>
    `
  }

  getGenderClass(gender) {
    switch (gender) {
      case 'women': return 'bg-pink-100 border-pink-200 text-pink-800'
      case 'men': return 'bg-blue-100 border-blue-200 text-blue-800'
      case 'coed': return 'bg-purple-100 border-purple-200 text-purple-800'
      default: return 'bg-gray-100 border-gray-200 text-gray-800'
    }
  }

  updateDropdown(bunkId, reservationId) {
    const select = this.element.querySelector(`select[name="assignments[${bunkId}]"]`)
    if (select) {
      console.log(`🔍 Updating dropdown for bunk ${bunkId} with reservation ${reservationId}`)
      console.log('Available options:', Array.from(select.options).map(opt => ({ value: opt.value, text: opt.textContent })))
      
      // Find the option that matches this reservation
      // Options have format "Reservation:123" or "Guest:456"
      const option = Array.from(select.options).find(opt => {
        if (!opt.value) return false
        const parts = opt.value.split(':')
        if (parts.length === 2) {
          const optionId = parts[1]
          return optionId === reservationId.toString()
        }
        return false
      })
      
      if (option) {
        console.log(`✅ Found matching option: ${option.value} (${option.textContent})`)
        select.value = option.value
      } else {
        console.log(`❌ No matching option found for reservation ${reservationId}`)
        // Try to find by just the ID as fallback
        const fallbackOption = Array.from(select.options).find(opt => 
          opt.value && opt.value.includes(reservationId.toString())
        )
        if (fallbackOption) {
          console.log(`🔄 Using fallback option: ${fallbackOption.value}`)
          select.value = fallbackOption.value
        }
      }
    }
  }

  removeFromSource(reservationId) {
    // Remove from any other bunk assignments
    const otherAssignments = this.element.querySelectorAll(`[data-bunk-editor-target="assignedPerson"] .draggable-person[data-reservation-id="${reservationId}"]`)
    otherAssignments.forEach(assignment => {
      const dropZone = assignment.closest('[data-bunk-editor-target="dropZone"]')
      if (dropZone) {
        this.clearBunkAssignment(dropZone)
      }
    })
    
    // Remove from unassigned areas (if it was there)
    const unassignedElements = this.element.querySelectorAll(`[data-bunk-editor-target="unassignedArea"] .draggable-person[data-reservation-id="${reservationId}"]`)
    unassignedElements.forEach(element => {
      element.remove()
    })
  }

  moveToUnassigned(reservationData) {
    const gender = reservationData.reservationGender
    let targetArea
    
    if (gender === 'female') {
      targetArea = this.element.querySelector('[data-gender="women"][data-bunk-editor-target="unassignedArea"]')
    } else if (gender === 'male') {
      targetArea = this.element.querySelector('[data-gender="men"][data-bunk-editor-target="unassignedArea"]')
    } else {
      // For unknown gender, add to coed area
      targetArea = this.element.querySelector('[data-gender="coed"][data-bunk-editor-target="unassignedArea"]')
    }
    
    if (targetArea) {
      const container = targetArea.querySelector('.flex.flex-wrap')
      if (container) {
        const genderClass = gender === 'female' ? 'bg-red-100 text-red-800 border-red-200' : 'bg-blue-100 text-blue-800 border-blue-200'
        const isGuest = reservationData.assignableType === 'Guest'
        
        const newElement = document.createElement('div')
        newElement.className = `draggable-person inline-flex items-center px-3 py-1 rounded-full text-sm font-medium ${genderClass} hover:bg-opacity-80 cursor-move`
        newElement.setAttribute('draggable', 'true')
        newElement.dataset.reservationId = reservationData.reservationId
        newElement.dataset.reservationName = reservationData.reservationName
        newElement.dataset.reservationGender = reservationData.reservationGender
        newElement.dataset.assignableType = reservationData.assignableType || 'Reservation'
        newElement.dataset.assignableId = reservationData.reservationId
        
        newElement.innerHTML = `
          ${reservationData.reservationName}
          ${isGuest ? '<span class="ml-1 text-purple-600">👤</span>' : ''}
        `
        
        container.appendChild(newElement)
      }
    }
  }

  findDropZoneByBunkId(bunkId) {
    return this.element.querySelector(`[data-bunk-editor-target="dropZone"][data-bunk-id="${bunkId}"]`)
  }

  extractBunkIdFromSelect(select) {
    const name = select.name
    const match = name.match(/assignments\[(\d+)\]/)
    return match ? match[1] : null
  }

  findReservationData(reservationId) {
    console.log('🔍 Finding reservation data for:', reservationId)
    
    // Handle dropdown value format "Reservation:123" or "Guest:456"
    let actualId = reservationId
    let assignableType = 'Reservation'
    
    if (reservationId.includes(':')) {
      const parts = reservationId.split(':')
      assignableType = parts[0]
      actualId = parts[1]
      console.log('🔍 Parsed dropdown value:', { assignableType, actualId })
    }
    
    // Try to find in the page data first
    const element = this.element.querySelector(`[data-reservation-id="${actualId}"]`)
    if (element) {
      console.log('✅ Found element in page data:', element.dataset)
      return {
        id: element.dataset.reservationId,
        name: element.dataset.reservationName,
        gender: element.dataset.reservationGender,
        assignableType: element.dataset.assignableType || assignableType
      }
    }
    
    // Fallback: try to parse from dropdown options
    const select = this.element.querySelector(`select option[value="${reservationId}"]`)
    if (select) {
      console.log('✅ Found option in dropdown:', select.textContent)
      return {
        id: actualId,
        name: select.textContent,
        gender: this.guessGenderFromDropdown(select),
        assignableType: assignableType
      }
    }
    
    console.log('❌ No reservation data found')
    return null
  }

  guessGenderFromDropdown(option) {
    // Try to determine gender from the option's parent select
    const select = option.closest('select')
    if (select) {
      const dropZone = this.findDropZoneBySelect(select)
      if (dropZone) {
        return dropZone.dataset.gender === 'women' ? 'female' : 
               dropZone.dataset.gender === 'men' ? 'male' : 'unknown'
      }
    }
    return 'unknown'
  }

  findDropZoneBySelect(select) {
    const bunkId = this.extractBunkIdFromSelect(select)
    return bunkId ? this.findDropZoneByBunkId(bunkId) : null
  }

  isGenderCompatible(roomGender, personGender) {
    if (roomGender === 'coed') return true
    if (roomGender === 'women' && personGender === 'female') return true
    if (roomGender === 'men' && personGender === 'male') return true
    return false
  }

  showAlert(message) {
    // Simple alert for now - could be enhanced with a toast notification
    alert(message)
  }

  quickAssign(event) {
    const button = event.target
    const reservationId = button.dataset.reservationId
    const reservationName = button.dataset.reservationName
    const reservationGender = button.dataset.reservationGender
    
    // Find the first available bunk for this gender
    const availableBunks = Array.from(this.dropZoneTargets).filter(zone => {
      const zoneGender = zone.dataset.gender
      return this.isGenderCompatible(zoneGender, reservationGender) && 
             !zone.querySelector('[data-bunk-editor-target="assignedPerson"] .draggable-person')
    })
    
    if (availableBunks.length > 0) {
      const firstBunk = availableBunks[0]
      const bunkId = firstBunk.dataset.bunkId
      
      // Update visual assignment
      this.updateBunkAssignment(firstBunk, {
        reservationId,
        reservationName,
        reservationGender
      })
      
      // Update dropdown
      this.updateDropdown(bunkId, reservationId)
      
      // Remove from source
      this.removeFromSource(reservationId)
      
      // Re-setup draggable elements
      this.makeAllDraggable()
      
      console.log(`Quick assigned ${reservationName} to bunk ${bunkId}`)
    } else {
      this.showAlert('No available bunks for this person')
    }
  }

  isGuestId(id) {
    // Check if this ID exists in the guests list
    const guestElement = this.element.querySelector(`[data-assignable-type="Guest"][data-assignable-id="${id}"]`)
    return !!guestElement
  }
} 