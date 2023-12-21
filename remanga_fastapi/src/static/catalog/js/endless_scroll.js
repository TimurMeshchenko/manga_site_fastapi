class Endless_scroll {
    constructor() {
        this.page = 0;
        this.grid = document.querySelector(".grid");
        this.gridPlaceholder = this.grid.querySelector(".gridPlaceholder");

        this.listen_scroll();
    }

    listen_scroll() {
        window.addEventListener('scroll', () => {
            const is_not_all_titles_loaded = this.page < pages_count;

            if (this.gridPlaceholder && this.is_last_title_scrolled() && is_not_all_titles_loaded)
                this.load_more_titles_post()
        });
    }

    load_more_titles_post() {
        this.page++;
        this.add_titles_page();
    }

    is_last_title_scrolled() {
      const footer = document.querySelector("footer");
      const all_titles = this.grid.querySelectorAll(".gridItem");
      const last_title = all_titles[all_titles.length - 1];
      const scrolledHeight = window.innerHeight + window.scrollY;
      const height_from_last_title_to_end = last_title.offsetHeight + footer.offsetHeight;
      
      return scrolledHeight + height_from_last_title_to_end >= document.documentElement.scrollHeight;
    }   

    async add_titles_page() {
        const query_symbol = window.location.href.includes("?") ? "&" : "?";
        const response = await fetch(`${window.location.href}${query_symbol}page=${this.page}`);
        const data = await response.json();
        
        this.gridPlaceholder.insertAdjacentHTML("beforebegin", data);
    }
}