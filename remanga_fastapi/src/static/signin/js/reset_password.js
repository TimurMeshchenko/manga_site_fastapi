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

document.querySelector(".Reset_password").addEventListener("click", () => {
    const label = document.querySelector(".Typography_h5__8pAxj");
    const container = document.querySelector(".container");

    const inputs = document.querySelectorAll(".jsx-261496919888b024");
    const input_email = inputs[0].querySelector("input");
    
    const button_span = document.querySelector(".Button_label__jamx3");
    const links = document.querySelectorAll(".Typography_body2__piveF");
    const old_button_reset_password = document.querySelector(".Button_button___CisL");
    
    label.innerHTML = "Восстановить пароль";
    inputs[1].style.display = "None";
    input_email.placeholder = "Почта";
    input_email.value = '';
    button_span.innerHTML = "Восстановить пароль";

    for (const link of links) link.remove();
    
    const button_reset_password = old_button_reset_password.cloneNode(true);

    old_button_reset_password.remove();
    container.appendChild(button_reset_password);

    button_reset_password.addEventListener("click", () => {
        const fetch_data = JSON.stringify({
            email: input_email.value,
        });
   
        fetch_request('/api/check_email', fetch_data, csrf_token, handler_email_response_callback)
        fetch_request('/api/reset_password_email', fetch_data, csrf_token, handler_email_response_callback);
    });
});