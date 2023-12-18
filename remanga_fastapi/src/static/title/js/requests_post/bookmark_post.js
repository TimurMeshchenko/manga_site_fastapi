function generate_session_id() {
  const timestamp = new Date().getTime();
  const randomNumber = Math.floor(Math.random() * 1000000);
  const sessionID = `${user_id}-${timestamp}-${randomNumber}`;

  return sessionID;
}

function handler_websocket_response() {    
    ws.onmessage = function(event) {
        const response = JSON.parse(event.data);
        const is_onopen = websoket_data == null; 

        init_websoket_data(response, is_onopen);
        
        if (is_onopen) return;
        
        update_bookmark_elements(response);
    };
}

function init_websoket_data(response, is_onopen) {
    if (is_onopen)
    {
        websoket_data = JSON.stringify({
            user_id: user_id,
            title_id: title_id,
            websockets_csrf_token: response.websockets_csrf_token
        });            
    }
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

