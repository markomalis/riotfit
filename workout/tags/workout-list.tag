<workout-list>
    <div class='mb15' each={ exercise,index in this.opts.exercises }>
        <workout-set-container 
            exercise={ exercise } 
            index={index} 
            add_set={ addSet } 
            add_entry={ addEntry }
            copy_set={ copySet } 
            delete_exercise={ deleteExercise } 
            delete_set={ deleteSet }>
        </workout-set-container>
    </div>
    
    <script>
        const tag = this
        
        addEntry(index, set, entry) {
            this.opts.add_entry(index, set, entry)
        }
    
        addSet(index) {
            this.opts.add_set(index)
        }
        
        copySet(index, set) {
            console.log('copySet')
            this.opts.copy_set(index, set)
        }
        
        deleteExercise(index) {
            tag.opts.delete_exercise(index)
        }
        
        deleteSet(index, set) {
            tag.opts.delete_set(index, set)
        }
        
    </script>
</workout-list>
