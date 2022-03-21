import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "window" ]

  close() {
    this.windowTarget.addEventListener("animationend", (event) => {
      this.remove()
    })

    this.windowTarget.classList.add("cart__window--close")
  }

  remove() {
    this.element.remove()
    this.cartTurboFrame.src = null
  }

  get cartTurboFrame() {
    return document.querySelector("turbo-frame[id='cart']")
  }
}
