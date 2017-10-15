// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import socket from "./socket";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

let handlebars = require("handlebars");
var chan;

$(function() {
  likes_stuff();
  socket_stuff();
});

function socket_stuff() {
  if (!$("#postsTable").length > 0) {
    // Wrong page.
    return;
  }

  join_channel();
}

function join_channel() {
  chan = socket.channel("updates:all");
  chan.join()
    .receive("ok", resp => { console.log("Joined successfully", resp); })
    .receive("error", resp => { console.log("Unable to join", resp); });

  chan.on("new_post", new_post);
}

function new_post(msg) {
  console.log("got a message", msg);
  // Find a <table> element with id="myTable":
  var table = document.getElementById("postsTable");

  // Create an empty <tr> element and add it to the 1st position of the table:
  var row = table.insertRow(1);

  // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);

  var userId = msg.user_id;
  var content = msg.message;

  // Add some text to the new cells:
  cell1.innerHTML = "<a href=\"/users/${userId}\">a@a.com</a>";
  cell2.innerHTML = content;
  cell3.innerHTML = '<span><a class="btn btn-default btn-xs" href="/posts/15">Show</a></span>';
}

function likes_stuff() {
  if (!$("#likes-template").length > 0) {
    // Wrong page.
    return;
  }

  let tt = $($("#likes-template")[0]);
  let code = tt.html();
  let tmpl = handlebars.compile(code);

  let dd = $($("#post-likes")[0]);
  let path = dd.data('path');
  let p_id = dd.data('post_id');

  let bb = $($("#like-button")[0]);
  let u_id = bb.data('user-id');

  function fetch_likes() {
    function got_likes(data) {
      console.log(data);
      let html = tmpl(data);
      dd.html(html);
    }

    $.ajax({
      url: path,
      data: {post_id: p_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_likes,
    });
  }

  function add_like() {
    let data = {like: {post_id: p_id, user_id: u_id}};

    $.ajax({
      url: path,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "POST",
      success: fetch_likes,
    });

    $("#like-button")[0].disabled=true
  }

  bb.click(add_like);

  fetch_likes();
}
