class Profile_avatar_put {
    constructor() {
        const fileInput = document.querySelector('#id_avatar');

        this.update_data_callback = (response) => {
            const is_error = 'detail' in response; 
        
            if (is_error)
                location.reload();
            else
                this.update_data()
        };

        document.querySelector(".relative").addEventListener('click', () => this.activate_avatar_uploader(fileInput));

        fileInput.addEventListener('change', () => {
            const formData = new FormData(document.querySelector(".form_avatar"));
            this.fetch_file_request("/api/change_avatar", formData, this.update_data_callback)
        });
    }

    activate_avatar_uploader(fileInput) {
        fileInput.click();
    }    

    fetch_file_request(url, fetch_data, update_data_callback) {
        fetch(url, {
        method: 'PUT',
        headers: {
            'X-CSRF-Token': csrf_token
        },
        body: fetch_data
        })
        .then(response => response.json())
        .then(update_data_callback)
    }

    update_data() {
        const imgs_avatar = document.querySelectorAll(".profile-pic");
        const have_not_avatar = imgs_avatar[0].src.includes('no_avatar');

        if (have_not_avatar) {
            const url_splited = window.location.href.split("/");
            const user_id = url_splited[url_splited.length -1]

            for (const img_avatar of imgs_avatar) 
                img_avatar.src = img_avatar.src.split("no_avatar")[0] + user_id + '.jpg';
        } 
        else {
            const timestamp = new Date().getTime();
    
            for (const img_avatar of imgs_avatar) 
                img_avatar.src = img_avatar.src.split("?")[0] + "?" + timestamp; 
        }
    }
}