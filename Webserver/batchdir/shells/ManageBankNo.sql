delete IBS_PTAB_BANKNO a
where exists (select a.FQHHAO from IBS_PTAB_BANKNODEL b where a.FQHHAO = b.FQHHAO);
commit;
exit;