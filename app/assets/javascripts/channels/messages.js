App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    if ($("#messages").length) { // User is viewing messages page
      $("#messages").removeClass('hidden');
      return $('#messages').append(this.renderMessage(data));
    }
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});

// App.messages = App.cable.subscriptions.create "MessagesChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server
//
//   disconnected: ->
//     # Called when the subscription has been terminated by the server
//
//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel
