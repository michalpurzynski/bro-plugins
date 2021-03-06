# @TEST-REQUIRES: which nc
# @TEST-EXEC: btest-bg-run nc nc -l 4151
# @TEST-EXEC: bro -r $TRACES/syslog-single-udp.trace %INPUT
# @TEST-EXEC: btest-bg-wait -k 5

# @TEST-EXEC: btest-diff nc/.stdout

@load Bro/ElasticSearch/logs-to-elasticsearch.bro
redef LogElasticSearch::send_logs += { Conn::LOG };

redef LogElasticSearch::destination = "nsq";
redef LogElasticSearch::server_port = 4151;