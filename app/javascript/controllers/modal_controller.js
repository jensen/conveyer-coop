import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    this.element.remove()
    this.modalTurboFrame.src = null
  }

  escClose(event) {
    if (event.key === 'Escape') this.close()
  }

  submitEnd(event) {
    console.log(event.detail)
    if (event.detail.success) {
      this.close()
    }
  }

  get modalTurboFrame() {
    return document.querySelector("turbo-frame[id='modal']")
  }
}
