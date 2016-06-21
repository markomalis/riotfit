<workout-add>
    <div class={col-xs-12: true, col-sm-6: true, pb15: true, hidden-xs: this.state.panelView == "DETAIL_PANEL"}>
        <search search={ searchExercise }></search>
        <exercise-list exercises={ this.state.exercises } add_exercise={ addExercise }></exercise-list>
        <img onclick={ setDetailPanel } src='images/list.svg' class="mobile-nav-btn right visible-xs color4" show={ this.state.panelView == "LIST_PANEL" } ></img>
        <div class="alert alert-warning alert-dismissible myalert hidden-sm" role="alert" show={ this.addedPopup }>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick={ closeAddedPopup }><span aria-hidden="true">&times;</span></button>
            <strong>{ this.lastSelectedExercise }</strong> added to the list
        </div>
    </div>
    <div class={pb100: true, col-xs-12: true, col-sm-6: true, hidden-xs: this.state.panelView == "LIST_PANEL"}>        
        <ul class="nav nav-pills nav-justified mb15">
            <li class='active'><a>Save this workout</a></li>
            <li><a>Plan it!</a></li>
        </ul>
        <workout-list 
            exercises={this.state.exerciseList} 
            add_set={addSet} 
            add_entry={ addEntry } 
            copy_set={ copySet }
            delete_exercise={ deleteExercise }
            delete_set={ deleteSet }>
        </workout-list>
        <img onclick={ setListPanel } src='images/back.svg' class="mobile-nav-btn left visible-xs" show={ this.state.panelView == "LIST_PANEL" } ></img>
    </div>   
    
    <script>
        //Assign this to tag to avoid confusion
        const tag = this
        tag.lastSelectedExercise = 'yolobro'
        tag.addedPopup = false
        var actions = require('../actions/workout.js')
        var store = this.opts.store
        this.state = store.getState()
        
        console.log("First state")
        console.log(this.state)
        console.log(tag.lastSelectedExercise)
        
        var unsubscribe = store.subscribe(function(){
            console.log(tag.lastSelectedExercise)
            this.state = store.getState()
            tag.update()
            console.log("State updated:")
            console.log(this.state)
        }.bind(this))
        
        addEntry(index, set, entry) {
            store.dispatch(actions.addEntry(index, set, entry))
        }
        
        addExercise(index, name) {
            console.log(name)
            tag.lastSelectedExercise = name
            tag.addedPopup = true
            console.log(tag.lastSelectedExercise)
            store.dispatch(actions.addExercise(index, name))
        }
        
        addSet(index) {
            store.dispatch(actions.addSet(index))
        }
        
        closeAddedPopup() {
            console.log('cap')
            tag.addedPopup = false
            tag.update()
        }
        
        copySet(index, set) {
            store.dispatch(actions.copySet(index, set))
        }
        
        deleteEntry(index, set, entry) {
            console.log('deleteEntry')
        }
        
        deleteExercise(index) {
            store.dispatch(actions.deleteExercise(index))
        }
        
        deleteSet(index, set) {
            console.log('deleteSet')
            store.dispatch(actions.deleteSet(index, set))
        }
        
        searchExercise(text) {
            store.dispatch(actions.search(text))
        }
        
        setDetailPanel() {
            console.log('detail panel')
            store.dispatch(actions.panelView(actions.DETAIL_VIEW))
        }
        
        setListPanel() {
            console.log('list panel')
            store.dispatch(actions.panelView(actions.LIST_VIEW))
        }
    </script>
</workout-add>
