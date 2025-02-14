// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/javascript/packs/application.js

// Import Rails UJS (for unobtrusive JavaScript), Turbolinks, ActiveStorage, etc.
import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import "channels"; // if you have Action Cable channels

Rails.start();
Turbolinks.start();
ActiveStorage.start();
