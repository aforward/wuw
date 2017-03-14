
export var Form = {
  waiting: function(obj) {
    obj.removeClass("ready");
    obj.addClass("waiting");
  },

  ready: function(obj) {
    obj.removeClass("waiting");
    obj.addClass("ready");
  },
}