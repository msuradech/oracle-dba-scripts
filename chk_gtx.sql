col globalid_txt for a32
col branchid_txt for a32

SELECT
    inst_id,
    formatid,
    utl_raw.cast_to_varchar2(globalid) globalid_txt,
    utl_raw.cast_to_varchar2(branchid) branchid_txt,
    state
FROM gv$global_transaction;
