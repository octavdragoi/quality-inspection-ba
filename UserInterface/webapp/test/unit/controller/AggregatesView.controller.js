/*global QUnit*/

sap.ui.define([
	"ui/UserInterface/controller/AggregatesView.controller"
], function (Controller) {
	"use strict";

	QUnit.module("AggregatesView Controller");

	QUnit.test("I should test the AggregatesView controller", function (assert) {
		var oAppController = new Controller();
		oAppController.onInit();
		assert.ok(oAppController);
	});

});