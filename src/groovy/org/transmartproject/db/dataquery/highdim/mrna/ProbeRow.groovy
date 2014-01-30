package org.transmartproject.db.dataquery.highdim.mrna

import groovy.transform.ToString
import org.transmartproject.core.dataquery.highdim.BioMarkerDataRow
import org.transmartproject.db.dataquery.highdim.AbstractDataRow

@ToString(excludes = [ 'assayIndexMap' ])
class ProbeRow extends AbstractDataRow implements BioMarkerDataRow<Object> {

    String probe

    String uniprotName

    String geneId

    @Override
    String getLabel() {
        probe
    }

    @Override
    String getBioMarker() {
        uniprotName
    }
}
