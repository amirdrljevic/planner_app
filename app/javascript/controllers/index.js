// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

import RemovalsController from "./removals_controller.js"
application.register("removals", RemovalsController)