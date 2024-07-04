#!/usr/bin/perl -w
# Abills configuration file

our $PROGRAM='~AsmodeuS~ Billing System';

#DB configuration
$conf{dbhost}='localhost';
$conf{dbname}='abills';
$conf{dbuser}='abills';
$conf{dbpasswd}='sqlpassword';
$conf{dbtype}='mysql';
#For MySQL 5 and highter (cp1251, utf8)
$conf{dbcharset}='utf8';

#Mail configuration
$conf{ADMIN_MAIL}='admin@yourhost.com';
$conf{USERS_MAIL_DOMAIN}='yourhost.com';
$conf{MAIL_CHARSET}='utf-8';
$conf{default_language}='russian';
$conf{default_charset}='utf-8';
$conf{WEB_TITLE}='';

our @MODULES = (
  'Internet',
  'Msgs',
  'Config',
  'Sysinfo',
  #Device monitoring and manage via snmp
  'Equipment',
  'Tags',
  #'Cards',
  'Sqlcmd',
);

our %ACCT = ();
#For VoIP GNU Gatekeeper accounting
$ACCT{gnugk} = 'Voip_aaa';

our %AUTH = ();
#For VoIP GNU Gatekeeper Auth
$AUTH{gnugk} = 'Voip_aaa';

$AUTH{default} = 'Auth2';
$ACCT{default} = 'Acct2';

#Technical works banner in admin and user interface
#$conf{tech_works}='Technical works';

$conf{CUSTOM_START_PAGE}=1;
$conf{AUTH_METHOD}=1;

#Periodic functions
$conf{p_admin_mails}=1;  # Send periodic admin reports
$conf{p_users_mails}=1;  # Send user warning  messages

# chap encryption decription key
$conf{secretkey}="test12345678901234567890";
$conf{s_detalization}=1; #make session detalization recomended for vpn leathed lines
$conf{ERROR2DB}=1;

#Octets direction
# server - Count octets from server side
# user   - Count octets from user side (default)
$conf{octets_direction}='user';

#Check web interface brute force
$conf{wi_bruteforce}=10;
$conf{user_finance_menu}=1; 

#Minimum session costs
$conf{MINIMUM_SESSION_TIME}=10; # minimum session time for push session to db
$conf{MINIMUM_SESSION_TRAF}=200; # minimum session trafic for push session to db

#System admin id
#ID for system operation, periodic procces
$conf{SYSTEM_ADMIN_ID}=2;
#ID For users web operations
$conf{USERS_WEB_ADMIN_ID}=3;

#System Langs
$conf{LANGS}="english:English;
 russian:Русский;
 ukrainian:Українська;
 bulgarian:Български;
 french:French;
 armenian:Armenian;
 azeri:Azeri;
 belarussian:Беларускi;
 spanish:Spain;
 uzbek:Uzbek;";

#Web interface
$conf{PASSWD_LENGTH}=6;
$conf{MAX_USERNAME_LENGTH}=15;

# User name expration
$conf{USERNAMEREGEXP}="^[a-z0-9_][a-z0-9_-]*\$";
$conf{list_max_recs}=25;
$conf{web_session_timeout} = 86000;
$conf{user_chg_passwd}=0;

#Auto assigning MAC in first connect
$conf{MAC_AUTO_ASSIGN} = 1;
$conf{KBYTE_SIZE}      = 1024;
$conf{ADDRESS_REGISTER}= 1;

# Debug mod 
$conf{debug}=1;
$conf{debugmods}='LOG_ALERT LOG_WARNING LOG_ERR LOG_INFO';

#show auth and accounting time need Time::HiRes module (available from CPAN)
# Check script runnig time
#$conf{time_check}=1;

# Folders and files
$base_dir='/usr/abills/';
$lang_path=$base_dir . 'language/';
$lib_path=$base_dir .'libexec/';
$var_dir=$base_dir .'var/';
$conf{SPOOL_DIR}=$base_dir.'var/q';

# Backup SQL data
$conf{BACKUP_DIR}=$base_dir.'/backup';

# Template folder
$conf{TPL_DIR}   = $base_dir . 'Abills/templates/';
$conf{LOG_DEBUG} = $base_dir . 'var/log/abills.debug';
$conf{LOGFILE}   = $base_dir . 'var/log/abills.log';

use POSIX qw(strftime);
our $DATE    = strftime "%Y-%m-%d", localtime(time);
our $TIME    = strftime "%H:%M:%S", localtime(time);
our $curtime = strftime("%F %H.%M.%S", localtime(time));
our $year    = strftime("%Y", localtime(time));

$conf{info_fields_new}=1;
$conf{CONTACTS_NEW}=1;

$conf{NEW_WIKI}=1;

# Msgs
$conf{ATTACH2FILE} = 1;
$conf{MSGS_ATTACH2FILE} = 1;

1
