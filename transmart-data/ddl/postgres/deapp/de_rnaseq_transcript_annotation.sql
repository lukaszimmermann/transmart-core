--
-- Name: de_rnaseq_transcript_annotation; Type: TABLE; Schema: deapp; Owner: -
--
CREATE TABLE de_rnaseq_transcript_annotation (
    id bigint NOT NULL,
    gpl_id character varying(50) NOT NULL,
    ref_id character varying(50) NOT NULL,
    chromosome character varying(2) NOT NULL,
    start_bp bigint NOT NULL,
    end_bp bigint NOT NULL,
    transcript character varying(100)
);

--
-- Name: de_rnaseq_transcript_annotation_pkey; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_rnaseq_transcript_annotation
    ADD CONSTRAINT de_rnaseq_transcript_annotation_pkey PRIMARY KEY (id);

--
-- Name: de_rnaseq_transcript_annotation_gpl_id_fkey; Type: FK CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_rnaseq_transcript_annotation
    ADD CONSTRAINT de_rnaseq_transcript_annotation_gpl_id_fkey FOREIGN KEY (gpl_id) REFERENCES de_gpl_info(platform);

--
-- Name: de_rnaseq_transcript_annotation_ref_id_unq; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_rnaseq_transcript_annotation
    ADD CONSTRAINT de_rnaseq_transcript_annotation_ref_id_unq UNIQUE (gpl_id, ref_id);
