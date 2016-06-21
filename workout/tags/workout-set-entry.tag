<workout-set-entry>
    <div class="input-group">
      <input name='unit' type='text' class="{ form-control: true, half-width: true, br1: true, unit-enter: !this.opts.entry }" list='units' placeholder="Select a unit" value={ this.opts.entry.unit || '' } onchange={ updateUnit }>
      <datalist id='units'>
        <option label='# of repetitions' value='reps'>
        <option label='kg' value='kg'>
        <option label='seconds' value='sec'>
        <option label='meters' value='meters'>
      </datalist>
      <input name='value' type="text" class="{ form-control: true, half-width: true, br1: true, val-enter: !this.opts.entry}" placeholder="Enter a value" value={ this.opts.entry.value || '' } onchange={ updateValue }>
      <span class="input-group-btn ">
        <button class="btn btn-default br1" type="button" show={this.opts.entry.value && this.opts.entry.unit}>
            <span class="glyphicon glyphicon-remove red" aria-hidden="true"></span></span>
        </button>
        <button class="btn btn-default br1" type="button" hide={this.opts.entry.value && this.opts.entry.unit} onclick={ addEntry }>
            <span class="glyphicon glyphicon-plus green" aria-hidden="true"></span>
        </button>
      </span>
    </div>
    <script>
        const tag = this
        tag.unit = ''
        tag.value = ''
        
        addEntry(e) {
            if(tag.unit && tag.value){
                tag.opts.add_entry({ unit: tag.unit, value: tag.value })
            }else{
                if(!tag.unit){
                    console.log(this.value)
                }
                
                if(!tag.value){
                    console.log(this.unit)
                }
            }
        }
        
        updateUnit(e) {
            tag.unit = e.target.value
        }
        
        updateValue(e) {
            tag.value = e.target.value
        }
    </script>
</workout-set-entry>
