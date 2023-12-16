function listen_signin_button(csrf_token) {
    const signin_button = document.querySelector(".Button_button___CisL");

    signin_button.addEventListener("click", () => {
        const username = document.querySelector("#id_username").value
        const password = document.querySelector("#id_password").value
        const fetch_data = JSON.stringify({
            username: username,
            password: password
        })
        
        fetch_request(fetch_data, csrf_token)
    });
}

function fetch_request(fetch_data, csrf_token) {
    fetch('/api/signin', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf_token
    },
    body: fetch_data
    })
    .then(response => response.json())
    .then(data => {
        const is_error = 'detail' in data; 
        
        if (is_error)
            document.querySelector(".exceptions").innerHTML = data['detail'];
        else
            location.reload();
    })
}