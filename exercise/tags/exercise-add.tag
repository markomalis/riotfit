<exercise-add>
    <div onclick={closeAddView} class='popup-blur'></div>
    <div class='popup-form'>
        <div><span onclick={closeAddView} class="glyphicon glyphicon-remove popup-close" aria-hidden="true"></span></div>
        <h3>Add a new exercise to your personal library</h3>
        <form id='exercise-add-form' onsubmit={addExercise} >
            <input name='name' type="text" class="form-control inline-item mb5" placeholder="Name for the exercise">
            <span each={tag in this.opts.tags} class="tag"> {tag} <span class="deleteTag" onclick={deleteTag}>x</span></span>
            <span class="tag"> ... </span>
            <input name='tagged' type="text" class="form-control inline-item mb5" placeholder="Tags" onkeypress={addTag}>
            <textarea rows="8" name='description' type="text" class="form-control inline-item mb5" placeholder="Descritpion"></textarea>
            <input name='video' type="text" class="form-control inline-item mb5" placeholder="Video link">
            <button type="submit" class="btn btn-default inline-item color2 item-selecter full-width">Submit</button>
        </form>
    </div>
    <script>
        addExercise(e) {
            if(e.target.name.value && e.target.description.value){
                this.opts.addexercise({
                    name: e.target.name.value,
                    description: e.target.description.value,
                    tags: this.opts.tags,
                    video: e.target.video.value,
                    visible: true,
                    own: true
                })
            }
        }
        
        addTag(e) {
            if(e.keyCode==13){
                this.opts.addtag(e.target.value)
                e.target.value = ''
            }
            return true
        }
        
        closeAddView(e) {
            this.opts.closeaddview()
        }
        
        deleteTag(e) {
            var index = this.opts.tags.indexOf(e.item.tag)
            this.opts.deletetag(index)
        }
    </script>
</exercise-add>
