class Title_rating_post {
    constructor(title_rating, title_menu_switcher) {        
        this._title_rating = title_rating;
        this.title_menu_switcher = title_menu_switcher;
        this.avg_rating = document.querySelector(".title_avg_rating");
        this.rating_count = document.querySelector(".ratingCount");
        this.body = document.querySelector("body");

        this.update_data_callback = (response) => {
            const is_error = 'detail' in response; 
        
            if (is_error)
                location.reload();
            else
                this.update_data(response)
        };
    }
    
    update_data(response) {
        this.avg_rating.innerHTML = Number(response['avg_rating']).toFixed(1);
        this.rating_count.innerHTML = response['count_rating'];
        this._title_rating = response['title_rating'];

        this.title_menu_switcher.remove_rating_menu();
    }

    form_submit(event) {
        const fetch_data = JSON.stringify({
            title_id: title_id,
            title_rating: this.get_title_rating_type(event.target)
        })

        document.querySelector('.form_title_rating').addEventListener('submit', (event) => {
            event.preventDefault();
            fetch_request("/api/title_rating", fetch_data, this.update_data_callback)
        });
    }

    get_title_rating_type(target) {
        let button_rating = target;

        if (target.tagName != "BUTTON")
            button_rating = target.tagName == "path" ? button_rating.parentNode.parentNode : button_rating.parentNode;

        return "rating_" + button_rating.querySelector("span").textContent;
    }

    get title_rating() {
        return this._title_rating;
    }

    set title_rating(value) {
        this._title_rating = value;
    }
}