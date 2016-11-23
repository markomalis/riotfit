<sidebar>
  <div id="search-sidebar" class='col-sm-3 col-md-2 no-padding hidden-xs'>
    <div class="btn-group full-width br1">
      <button class="btn btn-default btn-lg dropdown-toggle full-width br1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Exercise<span class="caret"></span> </button> <ul class="dropdown-menu"> <li><a href="#">Action</a></li> <li><a href="#">Another action</a></li> <li><a href="#">Something else here</a></li> <li role="separator" class="divider"></li> <li><a href="#">Separated link</a></li> </ul> </div>
    <search updatesearchsidebar={updateSearchSidebar}></search>
    <div class='search-item color1' each={ exercise, index in this.opts.exercises } show={exercise.visible} onclick={selectExercise}>
      <span class={red : selected(index)}>{exercise.name}</span>
    </div>
  </div>

  <script>
    var tag = this.opts

    selectExercise(e) {
      tag.selectexercise(e.item.index)
      window.scrollTo(0, 0);
    }

    selected(index) {
      return tag.detail == index
    }

    updateSearchSidebar(text) {
      tag.updatesearchsidebar(text)
    }
  </script>
</sidebar>
