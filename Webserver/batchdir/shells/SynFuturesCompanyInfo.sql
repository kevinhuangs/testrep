--���µ��ڻ���˾��Ϣ
update 
 ( select b.FUTURESCOMPANY_NAME b1,b.INPUTPASSWORDFLAG b2,'1' b3,a.FUTURESCOMPANY_NAME a1,a.INPUTPASSWORDFLAG a2,a.FUTURES_STATUS a3 
 from IBS_PTAB_FUTURESCOMPANY a, IBS_PTAB_FUTURESCOMPANY_TMP b 
 where a.FUTURESCOMPANY_ID=b.FUTURESCOMPANY_ID 
 )
 set a1=b1,a2=b2,a3=b3;
--�����ӵ��ڻ���˾��Ϣ
insert into IBS_PTAB_FUTURESCOMPANY (FUTURESCOMPANY_ID,FUTURESCOMPANY_NAME,INPUTPASSWORDFLAG,FUTURES_STATUS)
 (select FUTURESCOMPANY_ID,FUTURESCOMPANY_NAME,INPUTPASSWORDFLAG,'1' from  IBS_PTAB_FUTURESCOMPANY_TMP t where not exists (
 select '1' from IBS_PTAB_FUTURESCOMPANY b where b.FUTURESCOMPANY_ID=t.FUTURESCOMPANY_ID
 ));
--ɾ�����ڻ���˾��Ϣ
update IBS_PTAB_FUTURESCOMPANY a set a.FUTURES_STATUS='0' where not exists (
 select '1' from IBS_PTAB_FUTURESCOMPANY_TMP b where b.FUTURESCOMPANY_ID=a.FUTURESCOMPANY_ID
 );
commit;
exit;