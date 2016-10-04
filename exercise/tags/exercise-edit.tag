<exercise-edit>
    <div hide={this.opts.exercise.own}>You need to select a exercise from your personal library first</div>
    <form show={this.opts.exercise.own}>
        <input name='name' type="text" class="form-control inline-item mb5" placeholder="Name for the exercise" value={this.opts.exercise.name}>
        <span each={tag in this.opts.exercise.tags} class="tag"> {tag} <span class="deleteTag" onclick={deleteTag}>x</span></span>
        <span class="tag"> ... </span>
        <input name='tagged' type="text" class="form-control inline-item mb5" placeholder="Add tags" onkeypress={addTag}>
        <textarea rows="8" name='description' type="text" class="form-control inline-item mb5" placeholder="Descritpion" value={this.opts.exercise.description}></textarea>
        <input name='video' type="text" class="form-control inline-item mb5" placeholder="Video link" value={this.opts.exercise.video}>
        <button type="submit" class="btn btn-default inline-item color2 item-selecter full-width">Save</button>
    </form>
    
    
    <script>
        editExercise(e) {
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
            /*
            if(e.keyCode==13){
                this.opts.addtag(e.target.value)
                e.target.value = ''
            }
            return true
            */
            if(e.keyCode==13){
                console.log("yolo")
            }
            return true
        }
        
        deleteTag(e) {
            /*
            var index = this.opts.tags.indexOf(e.item.tag)
            this.opts.deletetag(index)
            */
            console.log(this.opts.exercise.tags.indexOf(e.item.tag))
        }
        
        test(e) {
            console.log(e)
            console.log(this.opts.exercise)
        }
    </script>
</exercise-edit>
