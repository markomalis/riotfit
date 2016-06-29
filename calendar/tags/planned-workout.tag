<planned-workout>
    
    <div class='mb15'>
        <div class='full-width inline-item color1 white mb5' onclick={ this.toggleWorkout }>
            {this.workout.name}
            <span class='glyphicon glyphicon-chevron-down pull-right'></span>
        </div>
        <div name='exercisescontainer' show={ false }>
            <div class="panel panel-default">
            <!-- Default panel contents -->
                <!-- <div class="panel-heading">Panel heading</div> -->
                <div class="panel-body">
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-green">Complete!</button>
                        <button type="button" class="btn btn-yellow">Edit</button>
                        <button type="button" class="btn btn-crimson">Delete</button>
                    </div>
                </div>

              <!-- List group -->
              <ul class="list-group">
                <li class="list-group-item" each= { ex in this.workout.exercises }>{ ex }</li>
              </ul>
            </div>
        </div>
    </div>
    <script>
        const velocity = require('velocity-animate')
        const tag = this
        
        tag.toggle = false
        tag.workout = this.opts.workout
        
        toggleWorkout(e) {
            var action = tag.toggle ? 'slideUp' : 'slideDown'
            tag.toggle = !tag.toggle
            velocity(this.exercisescontainer, action, {
                duration: 400
            });
        }
        
    
    </script>
</planned-workout>
