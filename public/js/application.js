$(document).ready(function () {

  // PSEUDO-CODE:
  //   1- intercept the form submission event using jQuery
  //   2- prevent the default action for that event from happening
  //   3- use jQuery to submit an AJAX post to the form's action
  //   4- when the AJAX post is done, display the new die roll using jQuery
  $("#answer-button").click(function(event){
    event.preventDefault();
    $("#answer-button").addClass("hidden");
    $("#answer-form").removeClass("hidden");
  });

  $(".comment-button").click(function(event){
    event.preventDefault();
    console.log(":)");
    $(this).addClass("hidden");
    //debugger;
    $(this).parent().find(".comment-submission-container").removeClass("hidden");
  });

  // $("#question-submission-form").on("submit", function(event){
  //   event.preventDefault();
  //   $.ajax({url: "/questions",
  //           method: "post",
  //         data: this.serialize,
  //         error: function(jqXHR, exception){
  //           alert(jqXHR.status);
  //         }});
  // });


  $(".comment-box").on("submit", function(event) {
    event.preventDefault();
    parent = $(this).parent().parent()
    current_list = $(parent).find(".comments-list");


    $.ajax({
          url: $(this).attr("action"),
          method: "post",
          data: $(this).serialize()})
          .done( function(response){
            $(current_list).append(response);
            $(parent).find(".comment-button").removeClass("hidden");
            $(parent).find(".comment-submission-container").addClass("hidden");
            $(parent).find("comment[description]").val("");
          })
          .fail( function(jqXHR, exception){
            alert(jqXHR.status);
          });
  });

  $("#answer-form").on("submit", function(event) {
    event.preventDefault();
    //parent = $(this).parent().parent()
    //current_list = $(parent).find(".comments-list");
    $.ajax({
          url: $(this).attr("action"),
          method: "post",
          data: $(this).serialize()})
          .done( function(response){
            $("#answers-list").append(response);
            $("#answer-button").removeClass("hidden");
            $("#answer-submission-form").addClass("hidden");
            $("#answer-text-box").val("");
          })
          .fail( function(jqXHR, exception){
            alert(jqXHR.status);
          });
  });

  // $("#answer-submission-form").on("submit", function(event) {
  //   event.preventDefault();
  //   $.ajax({url: "/questions/:id/answers",
  //           method: "post",
  //         data: this.serialize,
  //         success: function(response){
  //           $("#answer_list").append(response);
  //           $("#answer-button").removeClass("hidden");
  //           $("#answer-submission-form").addClass("hidden");
  //           $("textarea[name=answer[body]]").val("");
  //         },
  //         error: function(jqXHR, exception){
  //           alert(jqXHR.status);
  //         }});
  // });
  //

  })
// work in progress
  // $(".posts").on("click", ".question-filter", function(e){
  //   e.preventDefault();
  //   $.ajax({
  //     url: $(this).attr("href"),
  //     method: "get"
  //   }).done(function(reponse){
  //     $(".all-filter").hide();
  //   });

  });

});
