// app/javascript/application.js

import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import "controllers";
import "./custom/picture_upload";


// Initialize Rails UJS
Rails.start();

// For debugging, you can check if Rails UJS is loaded
window.Rails = Rails;
