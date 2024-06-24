// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "channels"
import "../scripts/custom_script"
import Chartkick from 'chartkick';
import Chart from 'chart.js';
import Rails from "@rails/ujs";
Rails.start();
Chartkick.addAdapter(Chart);
window.Chartkick = Chartkick; // opcional, para tornar Chartkick global

import * as bootstrap from "bootstrap"

