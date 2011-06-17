SCApp = SC.Application.create({});

SCApp.welcomeController = SC.Object.create({
  takeOverTheWorld: function() {
    alert("Done!");
  }
});

SCApp.WelcomeView = SC.View.extend({
  templateName: 'templates_welcome'
});

SC.$(document).ready(function() {
  SCApp.mainView = SCApp.WelcomeView.create();
  SCApp.mainView.append();
});
