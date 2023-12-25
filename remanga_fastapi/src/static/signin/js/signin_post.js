function listen_signin_button() {
    const signin_button = document.querySelector(".Button_button___CisL");
    const username = document.querySelector("#id_username")
    const password = document.querySelector("#id_password")

    const update_data_callback = (data) => {
        const is_error = 'detail' in data && !data['detail'].includes("CSRF"); 
        
        if (is_error)
            exceptions_element.innerHTML = data['detail'];
        else
            location.reload();
    }

    signin_button.addEventListener("click", () => {
        const fetch_data = JSON.stringify({
            username: username.value,
            password: password.value
        })
                
        fetch_request('/api/signin', fetch_data, update_data_callback)
    });
}