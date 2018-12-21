update ibs_ptab_bankno t set t.chshdm=substr(t.fqhhao,4,4);
commit;
exit;