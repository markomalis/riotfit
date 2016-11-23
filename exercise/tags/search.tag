<search>
    <div class="input-group mb15 full-width">
        <input oninput={searchList} type="text" class="form-control inline-item" placeholder="Search exercise">
    </div>

    <script>
        searchList(e) {
            console.log(this.opts);
            this.opts.updatesearchsidebar(e.target.value)
        }
    </script>
</search>
