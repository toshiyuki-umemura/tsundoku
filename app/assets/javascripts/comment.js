// コメントの非同期通信

$(function(){
  function buildHTML(comment){
    var html = `<div class="comment__list__element">
                  <strong class="comment__list__element--nickname">
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    :
                  </strong>
                  <span class="comment__list__element--comment add-comment-ele">
                    ${comment.content}
                  </span>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment__list').append(html);
      $('.textbox').val('');
      $('.comment__posts__submit--button').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});