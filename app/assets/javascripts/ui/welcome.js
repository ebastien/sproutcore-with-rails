
SCApp = SC.Application.create({
  API_MIME: "application/vnd.dsim+json;version=1",
  API_ROOT: "/home"
});

SCApp.updateState = function (res) {
  console.log("=> Update state");
  console.log(res);
  if (res["account"]) {
    // ... show account view ...
    console.log("=> Account!");
  } else if (res["login"]) {
    // ... show login view ...
    SCApp.loginLink(res, "login");
  }
}

SCApp.searchLink = function (res, rel) {
  if (res.links && res.links.length) {
    for (var i=0; i<res.links.length; i++) {
      if (res.links[i]["rel"] === rel) {
        return res.links[i]["href"];
      }
    }
  }
  return;
}

SCApp.actionLink = function (res, rel) {
  var link = SCApp.searchLink(res, rel);
  if (link) {
    $.ajax({ url: link }).done(
      function (newres) {
        SCApp.updateState(newres);
      }
    );
  }
  return link;
}

SCApp.loginLink = function (res, rel) {
  var link = SCApp.searchLink(res, rel);
  if (link) {
    var payload = JSON.stringify({ login: "John", password: "secret" });
    $.ajax({ url: link, type: "POST", data: payload }).done(
      function (newres) {
        SCApp.updateState(newres);
      }
    );
  }
  return link;
}

SCApp.reachAccount = function () {
  $.ajax({ url: SCApp.API_ROOT }).done(
    function (res) {
      if (! SCApp.actionLink(res, "account")) {
        // No account link found...
        if (SCApp.searchLink(res, "login")) {
          // ... but there is a login link. Let's try that!
          res.login = {};
          SCApp.updateState(res);
        }
      }
    }
  );
}

SCApp.welcomeController = SC.Object.create({
  takeOverTheWorld: function () {
    SCApp.reachAccount();
  }
});

SCApp.WelcomeView = SC.View.extend({
  templateName: 'templates_welcome'
});

SC.$(document).ready(function () {
  
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
