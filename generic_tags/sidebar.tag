<sidebar>
  <div id="search-sidebar" class='col-xs-2 no-padding'>
    <div class="btn-group full-width">
      <button class="btn btn-default btn-lg dropdown-toggle full-width" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Large button <span class="caret"></span> </button> <ul class="dropdown-menu"> <li><a href="#">Action</a></li> <li><a href="#">Another action</a></li> <li><a href="#">Something else here</a></li> <li role="separator" class="divider"></li> <li><a href="#">Separated link</a></li> </ul> </div>
    <search updatelist={updateSearchSidebar}></search>
    <div class='search-item color1' each={ exercise, index in this.opts.exercises } show={exercise.visible} onclick={getExercise}>
      {exercise.name}
    </div>
  </div>

  <script>
    getExercise(e) {
      this.opts.selectexercise(e.item.index)
      window.scrollTo(0, 0);
    }

    updateSearchSidebar(e) {
      this.opts.selectexercise(e.item.index)
      window.scrollTo(0, 0);
    }
  </script>
</sidebar>
