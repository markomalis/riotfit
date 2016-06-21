<exercise-list>
    <div class='inline-item mb5 item-selecter color1' each={ exercise, index in this.opts.exercises } show={exercise.visible} onclick={getExercise}>
        {exercise.name}
    </div>
    
    <script>
        getExercise(e) {
            this.opts.selectexercise(e.item.index)
            window.scrollTo(0, 0);
        }
    </script>
</exercise-list>
