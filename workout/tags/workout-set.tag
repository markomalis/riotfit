<workout-set>
    <div class='inline-item color3'>
        set {this.opts.index + 1}
        <div class="btn-group pull-right" role="group" aria-label="...">
            <button type="button" class="btn btn-default btn-sm" onclick={ deleteSet }><span class="glyphicon glyphicon-remove red" aria-hidden="true"></span></button>
            <button type="button" class="btn btn-default btn-sm" onclick={ copySet }>copy</button>
            <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></button>
        </div>
    </div>
    <workout-set-entry each={ entry in this.opts.set} entry={ entry }></workout-set-entry>
    <workout-set-entry add_entry={ addEntry }></workout-set-entry>
    <workout-set-entry add_entry={ addEntry }></workout-set-entry>
    <span class="glyphicon glyphicon-option-horizontal green" aria-hidden="true"></span>
    <script>
        const tag = this
        
        addEntry(entry) {
            this.opts.add_entry(this.opts.index, entry)
        }
        
        copySet() {
            console.log('copySet')
            this.opts.copy_set(this.opts.index)
        }
        
        deleteSet() {
            this.opts.delete_set(this.opts.index)
        }
    </script>
</workout-set>
