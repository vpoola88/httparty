$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


var form = new FormData();
form.append("user_id", "28");
form.append("course_id", "152");
form.append("role", "learner");

var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://wisdomlabs.talentlms.com/api/v1/addusertocourse",
  "method": "POST",
  "headers": {
    "authorization": "Basic R3p1Y1VoV05ldkluQlBONENWeGwxejFYTmNJV0RQOg==",
    "cache-control": "no-cache",
    "postman-token": "ded42252-8421-065b-82ef-f1004e1aafde"
  },
  "processData": false,
  "contentType": false,
  "mimeType": "multipart/form-data",
  "data": form
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
