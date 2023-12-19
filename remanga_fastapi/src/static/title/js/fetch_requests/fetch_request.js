function fetch_request(url, fetch_data, csrf_token, update_data_callback) {
    fetch(url, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf_token
    },
    body: fetch_data
    })
    .then(response => response.json())
    .then(update_data_callback)
}