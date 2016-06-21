<exercise-list>
    <div class='inline-item mb5 item-selecter color1' each={ exercise, index in this.opts.exercises } show={exercise.visible} >
        <span onclick={ exerciseInfo }>{exercise.name}</span>
        <button type="button" class="btn btn-default btn-sm btn-green br1 pull-right" onclick={ addExercise }>
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        </button>
        
    </div>
    
    <div class='popup-blur' show={ this.popup } onclick={ closePopup }></div>
    <div class='popup' show={ this.popup }>
        <p>{ this.opts.exercises[this.ii].name }</p>
        <p>{ this.opts.exercises[this.ii].description }</p>
        <iframe width="100%" height="340px" src="https://www.youtube.com/embed/wPRm8rPMWgA" frameborder="0" allowfullscreen></iframe>
        <button type="button" class="btn btn-default br1 full-width" onclick={ closePopup }>
            Close
        </button>
    </div>
    <script>
        const tag = this
        
        tag.popup = false
        tag.ii = false
        
        addExercise(e) {
           this.opts.add_exercise(this.opts.exercises.indexOf(e.item.exercise), e.item.exercise.name)
        }
        
        closePopup() {
            tag.popup = false
            tag.update()
        }
        
        exerciseInfo(e) {
            tag.ii = e.item.index
            tag.popup = true
            tag.update()
        }
    </script>
</exercise-list>
