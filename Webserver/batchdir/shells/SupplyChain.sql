update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='A') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='A'
          )
        )
set cif_otherflag=((substr(cif_otherflag,0,19)||khyxx||substr(cif_otherflag,21))); 

update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='B') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='B'
          )
        )
set cif_otherflag=((substr(cif_otherflag,0,20)||khyxx||substr(cif_otherflag,22))); 

update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='C') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='01' and x.LJS='C'
            )
        )
set cif_otherflag=((substr(cif_otherflag,0,21)||khyxx||substr(cif_otherflag,23))); 

update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='A') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='A'
            )
        )
set cif_otherflag=((substr(cif_otherflag,0,22)||khyxx||substr(cif_otherflag,24))); 

update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='B') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='B'
            )
        )
set cif_otherflag=((substr(cif_otherflag,0,23)||khyxx||substr(cif_otherflag,25))); 

update (
          select cc.cif_otherflag ,(select x.khyxx from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='C') khyxx from ibs_etab_cif cc where  exists (
          select x.cifno from IBS_ETAB_SCFP_TMP x where cc.cif_no=x.cifno and x.YWPZ='02' and x.LJS='C'
            )
        )
set cif_otherflag=((substr(cif_otherflag,0,24)||khyxx||substr(cif_otherflag,26))); 

commit;
exit;