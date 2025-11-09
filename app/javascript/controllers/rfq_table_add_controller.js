import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    click() {
        document.writeln("Clicked!");
    }
}