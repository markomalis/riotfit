<search>
    <div class="input-group mb15">
        <input oninput={searchList} type="text" class="form-control inline-item" placeholder="Search for an exercise">
        <span class="input-group-addon br1"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></span>
    </div>
    
    <script>
        searchList(e) {
            this.opts.updatelist(e.target.value)
        }
    </script>
</search>
