// websocket_request

function generate_session_id() {
  const timestamp = new Date().getTime();
  const randomNumber = Math.floor(Math.random() * 1000000);
  const sessionID = `${user_id}-${title_id}-${timestamp}-${randomNumber}`;

  return sessionID;
}

function handler_websocket_response() {    
    ws.onmessage = function(event) {
        const response = JSON.parse(event.data);
        const is_onopen = response.websockets_csrf_token != null; 

        if (is_onopen) {
            init_websoket_data(response);
            return;
        }
                
        if (response.type == "bookmark")
            update_bookmark_elements();
        else
            add_comment(response);
    };
}

//

function init_websoket_data(response) {
    websockets_csrf_token = response.websockets_csrf_token;

    websoket_data = JSON.stringify({
        type: "bookmark",
        user_id: user_id,
        title_id: title_id,
        websockets_csrf_token: response.websockets_csrf_token
    });            
}

function update_bookmark_elements() {
    const title_count_bookmarks_int = Number(title_count_bookmarks.innerHTML);
    const is_bookmark_added = bookmark_button.innerText == "ДОБАВИТЬ В СПИСОК";

    bookmark_button.innerHTML = is_bookmark_added ? 
        "УБРАТЬ ИЗ СПИСКА" : "ДОБАВИТЬ В СПИСОК";

    title_count_bookmarks.innerHTML = is_bookmark_added ? 
        title_count_bookmarks_int + 1 : title_count_bookmarks_int - 1;
}

function listen_bookmark_button() {
    if (!user_id) return window.location.href = "/signin";

    ws.send(websoket_data)
}

function listen_websocket_close() {
    ws.onclose = () => location.reload();
}

// В websockets_comment

function add_comment(response) {
     add_empty_comment(response);
    
    const comment_created = document.querySelector(".Comments_media__5h5tS");
    const comment_content = comment_created.querySelector('.jsx-918629f30f833e0'); 
    const comment_counter = document.querySelector(".Typography_h4__1eVxk.Typography_gutterBottom__mjtdd");
    const comment_counter_separeted_text = comment_counter.innerText.split(" ");
    const updated_comments_count = Number(comment_counter_separeted_text[1]) + 1;

    comment_content.innerText = response.content;
    comment_counter.innerText = comment_counter_separeted_text[0] + " " + updated_comments_count

    // this.add_new_comment_rating_listeners(comment_created, response);
}

function add_empty_comment(response) {
    const url_profile = `/user/${response.user_id}` 
    const user_avatar = response.user_avatar ? `/media/${response.user_avatar}` : "/media/users_avatars/no_avatar.jpg";
    const user_name = response.user_name;
    

    document.querySelector(".Comments_wrap__7NbKY").insertAdjacentHTML('afterbegin', `
        <div class="jsx-3914328852 Comments_media__5h5tS">
          <a href="${ url_profile }"> 
            <img src="${ user_avatar }" alt="..."
            class="jsx-3914328852 Comments_mediaAvatar__IuIbH" />
          </a>
        <div class="jsx-3914328852 Comments_mediaBody__d6xxB">
            <div class="jsx-3914328852 Comments_mediaContent__KYew0 scoreBorder">
            <div class="jsx-3914328852 Comments_mediaHeading___sytl flex items-center">
                <a class="Comments_username__BIt0K"
                href="${ url_profile }">${user_name}
                </a><small class="jsx-3914328852">· 0 minutes</small>
                <div class="jsx-3914328852 ml-auto flex items-center">
                </div>
            </div>
            <div class="jsx-918629f30f833e0">
            </div>
            </div>
            <div class="jsx-3914328852 Comments_footer__4u_24 flex items-center">
            <form method="post" class="comment_like_form">
                <button class="Comments_iconButton__dwH2e" type="submit" name="form_name" value="like_" style="background-color: transparent;border: none;padding: 0;">
                  <svg fill="currentColor" viewBox="0 0 40 40"
                    class="jsx-83d2bca1a5644a9 jsx-2719031823 SvgIcon_fontSize-small__i__5t Svg_rating">
                    <path
                      d="M31 26.4q0 .3-.2.5l-1.1 1.2q-.3.2-.6.2t-.5-.2l-8.7-8.8-8.8 8.8q-.2.2-.5.2t-.5-.2l-1.2-1.2q-.2-.2-.2-.5t.2-.5l10.4-10.4q.3-.2.6-.2t.5.2l10.4 10.4q.2.2.2.5z"
                      class="jsx-83d2bca1a5644a9 jsx-2719031823"></path>
                  </svg>
                </button>
                <span class="Comments_score__fxIQG"> 0 </span>
                <button class="Comments_iconButton__dwH2e" type="submit" name="form_name" value="dislike_"
                style="background-color: transparent;border: none;padding: 0;">
                  <svg fill="currentColor" viewBox="0 0 40 40" class="jsx-83d2bca1a5644a9 jsx-2719031823 SvgIcon_fontSize-small__i__5t Svg_rating"
                    style="transform: rotate(180deg);">
                    <path
                      d="M31 26.4q0 .3-.2.5l-1.1 1.2q-.3.2-.6.2t-.5-.2l-8.7-8.8-8.8 8.8q-.2.2-.5.2t-.5-.2l-1.2-1.2q-.2-.2-.2-.5t.2-.5l10.4-10.4q.3-.2.6-.2t.5.2l10.4 10.4q.2.2.2.5z"
                      class="jsx-83d2bca1a5644a9 jsx-2719031823"></path>
                  </svg>
                </button>
            </form>
            </div>
        </div>
        </div>
    `);
} 