function listen_change_password_button() {
    const change_password_button = document.querySelector(".Button_change_password");
    const exceptions_element = document.querySelector(".exceptions");
    const success_element = document.querySelector(".success");
    const old_password = document.querySelector("#id_old_password")
    const new_password = document.querySelector("#id_new_password")
    const new_password2 = document.querySelector("#id_new_password2")

    const update_data_callback = (data) => {
        const is_error = 'detail' in data && data['detail'].includes("CSRF"); 
        const is_password_changed = "message" in data;

        if (is_error)
            location.reload();
        else if (is_password_changed) {
            old_password.value = ''
            new_password.value = ''
            new_password2.value = ''
            exceptions_element.innerHTML = ''
            success_element.innerHTML = data['message']
        }
        else {
            success_element.innerHTML = ''
            exceptions_element.innerHTML = data['detail'];
        }
    }

    change_password_button.addEventListener("click", () => {
        const fetch_data = JSON.stringify({
            old_password: old_password.value,
            new_password: new_password.value,
            new_password2: new_password2.value
        })
   
        fetch_request('/api/change_password', fetch_data, update_data_callback, 'PUT')
    });
}