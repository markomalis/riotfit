<exercise-app>

  <sidebar
    exercises={this.state.exercises}
    detail={this.state.detail}
    selectexercise={selectExercise}
    updatesearchsidebar={updateSearchSidebar}>
  </sidebar>
  <div class='col-xs-12 col-sm-9 col-md-10 mt10'>
    <pagecontrol></pagecontrol>
    <pagecontent></pagecontent>
  </div>

  <script>
    var actions = require('../actions/exercise.js')
    var store = this.opts.store
    this.state = store.getState()
    console.log(this.state)
    var unsubscribe = store.subscribe(function(){
      this.state = store.getState()
      console.log('new state: ', this.state)
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

    closePageContent() {
      var pc = document.getElementById("pc_content")
      pc.className += " closed "
    }

    deleteTag(tag){
      store.dispatch(actions.deleteTag(tag))
    }

    notify() {
      console.log('yolo');
    }

    openPageContent() {
      var pc = document.getElementById("pc_content")
      pc.className.replace(/\closed\b/,'')
      pc.className += " open "
    }

    selectExercise(index){
      this.closePageContent()
      store.dispatch(actions.selectExercise(index))
      this.openPageContent()
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

    updatePageContent() {
      var pc = document.getElementById("pc_content")
      pc.className += " closed "
    }

    updateSearchSidebar(text) {
      store.dispatch(actions.search(text))
    }
  </script>

</exercise-app>
