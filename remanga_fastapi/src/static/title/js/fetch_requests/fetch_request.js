function fetch_request(url, fetch_data, update_data_callback, method = 'POST') {
    fetch(url, {
    method: method,
    headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf_token
    },
    body: fetch_data
    })
    .then(response => response.json())
    .then(update_data_callback)
}