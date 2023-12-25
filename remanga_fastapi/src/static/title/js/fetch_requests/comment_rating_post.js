class Comment_rating_post {
    constructor() {        
        this.comment_rating_colors = ['SvgIcon_color-primary__TnNB7', 'SvgIcon_color-secondary__OvK95'];

        this.update_data_callback = (response) => {
            const is_error = 'detail' in response; 
        
            if (is_error)
                location.reload();
            else
                this.update_data(response)
        };

        this.listen_buttons_comments_ratings()
    }
    
    listen_buttons_comments_ratings() {
        const buttons_comments_ratings = document.querySelectorAll('.Button_comment_rating');

        for (const button_comment_rating of buttons_comments_ratings)
            this.listen_button_comment_rating(button_comment_rating)
    }

    listen_button_comment_rating(button_comment_rating) {
        button_comment_rating.addEventListener('click', (event) => { 
            if (!user_id) return window.location.href = "/signin";
            
            this.set_comment_rating_element(event)
            
            const fetch_data = JSON.stringify({
                action: this.comment_rating_element.value,
            })

            fetch_request("/api/comment_rating", fetch_data, this.update_data_callback)
        });
    }

    set_comment_rating_element(event) {
        let button_comment_rating = event.target.tagName == "path" ? 
            event.target.parentNode.parentNode : event.target.parentNode;

        button_comment_rating = event.target.tagName == "BUTTON" ? event.target : button_comment_rating;

        this.comment_rating_element = button_comment_rating;
    }

    update_data(response) {
        const comment_rating_form = this.comment_rating_element.parentNode;
        const comment_score = comment_rating_form.querySelector(".Comments_score__fxIQG");
        const comment_rating_buttons = comment_rating_form.querySelectorAll(".jsx-2719031823.SvgIcon_fontSize-small__i__5t");
        
        comment_score.innerHTML = response['comment_likes'];

        for (let i = 0; i < comment_rating_buttons.length; i++)
            comment_rating_buttons[i].classList.remove(this.comment_rating_colors[i]);

        if (response['comment_rating'] != null) {
            const comment_rating_svg = this.comment_rating_element.querySelector('svg');
            const index_button_comment_rating = this.comment_rating_element.value.includes('dislike') ? 1 : 0;

            comment_rating_svg.classList.add(this.comment_rating_colors[index_button_comment_rating]);
        }
    }
}