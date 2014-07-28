  var chats = [];
  var c_colors = [
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#000000",
    "#333333",
    "#333333",
    "#333333",
    "#666666",
    "#666666",
    "#999999",
    "#CCCCCC",
    "#EEEEEE"
  ];

  function get_prevs() {
    $.ajax({
      type: "GET",
      url: "chats.json",
      dataType: "json",
      success: function(prevs) {
        chats = prevs;
        get_and_view_comment();
      }
    });
  }

  function set_new_comment(json) {
    chats = [$.parseJSON(json)].concat(chats);
    if (chats.length > c_colors.length) {
       chats = chats.slice(0, c_colors.length);
    }

  }

  function get_and_view_comment() {
    var text = "";
    for (i=0; i<chats.length; i++) {
       text = text + '<li style="color:' + c_colors[i] + ';">（' + chats[i].created_at + "）"  + chats[i].name + '：' + chats[i].comment + '</li>';
    }
    $("#chat_area").html(text);
  }

  //ページを開いたときの処理
  $(document).ready(function() {
    get_prevs();
  });