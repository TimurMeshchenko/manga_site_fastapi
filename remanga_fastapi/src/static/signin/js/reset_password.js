const handler_email_response_callback = (data) => {
    const is_error = 'detail' in data; 
    const is_csrf_token_invalid = is_error && data['detail'].includes("CSRF");
    
    if (is_csrf_token_invalid)
        location.reload();
    else {
        exceptions_element.innerHTML = is_error ? data['detail'] : '';
        success_element.innerHTML = is_error ? '' : data['message'];
    }
}

function listen_reset_password_link() {
    document.querySelector(".Reset_password").addEventListener("click", () => {
        const inputs = document.querySelectorAll(".jsx-261496919888b024");
        const input_email = inputs[0].querySelector("input");
        
        convert_signin_to_password_reset(inputs, input_email);
        listen_button_reset_password(input_email);
    });   
}

function convert_signin_to_password_reset(inputs, input_email) {
    const label = document.querySelector(".Typography_h5__8pAxj");
    const button_span = document.querySelector(".Button_label__jamx3");
    const links = document.querySelectorAll(".Typography_body2__piveF");
    const old_button_reset_password = document.querySelector(".Button_button___CisL");
    const container = document.querySelector(".container");

    label.innerHTML = "Восстановить пароль";
    inputs[1].remove();
    input_email.placeholder = "Почта";
    input_email.value = '';
    button_span.innerHTML = "Восстановить пароль";

    for (const link of links) link.remove();
        
    const button_reset_password = old_button_reset_password.cloneNode(true);

    old_button_reset_password.remove();
    container.appendChild(button_reset_password, input_email);
}

function listen_button_reset_password(input_email) {
    const button_reset_password = document.querySelector(".Button_button___CisL");

    button_reset_password.addEventListener("click", () => {
        const fetch_data = JSON.stringify({
            email: input_email.value,
        });

        fetch_request('/api/reset_password_email', fetch_data, handler_email_response_callback);
    });
}