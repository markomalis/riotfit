<exercise-detail>
    <h3 hide={ this.opts.exercise.name }>
        Select an exercise for more info
    </h3>
    <div show={ this.opts.exercise.name }>
        <h3 class='detail-title mb5'>
            {this.opts.exercise.name}
        </h3>
        <iframe width="100%" height="340px" src="https://www.youtube.com/embed/wPRm8rPMWgA" frameborder="0" allowfullscreen></iframe>
        <span class='tag' each={tag in this.opts.exercise.tags}> {tag} </span>
        <div class='mb90'>
            {this.opts.exercise.description}
        </div>
    </div>
</exercise-detail>
