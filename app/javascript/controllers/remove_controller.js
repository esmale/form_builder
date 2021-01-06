import { Controller } from "stimulus"

export default class extends Controller {
  remove(event) {
    event.preventDefault();
    document.getElementById(this.element.id).remove();
    const destroyField = document.getElementById(`${this.element.id}-remove`);
    destroyField.value = true;
  }
}
