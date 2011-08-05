$.ajaxSetup({
  cache: false,
  dataType: 'json',
  accepts: { json: "application/vnd.dsim+json;version=1" }
});

SCApp = SC.Application.create({});

SCApp.welcomeController = SC.Object.create({
  takeOverTheWorld: function() {
    $.ajax({ url: '/home' }).done(
      function(response) {
        // Do something interesting
      }
    );
  }
});

SCApp.WelcomeView = SC.View.extend({
  templateName: 'templates_welcome'
});

SC.$(document).ready(function() {
  SCApp.mainView = SCApp.WelcomeView.create();
  SCApp.mainView.append();
});
