import { Application } from "@hotwired/stimulus"

const application = Application.start()

ActiveStorage.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
