mkdir /root/.aws
touch /root/.aws/credentials
touch /root/.aws/config
cp /tmp/credentials /root/.aws/credentials
cp /tmp/config /root/.aws/config
cp /tmp/statsd.json /opt/aws/amazon-cloudwatch-agent/bin/default_linux_config.json
/opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent&
sleep 10
K6_STATSD_ENABLE_TAGS=true k6 run --out statsd $1
sleep 180
