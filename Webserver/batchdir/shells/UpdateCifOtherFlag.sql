update (
					select * from ibs_etab_cif cc where  exists (
					select x.cif_otherflag from IBS_ETAB_CIF_CUSTINFO_TMP x where cc.cif_no=x.ec_cif_no and x.cif_otherflag='1'
						)
				)
set cif_otherflag=((substr(cif_otherflag,0,12)||'1'||substr(cif_otherflag,14))); 
update (
					select * from ibs_etab_cif cc where  exists (
					select x.cif_otherflag from IBS_ETAB_CIF_CUSTINFO_TMP x where cc.cif_no=x.ec_cif_no and x.cif_otherflag='0'
					)
				)
set cif_otherflag=((substr(cif_otherflag,0,12)||'0'||substr(cif_otherflag,14))); 
commit;
exit;