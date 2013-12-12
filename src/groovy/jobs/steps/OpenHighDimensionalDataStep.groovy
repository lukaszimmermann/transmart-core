package jobs.steps

import org.transmartproject.core.dataquery.TabularResult
import org.transmartproject.core.dataquery.highdim.HighDimensionDataTypeResource
import org.transmartproject.core.dataquery.highdim.assayconstraints.AssayConstraint
import org.transmartproject.core.dataquery.highdim.dataconstraints.DataConstraint
import org.transmartproject.core.dataquery.highdim.projections.Projection

import static jobs.AbstractAnalysisJob.PARAM_ANALYSIS_CONSTRAINTS

class OpenHighDimensionalDataStep implements Step {

    final String statusName = 'Gathering Data'

    /* in */
    Map<String, Object> params
    HighDimensionDataTypeResource dataTypeResource

    /* out */
    Map<String, TabularResult> results = [:]

    @Override
    void execute() {
        try {
            extractPatientSets().eachWithIndex { resultInstanceId, index ->
                extractOntologyTerms().each { ontologyTerm ->
                    String seriesLabel = ontologyTerm.split('\\\\')[-1]
                    results["S" + index + "_" + seriesLabel] = fetchSubset(resultInstanceId, ontologyTerm)
                }
            }
        } finally {
            results.each { it.close() }
        }
    }

    private List<String> extractOntologyTerms() {
        params.analysisConstraints.assayConstraints.remove('ontology_term').split('\\|').collect {
            println(it)
            createConceptKeyFrom(it)
        }
    }

    private List<Integer> extractPatientSets() {
        params.analysisConstraints.assayConstraints.remove("patient_set").grep()
    }

    private TabularResult fetchSubset(Integer patientSetId, String ontologyTerm) {

        List<DataConstraint> dataConstraints = params[PARAM_ANALYSIS_CONSTRAINTS]['dataConstraints'].
                collect { String constraintType, values ->
                    if (values) {
                        dataTypeResource.createDataConstraint(values, constraintType)
                    }
                }.grep()

        List<AssayConstraint> assayConstraints = params[PARAM_ANALYSIS_CONSTRAINTS]['assayConstraints'].
                collect { String constraintType, values ->
                    if (values) {
                        dataTypeResource.createAssayConstraint(values, constraintType)
                    }
                }.grep()

        assayConstraints.add(
                dataTypeResource.createAssayConstraint(
                        AssayConstraint.PATIENT_SET_CONSTRAINT,
                        result_instance_id: patientSetId))

        assayConstraints.add(
                dataTypeResource.createAssayConstraint(
                        AssayConstraint.ONTOLOGY_TERM_CONSTRAINT,
                        concept_key: ontologyTerm))

        Projection projection = dataTypeResource.createProjection([:],
                params[PARAM_ANALYSIS_CONSTRAINTS]['projections'][0])

        dataTypeResource.retrieveData(assayConstraints, dataConstraints, projection)
    }

    /**
     * This method takes a conceptPath provided by the frontend and turns it into a String representation of
     * a concept key which the AssayConstraint can use. Such a string is pulled apart later in a
     * table_access.c_table_cd part and a concept_dimension.concept_path part.
     * The operation duplicates the first element of the conceptPath and prefixes it to the original with a double
     * backslash.
     * @param conceptPath
     * @return String conceptKey
     */
    private static String createConceptKeyFrom(String conceptPath) {
        // This crazy dance with slashes is "expected behaviour"
        // as per http://groovy.codehaus.org/Strings+and+GString (search for Slashy Strings)
        def bs = '\\\\'
        "\\\\" + (conceptPath =~ /$bs([^$bs]+)$bs/)[0][-1] + conceptPath
    }
}
