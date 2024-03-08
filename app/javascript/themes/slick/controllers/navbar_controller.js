import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal']

  connect() {
    console.log("[Slick] Navbar 👋")
  }

  open() {
    this.modalTarget.classList.remove('hidden')
  }

  close() {
    this.modalTarget.classList.add('hidden')
  }
}
