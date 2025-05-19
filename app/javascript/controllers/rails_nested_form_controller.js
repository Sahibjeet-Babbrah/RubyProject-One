import { NestedForm } from 'stimulus-rails-nested-form/dist/stimulus-rails-nested-form.umd.js'

export default class extends NestedForm {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }
}