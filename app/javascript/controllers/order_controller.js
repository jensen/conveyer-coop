import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["address"]

  applyParams(event) {
    const { name, value } = event.target
    this.addressTarget.search = new URLSearchParams({ [name]: value})
  }

  chooseMethod(event) {
    this.addressTarget.click()
  }
}
