<workout-set-container>
    <div class=' full-width inline-item color2 white mb5'>
        {this.opts.exercise.name}
        <button type="button" class="btn btn-default btn-sm btn-crimson pull-right" onclick={ deleteExercise }>
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        </button>
        <button type="button" class="btn btn-default btn-sm btn-crimson pull-right" onclick={ toggleBox }>
            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true" ></span>
        </button>
    </div>
    <div hide={ this.open } >
        <workout-set each={set,index in this.opts.exercise.sets} 
            set={ set } 
            index={ index } 
            add_entry={ parent.addEntry } 
            copy_set={ parent.copySet } 
            delete_set={ parent.deleteSet }>
        </workout-set>
        <button type="button" class="btn btn-default btn-sm full-width br1" onclick={addSet}>
            Add set <span class="glyphicon glyphicon-plus green" aria-hidden="true"></span>
        </button>
    </div>
    <script>
        const tag = this
        tag.open = true
        
        addEntry(set, entry) {
            this.opts.add_entry(this.opts.index, set, entry)
        }
    
        addSet() {
            this.opts.add_set(this.opts.index)
        }
        
        copySet(set) {
            this.opts.copy_set(this.opts.index, set)
        }
        
        deleteExercise() {
            this.opts.delete_exercise(this.opts.index)
        }
        
        deleteSet(set) {
            this.opts.delete_set(this.opts.index, set)
        }
        
        toggleBox() {
            tag.open = !tag.open
            tag.update()
        }
    </script>
</workout-set-container>
