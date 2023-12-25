function listen_signup_button() {
    const signup_button = document.querySelector(".Button_button___CisL");
    const exceptions_element = document.querySelector(".exceptions");
    const username = document.querySelector("#id_username")
    const email = document.querySelector("#id_email")
    const password = document.querySelector("#id_password1")
    const password2 = document.querySelector("#id_password2")

    const update_data_callback = (data) => {
        const is_error = 'detail' in data && !data['detail'].includes("CSRF"); 
        
        if (is_error)
            exceptions_element.innerHTML = data['detail'];
        else {
            signin_fetch_data = get_signin_fetch_data(username, password);
            reload_page = () => location.reload(); 
            fetch_request('/api/signin', signin_fetch_data, reload_page);
        }
    }

    signup_button.addEventListener("click", () => {
        const fetch_data = JSON.stringify({
            username: username.value,
            email: email.value,
            password: password.value,
            password2: password2.value
        })
   
        fetch_request('/api/signup', fetch_data, update_data_callback)
    });
}

function get_signin_fetch_data(username, password) {
    const signin_fetch_data = JSON.stringify({
        username: username.value,
        password: password.value
    })

    return signin_fetch_data
}