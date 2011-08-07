
SCApp = SC.Application.create({
  API_MIME: "application/vnd.dsim+json;version=1",
  API_ROOT: "/home"
});

SCApp.searchLink = function(res, rel) {
  if (res.links && res.links.length) {
    for (var i=0; i<res.links.length; i++) {
      if (res.links[i]["rel"] === rel) {
        return res.links[i]["href"];
      }
    }
  }
  return;
}

SCApp.testLogin = function() {
  $.ajax({ url: SCApp.API_ROOT }).done(
    function(res) {
      var login_url = SCApp.searchLink(res, "login");
      if (login_url) {
        var payload = JSON.stringify({ login: "John", password: "secret" });
        $.ajax({ url: login_url, type: "POST", data: payload }).done(
          function(res) {
            console.log(res);
          }
        );
      }
    }
  );
}

SCApp.welcomeController = SC.Object.create({
  takeOverTheWorld: function() {
    SCApp.testLogin();
  }
});

SCApp.WelcomeView = SC.View.extend({
  templateName: 'templates_welcome'
});

SC.$(document).ready(function() {
  
  $.ajaxSetup({
    cache: false,
    dataType: 'json',
    accepts: { json: SCApp.API_MIME },
    contentType: SCApp.API_MIME,
    processData: false
  });
  
  SCApp.mainView = SCApp.WelcomeView.create();
  SCApp.mainView.append();  
});
