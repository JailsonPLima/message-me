import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ['navLinkMenu', 'menu'];

    toggle() {
        this.navLinkMenuTarget.classList.toggle('is-open')
        this.menuTarget.classList.toggle('is-open');
    }
}