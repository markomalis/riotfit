<exercise-app>
    <div class=class={col-xs-12: true, col-sm-6: true, hidden-xs: this.state.panelView != 'LIST_VIEW'}>
        <search updatelist={updateList}></search>
        <button onclick={setAddView} type="button" class="btn btn-default full-width mb5 inline-item color2 item-selecter hidden-xs">Add Exercise</button>
        <img onclick={setAddView} src='images/add.svg' class="mobile-nav-btn visible-xs" ></img>
        <exercise-list exercises={this.state.exercises} selectexercise={selectExercise}></exercise-list>
    </div>
    <div class={col-xs-12: true, col-sm-6: true, hidden-xs: this.state.panelView != 'DETAIL_VIEW'}>
        <div class='back2list visible-xs' onclick={setListView} ><img src='images/back.svg'></span></div>
        <ul class="nav nav-tabs nav-justified mb15">
            <li onclick={setExerciseView} class={ active: this.state.detailView == 'EXERCISE_VIEW' }><a>Exercise</a></li>
            <li onclick={setEditView} class={ active: this.state.detailView == 'EDIT_VIEW' }>
                <a>
                    {this.state.exercises[this.state.detail].name} logs 
                    <span class='glyphicon glyphicon-list-alt'></span>
                </a>
            </li>
        </ul>
        <exercise-detail show={ this.state.detailView == 'EXERCISE_VIEW' } exercise={ this.state.exercises[this.state.detail] }></exercise-detail>
        <exercise-edit show={ this.state.detailView == 'EDIT_VIEW' } exercise={ this.state.exercises[this.state.detail] }></exercise-edit>
    </div>
    
    <exercise-add show={ this.state.addView } tags={this.state.tags} addexercise={addExercise} addtag={addTag} closeaddview={closeAddView} deletetag={deleteTag}></exercise-add>
    
    <script>
        var actions = require('../actions/exercise.js')
        var store = this.opts.store
        this.state = store.getState()
        console.log(this.state)
        var unsubscribe = store.subscribe(function(){
            this.state = store.getState()
            this.update()
        }.bind(this))
        
        addExercise(exercise){
            store.dispatch(actions.addExercise(exercise))
        }
        
        addTag(tag){
            store.dispatch(actions.addTag(tag))
        }
        
        closeAddView() {
            store.dispatch(actions.addView(false))
        }
        
        deleteTag(tag){
            store.dispatch(actions.deleteTag(tag))
        }
        
        selectExercise(index){
            store.dispatch(actions.selectExercise(index))
        }
        
        setAddView() {
            store.dispatch(actions.addView(true))
        }
        
        setEditView() {
            store.dispatch(actions.detailView(actions.EDIT_VIEW))
        }
        
        setExerciseView() {
            store.dispatch(actions.detailView(actions.EXERCISE_VIEW))
        }
        
        setListView() {
            store.dispatch(actions.panelView(actions.LIST_VIEW))
        }
        
        updateList(text) {
            store.dispatch(actions.search(text))
        }
    </script>
</exercise-app>
