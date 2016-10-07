App.messages = App.cable.subscriptions.create('ChatroomChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.email + ": </b>" + data.message + "</p>";
  }
});
