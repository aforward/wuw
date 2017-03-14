import { Form } from "./form";

export var Account = (function () {

  var entity = {};

  entity.showAccounts = function() {
    var container = $(".accounts-list");
    $.ajax({
      type: 'GET',
      url: container.data("action"),
      success: function(response) {
        container.html(response);
      },
    });
  }

  entity.addAccount = function() {
    var btn = $(".btn-create-account");
    var createAccount = $(".frm-create-account");
    Form.waiting(btn);
    $.ajax({
      type: 'POST',
      url: createAccount.attr("action"),
      data: createAccount.serialize(),
      success: function(response) {
        Form.ready(btn);
        entity.showAccounts();
      },
    });
    return false;
  }

  entity.attachEvents = function() {
    $(".frm-create-account").submit(function() {
      entity.addAccount();
      return false;
    });
  }

  entity.run = function() {
    entity.showAccounts();
    entity.attachEvents();
  }

  return entity;
}());