/* change pw */
/* ALTER USER studi2 PASSWORD '---'; */

/* select column names from table event */
select column_name from information_schema.columns where table_name = 'event';

/* select column names from table subject */
select column_name from information_schema.columns where table_name = 'subject';

select * from principal;

/* selects with only relevant cols */

select
    uuid,
    subject_uuid,
    timestampnanos,
    size_long,
    sequence_long,
    threadid_int,
    type,
    name_string,
    parameters_array,
    predicateobject_uuid,
    predicateobjectpath_string,
    predicateobject2_uuid,
    predicateobject2path_string,
    properties_map_cmdline,
    properties_map_exec,
    properties_map_return_value,
    properties_map_fd,
    properties_map_ppid,
    properties_map_ret_fd2,
    properties_map_ret_fd1,
    properties_map_partial_path,
    properties_map_arg_pid,
    properties_map_arg_mem_flags,
    properties_map_arg_euid,
    properties_map_arg_suid,
    properties_map_arg_ruid,
    properties_map_arg_rgid,
    properties_map_arg_egid,
    properties_map_arg_sgid,
    properties_map_address,
    properties_map_ret_msgid,
    properties_map_arg_uid,
    properties_map_arg_gid,
    properties_map_arg_miouuid,
    properties_map_port,
    properties_map_login,
    properties_map_ret_miouuid
from event
limit 500;

select
    uuid,
    parentsubject_uuid,
    starttimestampnanos,
    cid,
    localprincipal
from subject
limit 500;

/*
    count number of rows in relevant events
    => 20743978 events
    =>   117267 subjects
*/
select count(*) from event;

select count(*) from subject;

/* joined events and subjects */
select
    e.uuid,
    e.subject_uuid,
    e.timestampnanos,
    e.size_long,
    e.sequence_long,
    e.threadid_int,
    e.type,
    e.name_string,
    e.parameters_array,
    e.predicateobject_uuid,
    e.predicateobjectpath_string,
    e.predicateobject2_uuid,
    e.predicateobject2path_string,
    e.properties_map_cmdline,
    e.properties_map_exec,
    e.properties_map_return_value,
    e.properties_map_fd,
    e.properties_map_ppid,
    e.properties_map_ret_fd2,
    e.properties_map_ret_fd1,
    e.properties_map_partial_path,
    e.properties_map_arg_pid,
    e.properties_map_arg_mem_flags,
    e.properties_map_arg_euid,
    e.properties_map_arg_suid,
    e.properties_map_arg_ruid,
    e.properties_map_arg_rgid,
    e.properties_map_arg_egid,
    e.properties_map_arg_sgid,
    e.properties_map_address,
    e.properties_map_ret_msgid,
    e.properties_map_arg_uid,
    e.properties_map_arg_gid,
    e.properties_map_arg_miouuid,
    e.properties_map_port,
    e.properties_map_login,
    e.properties_map_ret_miouuid,
    s.uuid,
    s.parentsubject_uuid,
    s.starttimestampnanos,
    s.cid,
    s.localprincipal,
    p.uuid,
    p.username_string,
    p.userid
from event e
join subject s
    on e.subject_uuid = s.uuid
join principal p
    on s.localprincipal = p.uuid
/*where e.uuid = '07359506-C271-55A6-9A61-4FC24DAAA7D9'*/
/*where s.uuid = '49429E64-3947-11E8-BF66-D9AA8AFF4A69'*/
/*where e.name_string = 'aue_setgid'
and properties_map_return_value != '0'*/
order by s.uuid, e.sequence_long
limit 500;

/*
    count number of rows in joined events and subjects
    => 20725370 events associated with a subject
    => 20743978 - 20725370 = 18608 events without a subject
*/
select count(*) from (select
    e.uuid,
    e.subject_uuid,
    e.timestampnanos,
    e.size_long,
    e.sequence_long,
    e.threadid_int,
    e.type,
    e.name_string,
    e.parameters_array,
    e.predicateobject_uuid,
    e.predicateobjectpath_string,
    e.predicateobject2_uuid,
    e.predicateobject2path_string,
    e.properties_map_cmdline,
    e.properties_map_exec,
    e.properties_map_return_value,
    e.properties_map_fd,
    e.properties_map_ppid,
    e.properties_map_ret_fd2,
    e.properties_map_ret_fd1,
    e.properties_map_partial_path,
    e.properties_map_arg_pid,
    e.properties_map_arg_mem_flags,
    e.properties_map_arg_euid,
    e.properties_map_arg_suid,
    e.properties_map_arg_ruid,
    e.properties_map_arg_rgid,
    e.properties_map_arg_egid,
    e.properties_map_arg_sgid,
    e.properties_map_address,
    e.properties_map_ret_msgid,
    e.properties_map_arg_uid,
    e.properties_map_arg_gid,
    e.properties_map_arg_miouuid,
    e.properties_map_port,
    e.properties_map_login,
    e.properties_map_ret_miouuid,
    s.uuid,
    s.parentsubject_uuid,
    s.starttimestampnanos,
    s.cid,
    s.localprincipal
from event e
JOIN subject s
ON e.subject_uuid = s.uuid) as event_subject;
/* confirm that there are 18608 events without a subject */
select count(*) from event where subject_uuid is null;




/*
    wieviele versch properties_map_exec gibt es pro subject
*/
select avg(c) from (
select count(distinct properties_map_exec) as c, subject_uuid
from event e
join subject s
    on e.subject_uuid = s.uuid
group by subject_uuid) as csu;

select count(distinct properties_map_exec) as c, subject_uuid
from event e
join subject s
    on e.subject_uuid = s.uuid
group by subject_uuid
order by c desc;



/*
    random queries
*/
select distinct subject_uuid
from event
limit 500;

select uuid, properties_map_exec, properties_map_cmdline from event where properties_map_cmdline is not null limit 500;

/*
 for each group of events with the same subject_uuid, get all distinct properties_map_cmdline
 */
select subject_uuid, count(distinct properties_map_cmdline) as c
from event
group by subject_uuid
order by c desc
limit 500;

select subject_uuid, properties_map_cmdline
from event
where properties_map_cmdline is not null
limit 500;

/* list top 10 subjects with most events */
select count(e.uuid), s.uuid
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid
order by count(e.uuid) desc
limit 10;

/* list top 10 subjects with least events */
select count(e.uuid), s.uuid
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid
order by count(e.uuid) asc
limit 10;

/*
    get average number of properties_map_cmdline set per subject
 */
select avg(c) from (
select count(distinct properties_map_cmdline) as c, subject_uuid
from event e
join subject s
    on e.subject_uuid = s.uuid
where e.properties_map_cmdline is not null
group by subject_uuid) as csu;


/*
    subject 72FB0406-3678-11E8-BF66-D9AA8AFF4A69 hat 2.262.676 events...
    und kein properties_map_cmdline, properties_map_exec ist python2.7
*/
select distinct e.properties_map_exec
from event e
where e.subject_uuid = '72FB0406-3678-11E8-BF66-D9AA8AFF4A69';

/*
    wieviele subjects gibt es bei denen in den events mindestens ein properties_map_cmdline gesetzt ist
    => 107740 subjects
    117267 subjects total
    =>
*/
select count(distinct s.uuid)
from event e
join subject s
    on e.subject_uuid = s.uuid
where e.properties_map_cmdline is not null;

/*
 get all distinct properties_map_cmdline
 */
select distinct properties_map_cmdline
from event
limit 500;

select subject_uuid
from event
join subject
    on event.subject_uuid = subject.uuid
where properties_map_cmdline = 'find -sx / /data /dev/null ( ! -fstype local ) -prune -o -type f ( ( ! -perm +010 -and -perm +001 ) -or ( ! -perm +020 -and -perm +002 ) -or ( ! -perm +040 -and -perm +004 ) ) -exec ls -liTd {} +';

select distinct event.name_string
from event;

/*
    number of events
    number of events associated with a subject,
*/
select count(*)
from event;
select count(*)
from event
where subject_uuid is not null;

/*
    how many events are associated with a subject
 */
select count(*) as cnt
from event
join subject
    on event.subject_uuid = subject.uuid
group by subject.uuid
order by cnt desc;

SELECT cnt, COUNT(*) AS occurrence
FROM (select count(*) as cnt
from event
join subject
    on event.subject_uuid = subject.uuid
group by subject.uuid) as esc
GROUP BY cnt;

select min(cnt), max(cnt), avg(cnt), stddev(cnt), variance(cnt), percentile_cont(0.5) within group (order by cnt) as median, percentile_cont(0.95) within group (order by cnt) as p95
from (select count(*) as cnt
from event
join subject
    on event.subject_uuid = subject.uuid
group by subject.uuid) as esc;

select min(c), max(c), avg(c), percentile_cont(.5) within group (order by c) from (
select count(*) as c
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid) as sub;


select distinct event.properties_map_exec
from event
limit 500;


select
    e.uuid,
    e.subject_uuid,
    e.type,
    e.name_string,
    e.properties_map_cmdline,
    e.properties_map_exec,
    e.properties_map_return_value,
    s.uuid,
    s.parentsubject_uuid,
    p.username_string
from event e
join subject s
    on e.subject_uuid = s.uuid
join principal p
    on s.localprincipal = p.uuid
/*where e.uuid = '07359506-C271-55A6-9A61-4FC24DAAA7D9'*/
/*where s.uuid = '0000464B-38D0-11E8-BF66-D9AA8AFF4A69'*/
/*where e.name_string = 'aue_setgid'
and properties_map_return_value != '0'*/
order by s.uuid, e.sequence_long
limit 3000;

select s.uuid, e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
join principal p
    on s.localprincipal = p.uuid
group by s.uuid, e.properties_map_exec
order by s.uuid
limit 500;

select s.uuid, e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
join principal p
    on s.localprincipal = p.uuid
group by s.uuid, e.properties_map_exec
order by s.uuid
limit 500;

WITH RankedExecs AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY es.subject_uuid) AS RowNum,
           ROW_NUMBER() OVER (PARTITION BY es.properties_map_exec ORDER BY properties_map_exec) AS GroupId
    FROM (select * from event join subject on event.subject_uuid = subject.uuid) as "es"
)
SELECT COUNT(DISTINCT GroupId) AS distinct_exec_count
FROM RankedExecs
GROUP BY RowNum - GroupId
ORDER BY RowNum - GroupId;

select s.uuid, e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid, e.properties_map_exec
order by s.uuid
limit 500;

select s.uuid, e.properties_map_exec, row_number() OVER (PARTITION BY s.uuid ORDER BY e.properties_map_exec) as r
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid, e.properties_map_exec
order by r desc, s.uuid
limit 500;

select s.uuid, e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
where s.uuid = '00002710-3DF2-11E8-A5CB-3FA3753A265A'
order by s.uuid, e.sequence_long;

/*
    select properties_map_exec, count(*) as c
 */
select distinct event_subject.properties_map_exec, count(properties_map_exec) as c
from (select distinct subject.uuid, event.properties_map_exec
from event
join subject
    on event.subject_uuid = subject.uuid
group by subject.uuid, event.properties_map_exec
order by subject.uuid) as event_subject
group by event_subject.properties_map_exec;


select distinct subject.uuid, event.properties_map_exec
from event
join subject
    on event.subject_uuid = subject.uuid
group by subject.uuid, event.properties_map_exec
order by subject.uuid
limit 500;


select count(distinct s.uuid), e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
where e.properties_map_exec = 'python2.7'
group by e.properties_map_exec
limit 500;

select count(distinct s.uuid)
from subject s;
select count(distinct e.uuid)
from event e;

select count(s.uuid)
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid;

select count(*)
from event e
join subject s
    on e.subject_uuid = s.uuid
join principal p
    on s.localprincipal = p.uuid
group by s.uuid, e.uuid
/*where e.uuid = '07359506-C271-55A6-9A61-4FC24DAAA7D9'*/
/*where s.uuid = '49429E64-3947-11E8-BF66-D9AA8AFF4A69'*/
/*where e.name_string = 'aue_setgid'
and properties_map_return_value != '0'*/
order by s.uuid;

select *
from event e
join subject s
    on e.subject_uuid = s.uuid
where s.uuid = '00002710-3DF2-11E8-A5CB-3FA3753A265A';


select tmp.properties_map_exec, avg(tmp.seq_len) as seq_len
from (
select s.uuid, count(e.uuid) as seq_len, e.properties_map_exec
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid, e.properties_map_exec
order by s.uuid, seq_len desc) as tmp
group by tmp.properties_map_exec;


/* find sequences with exec qmgr */
select s.uuid, e.properties_map_exec, e.sequence_long
from event e
join subject s
    on e.subject_uuid = s.uuid
where e.properties_map_exec = 'qmgr'
order by s.uuid, e.sequence_long
limit 500;

select *
from event e
join subject s
    on e.subject_uuid = s.uuid
order by s.uuid, e.sequence_long
limit 500;

select *
from event e
join subject s
    on e.subject_uuid = s.uuid
where e.uuid = '9A3CA81D-7BD7-5E0C-A5B9-EE6592816B67'
order by s.uuid, e.sequence_long
limit 500;

select count(*), count(distinct e.uuid)
from event e;

select count(*)
from subject s;

/* find number of rows that have a subject_uuid */
select count(*)
from event
where subject_uuid is not null;

alter table event
    add attack BOOLEAN default FALSE;

select count(*)
from event;

select count(*)
from subject;

select count(*)
from event
where attack = TRUE;

select count(node_uuids)
from node_uuids;

select s.uuid, count(e.uuid) as seq_len, e.properties_map_exec, max(e.attack::int) as attack
from event e
join subject s
    on e.subject_uuid = s.uuid
group by s.uuid, e.properties_map_exec
order by s.uuid, seq_len;

select count(distinct programpoint)
from event;

select count(distinct hostid)
from event;

select distinct type
from event;
