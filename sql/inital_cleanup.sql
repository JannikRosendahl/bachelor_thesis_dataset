/* drop redundant tables */
drop table event_import;
drop table host;

/* drop empty tables */
drop table endmarker;
drop table memoryobject;
drop table provenancetagnode;
drop table startmarker;
drop table timemarker;
drop table unitdependency;

/* drop empty columns */
alter table event drop column location;
alter table event drop column location_long;
alter table event drop column name;
alter table event drop column parameters;
alter table event drop column predicateobject;
alter table event drop column predicateobject2;
alter table event drop column predicateobject2path;
alter table event drop column predicateobjectpath;
alter table event drop column programpoint;
alter table event drop column programpoint_string;
alter table event drop column properties;
alter table event drop column properties_map_affinity;
alter table event drop column properties_map_applicationid;
alter table event drop column properties_map_attributes;
alter table event drop column properties_map_baseaddress;
alter table event drop column properties_map_basepriority;
alter table event drop column properties_map_clientmachine;
alter table event drop column properties_map_code;
alter table event drop column properties_map_commandline;
alter table event drop column properties_map_component;
alter table event drop column properties_map_correlationid;
alter table event drop column properties_map_createoptions;
alter table event drop column properties_map_directorytablebase;
alter table event drop column properties_map_exitstatus;
alter table event drop column properties_map_extrainfo;
alter table event drop column properties_map_fileattributes;
alter table event drop column properties_map_fileindex;
alter table event drop column properties_map_filekey;
alter table event drop column properties_map_filename;
alter table event drop column properties_map_fileobject;
alter table event drop column properties_map_flags;
alter table event drop column properties_map_gid;
alter table event drop column properties_map_groupoperationid;
alter table event drop column properties_map_handle;
alter table event drop column properties_map_host;
alter table event drop column properties_map_hostprocessname;
alter table event drop column properties_map_imagefilename;
alter table event drop column properties_map_infoclass;
alter table event drop column properties_map_ioflags;
alter table event drop column properties_map_iopriority;
alter table event drop column properties_map_ipaddress;
alter table event drop column properties_map_ipport;
alter table event drop column properties_map_length;
alter table event drop column properties_map_logontype;
alter table event drop column properties_map_mode;
alter table event drop column properties_map_name;
alter table event drop column properties_map_object;
alter table event drop column properties_map_operation;
alter table event drop column properties_map_operationid;
alter table event drop column properties_map_opm;
alter table event drop column properties_map_options;
alter table event drop column properties_map_packagefullname;
alter table event drop column properties_map_pagepriority;
alter table event drop column properties_map_parentid;
alter table event drop column properties_map_permissions;
alter table event drop column properties_map_principal;
alter table event drop column properties_map_processid;
alter table event drop column properties_map_prot;
alter table event drop column properties_map_protection;
alter table event drop column properties_map_providerguid;
alter table event drop column properties_map_providername;
alter table event drop column properties_map_providerpath;
alter table event drop column properties_map_rc;
alter table event drop column properties_map_regionsize;
alter table event drop column properties_map_service;
alter table event drop column properties_map_sessionid;
alter table event drop column properties_map_shareaccess;
alter table event drop column properties_map_shmflg;
alter table event drop column properties_map_shmid;
alter table event drop column properties_map_stackbase;
alter table event drop column properties_map_stacklimit;
alter table event drop column properties_map_subprocesstag;
alter table event drop column properties_map_targetobject;
alter table event drop column properties_map_tebbase;
alter table event drop column properties_map_threadflags;
alter table event drop column properties_map_tthreadid;
alter table event drop column properties_map_uid;
alter table event drop column properties_map_uniqueprocesskey;
alter table event drop column properties_map_uptime;
alter table event drop column properties_map_username;
alter table event drop column properties_map_usersid;
alter table event drop column properties_map_userstackbase;
alter table event drop column properties_map_userstacklimit;
alter table event drop column properties_map_win32startaddr;
alter table event drop column size;
alter table event drop column subject;
alter table event drop column hostid;


alter table subject drop column cmdline;
alter table subject drop column cmdline_string;
alter table subject drop column count;
alter table subject drop column exportedlibraries;
alter table subject drop column importedlibraries;
alter table subject drop column iteration;
alter table subject drop column parentsubject;
alter table subject drop column parentuuid;
alter table subject drop column privilegelevel;
alter table subject drop column properties;
alter table subject drop column properties_map_path;
alter table subject drop column properties_map_ppid;
alter table subject drop column properties_map_tgid;
alter table subject drop column unitid;
alter table subject drop column type;
alter table subject drop column hostid;
alter table subject drop column properties_map_host;


alter table principal drop column properties;
alter table principal drop column properties_map_cred;
alter table principal drop column username;
alter table principal drop column properties_map_euid;


alter table fileobject drop column baseobject_hostid;
alter table fileobject drop column filedescriptor;
alter table fileobject drop column localprincipal;
alter table fileobject drop column size;
alter table fileobject drop column peinfo;
alter table fileobject drop column hashes;
alter table fileobject drop column baseobject_permission;
alter table fileobject drop column baseobject_epoch;
alter table fileobject drop column baseobject_permission_short;
alter table fileobject drop column baseobject_properties_map_path;
alter table fileobject drop column baseobject_properties_map_inode;
alter table fileobject drop column baseobject_properties_map_dev;
alter table fileobject drop column baseobject_properties_map_filename;
alter table fileobject drop column baseobject_properties_map_syscall;
alter table fileobject drop column size_long;
alter table fileobject drop column baseobject_properties;
alter table fileobject drop column baseobject_epoch_int


alter table netflowobject drop column baseobject_hostid;
alter table netflowobject drop column ipprotocol;
alter table netflowobject drop column filedescriptor;
alter table netflowobject drop column baseobject_permission;
alter table netflowobject drop column baseobject_epoch;
alter table netflowobject drop column baseobject_properties;
alter table netflowobject drop column ipprotocol_int;
alter table netflowobject drop column baseobject_epoch_int;

alter table principal drop column type;
alter table principal drop column hostid;
alter table principal drop column groupids;

alter table srcsinkobject drop column type;
alter table srcsinkobject drop column baseobject_hostid;
alter table srcsinkobject drop column filedescriptor;
alter table srcsinkobject drop column baseobject_permission;
alter table srcsinkobject drop column baseobject_epoch;
alter table srcsinkobject drop column baseobject_properties_map_name;
alter table srcsinkobject drop column baseobject_properties_map_db_name;
alter table srcsinkobject drop column baseobject_properties;
alter table srcsinkobject drop column baseobject_epoch_int;
alter table srcsinkobject drop column baseobject_properties_map_pid;
alter table srcsinkobject drop column filedescriptor_int;

alter table unnamedpipeobject drop column baseobject_hostid;
alter table unnamedpipeobject drop column sourcefiledescriptor;
alter table unnamedpipeobject drop column sinkfiledescriptor;
alter table unnamedpipeobject drop column baseobject_permission;
alter table unnamedpipeobject drop column baseobject_epoch;
alter table unnamedpipeobject drop column sourceuuid;
alter table unnamedpipeobject drop column sinkuuid;
alter table unnamedpipeobject drop column baseobject_properties;
alter table unnamedpipeobject drop column baseobject_epoch_int;
alter table unnamedpipeobject drop column baseobject_properties_map_pid;
alter table unnamedpipeobject drop column sourcefiledescriptor_int;
alter table unnamedpipeobject drop column sinkfiledescriptor_int;